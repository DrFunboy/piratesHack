$data = $_POST;

$json = array(
    'pd' => $data,
    'sd' => array(
        'email' => $_GET['email'],
    ),
    'token' => $_GET['token'],
    'created' => date('c'),
);

if (!empty($_GET['token'])) {
    $idUserPassword = getClubExtId(array(
        'extoken' => $_GET['token'],
    ), 'idUser_password');
    /*$modx->getService('registry', 'registry.modRegistry');
    $modx->registry->addRegister('login','registry.modFileRegister');
    $modx->registry->login->connect();
    $modx->registry->login->subscribe('/clubrecover/'.$_GET['token']);
    $msgs = $modx->registry->login->read(array(
        'poll_limit' => 1,
        'remove_read' => false,
    ));
    $internalKey = reset($msgs);*/
    if (!empty($idUserPassword) && !empty($idUserPassword['parent'])) {
        $user = $modx->getObject('modUser', $idUserPassword['parent']);
        if (!empty($user)) {
            if (!$user->hasSessionContext('web')) {
                $user->addSessionContext('web');
                $modx->invokeEvent('OnWebLogin',array(
                    'user' => $user,
                    'returnUrl' => true,
                ));
            }
            $modx->sendRedirect('/login/change-password.html');
        }
    }
} elseif (!empty($_POST['email'])&&!empty($_POST['recoveraccess'])) {
    $Profile = $modx->getObject('modUserProfile', array('email' => $_POST['email']));
    //$modx->log(modX::LOG_LEVEL_ERROR, "Log2 ".$_POST['email']);
    if (!empty($Profile)) {
        $bytes = openssl_random_pseudo_bytes(32);
        $data['token'] = bin2hex($bytes);
        setClubExtId(array(
            'parent' => $Profile->get('internalKey'),
            'extoken' => $data['token'],
            'duedate' => (new DateTime('today +1 week'))->format('c'),
        ), 'idUser_password');
        /*$modx->getService('registry', 'registry.modRegistry');
        $modx->registry->addRegister('login', 'registry.modFileRegister', array('directory' => 'login'));
        $modx->registry->login->connect();
        $modx->registry->login->subscribe('/clubrecover/');
        $modx->registry->login->send('/clubrecover/', array(
            $data['token'] => $Profile->get('internalKey'),
        ), array(
            'ttl' => 7*24*60*60,
        ));*/
        
        //$modx->log(modX::LOG_LEVEL_ERROR, "Log2 ".json_encode($Profile->toArray(), JSON_UNESCAPED_UNICODE));
        
        $modx->runSnippet('makeMsg', array(
            'handler' => 'clubRecoverAccess',
            'data' => $data,
        ));
    }
} else {
    $cookie_domain = $modx->getOption('session_cookie_domain', null, 'PHPSESSID', true);
    $servname = explode('.', $_SERVER['SERVER_NAME']);
    setcookie($cookie_domain, '', time() - 3600, "/");
    setcookie($cookie_domain, '', time() - 3600, "/", '.'.$servname[sizeof($servname)-2].'.'.$servname[sizeof($servname)-1]);
    unset($_COOKIE[$cookie_domain]);
    
    /*return $modx->runSnippet('ForgotPassword', array(
        'resetResourceId' => $id,
        'redirectTo' => $id,
        'redirectParams' => '{"rpas":"ok"}',
        'emailSubject' => 'Восстановление пароля',
        'tpl' => 'idForgotPassTpl',
        'emailTpl' => 'idForgotPassEmail',
        'sentTpl' => 'idForgotPassSentTpl',
    ));*/
}

echo json_encode($json, JSON_UNESCAPED_UNICODE);