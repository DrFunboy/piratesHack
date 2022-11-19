<?php
define('CLUB_UNAUTH', true);
require_once('id_init.php');

$mode = $modx->getOption('mode', $_REQUEST, 'city', true);
$sportsmen = $modx->getOption('sportsmen', $_REQUEST, 0); // для QR проверить
$stype = $_REQUEST['stype']; //TODO: статус по умолчанию


$json = array(
    'mode' => $mode,
    'squad' => array(),
    //'start_id' => $start_id,
    'idSchedule' => array(),
);

// Дни недели
$weekthis = new DateTime('this week');
$json["weekthis"] = $weekthis->format("Y-m-d");

$date = new DateTime( $modx->getOption('weekstart', $_REQUEST, 'this week', true) );
$weekstart = clone $date;

for ($i = 1; $i <= 7; $i++) {
    $json["dates"][] = array(
        "date" => $date->format("Y-m-d"),
        "day" => $date->format("w"),
        "dayname" => strftime("%A", $date->getTimestamp()),
    );
    if ($i==7) $weekend = clone $date;
    $date->modify('+1 day');
}
$json["weeknext"] = $date->format("Y-m-d");
$json["weekstart"] = $weekstart->format("Y-m-d");
$json["weekend"] = $weekend->format("Y-m-d");
$json["weekname"] = $weekstart->format("d.m").' &mdash; '.$weekend->format("d.m.Y");
$date->modify('-2 week');
$json["weekprev"] = $date->format("Y-m-d");
// END Дни недели

$wrepeat = array(
    'sch.repeat' => 1,
    'idTrainer.published' => 1,
);

if (empty($_REQUEST['datestart'])) {
    $qstart = $weekstart->format("Y-m-d 00:00:00");
    $qend   = $weekend->format("Y-m-d 23:59:59");
} else {
    $datestart = new DateTime($_REQUEST['datestart']);
    $json['datestart'] = $datestart->format("Y-m-d");
    //$weekday = $datestart->format("N")*1 - 1;

    $qstart = $datestart->format("Y-m-d 00:00:00");
    $qend   = $datestart->format("Y-m-d 23:59:59");

    $wrepeat[] = "weekday(sch.datestart) = weekday('{$qstart}')"; // Add to array
}

$wsch = array(
    array(
        $wrepeat,
        array(
            "OR:sch.repeat:=" => 0,
            "sch.datestart:>" => $qstart,
            "sch.datestart:<=" => $qend,
            array(
                'sch.planfact' => 1,
                array(
                    'OR:sch.planfact:=' => 0,
                    'idTrainer.published' => 1,
                ),
            ),
        ),
    ),
);

$json['key'] = $key = $modx->getOption('key', $_REQUEST, 0, true);

// Если занятие запланировано, то тренер должен быть опубликован, если занятие уже прошло - все равно
$wSchedule = $modx->newQuery('idSchedule');
$wSchedule->setClassAlias('sch');

