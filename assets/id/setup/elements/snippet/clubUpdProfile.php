if (!empty($hook)){
    $data = $hook->getValues();
    $user = $hook->getValue('updateprofile.user');
    $profile = $hook->getValue('updateprofile.profile');
    $_SESSION['user_fullname'] = $profile->get('fullname');
    
    //$modx->log(modX::LOG_LEVEL_ERROR, $dbedit_out );
    return true;
}

return "";