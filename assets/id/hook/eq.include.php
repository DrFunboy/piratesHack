<?php
if (empty($hook_name)) die('Empty HOOK_NAME');

define('CLUB_UNAUTH', true);
require_once(__DIR__.'/../id_init.php');

clubLog($hook_name, empty($hook_log)? $_REQUEST:$hook_log);

$paydata = getClubConfig($hook_name);
$paydata = (empty($paydata))? array() : json_decode($paydata, true);

if (!empty($hook_order)) {
    $idPay = $modx->getObject('idPay', array(
        'id' => $hook_order,
        'payd' => 0,
    ));
}