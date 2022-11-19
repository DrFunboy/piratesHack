<?php

$ugroups = $modx->scrm->userGroups;
$club_admin = in_array('idAdmin', $ugroups);

$json['sp_arc'] = getClubConfig('idSportsmen_arc');
$sp_arc_in = implode("','", explode(',', $json['sp_arc']));

if ($table == 'idClub') {
    require_once('period6m.php');
    $w->innerJoin('idSquad', 'idSquad', 'idSquad.club = idClub.id');
    $w->innerJoin('idSportsmen', 'idSportsmen', 'idSportsmen.squad = idSquad.id');
    $select = array(
        "DATE_FORMAT(idChanges.created, '%m') as month_ch",
        'YEAR(idChanges.created) as year_ch',
    );
    /*foreach ($period as $pk => $per) {
        $d_str = "(idChanges.created BETWEEN '{$per['d1']}' AND '{$per['d2']}')";
        
        //$select[] = "COUNT(DISTINCT CASE WHEN $d_str THEN idLesson.sportsmen END) as sportsmen_{$pk}";
        $select[] = "COUNT(DISTINCT IF(idChanges.newvalue = 'Архив' AND $d_str, idSportsmen.id, null)) as sportsmen_arc_{$pk}";
        $select[] = "COUNT(DISTINCT IF(idChanges.newvalue = 'new' AND $d_str, idSportsmen.id, null)) as sportsmen_new_{$pk}";
        $select[] = "COUNT(DISTINCT IF(idChanges.oldvalue = 'Архив' AND $d_str, idSportsmen.id, null)) as sportsmen_back_{$pk}";        
    }*/
    $select[] = "SUM(IF(idChanges.newvalue IN ('{$sp_arc_in}'), 1, 0)) as cnt_arc";
    $select[] = "COUNT(DISTINCT IF(idChanges.newvalue IN ('{$sp_arc_in}'), idSportsmen.id, null)) as sportsmen_arc";
    
    $select[] = "SUM(IF(idChanges.newvalue = 'new', 1, 0)) as cnt_new";
    $select[] = "COUNT(DISTINCT IF(idChanges.newvalue = 'new', idSportsmen.id, null)) as sportsmen_new";
    
    $select[] = "SUM(IF(idChanges.oldvalue IN ('{$sp_arc_in}'), 1, 0)) as cnt_back";
    $select[] = "COUNT(DISTINCT IF(idChanges.oldvalue IN ('{$sp_arc_in}'), idSportsmen.id, null)) as sportsmen_back";
    array_push($groupby, 'MONTH(idChanges.created)');
}

if ($table == 'idCity') {
    if (!$club_admin){
        $where['idCity.id'] = $_SESSION['club_city'];
    }
    $select = array(
        'idCity.id',
        'idCity.name',
    );
    $w->innerJoin('idSportsmen');
    
    $select[] = "SUM(IF(idChanges.newvalue IN ('{$sp_arc_in}'), 1, 0)) as cnt_arc";
    $select[] = "COUNT(DISTINCT IF(idChanges.newvalue IN ('{$sp_arc_in}'), idSportsmen.id, null)) as sportsmen_arc";
    
    $select[] = "SUM(IF(idChanges.newvalue = 'new', 1, 0)) as cnt_new";
    $select[] = "COUNT(DISTINCT IF(idChanges.newvalue = 'new', idSportsmen.id, null)) as sportsmen_new";
    
    $select[] = "SUM(IF(idChanges.oldvalue IN ('{$sp_arc_in}'), 1, 0)) as cnt_back";
    $select[] = "COUNT(DISTINCT IF(idChanges.oldvalue IN ('{$sp_arc_in}'), idSportsmen.id, null)) as sportsmen_back";

    $groupby[] = 'idCity.id';
    
    $totals = ", SUM(`cnt_arc`) as `cnt_arc`, SUM(`cnt_sportsmen`) as `cnt_sportsmen`";
}

$w->innerJoin('idChanges', 'idChanges', array(
    "idChanges.sportsmen = idSportsmen.id",
    "idChanges.created BETWEEN '{$d1}' AND '{$d2}'",
    "idChanges.chfield" => 'status',
));

if ($table == 'idSportsmen') {
    if ($club_admin) unset($where['city']);
    switch ($where['NAR']) {
        case 'new':
            $where['idChanges.newvalue'] = 'new';
            break;
        case 'arc':
            clubWhereIN($where, $json['sp_arc'], 'idChanges.newvalue');
            break;
        case 'return':
            clubWhereIN($where, $json['sp_arc'], 'idChanges.oldvalue');
            break;
    }
    unset($where['NAR']);

    //$rq['sql'] = 1;
    $select[] = "COUNT(idSportsmen.id) as add_cnt";
    $groupby[] = 'idSportsmen.id';
}
