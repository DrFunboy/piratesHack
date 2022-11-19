<?php

if (!empty($d1)&&!empty($d2)) {
    $w->innerJoin('idSchedule');
    $w->innerJoin('idStatus');
    $where[] = "(idSchedule.datestart BETWEEN '$d1' AND '$d2')";
    $select[] = 'idSchedule.datestart';
    $select[] = 'idSchedule.trainer';
    $select[] = 'idSchedule.club';
    $select[] = 'idSchedule.squad';
    $select[] = 'idStatus.name as status_name';
    $select[] = 'idStatus.extended as status_extended';
    
    $sidx[] = 'idSchedule.datestart';
    $sidx[] = 'idStatus.menuindex';
    $sidx[] = 'idStatus.name';
}

if (!empty($rq['_total'])) {
    $select = array(
        'SUM(idRate.value) as total',
    );
}