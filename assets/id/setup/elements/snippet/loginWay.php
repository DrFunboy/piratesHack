$rcode = http_response_code();
//$web = $modx->user->hasSessionContext($modx->context->get('key'));
//$modx->log(modX::LOG_LEVEL_ERROR, "loginWay{$rcode}-{$web}.return: ".$_POST['returnUrl'].'; url:'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'] );
    
if ($rcode!=200) {
    $modx->setPlaceholders(array(
       'rcode' => $rcode,
       'rurl' => $_SERVER['REQUEST_URI'],
    ));
} elseif ($user || $modx->user->hasSessionContext($modx->context->get('key'))) {
    //if (!empty($_SESSION['club_groups'])){
        //$ugroups = $modx->user->getUserGroupNames(); // при входе modx.user еще нету
        
        $ugroups = $modx->getOption('scrm_ugroups');
        foreach(getClubStatus('idPermission', 'extended') as $perm) {
            if (in_array($perm['alias'], $ugroups)) {
                if (!empty($perm['extended']['crew'])) {
                    $_SESSION['club_crew'] = true;
                }
                if (empty($loginUrl)) {
                    $loginUrl = $perm['extended']['loginUrl'];
                }
                //break;
            }
        }
        if (!empty($loginUrl)) {
            $_SESSION['club_loginUrl'] = $loginUrl;
            $modx->sendRedirect($loginUrl);
        }
    //}
}

return "";