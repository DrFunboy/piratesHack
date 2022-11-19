<?php

$ugroups = $modx->user->getUserGroupNames();
if (in_array('idAdmin', $ugroups)){
    $json['introtext'] = "По всем городам";
} else {
    $where['idClub.city'] = $_SESSION['club_city'];
}

$where[] = "(idLead.created BETWEEN '$d1' AND '$d2')";
$select = array(
    "idLead.status as label",
    "count(idLead.id) AS data",
);

array_push($sidx, 'idLead.`status`');
array_push($groupby, 'idLead.`status`');
