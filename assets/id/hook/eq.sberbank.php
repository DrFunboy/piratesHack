<?php
$hook_name = 'eq.sberbank';
function sb_url($test){
    return empty($test)? 'https://securepayments.sberbank.ru':'https://3dsec.sberbank.ru';
}
//$sb_url = 'https://securepayments.sberbank.ru'; //https://3dsec.sberbank.ru

if (!empty($json)) {
    $json['paym'][] = array(
        'name' => $hook_name,
        'label' => 'Банковская карта (онлайн)',
    );
    if (!empty($paydata)) {
        $idPay->save();
        $id_pay = $idPay->get('id');

        $pparams = array(
            'amount' => $paydata['total']*100,
            'currency' => 643,
            'language' => 'ru',
            'pageView' => 'DESKTOP',
            'sessionTimeoutSecs' => 43200, //12 часов
            'orderNumber' => $id_pay,
            'password' => $paydata['password'],
            'userName' => $paydata['username'],
            'returnUrl' => $paydata['backUrl'],
        );
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, sb_url($paydata['test'])."/payment/rest/register.do");
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($pparams));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        $response = curl_exec($ch);
        curl_close($ch);
        
        $paydata['response'] = $response;
        
        if (!empty($response)) {
            $response = json_decode($response, true);
            if ($response['orderId'] && $response['formUrl']) {
                $idPay->set('code1c', $response['orderId']);
                $idPay->save();
                $modx->sendRedirect($response['formUrl']);
            }
        }
        $paydata['debug'] = true; // если не редиректит, покажет
    }
}

if (empty($modx) && !empty($_REQUEST['mdOrder']) && !empty($_REQUEST['orderNumber'])) {
    require_once('eq.include.php');
    //club_log($_REQUEST, $hook_name.'_rq');
    $idPay = $modx->getObject('idPay', array(
        'code1c' => $_REQUEST['mdOrder'],
        'payd' => 0,
    ));
    if (empty($idPay)) die('Not found '.$_REQUEST['mdOrder']);
    
    // Проверяем
    $pparams = array(
        'language' => 'ru',
        'password' => $paydata['password'],
        'userName' => $paydata['username'],
        'orderId' => $_REQUEST['mdOrder'],
    );
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, sb_url($paydata['test'])."/payment/rest/getOrderStatus.do");
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($pparams));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    $response = curl_exec($ch);
    curl_close($ch);
    //"{\"expiration\":\"201912\",\"cardholderName\":\"CARDHOLDER NAME\",\"depositAmount\":100,\"currency\":\"643\",\"approvalCode\":\"123456\",\"authCode\":2,\"ErrorCode\":\"0\",\"ErrorMessage\":\"Успешно\",\"OrderStatus\":2,\"OrderNumber\":\"197\",\"Pan\":\"411111**1111\",\"Amount\":100,\"Ip\":\"188.162.167.7\"}"
    clubLog($hook_name.'_resp', $response);
    
    if (!empty($response)) {
        $response = json_decode($response, true);
        if ($response['ErrorCode'] == 0 && $response['OrderStatus'] == 2) {
            $idPay->fromArray(array(
                'payd' => 1,
                'sum' => $response['Amount'] / 100,
                'datepay' => date('c'),
                'numpay' => $response['OrderNumber'],
                'info' => "{$response['cardholderName']} {$response['Pan']}\n{$response['Ip']}",
            ));
            $idPay->save();
            echo "OK";
        }
    }
}