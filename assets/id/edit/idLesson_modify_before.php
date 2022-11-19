<?php

if (!empty($data['start_id']) && !empty($data['sportsmen'])) {
    if (empty($row)) $row = $modx->getObject($table, array(
        'schedule' => $data['start_id'],
        'sportsmen' => $data['sportsmen'],
    ));
    if (!empty($row)) {
        $oper = 'edit';
    } else {
        $data['schedule'] = $data['start_id'];
    }
}