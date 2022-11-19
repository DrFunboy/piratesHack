<?php
$hook_name = 'eq.tinkoff';

if (!empty($json)) {
    $json['paym'][] = array(
        'name' => $hook_name,
        'label' => 'Банковская карта (онлайн)',
    );
    if (!empty($paydata)) {
        $api_url = 'https://securepay.tinkoff.ru/v2/';
        
        if (empty($paydata['id_pay']) && !empty($idPay)) {
            $idPay->save();
            $paydata['id_pay'] = $idPay->get('id');
        }

        $total = 0;
        $pay_items = [];
        if (!empty($paydata['items'])) {
            foreach($paydata['items'] as $pi) {
                $pay_items[] = array(
                    'Name' => $pi['name'],
                    'Price' => $pi['price']*100,
                    'Quantity' => $pi['amount']*1,
                    'Amount' => $pi['total']*100,
                    //'PaymentMethod' => "full_prepayment",
                    'Tax' => 'none',
                );
                $total += $pi['total']*100;
            }
        } else {
            $pay_items[] = array(
                'Name' => $paydata['paytext'],
                'Price' => $paydata['total']*100,
                'Quantity' => 1,
                'Amount' => $total = $paydata['total']*100,
                //'PaymentMethod' => "full_prepayment",
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
        
        $pparams = array(
            'TerminalKey' => $paydata['key'],
            'Password' => $paydata['password'],
            'Amount' => $total,
            //'sessionTimeoutSecs' => 0,
            'OrderId' => $paydata['id_pay'],
            'Description' => $paydata['paytext'],
            //'DATA' => [
                //"Phone": "+71234567890",
                //'Email' => $paydata['email'],
            //],
            'returnUrl' => $paydata['backUrl'],
            'Receipt' => [
                'Email' => $paydata['email'],
                //'Phone' => "+79031234567",
                //'EmailCompany' => $paydata['email'],
                'Taxation' => $paydata['tax']? : 'osn',
                'Items' => $pay_items,
            ],
        );
        
        ksort($pparams);
        $token = '';
        foreach ($pparams as $arg) {
            if (!is_array($arg)) $token .= $arg;
        }
        
        
        $pparams['Token'] = hash('sha256', $token);
        unset($pparams['Password']);
        $pparams['DATA'] = [
            //"Phone": "+71234567890",
            'Email' => $paydata['email'],
        ];
        
        $paydata['params'] = $pparams;
        
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
        curl_close($curl);
        $paydata['response'] = $response;

        if (!empty($response)) {
            $response = json_decode($response, true);
            if (!empty($response['PaymentId']) && !empty($response['PaymentURL'])) {
                //$idPay->set('code1c', $response['PaymentId']);
                //$idPay->save();
                $modx->sendRedirect($response['PaymentURL']);
            }
        }
        $paydata['debug'] = true; // если не редиректит, покажет
    }
}

if (empty($modx)) {
    // {"TerminalKey":"1571913858776DEMO","OrderId":"208","Success":true,"Status":"CONFIRMED","PaymentId":133087003,"ErrorCode":"0","Amount":98000,"CardId":24066027,"Pan":"430000******0777","ExpDate":"1122","Token":"6743210a3ef550bcade19e47d1a801532fb45c787d306d08f63222a45ed2d70b"}
    
    $hook_log = file_get_contents('php://input');
    if (!empty($hook_log)) {
        $result = json_decode($hook_log, true);
        $hook_order = $result['OrderId'];
        require_once('eq.include.php');

        if ($result['Success']&&!empty($idPay)) {
            $idPay->fromArray(array(
                'payd' => 1,
                'sum' => $result['Amount'] / 100,
                'datepay' => date('c'),
                'numpay' => $result['PaymentId'],
                'info' => "{$result['CardId']} {$result['Pan']}\n{$result['Status']}",
            ));
            $idPay->save();
        }
        echo "OK";
    }
}