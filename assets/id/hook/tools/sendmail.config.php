<?php

$mcfg = clubConfig('mailBrand,SMTP');
if (!empty($mcfg['SMTP'])) {
    $smtp = json_decode($mcfg['SMTP'], true);
    $smtp['mail_use_smtp'] = 1;
    if ($smtp['mail_smtp_pass'] == '*******') {
        $smtp['emailsender'] = 'send@sportcrm.club';
        $smtp['mail_smtp_hosts'] = 'smtp-pulse.com';
        $smtp['mail_smtp_port'] = 465;
        $smtp['mail_smtp_prefix'] = 'ssl';
        $smtp['mail_smtp_user'] = 'info@sportcrm.club';
        $smtp['mail_smtp_pass'] = '7AJF286rqaYjkf';
        if ($_SESSION['club_city']) {
            if (($idCity = $modx->getObject('idCity', $_SESSION['club_city'])) && $idCity->get('email')) {
                $smtp['mail_reply_to'] = $idCity->get('email');
            }
        }
    }
    //clubLog('mailConfig', $smtp);
    foreach($smtp as $okey => $oval) {
        $modx->setOption($okey, $oval);
    }
}

if (empty($modx->mail)) $modx->getService('mail', 'mail.modPHPMailer');
