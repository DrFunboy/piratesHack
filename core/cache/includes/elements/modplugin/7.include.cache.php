<?php
//if ($modx->event->name != 'OnPageNotFound') {return false;}
// echo json_encode($json, JSON_UNESCAPED_UNICODE);
//if (defined('CLUB_FORWARD')) return false;
//define('CLUB_FORWARD', 1);

$rq = explode('/', $_REQUEST['q']);
if ($rq[0]=='qr.html') {
    if (!$qr = $modx->findResource('qr/')) return false; // если нет раздела выход
    $modx->sendForward($qr);
}
/*if ($rq[0]=='start') {
    $modx->resource = $modx->newObject('modResource');
    $modx->resource->set('cacheable', 0);
    
    //include('eform.php');
    
    $modx->resource->set('pagetitle', $modx->getOption('title', $json, '33Start!!'));
    
    $modx->setPlaceholder('pageBody', 'He423lllo!');
    $modx->sendForward($modx->findResource('start/'), array(
       'merge' => 1,
       'forward_merge_excludes' => 'template,type'
    ), false);
}*/
return;
