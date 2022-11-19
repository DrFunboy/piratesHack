if (!empty($row)) $rows = array( "{$row->get('id')}" => $row );
if (!$rows) {
    $msg_id = $modx->getOption('msg_id', $scriptProperties, 0);
    $rows = $modx->getCollection('idMsg', $msg_id);
}

foreach ($rows as $msg_key => $msg) {
    //clubLog('sendMsg', $msg->toArray());
    $type = $msg->get('type');
    $msg_body = $msg->get('info');
    $msg_to = explode(',', $msg->get('msg_to'));
    $msg_ext = $msg->get('extended'); // Для лога

    $msg->fromArray(array(
        'attempt' => $msg->get('attempt')+1,
        'datestart' => date('c'),
    ));
    $msg->save(); // Запись попытки
    
    if ($type=='email' || $type=='mail') {
        include_once(CRM_PATH.'hook/tools/sendmail.config.php');

        //$msg_body = $modx->getChunk("mailBrand", array('content' => $msg_body));
        $modx->mail->setHTML(true);
        $modx->mail->set(modMail::MAIL_FROM, $modx->getOption('emailsender'));
        $modx->mail->set(modMail::MAIL_FROM_NAME, $modx->getOption('site_name'));
        $modx->mail->set(modMail::MAIL_SUBJECT, $msg->get('msg_subj'));
        $modx->mail->set(modMail::MAIL_BODY, clubTmpl($mcfg['mailBrand'], array(
            'content' => $msg_body,
        )));

        $address = array();
        foreach ($msg_to as $email) {
            $email_arr = explode(':', $email); //reply-to,bcc
            if (sizeof($email_arr) == 1) array_unshift($email_arr, 'to');
            $address[ $email_arr[0] ] = $email_arr[1];
            $modx->mail->address($email_arr[0], $email_arr[1]);
        }
        //clubLog('sendMail', $address);
        if (!$address['reply-to'] && ($emailReplyTo = $modx->getOption('mail_reply_to'))) {
            $modx->mail->address('reply-to', $emailReplyTo);
        }

        foreach($_FILES as $file) {
            foreach($file['error'] as $n => $error) if (empty($error)) {
                $modx->mail->attach($file['tmp_name'][$n], $file['name'][$n]);
                //$modx->mail->mailer->addAttachment($file['tmp_name'][$n], $file['name'][$n]);
            }
        }
        if (!$modx->mail->send()) {
            $msg_ext['error'] = $modx->mail->mailer->ErrorInfo;
            clubLog('mailSendError', [$msg_key, $msg_ext['error']]);
            $msg->set('extended', $msg_ext);
        } else {
            $msg->set('ready', 1);
        }
        $msg->save();
        $modx->mail->reset();
    }
    if ($msg->get('type') == 'sms') {
        $api_key = $modx->getOption('sms_api_key'); // '7AA512BF-70DE-F958-D2F9-0C6509B86965'
        if (!empty($api_key)){
            require_once MODX_ASSETS_PATH.'id/phplib/sms.ru/sms.ru.php';
            $smsru = new SMSRU($api_key); // Ваш уникальный программный ключ, который можно получить на главной странице
            
            $data = new stdClass();
            $data->to = $msg_to[0];
            $data->text = $msg_body; // Текст сообщения
            // $data->from = ''; // Если у вас уже одобрен буквенный отправитель, его можно указать здесь, в противном случае будет использоваться ваш отправитель по умолчанию
            // $data->time = time() + 7*60*60; // Отложить отправку на 7 часов
            // $data->translit = 1; // Перевести все русские символы в латиницу (позволяет сэкономить на длине СМС)
            //$data->test = 1; // Позволяет выполнить запрос в тестовом режиме без реальной отправки сообщения
            // $data->partner_id = '1'; // Можно указать ваш ID партнера, если вы интегрируете код в чужую систему
            $sms = $smsru->send_one($data); // Отправка сообщения и возврат данных в переменную
            
            $result = array('status' => $sms->status);
            if ($result['status'] == "OK") { // Запрос выполнен успешно
                $result['id'] = $sms->sms_id;
                $result['balance'] = $sms->balance;
                $msg->set('ready', 1);
            } else {
                $result['status_code'] = $sms->status_code;
                $result['status_text'] = $sms->status_text;
            }
            $msg_ext['result'] = $result;
            $msg->set('extended', $msg_ext);
            $msg->save();
        }
    }
}