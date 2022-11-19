<?
if ( defined("INIT") ) {
    $json["cfg"] = array(
        'fields' => array(
            'idTmpl' => array(
                'subj' => array()
            ),
            'idMsgProvider' => array(
                'emailsender' => array(),
                'mail_smtp_hosts' => array(),
                'mail_smtp_port' => array(),
                'mail_smtp_prefix' => array(),
                'mail_smtp_user' => array(),
                'mail_smtp_pass' => array(),
                'mail_reply_to' => array()
            )
        )
    );
} 

if ( defined("SEND") ) {
    $smtp['mail_use_smtp'] = 1;
    $smtp["mail_smtp_auth"] = 1;
    foreach ($sts_ext as $k=>$v){
        $smtp[$k] = $v["val"];
    }
    // $smtp["emailsender"] = "send@sportcrm.club";
    // $smtp["mail_smtp_hosts"] = "smtp-pulse.com";
    // $smtp["mail_smtp_port"] = "465";
    // $smtp["mail_smtp_prefix"] = "ssl";
    // $smtp["mail_smtp_user"] = "info@sportcrm.club";
    // $smtp["mail_smtp_pass"] = "7AJF286rqaYjkf";
    // $smtp['mail_reply_to'] = "info@sportcrm.club";
    
    foreach($smtp as $okey => $oval) {
        $modx->setOption($okey, $oval);
    }
    
    $modx->getService('mail', 'mail.modPHPMailer');
    
    $modx->mail->setHTML(true);
    $modx->mail->set(modMail::MAIL_FROM, $modx->getOption('emailsender'));
    $modx->mail->set(modMail::MAIL_FROM_NAME, $modx->getOption('site_name'));
    $modx->mail->set(modMail::MAIL_SUBJECT, $idMsg->get("msg_subj") );
    $modx->mail->set(modMail::MAIL_BODY, $idMsg->get("info") );
    
    $modx->mail->address('to', $idMsg->get("msg_to"));
    $modx->mail->address('reply-to', $modx->getOption('mail_reply_to'));
    
    if (!$modx->mail->send()) {
        $msg_ext['error'] = $response;
        if (! ($ext = json_decode($idMsg->get("extended"))) ) $ext = [];
        $idMsg->set('extended', array_merge($msg_ext, $ext) );
    } else {
        $idMsg->set('datesend', date("Y-m-d H:i:s"));;
    }
    $idMsg->save();
    $modx->mail->reset();
}