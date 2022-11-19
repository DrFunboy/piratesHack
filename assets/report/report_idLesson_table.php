<?php
//$w->innerJoin('idSchedule');
$w->leftJoin('idSportsmen');
//$w->innerJoin('idSport', 'idSport', 'idSport.id = idSchedule.sport');

array_push($select,
    //"DATE_FORMAT(idSchedule.datestart, '%d.%m') as d_m",
    "idSportsmen.name as sportsmen_name",
    "DATE_FORMAT(idSchedule.datestart, '%H:%i') as d_s"
);

$sidx[] = 'datestart';
$sidx[] = 'idSportsmen.name';