<?php
$w->innerJoin('idEventCategory');
$w->innerJoin('idSportsmen');
$w->leftJoin('idSquad', 'evSquad', "idSportsmen.squad = evSquad.id");
$w->leftJoin('idTrainer', 'evTrainer', "idSportsmen.trainer = evTrainer.id");

array_push($select,
    'idEventCategory.name',
    'idEventCategory.alias',
    'idSportsmen.name as sportsmen_name',
    'idSportsmen.gender',
    //'idSportsmen.saldo',
    //'idSportsmen.contact',
    //'idSportsmen.tel',
    'idSportsmen.key',
    'idSportsmen.squad',
    'idSportsmen.trainer',
    'evSquad.name AS squad_name',
    'evTrainer.name AS trainer_name'
);

if (!empty($d1)&&!empty($d2)) {
    $w->innerJoin('idEvent');
    $select[] = 'idEvent.name as event_name';
    $where['idEvent.datestart:>='] = $d1;
    $where['idEvent.dateend:<='] = $d2;
}

if (empty($sidx)) {
    $w->sortby('CAST(team as unsigned)');
    $w->sortby('sportsmen_name');
}