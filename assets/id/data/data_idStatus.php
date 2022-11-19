<?php

$w->leftJoin('idConfig', 'cfg', "cfg.name = CONCAT(idStatus.tbl, '_main')");
$select[] = 'cfg.val as is_main';

if (isset($where['idPayMethod'])) {
    $where['idStatus.tbl'] = 'idPayMethod';
    $where['idStatus.published'] = 1;
    //$where['idPayMethod.parent:IN'] = array(0, $where['idCity_Pay']);
    $w->innerJoin('idStatus', 'idExType', array('idExType.tbl' => 'idExtid', 'idExType.alias' => $where['idPayMethod']));
    $w->innerJoin('idExtid', 'idPayMethod', array('idPayMethod.extid = idStatus.id', 'idPayMethod.extype=idExType.id'));
    $select[] = "idPayMethod.parent as parent";
    unset($where['idPayMethod']);
}