$handler = $modx->getOption('handler', $scriptProperties, null);
//$data = $modx->getOption('data', $scriptProperties, null);
$data = $modx->getOption('data', $scriptProperties, $_REQUEST);
clubLog('makeMsg', $data);

if (!empty($userProfile)) {
    $data['tel'] = $userProfile->get('mobilephone');
    $data['email'] = $userProfile->get('email');
}


$stmt = $modx->newQuery('idTmpl', array(
    'handler' => $handler,
    //'published' => 1,
))->select(explode(',','id,type,content,subj'))->prepare();
//$q->select(explode(',','id,name,address'));
$stmt->execute();
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
foreach($rows as $k => $tmpl){
    switch($tmpl['type']) {
        case 'sms';
            $msg_to = $data['tel'];
        break;
        default:
            $tmpl['type'] = 'email';
            $msg_to = $data['email'];
            $idCity = $data['idCity']? : ($data['idClub']? $data['idClub']['idCity'] : null);
            if ($msg_to && $idCity && $idCity['email']) {
                $msg_to .= ',reply-to:'.$idCity['email'];
            }
    }
    if ($msg_to) {
        $msg_subj = clubTmpl($tmpl['subj'], $data);
        $msg_body = clubTmpl($tmpl['content'], $data);
        
        $modx->runSnippet('dbedit', array(
            'data' => array(
                'oper' => 'add',
                'table' => 'idMsg',
                'type' => $tmpl['type'],
                'msg_to' => $msg_to,
                'msg_subj' => $msg_subj,
                'info' => $msg_body,
            ),
            //'placeholder' => 'idMsgRow',
        ));
    }
}

return json_encode($rows, JSON_UNESCAPED_UNICODE);