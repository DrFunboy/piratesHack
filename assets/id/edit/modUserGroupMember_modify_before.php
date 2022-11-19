<?php
//error_reporting(E_ALL & ~E_NOTICE);

if ($oper == 'edit') {
    $out['error'] = 'Can`t edit';
    $oper = null;
} else {
    $groups = array( );
    foreach(getClubStatus('idPermission') as $perm){
        $groups[ $perm['alias'] ] = $perm['menuindex'];
    }
    
    if (empty($data['id']) || !isset($groups[ $data['id'] ])) {
        $out['error']  = 'Wrong group';
    } else {
        $gr = $modx->getObject('modUserGroup', array('name' => $data['id']));
        $row = $modx->getObject('modUserGroupMember', array(
            'user_group' => $gr->get('id'),
            'member' => $data['member'],
        ));
        if ($oper=='add') {
            if (empty($row)) {
                $data['user_group'] = $gr->get('id');
                $data['rank'] = $groups[ $data['id'] ];
            } else {
                $oper = null;
                $out['error'] = 'Already exists';
            }
        }
        // if ($oper=='del' && !empty($row))
        // будет удален
    }
}