<?php

if (empty($mode)){
    $_label = $modx->getOption('_label', $_REQUEST, 'idLead.source');
    /*$ugroups = $modx->user->getUserGroupNames();
    if (in_array('idAdmin', $ugroups)){
        unset($where['city']);
    }*/
    
    $select = array(
        "$_label as label",
        "count(idLead.id) AS data",
    );
    
    $date_field = ($_label == 'idLead.datestart')? $_label: 'idLead.created';
    
    $where[] = "($date_field BETWEEN '$d1' AND '$d2')";
    $where[$_label.':!='] = '';

    array_push($sidx, $_label);
    array_push($groupby, $_label);
}