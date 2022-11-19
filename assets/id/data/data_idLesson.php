<?php

if (!empty($d1)&&!empty($d2)) {
    $w->rightJoin('idSchedule','idSchedule', '(idSchedule.id = idLesson.schedule OR idLesson.id IS NULL)');
    $where[] = "(idSchedule.datestart BETWEEN '$d1' AND '$d2')";
    $where['idSchedule.planfact'] = 1;
} else {
    $w->innerJoin('idSchedule');    
}

$w->innerJoin('idTrainer', 'idTrainer', 'idTrainer.id = idSchedule.trainer');
$w->innerJoin('idClub', 'idClub', 'idClub.id = idSchedule.club');
$w->innerJoin('idSport', 'idSport', 'idSport.id = idSchedule.sport');
$w->leftJoin('idSquad', 'idSquad', 'idSquad.id = idSchedule.squad');
$w->leftJoin('idLevel', 'idLevel', 'idLevel.id = idSquad.lvl');
$w->leftJoin('idInvoice', 'inv', 'inv.id = idLesson.idinvoice');
$w->leftJoin('idConfig', 'cfg', "cfg.name = CONCAT('schedule_', idSchedule.stype)");
$w->leftJoin('idStatus', 'idStatus', "idStatus.alias = idSchedule.stype AND idStatus.tbl='idSchedule' AND idStatus.published=1");

array_push($select,
    'idSchedule.id as schedule_id',
    'idSchedule.datestart',
    'idSchedule.squad',
    'idTrainer.name as trainer_name',
    'idClub.name as clubname',
    'idSport.name as sportname',
    'idSport.shortname as ssportname',
    'idSquad.name as squadname',
    'idLevel.name as levelname',
    'inv.dateinvoice',
    'inv.sum',
    'inv.lesson_amount',
    'inv.typeinvoice',
    'cfg.val as cfg_value',
    'idSchedule.stype',
    'idStatus.name as stype_name',
    'idStatus.ico as stype_ico'
);

    
if (!empty($where['idSchedule.trainer'])) {
    $where[] = array(
        'idSchedule.trainer' => $where['idSchedule.trainer'],
        'OR:idSchedule.trainer2:=' => $where['idSchedule.trainer'],
    );
    unset($where['idSchedule.trainer']);
}