<?php

if ($thumb_filetype) {
    $scrmFiles = $modx->getService('scrmfiles', 'scrmFiles', CRM_PATH);
    if (!$thumb_size) $thumb_size = 'sm';
    foreach($json['rows'] as $n => $v) {
        $fn = explode(',', $v[$thumb_filetype])[0];
        if (!empty($fn)) {
            $json['rows'][$n][$thumb_size] = $scrmFiles->fileUrlFromString($fn, $thumb_filetype, $thumb_size);
            //getClubThumb($fn, $thumb_size, $v['gender']);
        }
    }
}