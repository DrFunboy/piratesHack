<?php

/*if ($oper == 'add') {
    if (empty($up_file)) die('Empty file');
    
    $data['key'] = uniqid(substr(CRM_PREFIX, 0, 5), true);
}*/

if ($oper == 'del') {
    $ugroups = $modx->user->getUserGroupNames();
    if (!in_array('idAdmin', $ugroups)) die('Only Admin');
    
    require_once(CRM_PATH.'club_cloud.php');
    $w_del = array(
        'id:IN' => $ids,
    );
    
    $del_id = array();
    foreach ($modx->getCollection($table, $w_del) as $delFile) {
        $del_id[] = clubDelFile($delFile, $s3Client);
    }
    $data['id'] = implode(',', $del_id);
}