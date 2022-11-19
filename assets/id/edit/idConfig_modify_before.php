<?php

$ugroups = $modx->user->getUserGroupNames();
if (!in_array('idAdmin', $ugroups) && empty($modx->user->get('sudo'))) die('Only Admin');

if ($oper == 'add'||$oper == 'edit') {
    setClubConfig($data['id'], $data['val']); // Здесь очищается Конфиг
    $oper = '';
}

if ($oper == 'del') {
    $del_rows = $modx->getIterator($table, array(
        'name:IN' => $ids,
    ));
}

$modx->cacheManager->delete(CRM_PREFIX .'/clubConfig/');