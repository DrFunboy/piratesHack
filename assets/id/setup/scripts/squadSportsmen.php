<?php
require_once('../../id_init.php');

$idSportsmen = $modx->getTableName('idSportsmen');
$idSportsmenSquad = $modx->getTableName('idSportsmenSquad');
$idChanges = $modx->getTableName('idChanges');

$sql = "INSERT IGNORE INTO $idSportsmenSquad
 (`sportsmen`, `squad`, `created`, `dateend`, `published`)
 SELECT s.id, s.squad, s.created, MAX(c.created), IF(c.created IS NULL, 1, null)
 FROM $idSportsmen s
 LEFT JOIN $idChanges c ON (c.sportsmen = s.id AND c.newvalue = 'Архив' AND s.`status`= 'Архив')
 WHERE squad != 0
 group by s.id";
echo $modx->exec($sql);
echo $sql;