<?php

//$chfield = $_REQUEST['field'];
$chvalue = $_REQUEST['_rowid'];

$join = array("idChanges.sportsmen = idSportsmen.id", "idChanges.created BETWEEN '{$d1}' AND '{$d2}'");

if ($table == 'idChanges') {
    $where['idSportsmen.city'] = $_SESSION['club_city'];
    $w->innerJoin('idSportsmen', 'idSportsmen', $join);
    $select = array(
        "Count(idChanges.id) as cnt",
        "Count(DISTINCT idChanges.sportsmen) as cntsportsmen",
    );
    $select[] = "idChanges.chfield";
    $groupby[] = "idChanges.chfield"; 
    if (!empty($where['chfield'])) {
        $select[] = "idChanges.newvalue";
        $groupby[] = "idChanges.newvalue";
    }
}

if ($table == 'idSportsmen') {
    $w->innerJoin('idChanges', 'idChanges', $join);
    $w->groupby('idSportsmen.id');
    $select[] = "count(idChanges.id) as add_cnt";
    $totals = ", SUM(`add_cnt`) as `add_cnt`";
}
