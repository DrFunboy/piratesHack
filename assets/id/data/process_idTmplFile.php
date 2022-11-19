<?php

$rows = array();
foreach (glob(CRM_PATH. "export/tmpl/*") as $file){
    $r = pathinfo($file);
    $rows[] = $r;
}
$json['systmpl'] = $rows;
$modx->runSnippet('clubFiles', array(
    'uid' => 'usertmpl',
));

$json['usertmpl'] = $modx->getPlaceholder('clubFiles');