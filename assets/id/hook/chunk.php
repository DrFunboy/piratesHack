<?php

$rqData = $_REQUEST;

switch ($rq[1]) {
    /*case 'ecard':
    //case 'eform':
        $rqData['addScript'] = '';
        if ($rq[2]) {
            $wCard = array(
                'tbl' => $rq[1],    
            );
            clubWhereIN($wCard, $rq[2], 'alias');
            $cfgVal = json_encode(getClubStatus($wCard), JSON_UNESCAPED_UNICODE);
            $rqData['addScript'] .= "SCRM.setClubStatus({$cfgVal});";
        }
        unset($rq[2]);
        break;*/
    case 'eform':
        if ($rq[2]) {
            $rqData['addScript'] = $modx->runSnippet('runHook', array(
                'hook' => 'eform/'.$rq[2]
            ));
        }
        break;
    case 'html':
        $rqData['HTMLBlock'] = getClubConfig($rq[2].'HTMLBlock');
        break;
}

$rqData['rq'] = '/'.implode('/', $rq);
$rqData['uqid'] = uniqid();

if ($chunkFile = $modx->scrm->sysFilePath("hook/chunk/{$rq[1]}.html")) {
    $chunkHtml = file_get_contents($chunkFile);
    $wModule = array(
        'tbl' => 'idModule',
        'cls' => $rqData['rq'],
    );
    foreach(getClubStatus($wModule, null, 'cfg') as $module) {
        $chunkHtml .= $module['cfg'];
    }
} else {
    $chunkHtml = getClubConfig($rq[1].'HTMLBlock');
}

echo empty($chunkHtml)? '' : clubTmpl($chunkHtml, $rqData);

/*$seconds_to_cache = 3600*24*4; // 4 дней
$ts = gmdate("D, d M Y H:i:s", time() + $seconds_to_cache) . " GMT";
header("Expires: $ts");
header("Pragma: cache");
header("Cache-Control: max-age=$seconds_to_cache");*/
