<?php

$w->leftJoin('idOrderItems');
$w->leftJoin('idCity');
$select[] = 'idCity.name as cityname';

$w->leftJoin('idClub');
$select[] = 'idClub.name as clubname';

$w->leftJoin('idSportsmen');
$select[] = 'idSportsmen.name as sportsmen_name';

$w->groupby('idOrderPack.id');
$select[] = "GROUP_CONCAT(DISTINCT idOrderItems.status) as order_status";
$select[] = "count(idOrderItems.id) as cnt";
$select[] = "sum(idOrderItems.total) as total";