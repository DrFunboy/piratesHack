<?php

$rq['rows'] = 1001;

$d1 = new DateTime('monday next week');
$d2 = new DateTime('monday this week');
$d2->modify("-16 week");

$d1 = $d1->format('Y-m-d 00:00:00');
$d2 = $d2->format('Y-m-d 00:00:00');
$join = "sch.datestart BETWEEN '$d2' AND '$d1'";
$w->innerJoin('idLesson');
$w->innerJoin('idSchedule', 'sch', "sch.id = idLesson.schedule AND ($join)");

$select = array(
    //"SUM(IF(idLesson.`status`='y', 1, 0)) as cnt_y",
    //"SUM(IF(idLesson.`status`='n', 1, 0)) as cnt_n",
    //"SUM(IF(idLesson.`status`='t', 1, 0)) as cnt_t",
    'YEARWEEK(sch.datestart) as yw',
    'idLesson.`status`',
    'COUNT(idLesson.id) as cnt',
    "FROM_DAYS(TO_DAYS(sch.datestart) -MOD(TO_DAYS(sch.datestart) -2, 7)) as sd",
    //"YEARWEEK(sch.datestart) as yw",
);

$sidx = array('yw DESC');
array_push($groupby, 'YEARWEEK(sch.datestart)', 'idLesson.`status`');