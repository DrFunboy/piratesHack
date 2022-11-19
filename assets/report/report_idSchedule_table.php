<?php

$where['planfact'] = 1;

/*
$w->sortby("trainer_name", "asc");
$w->sortby("clubname", "asc");
$w->sortby("levelname", "asc");
$w->sortby("squadname", "asc");
*/

if ($_REQUEST['_mode'] == 'trainer') {
    $trainer = array();
    $json['idTrainer'] = array();
    foreach ($modx->getIterator('idTrainer', array(
        'iduser' => $modx->user->get('id')
    )) as $trow) {
        $json['idTrainer'][] = $trow->toArray();
        $trainer[] = $trow->get('id');
    }
    $where[] = array(
        "idSchedule.trainer:IN" => $trainer,
        "OR:idSchedule.trainer2:IN" => $trainer,
    );
    //$where['idTrainer.iduser'] = $modx->user->get('id');
} else {
    $where["idClub.city"] = $_SESSION['club_city'];
}