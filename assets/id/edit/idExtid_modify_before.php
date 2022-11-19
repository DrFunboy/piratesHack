<?php
if (!empty($data['extype'])) {
    $exType = $modx->getObject('idStatus', array(
        'tbl' => 'idExtid',
        'alias' => $data['extype'],
        'published' => 1,
    ));
    if (!empty($exType)) {
        $data['extype'] = $exType->get('id');
    }
}