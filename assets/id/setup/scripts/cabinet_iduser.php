<?php
require_once('../../id_init.php');

$idSportsmen = $modx->getTableName('idSportsmen');
$idTrainer = $modx->getTableName('idTrainer');
$modUser = $modx->getTableName('modUser');

$modx->exec("UPDATE $idSportsmen s
INNER JOIN $modUser mu ON mu.username = s.email
set s.iduser = mu.id WHERE s.iduser = 0");

$modx->exec("UPDATE $idTrainer s
INNER JOIN $modUser mu ON mu.username = s.email
set s.iduser = mu.id WHERE s.iduser = 0");