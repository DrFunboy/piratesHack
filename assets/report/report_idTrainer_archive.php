<?php

$json['sp_arc'] = getClubConfig('idSportsmen_arc');
$sp_arc = explode(',', $json['sp_arc']);


if ($table=='idSportsmen') {
    $w_d1d2_BETWEEN = "(idChanges.created BETWEEN '{$d1}' AND '{$d2}')";
    if (!empty($where['cnt_trainer'])) {
        $w->innerJoin('idChanges', 'idChanges', array(
            'idChanges.sportsmen = idSportsmen.id',
            $w_d1d2_BETWEEN,
            "idChanges.chfield = 'trainer'",
            'idChanges.oldvalue' => $where['cnt_trainer'],
        ));
        unset($where['cnt_trainer']);
    }
    
    if (!empty($where['idTrainer.id'])) {
        $w->innerJoin('idChanges', 'idChanges', array(
            'idChanges.sportsmen = idSportsmen.id',
            $w_d1d2_BETWEEN,
            'idChanges.chfield' => 'status',
            'idChanges.newvalue:IN' => $sp_arc,
        ));
    }
} else {
    $where['idTrainer.city'] = $_SESSION['club_city'];
    $idChanges = $modx->getTableName('idChanges');
    $idSportsmen = $modx->getTableName('idSportsmen');
    
    $sp_arc_in = implode("','", $sp_arc);
    
    $w->select(array(
        "idTrainer.id",
        "idTrainer.name",
    
        "(SELECT COUNT(*) FROM {$idChanges} as idChanges WHERE (idChanges.created BETWEEN '{$d1}' AND '{$d2}') AND idChanges.chfield = 'trainer' AND idChanges.oldvalue = idTrainer.id) as cnt_trainer",
        
        "(SELECT COUNT(*) FROM {$idSportsmen} as idSportsmen INNER JOIN {$idChanges} as c2 ON (c2.sportsmen = idSportsmen.id AND c2.created BETWEEN '{$d1}' AND '{$d2}') WHERE idSportsmen.trainer = idTrainer.id  AND c2.chfield = 'status' AND c2.newvalue IN ('{$sp_arc_in}')) as cnt_arc",
    ));
    
    $w->sortby("idTrainer.name");
    $w->having("cnt_trainer > 0 OR cnt_arc > 0");
}