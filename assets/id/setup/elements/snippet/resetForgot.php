$id = $modx->resource->get('id');
if ($_REQUEST["rpas"]=="ok") {
    return $modx->getChunk('idForgotPassSentTpl');
} elseif (isset($_REQUEST["lp"])) {
    return $modx->runSnippet('ResetPassword', array(
        'autoLogin' => 1,
        'tpl' => 'idResetPassTpl',
        'expiredTpl' => 'idExpiredTpl',
    ));
} else {
    $cookie_domain = $modx->getOption('session_cookie_domain', null, 'PHPSESSID', true);
    $servname = explode('.', $_SERVER['SERVER_NAME']);
    setcookie($cookie_domain, '', time() - 3600, "/");
    setcookie($cookie_domain, '', time() - 3600, "/", '.'.$servname[sizeof($servname)-2].'.'.$servname[sizeof($servname)-1]);
    unset($_COOKIE[$cookie_domain]);
    
    return $modx->runSnippet('ForgotPassword', array(
        'resetResourceId' => $id,
        'redirectTo' => $id,
        'redirectParams' => '{"rpas":"ok"}',
        'emailSubject' => 'Восстановление пароля',
        'tpl' => 'idForgotPassTpl',
        'emailTpl' => 'idForgotPassEmail',
        'sentTpl' => 'idForgotPassSentTpl',
    ));
}