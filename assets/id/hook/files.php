<?php

$uid = $modx->getOption('uid', $scriptProperties, $_REQUEST['uid']);
$filter = $modx->getOption('filter', $scriptProperties, $_REQUEST['filter']);
$cls = $modx->getOption('cls', $scriptProperties, $_REQUEST['cls']);
$thumb = $modx->getOption('thumb', $scriptProperties, $_REQUEST['thumb']);

$fullperm = array(
    'idAdmin' => 'list,add,edit,modify',
    'idManager' => 'list,add,edit', // Может перенести в настройки
);

$ugroups = $modx->getOption('scrm_ugroups');
$ugroups[] = 'all';
$filetypes = array();
foreach (getClubStatus('idFileType') as $fkey => $fval) {
    if (!empty($cls) && $fval['cls'] != $cls) continue;
    
    $fval['extended'] = $ft_ext = array_merge($fullperm, (array)$fval['extended']); // Добавляет в каждый тип полные разрешения
    $user_perms = array_intersect($ugroups, array_keys($ft_ext)); // смотрит какие разрешения пересекаются с файлом
    if (empty($user_perms)) continue;

    $perm = array();
    foreach($user_perms as $uperm) {
        foreach(explode(',', $ft_ext[$uperm]) as $p) {
            $perm[] = $p;
        }
    }
    if (empty($perm)) continue;

    $fval['permis'] = array_values(array_unique($perm));
    $fval['thumb'] = $ft_ext['thumb'];
    $filetypes[ $fval['alias'] ] = $fval;
}

$json = array(
    'postData' => array(
        'fid' => $modx->getOption('fid', $scriptProperties, $_REQUEST['fid'])?: $uid,
        'uid' => $uid,
        'filter' => $filter,
        'cls' => $cls,
        'thumb' => $thumb,
    ),
    'rows' => array(),
    'error' => '',
    'filetypes' => $filetypes,
);

$scrmFiles = $modx->getService('scrmfiles', 'scrmFiles', CRM_PATH);

if (!empty($uid)) {
    //if (!empty($thumb)) include_once(CRM_PATH.'club_thumb.php');

    $oper = $_REQUEST['oper'];
    $newCloud = array();
    
    if (!empty($oper)) {
        $filetype = $modx->getOption('filetype', $_REQUEST, 'file', true);

        if ($oper=='del'){
            $delFile = $modx->getObject('idFiles', array(
                'key' => $_REQUEST['fkey'],
            ));
            if (!empty($delFile)) $filetype = $delFile->get('filetype');
        }

        if ($oper=='modify') {
            $delFile = $modx->getObject('idFiles', array(
                'uid' => $uid,
                'filetype' => $filetype,
            ));
        }
        
        $oper_ft = $filetypes[ $filetype ];
        $oper_permis = empty($oper_ft)? [ ] : $oper_ft['permis'];
        
        if (!empty($delFile) && !empty(array_intersect(['edit','modify'], $oper_permis))){
            $del_id = $scrmFiles->delFile($delFile);
            if (!$del_id) {
                $json['error'] = "Error deleting file {$delFile->name};";
            } else {
                $delFile->remove();
            }
        }


        if (in_array($oper, ['add','modify']) && !empty($_FILES) && in_array($oper, $oper_permis)) {
            foreach($_FILES as $file) {
                $outPut = $scrmFiles->putFile($file, $uid, $filetype, $oper_ft['extended']);
                if (!$outPut['error']){
                    $newCloud[$outPut['idFile']->get('key')] = true;
                } else {
                    $json['error'] .= $outPut['error'];
                }
            }
        }
    } // if oper

    $w = array(
        'filetype:IN' => array_keys($filetypes),
    );
    clubWhereIN($w, $uid, 'uid');
    if (!empty($filter)) $w['filetype'] = $filter; //TODO: Возможно исправить

    $wq = $modx->newQuery('idFiles', $w);
    $wq->leftJoin('idStatus', 'ft', "(ft.alias = idFiles.filetype AND ft.tbl = 'idFileType' AND ft.published=1)");
    $wq->select(array(
        'idFiles.*',
        'ft.name as filetype_name',
    ));
    
    foreach ($modx->getIterator('idFiles', $wq) as $idF => $idFile) {
        $rowFile = $idFile->toArray();
        $ft = $filetypes[ $rowFile['filetype'] ];
        //if (empty($ft)) continue; // перенесено в SQL
        $ft_permis = $ft['permis'];
        if (empty($ft_permis) || !in_array('list', $ft_permis)) continue;
        $rowFile['permis'] = $ft_permis;
        
        $rowFile['filepath'] = $scrmFiles->fileUrl($rowFile);
        if (!empty($thumb) && !empty($ft['thumb'])) {
            foreach($ft['thumb'] as $size) {
                $rowFile[ $size ] = $scrmFiles->fileUrl($rowFile, $size);
            }
            //getClubThumb($photo['file'], 'thumb', $json['gender']);
        }
        $rowFile['newCloud'] = $newCloud[ $rowFile['key'] ];
        $json['rows'][] = $rowFile;
    }
}

if ($rq[2] == 'cron') {
    ignore_user_abort(true);
    set_time_limit(0);
    
    setClubConfig('filecloud', 1);

    if (!$scrmFiles->getS3()) dieJSON('Can`t connect to S3');

    $cloud_ft = array();
    foreach($filetypes as $ft_key => $ft) {
        if (!$ft['extended']['nocloud']) $cloud_ft[] = $ft_key;
    }
    $json = array(
        'filecnt' => 0,
        'cloud_ft' => $cloud_ft,
    );

    $query = $modx->newQuery('idFiles', array(
        'incloud' => 0,
        'filetype:IN' => $cloud_ft,
    ));
    $query->limit(200);
    foreach ($modx->getIterator('idFiles', $query) as $file) {
        $filePath = "{$file->filetype}/{$file->key}.{$file->fileext}";
        if ($scrmFiles->putS3(CRM_FILES.$filePath, $filePath)) {
            $file->set('incloud', 1);
            if ($file->save() == true) {
               unlink(CRM_FILES.$filePath);
               $json['filecnt']++;
            }
        }
    }
}
