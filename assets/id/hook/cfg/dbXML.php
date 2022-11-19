<?php
if ($val) {
    $manager = $modx->getManager();
    $generator = $manager->getGenerator();
    $temp = tmpfile();
    $temp_path = stream_get_meta_data($temp)['uri'];
    $temp_val = '<?xml version="1.0" encoding="UTF-8"?>
        <model package="'.CRM_PREFIX.'DB" baseClass="xPDOObject" platform="mysql">'.$val.'</model>';
    fwrite($temp, $temp_val);
    $model_path = CRMTOOLS_PATH.'start/model/';
    $generator->parseSchema($temp_path, $model_path);
    $modx->scrm->sendRedirect('/hook/cfg.dbXML');
}

if ($rq && $rq[1] == 'cfg.dbXML') {
    $setup = $modx->getService('scrmsetup', 'SCRMsetup', CRM_PATH.'setup/');
    $setup->setupFields();
    $json = array('status' => 'OK');
}