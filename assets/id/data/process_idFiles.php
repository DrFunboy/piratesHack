<?php

$scrmFiles = $modx->getService('scrmfiles', 'scrmFiles', CRM_PATH);
foreach($json['rows'] as $n => $v) {
    $json['rows'][$n]['file_exists'] = $v['incloud']? -1 : file_exists(CRM_FILES.$rowFile['filetype']."/{$rowFile['key']}." . $rowFile['fileext']);
    $json['rows'][$n]['path'] = $scrmFiles->fileUrl($v);
}