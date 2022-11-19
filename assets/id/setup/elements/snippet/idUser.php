$email = $modx->getOption('email', $scriptProperties, $_POST['email']);
$fullname = $modx->getOption('fullname', $scriptProperties, $_POST['fullname']);
$name = $modx->getOption('name', $scriptProperties, $_POST['name']);
$user_group = $modx->getOption('user_group', $scriptProperties, $_POST['user_group']);
$iduser_row = $modx->getOption('iduser_row', $scriptProperties, $_POST['iduser_row']);
// Параметр iduser_row обновит в классе $user_group строку, добавит к ней iduser

$out = array(
    'email' => $email = trim(strtolower($email)),
    'password' => '',
);

if (!empty($email) && !empty($user_group)) {
    $Profile = $modx->getObject('modUserProfile', array('email' => $email));
    if (empty($Profile)) {
        $modUser = $modx->getObject('modUser', array('username' => $email));
        if (empty($modUser) ) {
            // Создаем пользователя если не найдем с таким mail
            $modUser = $modx->newObject('modUser', array('username' => $email));
            $out['password'] = $modUser->generatePassword(); // для письма
            $modUser->set('password', $out['password']);
            $modUser->save();
        } else {
            $Profile = $modx->getObject('modUserProfile', array('internalKey' => $modUser->get('id')));
        }
    } else {
        $modUser = $modx->getObject('modUser', $Profile->get('internalKey'));
    }
    
    if (!$Profile) {
        $ProfileData = array(
            'email' => $email,
            'fullname' => $fullname,
            'internalKey' => $modUser->get('id'),
        );
        if ($rowCity = $modx->getObject('idCity', $modx->getOption('club_city', $_SESSION, 0))) {
            $out['idCity'] = $rowCity->toArray();
            $ProfileData['city'] = $rowCity->get('name');
            if ($modUser) {
                $modx->runSnippet('setUserCity', array(
                    'idCity' => $rowCity,
                    'user' => $modUser,
                ));
            }
        }
        $Profile = $modx->newObject('modUserProfile', $ProfileData);
        $Profile->save();
    }
    
    if ($iduser_row) $idUserRow = $modx->getObject($user_group, $iduser_row);
    if ($idUserRow) {
        $idUserRow->set('iduser', $modUser->get('id'));
        if (!$idUserRow->get('email')) $idUserRow->set('email', $Profile->get('email'));
        if (($user_group == 'idSportsmen') && !$idUserRow->get('contact')) $idUserRow->set('contact', $fullname);
        $idUserRow->save();
    }
    
    // Для SAAS систем
    $modUser->joinGroup('www_'.substr(CRM_PREFIX, 0, -1), 'Member', 110);

    // Добавление в группу
    $idPermission = getClubStatusAlias('idPermission', $user_group);
    $out['modUserGroupMember'] = $modUser->joinGroup($user_group, 'Member', (!$idPermission)? null : $idPermission['menuindex']);

    // Уведомления
    $tpl = ($user_group == 'idSportsmen')? 'idSportsmen' : 'idStuff';
    
    $out['name'] = $name? : $fullname;
    $modx->runSnippet('makeMsg', array(
        'handler' => "newUser_{$tpl}",
        'data' => $out,
    ));
} else {
    $out['error'] = 'Empty email or user_group';
}

$modx->setPlaceholder('idUser', $out);

return json_encode($out, JSON_UNESCAPED_UNICODE);