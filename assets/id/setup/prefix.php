<?php

if (!file_exists($prefixDIR)) mkdir($prefixDIR, 0755, true);

$wprefix = json_decode(file_get_contents("https://w.sportcrm.club/hook/w.prefix/{$http_host}"), true);
if (!empty($wprefix)) {
    file_put_contents($prefixFILE, "<?php
    define('CRM_PREFIX', '{$wprefix['prefix']}_');");
    include($prefixFILE);

    $w_prefixGroup = array(
        'name' => 'www_'.$wprefix['prefix'],
    );
    if (($prefixGroup = $modx->getObject('modUserGroup', $w_prefixGroup)) == null) {
        $prefixGroup = $modx->newObject('modUserGroup', $w_prefixGroup);
        $prefixGroup->save();
    }
    if ($wprefix['manager']) {
        $managerUser = $modx->getObject('modUser', array('username' => $wprefix['manager']));
        if (!empty($managerUser)) {
            $managerUser->joinGroup($prefixGroup->get('id'), 'Member', 110);
        }
    }
}
