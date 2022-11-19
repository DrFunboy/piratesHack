<?php

if ($oper=='edit' && isset($data['published']) && empty($data['published'])) {
    $modx->updateCollection('idSportsmenSquad', array(
        'published' => null,
        'editedby' => $userID,
        'dateend' => date('c'),
    ), array(
        'squad:IN' => $ids,
        'dateend' => null,
    ));
    foreach($modx->getIterator('idSchedule', array(
        'squad:IN' => $ids,
        'planfact' => 0,
        array(
            'datestart > NOW()',
            'OR:repeat:=' => 1,
        ),
    )) as $r) {
        $out['removed'][] = $r->toArray();
        $r->remove();
    }
}

if ($oper=='edit' && isset($data['unite']) && sizeof($ids)>1) {
    $to_id = array_shift($ids);
    $out['u2'] = $modx->updateCollection('idSportsmen', array(
        'squad' => $to_id,
    ), array(
        'squad:IN' => $ids,
    ));
    $out['u3'] = $modx->updateCollection('idSchedule', array(
        'squad' => $to_id,
    ), array(
        'squad:IN' => $ids,
    ));
    $out['u1'] = $modx->updateCollection('idSportsmenSquad', array(
        'squad' => $to_id,
    ), array(
        'squad:IN' => $ids,
    ));
    
    //$modx->query("UPDATE {$modx->getTableName('idSportsmen')} set squad = {$to} WHERE squad = {$from}");
    //$modx->query("UPDATE {$modx->getTableName('idSchedule')} set squad = {$to} WHERE squad = {$from}");
    //$modx->query("UPDATE {$modx->getTableName('idSportsmenSquad')} set squad = {$to} WHERE squad = {$from}");
    //$modx->query("DELETE FROM {$modx->getTableName('idSquad')} WHERE id = {$from}");
    $oper='del';
    $del_rows = $modx->getIterator($table, array(
        'id:IN' => $ids,
    ));
}