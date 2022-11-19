<?php

if ($oper == 'add') {
    $row = $modx->getObject($table, array(
        'schedule' => $data['schedule'],
        'sportsmen' => $data['sportsmen'],
        'status' => $data['status'],
    ));
    if (!empty($row)) {
        $oper = 'edit';
    } elseif (!isset($data['value']) || empty($data['value'])) {
        $oper = '';
    }
}

if ($oper == 'edit' && isset($data['value']) && empty($data['value'])) {
    $oper = 'del';
}
