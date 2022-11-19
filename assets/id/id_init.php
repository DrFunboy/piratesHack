<?php

if (!defined('MODX_API_MODE')) {
    define('MODX_API_MODE', true);
    require_once($_SERVER['DOCUMENT_ROOT'].'/config.core.php');
    require_once(MODX_CORE_PATH.'model/modx/modx.class.php');

    $modx = new modX();
    $modx->initialize('web');
}

$userID = $modx->getLoginUserID();
if (empty($userID) && !defined('CLUB_UNAUTH')) dieJSON('Forbidden', 403);

if (!empty($_REQUEST['d1'])) {
    $d1 = (new DateTime($_REQUEST['d1']))->format('Y-m-d 00:00:00');
    if (!empty($_REQUEST['d2'])) $d2 = (new DateTime($_REQUEST['d2']))->format('Y-m-d 23:59:59');
}
