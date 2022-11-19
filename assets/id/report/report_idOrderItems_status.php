<?php

/*$ugroups = $modx->user->getUserGroupNames();
if (in_array('idAdmin', $ugroups)){
    $json['introtext'] = "По всем городам";
} else {
    $where['idClub.city'] = $_SESSION['club_city'];
}*/

$where[] = "(idOrderItems.created BETWEEN '$d1' AND '$d2')";
$select = array(
    "idOrderItems.status as label",
    "count(idOrderItems.id) AS data",
    "sum(idOrderItems.total) AS total",
);

//$w->sortby('idOrderItems.status'); 
$w->groupby('idOrderItems.status', 'asc');