<?php

$w->innerJoin('idSportsmen');
// $w->innerJoin('idSchedule'); в data_idRate
$w->innerJoin('idTrainer','idTrainer','idTrainer.id = idSchedule.trainer');
$w->innerJoin('idClub','idClub','idClub.id = idSchedule.club');
$w->leftJoin('idSquad','idSquad','idSquad.id = idSchedule.squad');
$w->leftJoin('idLevel','idLevel','idLevel.id = idSquad.lvl');

$select[] = 'idSportsmen.name as sportsmen_name';
$select[] = 'idTrainer.name as trainer_name';
$select[] = 'idClub.name as club_name';
$select[] = "CONCAT_WS(', ', idLevel.name, idSquad.name) as squad_name";

$select[] = "SUM(IF(idStatus.extended LIKE('%sum\":\"total\"%'), idRate.value, 0)) as sum_value";
$select[] = 'COUNT(*) as cnt_value';

$w->groupby('idSportsmen.id, idSchedule.trainer, idSchedule.club, idSchedule.squad, idSchedule.id');

if ($_REQUEST['_mode']=='trainer') {
    $where['idTrainer.iduser'] = $modx->getLoginUserID();
} else {
    $where['idTrainer.city'] = $_SESSION['club_city'];
}