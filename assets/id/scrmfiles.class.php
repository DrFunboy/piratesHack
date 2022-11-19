<?php

class scrmFiles {
    public $modx;
    public $incloud = null;
    public $s3Client = null;
    
    private $S3cfg = array(
        'key' => 'qNE6IX8R4VRST5IMogSK',
        'secret' => 'lkWpY-Ds5J8wH2r1JORIfYnafEMPBqrOZMiXtKWC',
        'bucket' => 'scrm',
        'url' => 'https://scrm.website.yandexcloud.net/'
    );

    function __construct(modX &$modx, array $config = array()) {
        $this->modx =& $modx;

        $this->S3cfg = array_merge($this->S3cfg, $config);
    }
    
    function getS3() {
        if (!isset($this->incloud)) {
            $this->incloud = false;
            if (getClubConfig('filecloud')) {
                require_once(CRM_PATH.'vendor/autoload.php');
                try {
                    $sdk = new Aws\Sdk(array(
                        'credentials' => $this->S3cfg,
                        'version'     => 'latest',
                        'endpoint'    => 'https://storage.yandexcloud.net',
                        'region'      => 'ru-central1',
                    ));
                    $this->s3Client = $sdk->createS3();
                    $this->incloud = true;
                } catch (Exception $e) {
                    //$json["error"] = "Не удалось подключиться к облаку, файлы будут сохранены локально"; club_log(e->getMessage());
                }
            }
        }
        return $this->incloud;
    }
    
    function delFile($delFile) {
        $delPath = "{$delFile->filetype}/{$delFile->key}.{$delFile->fileext}"; //CRM_FILES
        
        if ($this->getS3() && $delFile->incloud) {
            $delPath = "{$_SERVER['HTTP_HOST']}/$delPath";
            try {
                $this->s3Client->deleteObject(array(
                    'Bucket' => $this->S3cfg['bucket'],
                	'Key'    => $delPath,
                ));
                return $delFile->get('id');
            } catch(Aws\S3\Exception\S3Exception $e) {
                clubLog('delS3File', $e);
            }
        } else {
            $delPath = CRM_FILES . $delPath;
            if (!file_exists($delPath) || unlink($delPath) === true) {
                return $delFile->get('id');
            }
        }
    }
    
    function putS3($src_path, $filePath) {
        $result = $this->s3Client->putObject(array(
            'Bucket'     => $this->S3cfg['bucket'],
            'Key'        => "{$_SERVER['HTTP_HOST']}/$filePath",
            'SourceFile' => $src_path,
            //'Body'   => $fileBody
        ));
        return $result['ETag'] == '"'.md5_file($src_path).'"';
    }
    
    function putFile($file, $uid, $filetype = 'file', $params = array()) {
        $out = array(
            'error' => ''
        );
        /*if (gettype($file) == 'string') { // чаще это $_FILES массив
            $file = array(
                'name' => $file,
            )
        }*/

        $path = pathinfo($file["name"]);
        $extension = strtolower($path['extension']);
        if ($extension == 'php') die('PHP upload');
        $src_path = $file['tmp_name'];
        
        $fileKey = uniqid(substr(CRM_PREFIX, 0, 5), true);
        $filePath = "{$filetype}/{$fileKey}.{$extension}";
        $out['idFile'] = $idFile = $this->modx->newObject('idFiles', array(
            'uid' => $uid,
            'key' => $fileKey,
            'fileext' => $extension,
            'filetype' => $filetype,
            'author' => $this->modx->getLoginUserID(),
            'name' => $this->modx->getOption('filename', $_REQUEST, $path['filename'], true),
        ));
        
        if ($this->getS3() && !$params['nocloud']) {
            if ($this->putS3($src_path, $filePath)) {
                $idFile->set('incloud', 1);
                $idFile->save();
                //$newCloud[$fileKey] = true;
            } else {
                $out['error'] .= "Error uploading file {$filePath}; ";
            }
        } else {
            $dir = CRM_FILES.$filetype.'/';
            $filePath = CRM_FILES.$filePath;
            if (!is_dir($dir) && !mkdir($dir, 0755, true)){
                $json['error'] .= "Error creating folder {$dir}";
            } elseif (move_uploaded_file($src_path, $filePath)) {
                $idFile->save();
                if ($uid=='logoClub') {
                    setClubConfig('club_logo', $this->fileUrl($idFile->toArray(), 'logo'));
                }
            } else {
                $out['error'] .= "Error uploading file {$filePath};";
            }
        }
        return $out;
    }
    
    function fileUrl($rowFile, $thumb = '') {
        //https://scrm.website.yandexcloud.net/_thumb/dev.sportcrm.club/photo/5b60cc8226841.jpg.sm.jpeg
    
        $fprefix = $rowFile['incloud']? $this->S3cfg['url'] : '/files/';
        $filePath = $rowFile['filetype']."/{$rowFile['key']}.{$rowFile['fileext']}";
        if ($thumb) {
            $fprefix .= '_thumb/';
            $filePath .= ".{$thumb}.jpeg";
        }
        if ($rowFile['incloud']) $fprefix .= "{$_SERVER['HTTP_HOST']}/";
        
        return $fprefix.$filePath;
    }
    
    function fileUrlFromString($fileString, $fileType = 'photo', $size = 'sm') {
        $path = explode('.', $fileString);
        $v = array(
            'incloud' => array_pop($path),
            'fileext' => array_pop($path),
            'key' => implode('.', $path),
            'filetype' => $fileType,
        );
        return $this->fileUrl($v, $size);
    }
    
    function emptyImg($gender = '', $site_url = false) {
        $img = "images/no-image{$gender}.png";
        return ($site_url? $this->modx->getOption('site_url') : CRM_PATH) . $img;
    }
}

// https://modx.pro/development/22496
