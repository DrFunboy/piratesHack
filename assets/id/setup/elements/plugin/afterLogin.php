$ugroups = $user->getUserGroupNames();
$_SESSION['club_groups'] = implode(';', $ugroups);
$_SESSION['scrm_thislogin'] = date('c');

if (in_array('idAdmin', $ugroups)) $_SESSION['club_admin'] = 1;
if (in_array('idManager', $ugroups)) $_SESSION['club_manager'] = 1;
$_SESSION['club_debug'] = $user->isMember('Administrator');

if (($userprofile = $user->getOne('Profile')) !== null) {
    $_SESSION['user_fullname'] = $userprofile->get('fullname');
    $_SESSION['club_cityname'] = $userprofile->get('city');
    $modx->loadClass('idExtid');
    $modx->map['idExtid']['aggregates']['idCity'] = array (
        'class' => 'idCity',
        'local' => 'extid',
        'foreign' => 'id',
        'cardinality' => 'one',
        'owner' => 'foreign',
    );
    
    $idUser_city = getClubExtId(array(
        'parent' => $user->get('id'),
    ), 'idUser_city', true, 'idCity');

    if (!empty($idUser_city)){
        $_SESSION['club_city'] = $idUser_city->idCity->get('id');
        $_SESSION['club_cityname'] = $idUser_city->idCity->get('name');
    }
}

$returnUrl = $modx->getOption('returnUrl', $scriptProperties, $_POST['returnUrl']);
//$returnUrl = $modx->getOption('returnUrl', $_POST, $returnUrl);

//$modx->log(modX::LOG_LEVEL_ERROR, "afterLogin: $returnUrl; url:".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'].'; user:'.$user->get('id'));

if (empty($returnUrl)) {
    $modx->runSnippet('loginWay', array(
        'user' => $user,
    ));
}