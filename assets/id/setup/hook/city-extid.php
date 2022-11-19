<?php

// ==== Смена города
$idExtid = getClubStatusAlias('idExtid', 'idUser_city');

$w = $modx->newQuery('idLink', array(
    'tbl1' => 'modUser',
    'tbl2' => 'idCity',
));
$w->leftJoin('idExtid', 'idExtid', "idExtid.parent=idLink.id1 AND idExtid.extype=".$idExtid['id']);
$w->select(array('idLink.*, idExtid.id as extid'));
$w->having('extid IS NULL');
foreach($modx->getCollection('idLink', $w) as $row) {
    $next = $modx->newObject('idExtid', array(
        'parent' => $row->get('id1'),
        'extid' => $row->get('id2'),
        'extype' => $idExtid['id'],
    ));
    $next->save();
    print_r($row->toArray().'<br>');
}