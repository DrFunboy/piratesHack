<?php

$ugroups = $modx->user->getUserGroupNames();
if (in_array('idAdmin', $ugroups)){
    unset($where['city']);
}
$w->leftJoin('idCity');
$select[] = 'idCity.name as city_name';

$select[] = '(YEAR(CURRENT_DATE)-YEAR(idSportsmen.birth))-(RIGHT(CURRENT_DATE,5)<RIGHT(idSportsmen.birth,5)
  ) AS `age`';