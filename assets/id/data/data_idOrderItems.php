<?php
$json['w'] = $where;
$w->leftJoin('idShopItem');
$select[] = 'idShopItem.name';

$w->leftJoin('idOrderPack');
$select[] = 'idOrderPack.name as customer_name';
$select[] = 'idOrderPack.tel';
$select[] = 'idOrderPack.address';
$select[] = 'idOrderPack.datepay';

$w->leftJoin('idCity', 'idCity', 'idCity.id = idOrderPack.city');
$select[] = 'idCity.name as cityname';

$w->leftJoin('idClub', 'idClub', 'idClub.id = idOrderPack.club');
$select[] = 'idClub.name as clubname';

$w->leftJoin('idSportsmen', 'idSportsmen', 'idSportsmen.id = idOrderPack.sportsmen');
$select[] = 'idSportsmen.name as sportsmen_name';
