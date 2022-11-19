<?php

#https://3dsec.sberbank.ru/payment/rest/getOrderStatusExtended.do

$api_url = !$payParams['test']? 'https://securepayments.sberbank.ru' : 'https://3dsec.sberbank.ru';


if (PAY_MODE=='init') {
    # По умолчанию в процессинг банка передаются поля:
    # orderNumber – номер заказа в системе магазина;
    # description – описание заказа (не более 24 символов, запрещены к использованию %, +, конец строки \r и перенос строки \n).
    
    $items = []; //cartItems - Пока не понятно что с этим делать
    if (!empty($orderPack['items'])) {
        
        $total = 0;
        foreach($orderPack['items'] as $oi) {
            $items[] = array(
                'Name' => $oi['name'],
                'Price' => $oi['price']*100,
                'Quantity' => $oi['amount']*1,
                'Amount' => $oi['total']*100,
                'Tax' => 'none',
            );
            $total += $oi['total']*1; // Умножается потом
        }
    } elseif (!empty($idSportsmen)){
        $items[] = array(
            'Name' => $Description,
            'Price' => $total*100,
            'Quantity' => 1,
            'Amount' => $total*100,
            'Tax' => 'none',
        );
    }

    /* {
        "amount": 100,
        "currency": 643,
        "language": "ru",
        "pageView": "DESKTOP",
        "sessionTimeoutSecs": 43200,
        "_sessionTimeoutSecs": "12 часов",
        "orderNumber": "",
        "password": "xxx",
        "userName": "xxx",
        "returnUrl": "https://merchant.com/return_url"
    } */
    
    $extId = setClubExtId($extIdData, $extIdType);
    $pparams = array_merge($payParams['init'], array(
        'amount' => $total*100,
        'orderNumber' => $extId->get('id'),
        'returnUrl' => $backUrl,
        'failUrl' => $backUrl,
        'description' => $Description,
    ));
    
    clubLog('pay_sber_curl', $pparams);
    
    $curl = curl_init($api_url.'/payment/rest/register.do');
    curl_setopt($curl, CURLOPT_POST, true);
    curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($pparams));
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    $response = curl_exec($curl);
    $code = curl_getinfo($curl, CURLINFO_HTTP_CODE);
    curl_close($curl);

    if ($code != 200) {
        clubLog('pay_sber_error', "SberError: {$code}. {$response}");
    } else {
        clubLog('pay_sber_response', $response);
        $response = getClubJSON($response);
        if ($response['orderId'] && $response['formUrl']) {
            $extId->set('extoken', $response['orderId']);
            $extId->save();
            $modx->scrm->sendRedirect($response['formUrl']);
        }
    }
}

if (PAY_MODE=='callback') {
    clubLog('paycb_sber', $_REQUEST);

    $extId = $modx->getObjectGraph('idExtid', '{"exType":{}}', array(
        'id' => $_REQUEST['orderNumber'],
        'extoken' => $_REQUEST['mdOrder'],
        'duedate:!=' => null,
    ));
    
    if (!empty($extId)) {
        $ch = curl_init($api_url.'/payment/rest/getOrderStatusExtended.do');
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query(array(
            'password' => $payParams['init']['password'],
            'userName' => $payParams['init']['userName'],
            'orderId' => $_REQUEST['mdOrder'],
        )));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $response = curl_exec($ch);
        curl_close($ch);

        clubLog('paycb_sber_getOrderStatusExtended', $response);
        $payData = getClubJSON($response);
        if ($payData['errorCode'] == 0 && $payData['orderStatus'] == 2) {
            $extId->set('duedate', null); // чтобы не удалил
            $extId->set('extended', $payData);
            $extId->save();
            
            switch ($extId->exType->get('alias')) {
                case 'idSportsmen_payinit':
                    $idPay = $modx->newObject('idPay', array(
                        'sportsmen' => $extId->get('parent'),
                        'sum' => $payData['amount'] / 100,
                        'datepay' => (new DateTime('@'.substr($payData['date'], 0, 10)))->format('c'),  //depositedDate Дата оплаты заказа в формате UNIX-времени (POSIX-времени).
                        'numpay' => $payData['authRefNum'],
                        'info' => "{$payData['bankInfo']['bankName']} {$payData['cardAuthInfo']['maskedPan']} {$payData['ip']}",
                        'receipt' => $extId->get('id'),
                    ));
                    $idPay->save();
                break;
    
                // case 'idOrderPack_payinit':
            }
        }
    }
    echo 'OK';
}
