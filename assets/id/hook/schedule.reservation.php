<?php

$offset = getClubConfig('reservation_offset');
//$mode = $modx->getOption('mode', $_REQUEST, 'idSchedule');
$sportsmen = $modx->getOption('sportsmen', $_REQUEST, null);
$trainer = $modx->getOption('trainer', $_REQUEST, null);
$start_id = $modx->getOption('start_id', $_REQUEST, null);
$days = $modx->getOption('days', $_REQUEST, 7);

$json = array(
    'spLesson' => array(),
);

$date1 = new DateTime($modx->getOption('d1', $_REQUEST, 'today'));
$json["d1"] = $date1->format("Y-m-d");

for ($i = 1; $i <= $days; $i++) {
    $n = $date1->format("N");
    $json["dates"][$n] = array(
        "date" => $date1->format("Y-m-d"),
        "dayname" => strftime("%A", $date1->getTimestamp()),
    );
    $date1->modify('+1 day');
}
$json["d2"] = $date1->format("Y-m-d");

/* ======= clubStatus ======== */

$statuses = getClubStatus('idSchedule');
$r_statuses = array();
foreach($statuses as $status) {
    if (!empty($status['extended']['reservation'])) {
        $r_statuses[] = $status['alias'];
    }
}
$json['r_statuses'] = $r_statuses;

$w_repeat = array(
    "idSchedule.repeat" => 1,
    //"idSchedule.planfact" => 0,
);
$w_norepeat = array(
    "OR:idSchedule.repeat:=" => 0,
    "idSchedule.datestart:>" => $json["d1"],
);

$w = $modx->newQuery('idSchedule', array(
    'idTrainer.published' => 1,
    'idSchedule.stype:IN' => $r_statuses,
));
$w->innerJoin('idTrainer');

$bigData = !empty($trainer) || !empty($start_id); // Быбран тренер или id для резервирования
if ($bigData) {
    if (!empty($start_id)) {
        $w->where(array(
            'id' => $start_id, // может еще добавить OR parent, datetime
        ));
    } else {
        $w_norepeat["idSchedule.datestart:<"] = $json["d2"];
        $w->where(array(
            array($w_repeat, $w_norepeat),
            'trainer' => $trainer,
        ));
    }
    $w->leftJoin('idLesson');
    
    $w->select(array(
        //'idTrainer.name as trainer_name',
        'idSchedule.id',
        'idSchedule.repeat',
        'idSchedule.parent',
        'idSchedule.planfact',
        'idSchedule.datestart',
        'idSchedule.dateend',
        "DATE_FORMAT(datestart, '%H:%i') as d_s",
        "DATE_FORMAT(dateend, '%H:%i') as d_e",
        'COUNT(idLesson.id) as cnt_lesson',
    ));
    $w->groupby('idSchedule.id');
    //$w->sortby('idSchedule.datestart','ASC');
    if (!empty($sportsmen)) {
        $w->leftJoin('idSportsmen', 'sp', "sp.id = idLesson.sportsmen AND sp.key = '{$sportsmen}'");
        $w->select(array(
            "COUNT(sp.id) as cnt_sportsmen",
        ));
    }

} else { // Empty trainer
    
    $w->where(array($w_repeat, $w_norepeat));
    $w->select(array(
        'idTrainer.id',
        'idTrainer.name',
    ));
    $w->groupby('idTrainer.id');
}

$q = $w->prepare();
//$json["sql"] = $w->toSQL();
$q->execute();

$json['rows'] = $q->fetchAll(PDO::FETCH_ASSOC);

if (!empty($sportsmen)) {
    $wl = $modx->newQuery('idSchedule', array(
        "idSchedule.datestart:>=" => (new DateTime('today'))->format("Y-m-d"), //$json["d1"],
        //"idSchedule.datestart:<=" => $json["d2"], // Не надо, поскольку выбираем все заразервированные слоты для публикации на странице
    ));
    $wl->innerJoin('idTrainer');
    $wl->innerJoin('idLesson');
    $wl->innerJoin('idSportsmen', 'sp', "sp.id = idLesson.sportsmen AND sp.key = '{$sportsmen}'");
    $wl->select(array(
        'idSchedule.id',
        'idSchedule.datestart',
        'idSchedule.dateend',
        'idSchedule.created',
        'idTrainer.name as trainer_name',
        'idLesson.status',
    ));
    $wl->sortby('idSchedule.datestart','ASC');
    $q = $wl->prepare();
    $json["sql2"] = $wl->toSQL();
    $q->execute();
    
    while ($r = $q->fetch(PDO::FETCH_ASSOC)) {
        $r['ds_stamp'] = (new DateTime($r['datestart']))->getTimestamp();
        $json['spLesson'][] = $r;
    }
}
        

