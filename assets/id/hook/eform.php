<?php
clubAllowOrigin();

$cfgKey = defined('CRM_PAGE')? 'welcome' : 'hook';
$cfgKey = ($rq[1])? : $cfgKey;
//$modx->getOption('eform', $_REQUEST, $key? 'eFormWelcomeLead' : 'eFormWelcome');

$cfgData = getClubStatusAlias('eForm', $cfgKey);
$json = array(
    'eform' => $cfgKey,
    'table' => 'idLead',
);

if (!$cfgData) {
    $json['error'] = 'Empty eCard Config';
    clubLog('eFormError', $_REQUEST);
} else {
    $json['title'] = $cfgData['name'];
    $json['cfg'] = $cfgData['extended'];
    $json['clubStatus'] = getClubStatus('Gender');
    
    $modx->runSnippet('dbvalues', array(
        'mode' => 'idClub',
        'lessdata' => 1,
        'placeholder' => 'dbValues',
    ));
    $json['dbvalues'] = $modx->getPlaceholder('dbValues');
    
    $key = $modx->getOption('key', $scriptProperties, $_REQUEST['key']);
    if ($key) {
        $modx->runSnippet('idGetSportsmen');
        $sp = $modx->getPlaceholder('idGetSportsmen');
        if ($sp['id']) {
            $json['edata'] = $sp;
            $json['table'] = 'idSportsmen';
        } else {
            $idLead = $modx->getObjectGraph('idLead', '{"idSportsmen":{},"idClub":{}}', array('key' => $key));
            if (!empty($idLead)){
                $json['edata'] = $idLead->toArray('', false, false, true);
            }
        }
    }
    
    $eData = array();
    $srcData = $_POST;
    $srcKeys = array(); // array_diff_key($array1, $array2)
    foreach($json['cfg'] as $cfg) {
        if ($cfg['tbl'] && $json['table'] != $cfg['tbl']) continue;
        if ($cfg['from']) include(__DIR__ . "/eform/{$cfg['from']}.php");
    
        $fld = $cfg['name'];
        if (!$fld || $cfg['readonly']) continue;
        
        if ($cfg['system']) {
            $eData[ $fld ] = $cfg['value'];
            continue;
        }
        $srcFld = $cfg['src']? : $fld;
        if ($srcFld == '-') {
            // Сохранение несопоставленных полей в поле $fld 
            foreach($srcData as $ikey => $ival) {
                if (in_array($ikey, $srcKeys)) continue;
                if (!$eData[$fld]) $eData[$fld] = ''; else $eData[$fld] .= PHP_EOL;
                $eData[$fld] .= $ikey.': '.$ival;
            }
            continue;
        }
        
        $srcKeys[] = $srcFld;
        $val = $srcData[ $srcFld ];
        if ($val) {
            // Только поля со значениями
            $eData[ $fld ] = $val;
        } elseif ($cfg['required']) {
            $json['error_fields'][] = $fld;
        }
    }
    $json['srcKeys'] = $srcKeys;
    clubLog('eForm', $eData);
    
    
    if (!empty($eData) && empty($json['error_fields'])) { // Только изменения. Добавить oper?
        $eData['table'] = $json['table'];
        $eData['oper'] = 'add';
        if ($json['edata']) {
            $eData['oper'] = 'edit';
            $eData['id'] = $json['edata']['id'];
        }
        if ($key) {
            
        }
    
        if (empty($json['error_fields'])) {
            $modx->runSnippet('dbedit', array(
                'data' => $eData,
                'placeholder' => 'eData',
            ));
            $row = $modx->getPlaceholder('eData');
            $json['edata'] = $row->toArray('', false, false, true);
        }
    }
}
