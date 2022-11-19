<?php  return '$res = $modx->resource;
$start = \'\'; $bottom = \'\'; $app = array(
    \'club_id\' => $res->get(\'club_id\'),
    \'club_city\' => $_SESSION[\'club_city\'],
);
if (defined(\'CRM_PREFIX\') && !empty($res->get(\'template\'))) {
    //$modx->log(modX::LOG_LEVEL_ERROR,"Log2 ".json_encode($res->toArray(), JSON_UNESCAPED_UNICODE));

    $cfg = clubConfig(\'StartupHTMLBlock,BottomHTMLBlock\'); //grid_rows
    $start = $cfg[\'StartupHTMLBlock\'];
    $bottom = $cfg[\'BottomHTMLBlock\'];
    //$app[\'res\'] = $res->toArray(\'\',false,false,true);
    //$app[\'res\'][\'content\'] = null;

    $app[\'ugroups\'] = $ugroups = $modx->getOption(\'scrm_ugroups\');
    if (!empty($ugroups)){
        $app[\'is_crew\'] = isCrew();
    }
    
    $club_modules = $modx->getOption(\'club_modules\');
    $clubStatus = getClubStatus(array(
        \'tbl\' => \'idModule\',
        \'cls:IN\' => $club_modules,
    )); //idPermission
    
    //$bottom .= \'111\'.json_encode($club_modules);
    $userID = $modx->scrm->user;
    $load_modules = array();
    $pathReplace1 = array(\'{crm}\',\'{modules}\',\'{vers}\',\'{user}\', \'{prugv}\');
    $pathReplace2 = array(
        CRM_URL,
        \'/handlers/modules/\',
        \'v=\'.$modx->getOption(\'vers\'),
        $userID,
        $modx->getOption(\'scrm_prugv\'),
    );
    
    foreach($clubStatus as $rowMod) {
        if ($rowMod[\'tbl\'] != \'idModule\') continue;
        $ext = $rowMod[\'extended\'];
        //if (!in_array($rowMod[\'cls\'], $club_modules)) continue;
        if (!empty($ext[\'group\'])) {
            if (empty($ugroups)) continue;
            $check_groups = array_merge(array(\'all\'), $ugroups);
            if (empty(array_intersect(explode(\',\', $ext[\'group\']), $check_groups))) continue;
        }
        if (!empty($ext[\'club_id\']) && !in_array($app[\'club_id\'], explode(\',\', $ext[\'club_id\']))) continue;
        if (!empty($ext[\'script\'])) {
            $bottom .= \'<script src="\'. str_replace($pathReplace1, $pathReplace2, $ext[\'script\']) .\'"></script>\';
        }
        if (!empty($ext[\'load\'])) {
            $load_modules[] = str_replace($pathReplace1, $pathReplace2, $ext[\'load\']);
        }
    }
    if (!empty($load_modules)) {
        $bottom .= \'<script>$(function(){SCRM.loadSeries(\'.json_encode($load_modules).\');});</script>\';
    }

    foreach (glob(CRM_START.\'load.php\', GLOB_BRACE) as $data_handler) require($data_handler);
}

$modx->setPlaceholders(array(
    \'StartupHTMLBlock\' => \'<script>$.extend(SCRM.app, \'. json_encode($app) .\');</script>\'.PHP_EOL.$start,
    \'BottomHTMLBlock\' => $bottom,
));
return;
';