<?php

// https://docs.paykeeper.ru/metody-integratsii/poluchenie-pryamoj-ssylki-na-oplatu/

if (PAY_MODE=='init') {
    
    # Basic-авторизация передаётся как base64
    $base64=base64_encode($payParams['user'].':'.$payParams['password']);         
    $headers = array(
        'Content-Type: application/x-www-form-urlencoded',
        'Authorization: Basic '.$base64,
    ); 
    $server_paykeeper = $payParams['server'];
     
    # Готовим первый запрос на получение токена безопасности
    $curl = curl_init($server_paykeeper."/info/settings/token/"); 
    curl_setopt($curl,CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl,CURLOPT_CUSTOMREQUEST, 'GET');
    curl_setopt($curl,CURLOPT_HTTPHEADER, $headers);
    curl_setopt($curl,CURLOPT_HEADER, false);
    $curl_response = curl_exec($curl);
    $response = json_decode($curl_response, true);

    # В ответе должно быть заполнено поле token, иначе - ошибка
    if (!isset($response['token'])) {
        clubLog('paykeeper_error_token', $curl_response);
        die();
    }

    # Параметры платежа, сумма - обязательный параметр. Остальные параметры можно не задавать
    $pay_amount = empty($payParams['multiply'])? $total : ($total+$total*$payParams['multiply']);
    $data_paykeeper = array (
        "pay_amount" => $pay_amount,
        "clientid" => $payContact['email'],
        //"orderid" => "Заказ № 10",
        "client_email" => $payContact['email'],
        "service_name" => $Description,
        "client_phone" => $payContact['tel'],
        'user_result_callback' => $backUrl,
        'token' => $response['token'],
    );

    $extIdData['extended'] = array_merge($data_paykeeper, array(
        'idPaySum' => $total,
    ));
    $extId = setClubExtId($extIdData, $extIdType);
    $data_paykeeper['orderid'] = $extId->get('id');
    clubLog('paykeeper_init', $extIdData);
    
    # Готовим запрос 3.4 JSON API на получение счёта
    $request = http_build_query($data_paykeeper);
    curl_setopt($curl,CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl,CURLOPT_URL, $server_paykeeper."/change/invoice/preview/");
    curl_setopt($curl,CURLOPT_CUSTOMREQUEST, 'POST');
    curl_setopt($curl,CURLOPT_HTTPHEADER, $headers);
    curl_setopt($curl,CURLOPT_HEADER, false);
    curl_setopt($curl,CURLOPT_POSTFIELDS, $request);
    $curl_response=curl_exec($curl);
    $response=json_decode($curl_response,true);

    # В ответе должно быть поле invoice_id, иначе - ошибка
    if (!isset($response['invoice_id'])) {
        clubLog('paykeeper_error_invoice_id', $curl_response);
        die();
    }

    # В этой переменной прямая ссылка на оплату с заданными параметрами
    $link = $server_paykeeper."/bill/{$response['invoice_id']}/";
    $modx->scrm->sendRedirect($link);
}

if (PAY_MODE=='callback') {
    clubLog('paycb_paykeeper', $_REQUEST);
    
    $orderid = $_REQUEST['orderid'];
    $payid = $_POST['id'];
    $sum = number_format($_POST['sum'], 2, ".", "");
    $key = $_POST['key'];
 
    if ($key != md5($payid.$sum.$_POST['clientid'].$orderid.$payParams['secret'])) {
        exit("Error! Hash mismatch");
    } else {
        $extId = $modx->getObjectGraph('idExtid', '{"exType":{}}', array(
            'id' => $orderid,
            'duedate:!=' => null,
        ));
        if (!empty($extId)) {
            $idPay = $modx->newObject('idPay', array(
                'sportsmen' => $extId->get('parent'),
                'sum' => $extId->get('extended')['idPaySum'],
                'sumbank' => $sum,
                'datepay' => date('c'),
                'numpay' => $payid,
                'info' => "{$_POST['card_number']}\n{$_POST['service_name']}",
                'receipt' => $extId->get('id'),
            ));
            
            $extId->set('duedate', null); // чтобы не удалил
            $extId->set('extended', $_POST);
            $extId->set('extoken', $key);
            $extId->save();
            
            $idPay->save();
            
            echo "OK ".md5($payid.$payParams['secret']);
        }
    }
}
