<?php

$flds = explode(',', getClubConfig('change_idSportsmen'));
$json = array();

$chfield = $_REQUEST['name'];
$chvalue = $_REQUEST['value'];
$sportsmen = $modx->getObject('idSportsmen', array('key' => $_REQUEST['key']));
if (!empty($sportsmen) && in_array($chfield, $flds)){
    //TODO:  Может разрешать пустые значения?? && !empty($chvalue)
    $chData = array(
        'table' => 'idSportsmen',
        'oper' => 'edit',
    );
    $chData[$chfield] = $chvalue;
    $modx->runSnippet('dbedit', array(
        'data' => $chData,
        'row' => $sportsmen,
    ));
    /*$ch_insert = array(
        'sportsmen' => $sportsmen->id,
        'chfield' => $chfield,
        'author' => $userID,
        'oldvalue' => $sportsmen->get($chfield),
        'newvalue' => $chvalue,
    );
    $ch = $modx->newObject('idChanges', $ch_insert);
    $ch->save();
    $sportsmen->set($chfield, $chvalue);
    $sportsmen->save();*/
    $json['result'] = "OK";
} else {
    dieJSON("Ошибка изменения [$chfield, $chvalue]");
}
