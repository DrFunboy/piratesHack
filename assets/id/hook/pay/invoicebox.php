<?php

// https://www.invoicebox.ru/ru/integration/webapi/paymentform/
$api_url = 'https://go.invoicebox.ru/module_inbox_auto.u';

if (PAY_MODE=='init') {
    
    $pd = array();
    $n = 1;
    if (!empty($idSportsmen)){
        $pd["itransfer_item{$n}_name"] = $Description;
        $pd["itransfer_item{$n}_quantity"] = 1;
        $pd["itransfer_item{$n}_measure"] = '.';
        $pd["itransfer_item{$n}_price"] = $total;
        $pd["itransfer_item{$n}_vatrate"] = '-';
        $pd["itransfer_item{$n}_vat"] = 0;
    }
    
    /*$total = 0; $n = 1;
    foreach($paydata['items'] as $pi) {
        $pd["itransfer_item{$n}_name"] = $pi['name'];
        $pd["itransfer_item{$n}_quantity"] = $pi['amount'];
        $pd["itransfer_item{$n}_measure"] = '.';
        $pd["itransfer_item{$n}_price"] = $pi['price'];
        $pd["itransfer_item{$n}_vatrate"] = '-';
        $pd["itransfer_item{$n}_vat"] = 0;
        $total += $pi['total'];
        $n++;
    }*/
    
    $extId = setClubExtId($extIdData, $extIdType);
    //$pd['itransfer_testmode'] = 1;
    $pd['itransfer_order_amount'] = $total;
    $pd['itransfer_url_return'] = $backUrl;
    $pd['itransfer_url_returnsuccess'] = $backUrl;
    $pd['itransfer_person_email'] = $payContact['email'];
    $pd['itransfer_person_name'] = $payContact['name'];
    $pd['itransfer_body_type'] = 'PRIVATE';
    $pd['itransfer_order_description'] = $Description;
    $pd['itransfer_order_currency_ident'] = 'RUB';
    $pd['itransfer_order_id'] = $extId->get('id');
    $pd['itransfer_participant_ident'] = $payParams['participant'];
    $pd['itransfer_participant_id'] = $payParams['shop'];
    $pd['itransfer_order_amount'] = $total;
    $pd['itransfer_participant_sign'] = md5("{$pd['itransfer_participant_id']}{$pd['itransfer_order_id']}{$total}{$pd['itransfer_order_currency_ident']}{$payParams['key']}");
    
    $modx->scrm->sendRedirect( $api_url . "?" . http_build_query($pd) );
}

if (PAY_MODE=='callback') {
    clubLog('paycb_invoicebox', $_REQUEST);
    
    $extId = $modx->getObjectGraph('idExtid', '{"exType":{}}', array(
        'id' => $_REQUEST['participantOrderId'],
        'duedate:!=' => null,
    ));
    // можно проверить sign
    if (!empty($extId)) {
        $extId->set('duedate', null); // чтобы не удалил
        $extId->set('extended', $_REQUEST);
        $extId->set('extoken', $_REQUEST['ucode']);
        $extId->save();

        switch ($extId->exType->get('alias')) {
            case 'idSportsmen_payinit':
                $idPay = $modx->newObject('idPay', array(
                    'sportsmen' => $extId->get('parent'),
                    'sum' => $_REQUEST['amount']*1,
                    'datepay' => $_REQUEST['time'],
                    'numpay' => $_REQUEST['ucode'],
                    'info' => $_REQUEST['agentName'],
                    'receipt' => $extId->get('id'),
                ));
                $idPay->save();
            break;
        }
    }
    echo "OK";
}
