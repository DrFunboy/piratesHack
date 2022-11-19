$key = $modx->getOption('key', $scriptProperties, $_REQUEST["key"]);
$json = array('key' => $key);

$idLead = $modx->getObject('idLead', array('key' => $key));
if ( empty($key) || empty($idLead) ){
    $modx->sendRedirect('/');
} else {
    $json = $idLead->toArray();

    if (($idSquad = $idLead->getOne('idSquad')) !== null) {
        $json['squadname'] = $idSquad->get('name');
        $level = $idSquad->getOne('idLevel');
        $json['levelname'] = $level->get('name');
        if (($idClub = $idSquad->getOne('idClub')) !== null) {
            $json['clubname'] = $idClub->get('name');
            $city = $idClub->getOne('idCity');
            $json['cityname'] = $city->get('name');
        }
    }
    if (($club = $idLead->getOne('idClub')) !== null) {
        $json['clubname'] = $club->get('name');
        $city = $club->getOne('idCity');
        $json['cityname'] = $city->get('name');
    }

    if (($sport = $idLead->getOne('idSport')) !== null) {
        $json['sportname'] = $sport->get('name');
    }

    $resID = $modx->resource->get('id');
    $json['url'] = $modx->makeUrl($resID, '', array('key' => $key), 'full');

    $modx->setPlaceholders($json, 'ids.');
}

return json_encode($json, JSON_UNESCAPED_UNICODE);