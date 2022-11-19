<?php

$ecard = $modx->getOption('ecard', $_POST, $rq[2]);

$json = array(
    'ecard' => $ecard,
    'fields' => $cfgData = getClubStatusAlias('ecard', $ecard)['extended'], //getClubConfig($ecard, true),
);

if (!$cfgData) {
    $json['error'] = 'Empty eCard Config';
    dieJSON($json);
}

$eData = array();
$key = array();
foreach($cfgData as $cfg) {
    $fld = $cfg['name'];
    if ($cfg['tbl']) $json['table'] = $cfg['tbl'];
    if (!$fld || $cfg['readonly']) continue;
    
    if ($cfg['system']) {
        $eData[ $fld ] = $cfg['value'];
        continue;
    }
    if (array_key_exists($fld, $_POST)) {
        $val = $_POST[ $fld ]; // Читает данные
        if ($cfg['key'] && $val) {
            $key[$fld] = $val;
            continue;
        }
        
        if ($cfg['required'] && empty($val)) {
            $json['error_fields'][] = $fld;
            continue;
        }
        $eData[ $fld ] = $val;
    }
}

if (empty($key) || !$json['table']) {
    $json['error'] = 'Empty eCard key/table';
    
} elseif (empty($eData)) {
    $json['error'] = 'Empty edit DATA';
    
} else {
    $eItem = $modx->getObject($json['table'], $key);
    if (empty($eItem)) {
        $json['error'] = 'Empty Object';
    }
}

if (empty($json['error'])) {
    $eData['oper'] = 'edit';
    $eData['table'] = $json['table'];
    $json['eout'] = $modx->runSnippet('dbedit', array(
        'data' => $eData,
        //'placeholder' => 'eCard',
        'row' => $eItem,
    ));
    //$eItem = $modx->getPlaceholder('eData');
    $json['edata'] = $eItem->toArray('', false, false, true);
}
