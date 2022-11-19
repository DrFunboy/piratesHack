<?php

$scrmFiles = $modx->getService('scrmfiles', 'scrmFiles', CRM_PATH);
$fids = array();
foreach ($json['rows'] as $n => $talk){
    $fids['idTalk'.$talk['id']] = $n;
}

foreach($modx->getIterator('idFiles', array(
    'key:IN' => array_keys($fids),
)) as $file) {
    $rowFile = $file->toArray();
    $n = $fids[ $rowFile['key'] ];
    if (!empty($n)) {
        $json['rows'][$n]['attach'] = $scrmFiles->fileUrl($rowFile);
    }
}
$json['fids'] = $fids;
