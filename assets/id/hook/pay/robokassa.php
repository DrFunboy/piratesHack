<?php

$api_url = 'https://auth.robokassa.ru/Merchant/Index.aspx';

if (PAY_MODE=='init') {
    $items = [];
    if (!empty($orderPack['items'])) {
        $total = 0;
        foreach($orderPack['items'] as $oi) {
            $items[] = array(
                'name' => $oi['name'],
                'sum' => $oi['price'],
                'quantity' => $oi['amount']*1,
                'tax' => 'none',
            );
            $total += $oi['total']*1;
        }
    } elseif (!empty($idSportsmen)){
        $items[] = array(
            'name' => $Description,
            'sum' => $total,
            'quantity' => 1,
            'tax' => 'none',
        );
    }
    
    /* 
    {
      "sno":"osn",
      "items": [
        {
          "name": "Название товара 1",
          "quantity": 1,
          "sum": 100,
          "payment_method": "full_payment",
          "payment_object": "commodity",
          "tax": "vat10"
        },
        {
          "name": "Название товара 2",
          "quantity": 3,
          "sum": 450,
          "payment_method": "full_prepayment",
          "payment_object": "excise",
          "nomenclature_code": "04620034587217"
        }
      ]
    }
    */
    
    $Receipt = json_encode(array(
        "sno" => "osn",
        "items" => $items
    ));
    
    $pwd1 = $payParams['IsTest']? $payParams['test_password1'] : $payParams['password1'];
    
    $extId = setClubExtId($extIdData, $extIdType);
    $pparams = array(
        'MerchantLogin' => $payParams['login'],
        'Password' => $pwd1,
        'OutSum' => $total,
        'InvoiceID' => $extId->get('id'),
        'Description' => $Description, 
        //'Shp_parent' => $extId->get('parent'),
        'SignatureValue' => md5(implode(':', array(
            $payParams['login'],
            $total,
            $extId->get('id'),
            $Receipt,
            $pwd1,
            //"Shp_parent=".$extId->get('parent')
        ))),
        'Receipt' => urlencode($Receipt),
        'IsTest' => $payParams['IsTest']
    );
    
    echo '<html><body>Loading...<form id="roboForm" action="'.$api_url.'" method="post">';
        foreach ($pparams as $par => $val) {
            echo '<input type="hidden" name="'.$par.'" value="'.$val.'">';
        }
    echo '</form>
    <script type="text/javascript">
        document.getElementById("roboForm").submit();
    </script></body></html>';    
}

if (PAY_MODE=='callback') {
    clubLog('paycb_robokassa', $_REQUEST);

    $backUrl = $modx->getOption('site_url');
    if ($rq[2] != "success") $modx->scrm->sendRedirect($backUrl);
    $crc = strtoupper($_REQUEST["SignatureValue"]);
    
    $extId = $modx->getObjectGraph('idExtid', '{"exType":{}}', array(
        'id' => $_REQUEST['InvId'],
        'duedate:!=' => null
    ));
    
    $pwd1 = $_REQUEST['IsTest']? $payParams['test_password1'] : $payParams['password1'];
    $my_crc = strtoupper(md5(join(array(
        $_REQUEST["OutSum"],
        $_REQUEST["InvId"],
        $pwd1,
        //"Shp_parent=".$extId->get('parent')
    ),":")));
    if ($my_crc != $crc){
        $modx->scrm->sendRedirect($backUrl);
        die();
    }
    
    switch ($extId->exType->get('alias')) {
        case 'idSportsmen_payinit':
            $idSportsmen = $modx->getObject('idSportsmen', array(
                'id' => $extId->get('parent'),
            ));
            $backUrl = $backUrl . 'sportsmens/sportsmen.html?key=' . $idSportsmen->get('key');
            $idPay = $modx->newObject('idPay', array(
                'sportsmen' => $extId->get('parent'),
                'sum' => $_REQUEST['OutSum'],
                'datepay' => date('c'),
                'numpay' => $_REQUEST['InvId'],
                'receipt' => $extId->get('id'),
            ));
            $idPay->save();
            
        break;

        case 'idOrderPack_payinit':
            $oPack = $modx->getObject('idOrderPack', $extId->get('parent'));
            if ( !empty($oPack) ) {
                $backUrl = $backUrl . 'shop/myorders.html';
                $ext = $oPack->get('extended');
                $ext['acq'] = $_REQUEST;
                $oPack->set('extended', $ext);
                $oPack->set('receipt', $extId->get('id'));
                
                $oi = $modx->getCollection('idOrderItems', array('orderpack' => $oPack->get('id')));
                $total = 0;
                foreach ($oi as $oi_row) {
                    $total += $oi_row->get('total');
                }
                
                $eq_total = $_REQUEST['OutSum'];
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
    
    
    $modx->scrm->sendRedirect($backUrl);
}
