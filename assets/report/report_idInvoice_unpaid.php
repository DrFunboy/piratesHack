<?
$w->innerJoin('idSportsmen');
$select[] = "idSportsmen.key as sp_key";
$select[] = "idSportsmen.name as sp_name";
$w->having("sumpay < `sum`");