<?php
define('CRM_PAGE', true);
$modx->resource = $modx->newObject('modResource');
$modx->resource->set('cacheable', 0);
$pageFile = $modx->scrm->sysFilePath( "hook/page/{$rq[0]}.html" );

switch ($rq[0]) {
    case 'welcome':
        include('eform.php');
    break;
}

if (isset($json)) {
    $modx->resource->set('pagetitle', $modx->getOption('title', $json));
    if ($pageFile) $modx->setPlaceholder('pageBody', file_get_contents($pageFile));
    $modx->setPlaceholder('pageData', json_encode($json, JSON_UNESCAPED_UNICODE));
    unset($json);
}

$modx->sendForward($modx->findResource('page/'), array(
   'merge' => 1,
   'forward_merge_excludes' => 'template,type',
), false);
