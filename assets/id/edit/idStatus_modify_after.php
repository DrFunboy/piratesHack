<?php
$modx->cacheManager->delete(CRM_PREFIX .'/clubStatus/');

// если пользовательская группа, создать ее?
if (in_array($oper, ['add','edit']) && $data['tbl']=='idPermission') {
    $wPermission = array('name' => $data['alias']);
    if (!($rowPermission = $modx->getObject('modUserGroup', $wPermission))) {
        $rowPermission = $modx->newObject('modUserGroup', $wPermission);
        $rowPermission->save();
        $rg = $modx->getObject('modResourceGroup', array(
            'name' => 'idLoggedUsers',
        ));
        if (!empty($rg)) {
            $arg = $modx->newObject('modAccessResourceGroup', array(
                "target" => $rg->get('id'),
                "principal" => $rowPermission->get('id'),
                "principal_class" => "modUserGroup",
                "policy" => 1,
                "context_key" => "web",
            ));
            //$rg->addOne($arg); //Acls
            //$rg->save();
            $arg->save();
        }
    }
}

if ($oper=='add' && $data['tbl']=='idPayMethod' && !empty($data['idExtid'])) {
    $d_idExtid = explode(':', $data['idExtid']);
    setClubExtId(array(
        'parent' => $d_idExtid[1],
        'extid' => $row->get('id'),
    ), $d_idExtid[0]);
}
    