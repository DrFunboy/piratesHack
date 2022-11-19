<?php

$status = $rq[2];
if (empty($status)) {
    dieJSON('Empty Status');
}
$json = array();
foreach($modx->getIterator('idRate', array(
    'status' => $status,
)) as $r) {
    $modx->updateCollection('idLesson', array(
        'mark' => $r->get('value'),
    ), array(
        'schedule' => $r->get('schedule'),
        'sportsmen' => $r->get('sportsmen'),
    ));
    $json[] = $r->toArray();
}