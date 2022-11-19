<?php
$incloud = getClubConfig('filecloud'); // пока непонятно что там хранить
if ($incloud) {
    require_once(CRM_PATH.'vendor/autoload.php');
    try {
        $S3cfg = array(
            "key" => "qNE6IX8R4VRST5IMogSK",
            "secret" => "lkWpY-Ds5J8wH2r1JORIfYnafEMPBqrOZMiXtKWC",
            //"bucket" => "scrm"
        );
        $sdk = new Aws\Sdk(array(
            'credentials' => $S3cfg,
            'version' => 'latest',
            'endpoint' => 'https://storage.yandexcloud.net',
            'region' => 'ru-central1',
        ));
        $s3Client = $sdk->createS3();
    } catch (Exception $e) {
        //$json["error"] = "Не удалось подключиться к облаку, файлы будут сохранены локально"; club_log(e->getMessage());
    }
}

function clubDelFile($delFile, $s3Client) {
    $delPath = "{$delFile->filetype}/{$delFile->key}.{$delFile->fileext}"; //CRM_FILES
    
    if (!is_null($s3Client) && $delFile->incloud ) {
        $delPath = "{$_SERVER['HTTP_HOST']}/$delPath";
        try {
            $s3Client->deleteObject(array(
                'Bucket' => SCRMBUCKET,
            	'Key'    => $delPath,
            ));
            return $delFile->get('id');
        } catch(Aws\S3\Exception\S3Exception $e) {
            clubLog('delS3File', $e);
        }
    } else {
        $delPath = CRM_FILES.$delPath;
        if (!file_exists($delPath) || unlink($delPath) === true) {
            return $delFile->get('id');
        }
    }
}

function clubPutFile($file, $filePath, $s3Client) {
    $result = $s3Client->putObject(array(
        'Bucket' => SCRMBUCKET,
        'Key'    => "{$_SERVER['HTTP_HOST']}/$filePath",
        'SourceFile' => $file,
        //'Body'   => $fileBody
    ));
    return $result['ETag'] == '"'.md5_file($file).'"';
}
