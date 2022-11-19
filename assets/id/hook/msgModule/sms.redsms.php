<?
if ( defined("INIT") ) {
    $json["cfg"] = array(
        'fields' => array(
            'idTmpl' => array(
                'info_sms' => array("ace" => true, 'optional' => true),
                'info_viber' => array("ace" => true, 'optional' => true),
                'viber.btnText' => array('optional' => true),
                'viber.btnUrl' => array('optional' => true),
                'viber.imageUrl' => array('optional' => true),
            ),
            'idMsgProvider' => array(
                'route' => array('val' => 'viber,sms'),
                'login' => array(),
                'api_key' => array()
            )
        )
    );
}
if ( defined("SEND") ) {
    $ts = time();
    $ext = $idMsg->get("extended");
    $curl = curl_init();
    $info = false;
    $arr = array(
        'route' => $sts_ext['route']['val'], 
        'to' => $idMsg->get("msg_to"),
        'viber.btnText' => $ext['viber.btnText']['val'],
        'viber.btnUrl' => $ext['viber.btnUrl']['val'],
        'viber.imageUrl' => $ext['viber.imageUrl']['val']
    );
    
    if ( strripos($idMsg->get('info'), "<br><hr><br>") === false || (!$ext['info_viber']['val'] || !$ext['info_sms']['val'])) $arr['text'] = $idMsg->get('info');
    else {
        $arr['sms.text'] = $ext['info_sms']['val'];
        $arr['viber.text'] = $ext['info_viber']['val'];
    }
    
    curl_setopt($curl, CURLOPT_URL, 'https://cp.redsms.ru/api/message');
    curl_setopt($curl, CURLOPT_POST, 1);
    curl_setopt($curl, CURLOPT_POSTFIELDS, $arr);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($curl, CURLOPT_HTTPHEADER, array(
        'login: '.$sts_ext['login']['val'],
        'ts: '.$ts,
        'secret: '.md5($ts.$sts_ext['api_key']['val']),
    ));
    $response = json_decode(curl_exec($curl), true);
    curl_close($curl);
    if ($response["success"] == true) {
        $idMsg->set('datesend', date("Y-m-d H:i:s"));
        $idMsg->set('extid', $response['items'][0]['uuid']);
    } else {
        $msg_ext['error'] = $response;
        $idMsg->set('extended', array_merge($msg_ext, $ext) );
    }
    $idMsg->save();
}

if ( defined("CALLBACK") ) {
    $idMsg = $modx->getObject('idMsg', array(
        'extid' => $_POST["uuid"]  
    ));
    if (!$idMsg) die; 
    
    //clubLog("redsms_callback", $_POST['status']);
    
    if ($_POST['status'] == 'delivered') {
        $idMsg->set('datedelivery', date("Y-m-d H:i:s", $_POST['status_time']));
        $idMsg->set('info', $_POST['text']);
    } else if ($_POST['status'] == 'read') {
        $idMsg->set('dateread', date("Y-m-d H:i:s", $_POST['status_time']));
    }
    $idMsg->save();
}