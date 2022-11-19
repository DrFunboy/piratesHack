<?php
$thumbDir = '_thumb';
$thumbSizes = [
    "sm" => array(
        'f' => 'jpeg',
        'q' => 80,
        'w' => 400,
        'h' => 400,
        'zc' => 'C',
        'ar' => 'x'
    ),
    "md" => array(
        'f' => 'jpeg',
        'q' => 75,
        'w' => 700,
        'ar' => 'x'
    ),
    "logo" => array(
        'f' => 'jpeg',
        'q' => 100,
        'wl' => 350,
        'hp' => 270,
        'hs' => 300
    ),
];

if ($rq[1] == $thumbDir) {
    $dir = CRM_FILES."{$thumbDir}/{$rq[2]}/";
    if (!is_dir($dir) && !mkdir($dir, 0755, true)) {
        dieJSON("Error creating folder {$dir}");
    } else {
        $pinfo = pathinfo($rq[3]);
        //$basename = $pinfo['basename'];
        $pfile = explode('.', $pinfo['filename']);
        $fsize = array_pop($pfile);
        
        //$ftype = array_shift($pfile);
        
        $fkey = implode('.', $pfile);
        //$src = CRM_FILES."{$ftype}/{$fkey}.".$pinfo['extension'];
        //if (!file_exists($src)) dieJSON("File not exists {$src}");
        
        if (!$thumbSizes[$fsize]) dieJSON("Wrong size {$fsize}");
        $phpThumb = $modx->getService('modphpthumb','modPhpThumb', MODX_CORE_PATH . 'model/phpthumb/', array());
        $src = CRM_FILES."{$rq[2]}/".implode('.', $pfile);
        if (file_exists($src)) {
            $phpThumb->setSourceFilename($src);
            foreach ($thumbSizes[$fsize] as $k => $v) {
                $phpThumb->setParameter($k, $v);
            }
    
            // Генерируем уменьшенную копию
            if ($phpThumb->GenerateThumbnail()) {
                // Сохраняем в файл
                $dst = $dir.$rq[3];
                if (!$phpThumb->renderToFile($dst)) {
                    clubLog('phpThumbRenderToFile', "Could not save rendered image to {$dst}");
            	}
            	// Выводим готовое изображение сразу на экран
            	$phpThumb->OutputThumbnail();
            } else {
                clubLog('phpThumbGenerateThumbnail', $phpThumb->debugmessages);
            	// Если возникла ошибка - пишем лог работы в журнал MODX
            	//print_r($phpThumb->debugmessages, 1);
            }
        }
    }
}
