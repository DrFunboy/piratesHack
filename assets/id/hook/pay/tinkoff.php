<?php

//https://www.tinkoff.ru/kassa/develop/api/payments/init-request/
$api_url = 'https://securepay.tinkoff.ru/v2/';

if (PAY_MODE=='init') {
    
    $items = [];
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
        "Name": "Наименование товара 1",
        "Price": 10000,
        "Quantity": 1.00,
        "Amount": 10000,
        "PaymentMethod": "full_prepayment",
        "PaymentObject": "commodity",
        "Tax": "vat10",
        "Ean13": "0123456789"
    } */
    
    $extId = setClubExtId($extIdData, $extIdType);
    $pparams = array(
        'TerminalKey' => $payParams['TerminalKey'],
        'Password' => $payParams['Password'],
        'Amount' => $total*100,
        //'sessionTimeoutSecs' => 0,
        'OrderId' => $extId->get('id'),
        'Description' => $Description, //$paydata['paytext'],
        'returnUrl' => $backUrl, // ???
        'SuccessURL' => $backUrl,
        'FailURL' => $backUrl,
        'NotificationURL' => $callbackUrl,
        'Receipt' => array(
            'Email' => $payContact['email'],
            //'Phone' => "+79031234567",
            //'EmailCompany' => $paydata['email'],
            'Taxation' => $payParams['tax']? : 'osn',
            'Items' => $items,
        ),
    );

    ksort($pparams);
    $token = '';
    foreach ($pparams as $arg) {
        if (!is_array($arg)) $token .= $arg;
    }
    $pparams['Token'] = hash('sha256', $token);
    unset($pparams['Password']);
    $pparams['DATA'] = array(
        //"Phone": "+71234567890",
        'Email' => $payContact['email'],
    );
    
    //$paydata['params'] = $pparams;
    clubLog('pay_tinkoff_curl', $pparams);
    
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $api_url.'Init');
    curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($curl, CURLOPT_POST, true);
    curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($pparams));
    curl_setopt($curl, CURLOPT_HTTPHEADER, array(
        'Content-Type: application/json',
    ));

    $response = curl_exec($curl);
    $code = curl_getinfo($curl, CURLINFO_HTTP_CODE);
    curl_close($curl);
    clubLog('pay_tinkoff_init', $response);
    
    if ($code != 200) {
        $modx->log(modX::LOG_LEVEL_ERROR, "Tinkoff Error: {$code}. {$response}");
    } else {
        $response = json_decode($response, true);
        if (!empty($response['PaymentId']) && !empty($response['PaymentURL'])) {
            $extId->set('extoken', $response['PaymentId']);
            $extId->save();
            $modx->scrm->sendRedirect($response['PaymentURL']);
        }
    }
}

if (PAY_MODE=='callback') {
    $cbData = file_get_contents('php://input');
    clubLog('paycb_tinkoff', $cbData); // 'php://input'
    $payData = json_decode($cbData, true);
    if (!empty($payData['Success']) && $payData['Status'] == 'CONFIRMED') {
    
        $extId = $modx->getObjectGraph('idExtid', '{"exType":{}}', array(
            'id' => $payData['OrderId'],
            'extoken' => $payData['PaymentId'],
            'duedate:!=' => null,
        ));
        
        if (!empty($extId)) {
            $extId->set('duedate', null); // чтобы не удалил
            $extId->set('extended', $payData);
            $extId->save();

            switch ($extId->exType->get('alias')) {
                case 'idSportsmen_payinit':
                    $idPay = $modx->newObject('idPay', array(
                        'sportsmen' => $extId->get('parent'),
                        'sum' => $payData['Amount'] / 100,
                        'datepay' => date('c'),
                        'numpay' => $payData['PaymentId'],
                        'info' => "{$payData['CardId']} {$payData['Pan']}\n{$payData['Status']}",
                        'receipt' => $extId->get('id'),
                    ));
                    $idPay->save();
                break;
    
                case 'idOrderPack_payinit':
                    $oPack = $modx->getObject('idOrderPack', $extId->get('parent'));
                    if (!empty($oPack)) {
                        $ext = $oPack->get('extended');
                        $ext['acq'] = $payData;
                        $oPack->set('extended', $ext);
                        $oPack->set('receipt', $extId->get('id'));
                        
                        $oi = $modx->getCollection('idOrderItems', array('orderpack' => $oPack->get('id')));
                        $total = 0;
                        foreach ($oi as $oi_row) {
                            $total += $oi_row->get('total');
                        }
                        
                        $eq_total = $payData['Amount'] / 100;
                        if ($total == $eq_total) {
                            $oPack->set('datepay', date('c'));
                            $oPack->save();
                            foreach ($oi as $oi_row) {
                                $oi_row->set('status', 'payd');
                                $oi_row->save();
                            }
                        }
                    }
                break;
            }
        }
    }
    echo 'OK';
}