if ($mode=='trainer') {
    if (empty($key)) $key = 'my';
    if ($key == 'my') {
        $wtr = array(
            'iduser' => $modx->user->get('id'),
            'published' => 1,
        );
    } else {
        $wtr = array('uid:IN' => explode(',', $key));
    }
    $trainer = array();
    $json['idTrainer'] = array();
    foreach ($modx->getIterator('idTrainer', $wtr) as $trow) {
        $json['idTrainer'][] = $trow->toArray();
        $trainer[] = $trow->get('id');
    }
    
    $wsch[] = empty($trainer)? array(
        "sch.trainer" => 0,
    ) : array(
        "sch.trainer:IN" => $trainer,
        "OR:sch.trainer2:IN" => $trainer,
    );
    if (!empty($sportsmen)) {
        /* Для QR посещения определить был ли спортсмен на занятии */
        $wSchedule->select("(SELECT count(`id`) FROM {$modx->getTableName('idLesson')} lsn 
            WHERE lsn.schedule = sch.id AND lsn.sportsmen = {$sportsmen} AND lsn.`status`='y') as lesson_cnt");
    }
} elseif ($mode=='squad') {
    if (!empty($key)) {
        $wsch['sch.squad:IN'] = explode(',', $key);
    } else {
        $wsch['sch.trainer'] = 0; // Пустые результаты если нет группы
    }
} elseif ($mode=='sportsmen') {
    $wSchedule->innerJoin('idSportsmen', 'sp', "sp.`key` = '{$key}'");
    $wSchedule->leftJoin('idSportsmenSquad', 'ssq', 
        "(ssq.squad = sch.squad AND ssq.sportsmen = sp.id AND ssq.dateend IS NULL)");
    $wSchedule->leftJoin('idLesson', 'lesn', "lesn.schedule = sch.id AND lesn.sportsmen = sp.id");
    $wSchedule->where(array(
        'ssq.id:!=' => null,
        'OR:lesn.id:!=' => null,
    ));
    if (!empty($sportsmen)) {
        /* Для QR посещения определить был ли спортсмен на занятии */
        $wSchedule->select("(SELECT count(`id`) FROM {$modx->getTableName('idLesson')} lsn 
            WHERE lsn.schedule = sch.id AND lsn.sportsmen = sp.id AND lsn.`status`='y') as lesson_cnt");
    }
} else {
    if (empty($stype)) {
        $stype = array();
        foreach (getClubStatus('idSchedule', 'extended') as $status) {
            if ($status['extended']['group']) $stype[] = $status['alias'];
        }
        $wsch['sch.stype:IN'] = $stype;
    } else {
        $wsch['sch.stype'] = $stype;
    }

    if (!empty($key)) {
        $idCity = $modx->getObject('idCity', array('id' => $key, 'OR:alias:=' => $key));
        if (!empty($idCity)) $key = $idCity->get('id');
    } else $key = $_SESSION['club_city'];
    if (empty($key)) {
        $modx->runSnippet('dbvalues', array(
            'mode' => 'idCity',
            'placeholder' => 'schCity',
        ));
        $json["idCity"] = $modx->getPlaceholder('schCity')['idCity'];
        if (!empty($json["idCity"])) {
            $key = $json["idCity"][0]['id'];
        }
    }
    $wsch['idClub.city'] = $key; // По площадке где проходят занятия
    $json['club_city'] = $_SESSION['club_city'];
}

$wSchedule->where($wsch);
$wSchedule->select(array(
    "sch.*",
    '_parent.cnt as cnt_child',
    'idClub.name as clubname',
    'idTrainer.name as trainername',
    'tr2.name as trainername2',
    'idStatus.name as stype_name',
    'idSport.name as sportname',
    'idSport.color as sportcolor',
    "idSport.shortname as ssportname",
    "idSquad.name as squadname",
    "idSquad.club as squadclub",
    'sq_club.name as squadclubname',
    "idLevel.name as levelname",
    "DATE_FORMAT(sch.datestart, '%H:%i') as d_s",
    "DATE_FORMAT(sch.dateend, '%H:%i') as d_e",
    "DAYOFWEEK(sch.datestart)-1 as d_w", //Returns the weekday index for date (1 = Sunday, 2 = Monday, ., 7 = Saturday).
));

$wSchedule->innerJoin('idTrainer');
$wSchedule->innerJoin('idSport');
$wSchedule->innerJoin('idClub');
$wSchedule->innerJoin('idStatus', 'idStatus', "idStatus.alias = sch.stype AND idStatus.tbl = 'idSchedule'");
$wSchedule->leftJoin('idTrainer', 'tr2', 'tr2.id = sch.trainer2');

$wSchedule->leftJoin('idSquad');
$wSchedule->leftJoin('idClub', 'sq_club', 'sq_club.id = idSquad.club');
$wSchedule->leftJoin('idLevel', 'idLevel', 'idLevel.id = idSquad.lvl');

$wSchedule->sortby("d_s", "asc");
//$wSchedule->groupby('sch.id');

$wparent = $modx->newQuery('idSchedule', array(
    "(datestart BETWEEN '{$qstart}' AND '{$qend}')",
    "parent:!=" => 0
));
$wparent->select(array(
    'idSchedule.`parent`',
    'COUNT(id) as cnt',
));
$wparent->groupby("idSchedule.`parent`");
$wparent->prepare();
$sql_parent = $wparent->toSQL();

