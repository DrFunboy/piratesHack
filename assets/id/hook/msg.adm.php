<?php
if (empty($userID)) $modx->sendUnauthorizedPage();
$data = $_POST;
if (!empty($data['email'])) {
    $admail = array();

    $mcfg = clubConfig('emailtech');
    $idCity = $modx->getObject('idCity', $modx->getOption('club_city', $_SESSION, 0));
    if (!empty($idCity)) {
        $city_email = $idCity->get('email');
        $data['city'] = $idCity->get('name');
        if (!empty($city_email)) $admail[] = $city_email;
    }
    /* elseif (!empty($mcfg['SMTP'])) {
        $smtp = json_decode($mcfg['SMTP'], true);
        if (!empty($smtp['emailsender'])) $admail[] = $smtp['emailsender'];
    } */
    foreach(explode(',', $mcfg['emailtech']) as $mail) {
        if (!empty($mail)) {
            $admail[] = empty($admail)? $mail : 'bcc:'.$mail;
        }
    }
    
    if (!empty($admail)) {
        $admail[] = 'reply-to:'.$data['email'];
        $admail[] = 'cc:'.$data['email'];
        $data['mail'] = $data['email']; // для текста письма
        $data['email'] = implode(',', $admail); // адресаты
        $modx->runSnippet('makeMsg', array(
            'handler' => 'clubMsgToAdm',
            'data' => $data,
        ));
    }
    // В сессию прописать город при запросе спортсмена в idGetSportsmen
    // Выбрать email Города. Если нет - вставить Email tech
    // В bcc поместить email_tech
    // Если email пуст - не отправлять
}