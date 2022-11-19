<?php

$modx->setOption('vers', 1108);

function clubLog($name, $data = '') {
    $dt = new DateTime();
    $today = $dt->format('Y-m-d');
    $now = $dt->format('H-i-s.u-');
    $prefix = defined('CRM_PREFIX')? CRM_PREFIX : '_';
    
    if (empty($data)) {
        $now = "{$now}input";
        $data = file_get_contents('php://input');
    }
    $logtxt = is_array($data)? json_encode($data, JSON_UNESCAPED_UNICODE) : $data;
    
    $logfolder = __DIR__ . "/../scrm_log/{$prefix}/{$today}/{$name}/";
    if (!file_exists($logfolder)) mkdir($logfolder, 0755, true);
    file_put_contents($logfolder.$now.sha1($logtxt) .'.txt', $logtxt);
    //return $data;

    /*$log_q = [
        'key' => $_SERVER['HTTP_HOST'],
        'ltype' => $ltype,
    ];
    $yndx = 'https://functions.yandexcloud.net/d4eejc0f4etmnahoac41';
    //$yndx = 'https://functions.yandexcloud.net/d4erqgetljus8cg5bc7d';
    
    $curl = curl_init($yndx.'?'.http_build_query($log_q));
    curl_setopt_array($curl, array(
        //CURLOPT_URL => ,
        CURLOPT_TIMEOUT => 1,
        //CURLOPT_TIMEOUT_MS => 100,
        CURLOPT_CUSTOMREQUEST => 'POST',
        CURLOPT_POSTFIELDS => $data,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_SSL_VERIFYPEER => false,
        CURLOPT_HTTPHEADER => array(
            //'Key:'.$log_q['key'],
            //'Ltype:'.$log_q['ltype'],
            'Url: '.$_SERVER['REQUEST_URI'],
            'Content-Type: application/json',
            'Cache-Control: no-cache',
        ),
    ));
    $response = curl_exec($curl);
    curl_close($curl);
    return $ltype.PHP_EOL.$response;*/
}

function cacheHash($data) {
    return sha1((gettype($data)==='array')? json_encode($data) : $data);
}
function generateUUID() {
    srand(intval(microtime(true) * 1000));
    $b = md5(uniqid(rand(), true), true);
    $b[6] = chr((ord($b[6]) & 0x0F) | 0x40);
    $b[8] = chr((ord($b[8]) & 0x3F) | 0x80);
    return implode('-', unpack('H8a/H4b/H4c/H4d/H12e', $b));
}

function dieJSON($txt, $code = 200) {
    if ($code != 200) http_response_code($code);
    if (gettype($txt)==='string') $txt = ['error' => $txt];
    die(json_encode($txt, JSON_UNESCAPED_UNICODE));
}

function dieJSONForbidden() {
    dieJSON('Forbidden', 403);
}

function clubAllowOrigin() {
    header('Access-Control-Allow-Origin: '.$_SERVER['HTTP_ORIGIN']);
    header('Access-Control-Allow-Methods: GET, PUT, POST, DELETE, OPTIONS');
    header('Access-Control-Max-Age: 1000');
    header('Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With');
}

function clubConfig($name, $cache_path = '', $no_cache = false) {
    global $modx;
    $names = explode(',', $name);
    if (empty($cache_path)) $cache_path = CRM_PREFIX .'/clubConfig/'. cacheHash($names);
    
    if (!$no_cache) {
        $json = $modx->cacheManager->get($cache_path);
    }
    if (empty($json)) {
        //$json = array();
        $json = array_fill_keys($names, '');
        $w = $modx->newQuery('idConfig', array('name:IN' => $names));
        $w->select('id,name,val');
        $stmt = $w->prepare();
        $stmt->execute();
        while ($opt = $stmt->fetch(PDO::FETCH_ASSOC)) {
            //if ($decode) $val = (empty($val))? array() : json_decode($val, true);
            $json[ $opt['name'] ] = $opt['val'];
        }
        /*foreach($names as $cfgkey) {
            if (!isset($json[ $cfgkey ])) {
                $json[ $cfgkey ] = file_get_contents( CRM_PATH."setup/cfg/{$cfgkey}.html" )? : '';
            }
        }*/
        if (empty($no_cache)) $modx->cacheManager->set($cache_path, $json, 86400); //4*7 дней
    }
    return $json;
}
function getClubJSON($json) {
    return empty($json)? [ ] : json_decode($json, true);
}

function getClubConfig($name, $type = 'raw') {
    $cfg = clubConfig($name)[$name];
    return ($type=='json'||$type===true)? getClubJSON($cfg) : $cfg;
}
function setClubConfig($name, $val) {
    global $modx;
    $modx->cacheManager->delete(CRM_PREFIX .'/clubConfig/');

    $wname = array('name' => $name);
    if (!$row = $modx->getObject('idConfig', $wname)) {
        $row = $modx->newObject('idConfig', $wname);
    }
    if (gettype($val) === 'array') $val = json_encode($val, JSON_UNESCAPED_UNICODE);
    $row->fromArray(array(
        'val' => $val,
        'edited' => date('c'),
        'editedby' => $modx->scrm->user,
    ));
    $saved = $row->save();
    if ($hook_file = $modx->scrm->sysFilePath("hook/cfg/{$name}.php")) {
        include($hook_file);
    }
    return $saved;
}

/* ========================== ============== ========================== */

