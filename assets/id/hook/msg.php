<?php
ignore_user_abort(true);
set_time_limit(0);

//ini_set('error_reporting', E_ALL);
//ini_set('display_errors', 1);
//ini_set('display_startup_errors', 1);

//Ф-ция отправки сообщений по хэндлеру
function sendMsgByHandler($handler, $people){
    global $modx;
    if (empty($people[0]) && !empty($people) ) $people = [$people];
    $extype = getClubStatusAlias('idExtid', 'TmplHandler')['id'];
    $query = $modx->newQuery('idStatus'); 
    $query->innerJoin("idExtid", "idExtid", "idStatus.id = idExtid.parent AND idExtid.extoken = '$handler' AND idExtid.extype = $extype");
    
    $tmpls = $modx->getCollection('idStatus', $query);
    if (empty($tmpls)) return("Handler not found");
    foreach($tmpls as $tmpl){
        $tmpl = $tmpl->toArray();
        $provider = $modx->getObject("idStatus", array(
            "alias" => $tmpl["cls"]
        ));
        $type = explode(".", $provider->get('cls'))[0];
        $subj = $tmpl["extended"]["subj"]["val"];
        $info = '';
        if (!empty($tmpl["info"])) $info = $tmpl["info"];
        else {
            foreach ($tmpl["extended"] as $name => $val){
                if( strripos($name, "info_") !== false && !empty($val["val"])) {
                    $info .= "$name : ".$val["val"]."<br><hr><br>";
                    $infoArr[$name] = $val["val"];
                }
            }
            $info = mb_substr($info, 0, -12);
        }
        $typeCfg = json_decode(getClubConfig("msgType_$type"), true);
        foreach($people as $human){
            $hmnCfg = $typeCfg;
            $hmnInfo = $info;
            foreach($hmnCfg as $key => $val){
                foreach(explode(",", $val) as $par){
                    if ($parName = $human[$par]) {
                        $hmnCfg[$key] = $human[$par];
                        break;
                    }
                }
            }
            $hmnInfo = clubTmpl($hmnInfo, $hmnCfg);
            
            $objArr = array(
                'type' => $type,
                'msg_to' => $hmnCfg['msg_to'],
                'msg_subj' => $subj,
                'info' => $hmnInfo,
                'provider' => $provider->get('id'),
                'extended' => $tmpl["extended"]
            );
            
            $newMsg = $modx->newObject("idMsg", $objArr);
            $newMsg->save();
        }
    };
    
    $ctx = stream_context_create(['http'=> ['timeout' => 1]]);
    file_get_contents($modx->getOption('site_url')."hook/msg/send?self=1", null, $ctx);
}

#Пример с одним человеком
// $sp = $modx->getObject("idSportsmen", 575);
// sendMsgByHandler("userBirthday", $sp->toArray());

#Пример с несколькими людьми
// $spListRaw = $modx->getCollection("idSportsmen", array('id:IN' => array(575, 512)) );
// foreach($spListRaw as $sp) {
//     $spList[] = $sp->toArray();
// }
// sendMsgByHandler("userBirthday", $spList);

if ($rq[2] == "drivers"){
    $json = array( 'drivers' => array() );
    foreach (glob(__DIR__.'/msgModule/*.php') as $filename) {
        $json['drivers'][] = pathinfo($filename)["filename"];
    }
} elseif ($rq[2] == "init"){
    if ( !empty($_GET['path']) ){
        define("INIT", true);
        include CRMTOOLS_PATH.'hook/msgModule/'.$_GET['path'].'.php';
        die(json_encode($json['cfg']));
    }
} elseif ($rq[2] == "save"){
    $data = $_POST["data"];
    $provider = $modx->getObject("idStatus", array(
        "alias" => $data["cls"]
    ));
    $msgType = explode(".", $provider->get('cls'))[0];
    $msgSubj = $data["extended"]["subj"]["val"];
    $msgInfo = '';
    
    if (!empty($_POST["info"])) $msgInfo = $_POST["info"];
    else {
        foreach ($data["extended"] as $name => $val){
            if( strripos($name, "info_") !== false && !empty($val["val"])) {
                $msgInfo .= "$name : ".$val["val"]."<br><hr><br>";
                $infoArr[$name] = $val["val"];
            }
        }
        $msgInfo = mb_substr($msgInfo, 0, -12);
    }
    
    $people = $modx->getCollection($_POST["tbl"], array(
        "id:IN" => $_POST["ids"]
    ));
    $typeCfg = json_decode(getClubConfig("msgType_$msgType"), true);
    foreach($people as $human){
        $hmnCfg = $typeCfg;
        $hmnInfo = $msgInfo;
        foreach($hmnCfg as $key => $val){
            foreach(explode(",", $val) as $par){
                if ($parName = $human->get($par)) {
                    $hmnCfg[$key] = $human->get($par);
                    break;
                }
            }
        }
        $hmnInfo = clubTmpl($hmnInfo, $hmnCfg);
        
        $objArr = array(
            'type' => $msgType,
            'msg_to' => $hmnCfg['msg_to'],
            'msg_subj' => $data['extended']['subj']['val'],
            'info' => $hmnInfo,
            'provider' => $provider->get('id'),
            'extended' => $data["extended"]
        );
        
        $newMsg = $modx->newObject("idMsg", $objArr);
        $newMsg->save();
    }
    $ctx = stream_context_create(['http'=> ['timeout' => 1]]);
    file_get_contents($modx->getOption('site_url')."hook/msg/send?self=".$self, null, $ctx);
    die(json_encode(true));
} elseif ($rq[2] == "send"){
    if ($_GET["self"]) {
        $self = $_GET["self"]++;
        if ($self > 10) die;
        sleep(10);
    } else $self = 1;
    
    $query = $modx->newQuery('idMsg'); 
    $query->where(array(
        "datestart:<=" => date('Y-m-d H:i:s', (strtotime ( 'now -10 minute' ) )),
        "OR:datestart:IS"=> null
    ));
    $query->where(array(
        "provider:!=" => 0,
        "datesend:IS"=> null
    ));
    $query->innerJoin("idStatus", "idStatus", "idStatus.id = idMsg.provider AND idStatus.tbl = 'idMsgProvider'");
    $query->select(array(
        "idMsg.*",
        "idStatus.cls as driver",
        "idStatus.extended as sts_ext",
    ));
    $total = $modx->getCount('idMsg', $query);
    
    $query->limit(10);
    $msgs = $modx->getCollection('idMsg', $query);
    foreach($msgs as $msg){
        $msg->set('datestart', date("Y-m-d H:i:s"));
        $msg->set('attempt', $self);
        $msg->save();
    }
    
    echo time()."<br>";
    var_dump($total);
    if ($total > 10) {
        $ctx = stream_context_create(['http'=> ['timeout' => 1]]);
        file_get_contents($modx->getOption('site_url')."hook/msg/send?self=".$self, null, $ctx);
    }
    echo "<hr>".time();
    define("SEND", true);
    foreach($msgs as $idMsg){
        $sts_ext = json_decode($idMsg->get('sts_ext'), true);
        include CRMTOOLS_PATH.'hook/msgModule/'.$idMsg->get('driver').'.php';
    }
} elseif ($rq[2] == "callback"){
    clubLog("msg_callback");
    define("CALLBACK", true);
    if ($_GET['driver']) include CRMTOOLS_PATH.'hook/msgModule/'.$_GET['driver'].'.php';
}