$wSchedule->query['from']['joins'][] = array(
    "type" => "LEFT JOIN",
    "table" => "({$sql_parent})",
    "alias" => "_parent",
    "conditions" => array(
        new xPDOQueryCondition(array(
            "sql" => "_parent.parent = sch.id",
        )),
    ),
);
$wSchedule->having(array('_parent.cnt' => null));


/*$parents = array();
if (!empty($planfact)) {
    $w2 = $modx->newQuery('idSchedule', array(
        'parent:!=' => '0',
        'datestart:>' => $qstart,
        'datestart:<=' => $qend,
    ));
    $w2->select(array(
        "id",
        "parent",
    ));
    $stmt = $w2->prepare();
    $json['debug_apr'] = $w2->toSQL();
    $stmt->execute();
    while ($r = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $parents[ $r['parent'] ] += 1;
    }
}*/

$qSchedule = $wSchedule->prepare();
if ($_SESSION['club_debug']) $json["sql"] = $wSchedule->toSQL();
$qSchedule->execute();

/*$rows = $qSchedule->fetchAll(PDO::FETCH_ASSOC);
$parents = array();
foreach($rows as $idx => $row) {
    if (!empty($row['parent'])) $parents[ $row['parent'] ] = 1;
}
$json["parents"] = $parents;*/

$squad = array();
while($r = $qSchedule->fetch(PDO::FETCH_ASSOC)){
//foreach($rows as $idx => $r) {    
    /*if (isset($parents[ $r['id'] ])) {
        $parents[ $r['id'] ] = $r['repeat'];
        continue;
    }*/
    $json['stype'][ $r['stype'] ] = array(
        "id" => $r['stype'],
        "name" => $r['stype_name'],
    );
    $json['sport'][ $r['sport'] ] = array(
        "id" => $r['sport'],
        "name" => $r['sportname'] .' ('. $r['ssportname'] .')',
    );
    $json['club'][ $r['club'] ] = array(
        "id" => $r['club'],
        "name" => $r['clubname'],
    );
    $json['trainer'][ $r['trainer'] ] = array(
        "id" => $r['trainer'],
        "name" => $r['trainername'],
    );
    if (!empty($r['trainer2'])) $json['trainer'][ $r['trainer2'] ] = array(
        "id" => $r['trainer2'],
        "name" => $r['trainername2'],
    );
    
    if (!empty($r['squad'])) {
        $r['squadname'] = $r['levelname'].', '.$r['squadname'];
        $squad_id = $r['squad'];
        if (empty($json['squad'][$squad_id])) {
            $squad[] = $squad_id;
            $json['squad'][$squad_id] = array(
                'id' => $squad_id,
                'name' => $r['squadclubname'].', '.$r['squadname'],
                'squadname' => $r['squadname'],
                'club' => $r['squadclub'],
                'clubname' => $r['squadclubname'],
                'ssportname' => $r['ssportname'],
            );
        }
    }

    $date = new DateTime($r['datestart']);
    //$r['daynum'] = $date->format("N");
    $r['datestartfmt'] = $date->format("d.m.Y");

    $json["idSchedule"][ ] = $r;
}

function cmp($a, $b) { 
    return strnatcmp($a["name"], $b["name"]); 
}
foreach(['sport','club','trainer','squad', 'stype'] as $key){
    if (!empty($json[$key])){
        $json[$key] = array_values( $json[$key] );
        usort($json[$key], "cmp");
    }
}

if (!empty($_REQUEST['cnt_squad']) && !empty($squad)) {
    $q2 = $modx->newQuery('idSportsmenSquad', array(
        'squad:IN' => $squad,
        'dateend' => null,
    ));
    $q2->select(array(
        "squad",
        "COUNT(sportsmen) as cnt",
    ));
    $q2->groupby("squad");
    $stmt = $q2->prepare();
    $json['debug_squad'] = $q2->toSQL();
    $stmt->execute();
    while ($r = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $json["cnt_squad"][ $r['squad'] ] = $r['cnt'];
    }
}

$modx->runSnippet('AllowOrigin');
echo json_encode($json, JSON_UNESCAPED_UNICODE);
