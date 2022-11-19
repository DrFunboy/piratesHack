<?php
if (!empty($d1)&&!empty($d2))
    $where[] = "(idSchedule.datestart BETWEEN '$d1' AND '$d2')";
    
$w_trainer = empty($where['trainer'])? $where['idSchedule.trainer'] : $where['trainer'];
if (!empty($w_trainer)) {
    $where[] = array(
        'idSchedule.trainer' => $w_trainer,
        'OR:idSchedule.trainer2:=' => $w_trainer,
    );
    unset($where['idSchedule.trainer'], $where['trainer']);
}

$w->innerJoin('idSport');
$w->innerJoin('idClub');
$w->innerJoin('idTrainer');
$w->leftJoin('idLesson');
$w->leftJoin('idSquad');
$w->leftJoin('idLevel', 'idLevel', 'idLevel.id = idSquad.lvl');
$w->leftJoin('idTrainer','tr2','tr2.id = idSchedule.trainer2');

array_push($select,
    "idSquad.name as squadname",
    "idLevel.name as levelname",
    "idClub.name as clubname",
    "idSport.name as sportname",
    "idSport.shortname as ssportname",
    'idTrainer.`name` as trainer_name',
    'tr2.name as trainer2_name',
    "DATE_FORMAT(idSchedule.datestart, '%H:%i') as d_s",
    "DATE_FORMAT(idSchedule.dateend, '%H:%i') as d_e",
    "DAYOFWEEK(idSchedule.datestart)-1 as d_w",
    "COUNT(idLesson.id) as cnt_lesson"
);
$csLesson = getClubStatus('idLesson');
foreach($csLesson as $csLessonRow) {
    $select[] = "SUM(IF(idLesson.status='{$csLessonRow['alias']}', 1, 0)) as cnt_{$csLessonRow['alias']}";
}

$groupby[] = 'idSchedule.id';