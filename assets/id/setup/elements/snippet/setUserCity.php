$user = $modx->getOption('user', $scriptProperties, $modx->user);

if (!empty($idCity) && !empty($user)) {
    $userID = $modx->getLoginUserID();
    if ($user->get('id') == $userID) {
        $_SESSION['club_city'] = $idCity->get('id');
        $_SESSION['club_cityname'] = $idCity->get('name');
    }
    
    $where = array(
        'parent' => $user->get('id'),
    );
    $idUser_city = getClubExtId($where, 'idUser_city', true);
    $where['extid'] = $idCity->get('id');
    if (!empty($idUser_city)) {
        $idUser_city->fromArray($where);
        $idUser_city->save();
    } else {
        setClubExtId($where, 'idUser_city');
    }

    /*$wcity = array(
        'id1' => $userID,
        'tbl1' => 'modUser',
        'tbl2' => 'idCity',
    );
    
    $idLink = $modx->getObject('idLink', $wcity);
    if (empty($idLink)) $idLink = $modx->newObject('idLink', $wcity);
    $idLink->set('id2', $_SESSION['club_city']);
    $idLink->save();*/
    
    /*$id_userprops = $Profile->get("extended");
    $id_userprops["idcity"] = $_SESSION['club_city'];
    $Profile->set('extended', $id_userprops);
    $Profile->set('city', $_SESSION['club_cityname']); // ??
    $Profile->save();*/
}
return '{"status":"OK"}';