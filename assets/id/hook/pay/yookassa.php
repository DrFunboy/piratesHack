<?php

if (PAY_MODE=='init') {
    $url = 'https://api.yookassa.ru/v3/';
    $method = 'payments';

    $curl = curl_init();
    curl_setopt_array($curl, [
        CURLOPT_URL            => $url . $method,
        CURLOPT_HTTPAUTH       => CURLAUTH_BASIC,
        CURLOPT_USERPWD        => $payParams['shop_id'].':'.$payParams['secret'],
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_VERBOSE        => false,
        CURLOPT_SSL_VERIFYHOST => false,
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_HTTPHEADER     => [
            'Idempotence-Key: ' . uniqid(),
            'Content-Type: application/json',
            'Cache-Control: no-cache',
            'charset="utf-8"',
        ],
    ]);
    $data = $payParams['init'];
    $data['confirmation']['return_url'] = $backUrl;
    $data['amount']['value'] = number_format($total, 2, '.', '');
    $data['description'] = $Description;

    curl_setopt_array($curl, [
        CURLOPT_POSTFIELDS => json_encode($data, JSON_UNESCAPED_UNICODE),
        CURLOPT_POST       => true,
    ]);

    $result = curl_exec($curl);
    $code = curl_getinfo($curl, CURLINFO_HTTP_CODE);
    curl_close($curl);

    $result = json_decode($result, true);
    if ($code != 200) {
        if (isset($result['type']) && $result['type'] == 'error') {
            clubLog('yookassa_error', $result);
        } else {
            clubLog('yookassa_error', 'Server is not responding');
        }
        die();
    } else {
        $extIdData['extoken'] = $result['id'];
        setClubExtId($extIdData, $extIdType);
        $modx->scrm->sendRedirect($result['confirmation']['confirmation_url']);
    }
}

if (PAY_MODE=='callback') {
    $payData = file_get_contents('php://input');
    clubLog('yookassa_callback', $payData);
    $payData = json_decode($payData, true);
    if ($payData['event'] == "payment.succeeded") {
        $extId = $modx->getObjectGraph('idExtid', '{"exType":{}}', array(
            //'exType.alias' => 'idUser_city',
            'extid' => $payCfg->get('id'),
            'extoken' => $payData['object']['id'],
            'duedate:!=' => null,
        ));
        if (!empty($extId) && $extId->exType->get('alias') == 'idSportsmen_payinit') {
            $extId->set('duedate', null); // чтобы не удалил
            $extId->set('extended', $payData);
            $extId->save();
            
            $idPay = $modx->newObject('idPay', array(
                'sportsmen' => $extId->get('parent'),
                'sum' => $payData['object']['amount']['value'],
                'datepay' => $payData['object']['captured_at'],
                'numpay' => $payData['object']['authorization_details']['rrn'],
                'info' => $payData['object']['payment_method']['title'],
                'receipt' => $extId->get('id'),
            ));
            $idPay->save();
        }
    }
}