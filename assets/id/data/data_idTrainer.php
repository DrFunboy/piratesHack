<?php
if ($where["birth"]=='b7d') {
    unset($where["birth"]);
    $where[] = 'DATE_FORMAT(`birth`, CONCAT(YEAR(NOW()),"-%m-%d")) 
    BETWEEN DATE_SUB(NOW(), INTERVAL 1 DAY) AND DATE_ADD(NOW(), INTERVAL 7 DAY)';
}

$w->leftJoin('modUser', 'idUser', "idUser.id = idTrainer.iduser");
$select[] = 'idUser.username';