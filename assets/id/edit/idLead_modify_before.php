<?php
$clubConfig = clubConfig('idLead_main,Gender_main,idLead_arc');
$idLead_arc = explode(',', $clubConfig['idLead_arc']);

if ($oper == 'del') {
    $del_rows = $modx->getIterator($table, array(
        'id:IN' => $ids,
        'status:IN' => $idLead_arc,
    ));
} else {
    $info = empty($data['info'])? array() : $data['info'];
    if (gettype($info) !== 'array') $info = array($info);
    //$out['dddd'] = $info;
    if ($oper == 'add') {
        if (!$data['key']) $data['key'] = generateUUID();
        
        //$modx->loadClass('idLead');
        $modx->map['idLead']['fields']['status'] = $clubConfig['idLead_main'];
        $modx->map['idLead']['fields']['gender'] = $clubConfig['Gender_main'];
        if (empty($data['name'])) $data['name'] = $data['tel'];
        if (empty($data['name'])) $data['name'] = $data['email'];
        if (empty($data['name'])) $data['name'] = $data['contact'];
    }
    
    if (!empty($data['squad'])) {
        //$idSquad = $modx->getObjectGraph('idSquad', '{"idClub":{}}', $data['squad']);
        $idSquad = $modx->getObject('idSquad', $data['squad']);
        if (empty($idSquad)) {
            $info[] = 'squad:'.$data['squad'];
            $data['squad'] = 0;
        } else {
            $data['club'] = $idSquad->get('club');
        }
    }
    
    if (!empty($data['club']) && empty($idSquad)) { // если не было проверки в предыдущем блоке
        $idClub = $modx->getObject('idClub', array(
            'id' => trim($data['club']),
            'OR:name:LIKE' => trim($data['club']),
        ));
        if (empty($idClub)) {
            $info[] = 'club:'.$data['club'];
            $data['club'] = 0;
        } else {
            $data['club'] = $idClub->get('id');
        }
    }
    
    if (empty($data['club']) && !empty($data['city'])) {
        $idClub = $modx->getObjectGraph('idClub', '{"idCity":{}}', array(
            'idClub.city' => trim($data['city']),
            'OR:idCity.alias:LIKE' => trim($data['city']),
        ));
        if (empty($idClub)) {
            $info[] = 'city:'.$data['city'];
        } else {
            $data['club'] = $idClub->get('id');
        }
    }
    
    if (!empty($data['sportsmen'])) {
        $idSportsmen = $modx->getObject('idSportsmen', $data['sportsmen']);
        if (empty($idSportsmen)) $data['sportsmen'] = 0;
    }
    
    if ($oper == 'edit' && !empty($data['status'])) {
        foreach($modx->getIterator($table, array(
            'id:IN' => $ids,
            'status:!=' => $data['status']
        )) as $lead) {
            $idTascom = $modx->newObject('idTascom', array(
                'action' => 'status',
                'uid' => $lead->get('key'),
                'name' => $data['status'],
                'info' => $data['comment'],
                'author' => $userID,
            ));
            $idTascom->save();
        }
    }
    
    if (!empty($info)) {
        $data['info'] = implode(PHP_EOL, $info);
    }
}
