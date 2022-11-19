<?php

$cfg = getClubConfig('vpbx', true);
$mcnAliasId = getClubStatusAlias('idExtid', 'idUser_mcn')["id"];
$apiUrl = 'https://api.mcn.ru/v2/rest/account/';
$json = array(
    'clubStatus' => getClubStatus('idTalk'),
);
$idTalkStatus = array();
foreach ($json['clubStatus'] as $status) {
    $idTalkStatus[ $status['alias'] ] = $status;
}

function whoOnline($apiUrl, $cfg){
    $curl = curl_init();
    curl_setopt_array($curl, array(
      CURLOPT_URL => $apiUrl.$cfg["account"].'/sip_statuses?did='.$cfg["number"].'&user_hash='.$cfg["token"],
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => '',
      CURLOPT_TIMEOUT => 0,
      CURLOPT_CUSTOMREQUEST => 'GET',
    ));
    $response = json_decode(curl_exec($curl), true);
    curl_close($curl);
    if ($response["code"] == 200) {
        foreach($response['items'] as $item) {
            $opList[ $item['name'] ] = $opList[ $item['name'] ] || $item['registered'];
        }
        return $opList;
    } else {
        return array();
    }
}

if (!empty($_GET["call_id"])) {
    // запись звонка
    //header('Content-type: audio/mpeg');
    //header('Content-Disposition: attachment; filename="'.$_GET["call_id"].'.mp3"');
    $url = $apiUrl.$cfg["account"].'/vpbx/'.$cfg["vats"].'/call_log/record?call_id='.$_GET["call_id"].'&user_hash='.$cfg["token"];
    $modx->sendRedirect($url);
    //$file = file_get_contents($url);
    //die( $file );
} elseif ($_POST["phone"]){
    // инициализация звонка
    $online = whoOnline($apiUrl, $cfg);
    
    $w = $modx->newQuery('idExtid', array(
        'exType.alias' => 'idUser_mcn',
        'idExtid.parent' => $userID,
    ));
    $w->innerJoin('idStatus', 'exType');
    //$w->innerJoin('modUserProfile', 'Profile', "idExtid.parent = $userID");
    
    foreach ($modx->getCollection('idExtid', $w) as $row) {
        $r = $row->toArray();
        $ext = $r['extended'];
        if ($online[ $ext['sip'] ]) {
            $json["online"] = $r;
            break;
        }
    };
    
    //$errors[] = array("description" => "Оператор оффлайн");
    if ( !$json["online"] ) dieJSON('Offline');
    
    $curl = curl_init();
    curl_setopt_array($curl, array(
      CURLOPT_URL => $apiUrl.$cfg['account']."/vpbx/{$cfg['vats']}/outbound_call?user_hash=" . $cfg['token'],
      CURLOPT_RETURNTRANSFER => true,
      CURLOPT_ENCODING => '',
      CURLOPT_TIMEOUT => 0,
      CURLOPT_CUSTOMREQUEST => 'POST',
      CURLOPT_POSTFIELDS => array('from' => $json["online"]["extoken"], 'to' => $_POST["phone"])
    ));
    $response = curl_exec($curl);
    curl_close($curl);
    die( $response );

} elseif ($rq[2]=='missed') {
    // пропущенные звонки
    $w = $modx->newQuery('idTalk', array(
        'idStatus.alias' => 'callinBegin', // 'calloutBegin'
    ));
    $w->innerJoin('idStatus');
    $json['total'] = $modx->getCount('idTalk', $w);
} elseif ($rq[2]=='operators') {
    if ( in_array( "idAdmin", $modx->scrm->userGroups) ) {
        if ( $rq[3]=='newoper' ) { //Привязывает пользователя к MCN
            setClubExtId(array(
                'parent' => $_POST["user"],
                'extoken' => $_POST["num"],
                'extended' => array("sip" => $_POST["sip"])
            ), 'idUser_mcn');
        }
    
        //Список пользователей
        $group = $modx->getObject("modUserGroup", array( "name" => "idManager" )); //Можно сделать через collectionGraph
        $query = $modx->newQuery('modUserProfile');
        $query->innerJoin('modUserGroupMember', 'modUserGroupMember', "modUserProfile.id = modUserGroupMember.member AND user_group = {$group->get('id')}");
        $query->select(array(
            "modUserProfile.id",
            "modUserProfile.fullname",
            "modUserProfile.email",
            "modUserProfile.internalKey",
        ));
        $query->groupBy('modUserProfile.id');
        $users = $modx->getCollection("modUserProfile", $query);
        
        foreach($users as $user){
            $json["users"][] = $user->toArray();
        }
    }
    
    $json['status'] = $noUser = whoOnline($apiUrl, $cfg, $json);
    
    if (!empty($json['status'])) {
        $w = $modx->newQuery('idExtid', array(
            'exType.alias' => 'idUser_mcn',
        ));
        $w->innerJoin('idStatus', 'exType');
        $w->innerJoin('modUserProfile', 'Profile', 'Profile.internalKey = idExtid.parent');
        $w->select(array(
            'idExtid.*',
            'Profile.fullname AS fullname',
            'Profile.email AS email'
        ));
        foreach ($modx->getCollection('idExtid', $w) as $row) {
            $r = $row->toArray();
            $ext = $r['extended'];
            unset($noUser[$ext["sip"]]);
            $r['online'] = $json['status'][ $ext['sip'] ];
            $json['operators'][] = $r;
        };
        
        foreach($noUser as $k=>$v){
           $json['noUser'][] = $k;
        }
    }
} else {
    //коллбэки
    clubLog('mcnTelecom', $_POST);
    $talkAliasId = getClubStatusAlias('idExtid', 'idTalk')["id"];
    
    $call = json_decode(file_get_contents('php://input'), true);
    if ( empty($call["call_id"]) ) die;
    
    $mcnStatus = array(
        "onBegin"               => "callinBegin",
        "onInCallingAnswered"   => "callinAnswered",
        "onInAbonEnd"           => "callinEnd",
        "onInCallingEnd"        => "callinEnd",
        "onOutCallingStart"     => "calloutBegin",
        "onOutCallingAnswered"  => "calloutAnswered",
        "onOutAbonEnd"          => "calloutEnd",
        "onOutCallingEnd"       => "calloutEnd",
    );
    
    $talk = $modx->getObject('idTalk', array(
        'extid' => $call['call_id'],
    ));
    
    $status = $idTalkStatus[ $mcnStatus[ $call['event_type'] ] ];
    if ( empty($status) ) die;
    
    // Пользователи телефонии
    $telUser = getClubExtId(array(
        'extoken' => $call["abon"],
    ), 'idUser_mcn', true);
    $telUserID = empty($telUser)? null : $telUser->get('parent');
    
    /*$ops = $modx->getCollection('idExtid', array(
        'extype' => $mcnAliasId
    ));
    $opList = array();
    foreach($ops as $k => $v){
        $opList[explode(':', $v->get('extoken'))[0] ] = $v->get('parent');
    }*/
    
    if (empty($talk)) {
        $newTalk = $modx->newObject('idTalk', array(
           'status' => $status["id"],
           'local' => $call["did_mcn"],
           'foreign' => $call["did"],
           'iduser' => $telUserID,
           'extid' => $call['call_id'],
        ));
        $newTalk->save();
        /*$rowid = $newTalk->get('id');
        $extId = setClubExtId(array(
            'parent' => $rowid,
            'extoken' => $call["call_id"],
            'extended' => $call,
            'extid' => $status["id"]
        ), 'idTalk');*/
    } else {
        $talk->set('status', $status["id"]);
        $talk->set('iduser', $telUserID);
        
        if ( !empty($call['billsec']) ) $talk->set('duration', $call['billsec']);
        $talk->save();
        
        /*$extid = $modx->getObject('idExtid', array(
            'parent' => $talk->get("id"),
            'extoken' => $call["call_id"],
            'extype' => $talkAliasId
        ));
        $extid->fromArray(array(
           'extended' => $call,
           'extid' => $status["id"],
        ));
        
        $extid->save();*/
        
        if ( $status["alias"] == "callinEnd" || $status["alias"] == "calloutEnd") {
            $missed = $modx->getCollection('idTalk', array(
                'status' => $idTalkStatus['callinBegin']['id'],
                'foreign' => $call["did"],
            ));
            
            foreach ($missed as $k => $v) {
                $v->set('status', $idTalkStatus['recall']['id']);
                $v->save();
            }
        }
    }
}
