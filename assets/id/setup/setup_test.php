<?php
define('CLUB_UNAUTH', true);
require_once('../id_init.php');
//error_reporting(E_ALL);
error_reporting(E_ALL & ~E_NOTICE);
set_time_limit(0);

foreach (glob("tmpl/*", GLOB_BRACE) as $tpl_file) {
    $pi = pathinfo($tpl_file);
    $w = array('handler' => $pi['filename']);
    $tmpl = $modx->getObject('idTmpl', $w);
    if (empty($tmpl)) {
        $w['type'] = '';
        $w['subj'] = 'Добро пожаловать!';
        $w['name'] = $w['handler'];
        $tmpl = $modx->newObject('idTmpl', $w);
    }
    if ($tmpl->get('type')=='') {
        $tmpl->set('content', file_get_contents($tpl_file));
        $tmpl->save();
    }
}