function getClubStatus($tbl = '', $addfields = '', $leftJoin = '') {
    global $modx;
    
    $cache_path = CRM_PREFIX .'/clubStatus/'. cacheHash([$tbl, $addfields]);
    $json = $modx->cacheManager->get($cache_path);
    if (empty($json)) {
        $json = array();
        if (gettype($tbl) !== 'array') {
            $tbl = array('tbl' => $tbl);
        }
        clubWhereIN($tbl, $tbl['tbl'], 'tbl');
        if ($tbl['alias']) clubWhereIN($tbl, $tbl['alias'], 'alias');
        $tbl['published'] = 1;
        $w = $modx->newQuery('idStatus', $tbl);
        switch ($leftJoin) {
            case 'cfg':
                $w->leftJoin('idConfig', 'cfg', "cfg.name = idStatus.alias");
                $w->select('cfg.val as cfg');
            break;
        }

        //$w->leftJoin('idConfig', 'cfg', "cfg.name = CONCAT(idStatus.tbl, '_main')");
        $w->sortby('idStatus.menuindex, name', 'ASC');

        $select = 'idStatus.id,idStatus.name,alias,ico,cls,tbl,idStatus.menuindex,extended'; //,cfg.val as is_main
        if (!empty($addfields)) $select = "{$select},{$addfields}";
        $w->select(array_unique(explode(',', $select)));

        $stmt = $w->prepare();
        //$json['sql'] =  $w->toSQL();
        //$stmt->execute();
        //$json = $stmt->fetchAll(PDO::FETCH_ASSOC);
        foreach($modx->getIterator('idStatus', $w) as $status) {
            $json[] = $status->toArray('', false, true); // $status->toArray(); //
        }

        $modx->cacheManager->set($cache_path, $json, 604800*4); //4*7 дней
    }
    return $json;
}

function getClubStatusAlias($tbl = '', $alias = '', $addfields = '') {
    $json = getClubStatus(array(
        'tbl' => $tbl,
        'alias' => $alias,
    ), $addfields);
    return (sizeof($json)==1)? $json[0] : $json;
}

function clubWhereIN(&$where, $val, $field, $ne = '') {
    unset($where[$field]);
    if (gettype($val) !== 'array') $val = explode(',', $val);
    if (count($val) > 1){
        $ne = empty($ne)? 'IN': 'NOT IN';
        $where["{$field}:{$ne}"] = $val;
    } else {
        $ne = empty($ne)? '': ':!=';
        $where[$field.$ne] = $val[0];
    }
}

function getClubExtId($where, $extype, $returnObject = false, $graph = null) {
    global $modx;
    $w = $modx->newQuery('idExtid', $where);
    $w->innerJoin('idStatus','exType');
    $w->where(array(
        'exType.tbl' => 'idExtid',
        'exType.published' => 1,
        'exType.alias' => $extype,
    ));
    //$w->prepare();
    //echo $w->toSQL();
    $graphs = array(
        'idSportsmen' => '{"idSportsmen":{}}',
        'idCity' => '{"idCity":{}}',
        'idUser' => '{"idUser":{}}',
    );
    
    $r = $modx->getObjectGraph('idExtid', $graphs[$graph], $w);
    if (empty($r)) return null;
    return $returnObject? $r : $r->toArray('', false, false, true);
}

function setClubExtId($where, $extype) {
    global $modx;
    
    $extId = getClubStatusAlias('idExtid', $extype);
    if (!empty($extId)) {
        $where['extype'] = $extId['id'];
        $idExtid = $modx->newObject('idExtid', $where);
        $idExtid->save();
        //return $idExtid;
    }
    $cache_path = CRM_PREFIX .'/clubExtidDuedate';
    $ced = $modx->cacheManager->get($cache_path);
    if (empty($ced)) {
        $modx->removeCollection('idExtid', array(
            'duedate < NOW()',
        ));
        $ced = array(new DateTime('+1 day'));
        $modx->cacheManager->set($cache_path, $ced, 60*60*24); //4*7 дней
    }
    return $idExtid;
}

function accessDenied() {
    header($_SERVER['SERVER_PROTOCOL'] . ' 403 Forbidden', true, 403);
    die();
}

function isCrew($redirect = true) {
    global $modx;
    if (!isset($_SESSION['club_crew'])) {
        if ( empty($modx->scrm->user) ) return false;
        
        $_SESSION['club_crew'] = false;
        
        $clubStatus = getClubStatus('idPermission');
        $ugroups = $modx->user->getUserGroupNames();
        
        foreach($clubStatus as $cs) {
            if (!empty($cs['extended']['crew']) && in_array($cs['alias'], $ugroups)) {
                $_SESSION['club_crew'] = true;
                break;
            }
        }
    }
    //if (empty($_SESSION['club_crew']) && $redirect) accessDenied();
    return $_SESSION['club_crew'];
}

function clubTmpl($tmpl='', $data = array()) {
    global $modx;
    if (!empty($data)) {
        $chunk = $modx->newObject('modChunk');
        $chunk->setCacheable(false);
        $tmpl = $chunk->process($data, $tmpl);
    }
    if (!empty($tmpl)) {
        $parser = $modx->getParser();
        // Определяем, как глубоко мы можем пойти
        $maxIterations = 4; //(integer) $modx->getOption('parser_max_iterations', null, 10);

        // Разобрать кэшированные теги, оставив необработанные теги на месте
        $parser->processElementTags('', $tmpl, false, false, '[[', ']]', [], $maxIterations);
        // Разобрать некэшированные теги и удалить все, что не удалось обработать
        $parser->processElementTags('', $tmpl, true, true, '[[', ']]', [], $maxIterations);
    }
    
    return $tmpl;
}
