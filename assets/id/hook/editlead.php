<?php

$can_edit = ['datestart'];

$lead = $modx->getObject('idLead', array('key' => $_REQUEST['key']));
if (!empty($lead)) {
    $edata = array_intersect_key($_REQUEST, array_flip($can_edit));
    echo $modx->runSnippet('dbedit', array(
        'data' => array_merge($edata, array(
            'oper' => 'edit',
            'table' => 'idLead',
            //'id' => $lead->get('id'),
        )),
        'row' => $lead,
    ));
}