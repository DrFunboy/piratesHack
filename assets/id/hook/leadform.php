<?php

if (!defined('MODX_API_MODE')) {
    define('CLUB_UNAUTH', true);
    require_once(__DIR__.'/../id_init.php');
}

clubAllowOrigin();

$_cfg = clubConfig('leadform_fields,leadform_cfg');
/*{
    "type":"post",
    "type_":"inline"
}*/

$cfg_fields = getClubJSON($_cfg['leadform_fields']);
$cfg = getClubJSON($_cfg['leadform_cfg']);

if ($cfg['type']=='input') {
    $input = file_get_contents('php://input');
    $d = json_decode($input, true);
} else {
    $d = $_REQUEST;
}
clubLog('hook_leadform', $d);

$flds = $modx->getFieldMeta('idLead');
$flds['city'] = array(); // Добавим чтобы передать в сниппет dbedit
$add = array();
$info = array();
foreach($d as $rkey => $rvalue) {
    $fld = isset($cfg_fields[$rkey])? $cfg_fields[$rkey] : $rkey;
    if (empty($rvalue) || empty($fld)) continue;
    if (isset($flds[$fld])) {
        $add[$fld] = $rvalue;
        if (in_array($flds[$fld]['dbtype'], ['date'])) {// 'datetime'
            if (strlen($rvalue)==4) $rvalue.= '-01-01';
            try {
                $date = new DateTime($rvalue);
                $add[$fld] = $date->format('Y-m-d');
            } catch(Exception $e){
                $info[] = $fld.':'.$rvalue;
            }
        }
        if (in_array($flds[$fld]['dbtype'], ['datetime'])) {
            try {
                $date = new DateTime($rvalue);
                $add[$fld] = $date->format('Y-m-d H:i:s');
            } catch(Exception $e){
                $info[] = $fld.':'.$rvalue;
            }
        }
        if ($fld == 'info') $info[] = $rvalue;
    } else {
        $info[] = $fld.':'.$rvalue;
    }
}

if (empty($add['name'])) $add['name'] = $add['tel'];
if (empty($add['name'])) $add['name'] = $add['email'];
if (empty($add['name'])) $add['name'] = $add['contact'];

if (!empty($add['name'])) {
    $add['info'] = $info;
    $add['table'] = 'idLead';
    $add['oper'] = 'add';
    $dbedit = $modx->runSnippet('dbedit', array(
        'data' => $add,
    ));
    $idLead = $modx->getPlaceholder('dbeditRow');
    if (empty($json)) {
        echo $dbedit;
    } else {
        $json['idLead'] = $idLead->toArray();
    }
    if (!empty($_REQUEST['idTascom'])) {
        $modx->runSnippet('dbedit', array(
            'data' => array_merge($_REQUEST['idTascom'], array(
                'table' => 'idTascom',
                'oper' => 'add',
                'tbl' => 'idLead',
                'uid' => $idLead->get('key'),
            )), // data
        ));
    }
} else {
    dieJSON('Empty data');
}