if ($bigData) {
    $rows = array();
    $parents = array();
    foreach($json['rows'] as $idx => $row) {
        if (!empty($row['parent'])) $parents[ $row['parent'] ] = 1;
    }
        
    $json['offset'] = $offset = (new DateTime("now +{$offset} hours"))->getTimestamp();
    foreach($json['rows'] as $idx => $row) {
        // если есть дочерний элемент, то родительский не выводится
        if (isset($parents[ $row['id'] ])) continue;
        // время забронировано, но не смортсменом убрать из выдачи
        if ($row['cnt_lesson']*1>0 && empty($row['cnt_sportsmen'])) continue;
        
        $date = new DateTime($row['datestart']);
        $row['duration'] = (new DateTime($row['dateend']))->getTimestamp() - $date->getTimestamp();
        $row['dn'] = $n = $date->format("N");
        if (!empty($row['repeat'])) {
            $row['datestart'] = $json['dates'][$n]['date'].' '.$row['d_s'];
            $date = new DateTime($row['datestart']);
        }
        
        // = $date->format("Y-m-d")
        // проверка можно ли бронировать заблаговременно
        $row['ds_stamp'] = $date->getTimestamp();
        $diff = ($row['ds_stamp'] - $offset)/60*60;
        $row['diff'] = $diff;
        if ($diff < 0) continue;
        
        // TODO: проверка спортсмена свободен ли выбранный диапазон - сколько человек записано (не превышен лимит)
        
        // пройтись по rows отметить какие занятия попадают в массив и ds и de
        //while ($r = $q->fetch(PDO::FETCH_ASSOC)) {
        if (empty($row['cnt_sportsmen'])) foreach ($json['spLesson'] as $r) {
            if ($r['ds_stamp'] >= $row['ds_stamp'] && $r['ds_stamp'] < ($row['ds_stamp']+$row['duration'])) {
                $row['cnt_sportsmen'] = 1;
                if (empty($row['cnt_lesson'])) $row['cnt_lesson'] = 1;
            }
        }
        $rows[] = $row;
    }
    $json['rows'] = $rows;


    if (!empty($start_id)) {
        $sp = $modx->getObject('idSportsmen', array('key' => $sportsmen));	
        if (!empty($sp)) {
            $start_w = array(
                'table' => 'idSchedule',
                'start_id' => $start_id,
                'datestart' => $_REQUEST['datestart'],
            );
            
            $json['startSchedule'] = $modx->runSnippet('dbedit', array(
                'data' => $start_w,
                'placeholder' => 'startSchedule',
            ));
            $startSchedule = $modx->getPlaceholder('startSchedule');
            if (empty($startSchedule)) {
                $json['error'] = 'Empty startSchedule';
            } else {
                $w = array(
                    'table' => 'idLesson',
                    'start_id' => $startSchedule->get('id'),
                    'sportsmen' => $sp->get('id'),
                    'status' => 'n',
                );
                $json['startSportsmen'] = $modx->runSnippet('dbedit', array(
                    'data' => $w,
                    'placeholder' => 'startSportsmen',
                ));
                $startSportsmen = $modx->getPlaceholder('startSportsmen');
                if (!empty($startSportsmen) && empty($startSportsmen->get('idinvoice'))) {
                    $modx->runSnippet('dbvalues', array(
                        'mode' => 'idInvoiceType',
                        'stype' => $startSchedule->get('stype'),
                        'placeholder' => 'startPrice',
                    ));
                    $startPrice = $modx->getPlaceholder('startPrice');
                    $json['startPrice'] = $startPrice;
                    if (!empty($startPrice) && !empty($startPrice['idInvoiceType'])) {
                        $price = $startPrice['idInvoiceType'][0];
                        $w = array(
                            'table' => 'idInvoice',
                            'dateinvoice' => $startSchedule->get('datestart'),
                            'sportsmen' => $sp->get('id'),
                            'sum' => $price['price'],
                            'typeinvoice' => $price['id'],
                        );
                        $json['idInvoice'] = $modx->runSnippet('dbedit', array(
                            'data' => $w,
                        ));
                    }
                }
            }
        }
    }
}
