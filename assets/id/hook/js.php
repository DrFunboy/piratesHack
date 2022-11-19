<?php

$ugroups = $modx->getOption('scrm_ugroups');
$js = $rq[sizeof($rq)-1];

if ($js == 'start.js') {
    readfile(CRM_PATH.'wss/start.js');
    echo "window.club_city = '{$_SESSION['club_city']}';
        SCRM.vers = '{$modx->getOption('vers')}';
        SCRM.url = '".CRM_URL."';";
    if (!empty($userID)) {
        $SCRM = array();
        $SCRM['app']['user'] = $modx->user->getOne('Profile')->toArray();
        $isCrew = isCrew();
        if ($isCrew) {
            $cfg = clubConfig('grid_rows');
            $SCRM['grid_rows'] = $cfg['grid_rows'];
            $SCRM['dataUrl'] = CRM_URL.'id_data.php';
            $SCRM['editUrl'] = '/hook/dbedit';
            
        }
        echo '$.extend(true, SCRM, '.json_encode($SCRM).');'.PHP_EOL;
    }
    readfile(CRM_PATH.'wss/start_old.js');

    $mode = $modx->getOption('mode', $_REQUEST, 'site');
    if ($mode=='frame') readfile(CRM_PATH.'wss/iframe.js');
    if ($mode=='site') {
        if (!empty($isCrew)) {
            readfile(CRM_PATH.'wss/chat_tech.js');
        }
        readfile(CRM_PATH.'wss/site4.js');
    }
} elseif ($js == 'admin.js'||$js == 'admin.json') {
    if (in_array('idAdmin', $ugroups)) {
        readfile(CRM_PATH.'wss/hook/admin.js');
        $club_modules = $modx->getOption('club_modules');
        if (in_array('clubSAAS', $club_modules)) {
            echo clubTmpl(file_get_contents(CRM_PATH.'wss/hook/saas.js'));
        }
    }
} else {
    $chunkHtml = getClubConfig($js.'HTMLBlock');
    if (!empty($chunkHtml)) echo clubTmpl($chunkHtml, array());
}

$seconds_to_cache = 3600*24*4; // 4 дней
$ts = gmdate("D, d M Y H:i:s", time() + $seconds_to_cache) . " GMT";
header("Expires: $ts");
header("Pragma: cache");
header("Cache-Control: max-age=$seconds_to_cache");
header("Content-type: text/javascript");
