<?php
set_time_limit(0);
require_once('../../id_init.php');

$new_ft = 'logo';
$new_dir = MODX_BASE_PATH."files/{$new_ft}/";
if (!is_dir($new_dir)) mkdir($new_dir, 0755, true);

foreach($modx->getCollection('idFiles', array('uid' => 'logoClub', 'filetype' => 'photo')) as $idFile) {
    $file = MODX_BASE_PATH."files/{$idFile->filetype}/{$idFile->key}.{$idFile->fileext}";
    $file_new = MODX_BASE_PATH."files/{$new_ft}/{$idFile->key}.{$idFile->fileext}";
    if (rename ($file, $file_new)) {
        $idFile->set('filetype', $new_ft);
        $idFile->save();
        echo "moved $new_ft<br>";
    };
}

$new_ft = 'photo_shop';
$new_dir = MODX_BASE_PATH."files/{$new_ft}/";
if (!is_dir($new_dir)) mkdir($new_dir, 0755, true);

foreach($modx->getCollection('idFiles', array('uid:LIKE' => 'shop%', 'filetype' => 'photo')) as $idFile) {
    $file = MODX_BASE_PATH."files/{$idFile->filetype}/{$idFile->key}.{$idFile->fileext}";
    $file_new = MODX_BASE_PATH."files/{$new_ft}/{$idFile->key}.{$idFile->fileext}";
    if (rename ($file, $file_new)) {
        $idFile->set('filetype', $new_ft);
        $idFile->save();
        echo "moved $new_ft<br>";
    };
}

$new_ft = 'tr_photo';
$new_dir = MODX_BASE_PATH."files/{$new_ft}/";
if (!is_dir($new_dir)) mkdir($new_dir, 0755, true);

$tr = array();
foreach($modx->getCollection('idTrainer') as $idTrainer) $tr[] = $idTrainer->get('uid');

foreach($modx->getCollection('idFiles', array('uid:IN' => $tr, 'filetype' => 'photo')) as $idFile) {
    $file = MODX_BASE_PATH."files/{$idFile->filetype}/{$idFile->key}.{$idFile->fileext}";
    $file_new = MODX_BASE_PATH."files/{$new_ft}/{$idFile->key}.{$idFile->fileext}";
    if (rename ($file, $file_new)) {
        $idFile->set('filetype', $new_ft);
        $idFile->save();
        echo "moved $new_ft<br>";
    };
}