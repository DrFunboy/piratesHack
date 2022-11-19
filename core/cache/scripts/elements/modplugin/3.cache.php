<?php  return '/*ini_set(\'error_reporting\', E_ALL);
ini_set(\'display_errors\', 1);
ini_set(\'display_startup_errors\', 1);*/

define(\'CRM_PATH\', MODX_ASSETS_PATH.\'id/\');
define(\'CRM_URL\', MODX_ASSETS_URL.\'id/\');
define(\'CRM_FILES\', MODX_BASE_PATH.\'files/\');

define(\'CRMTOOLS_PATH\', MODX_ASSETS_PATH.\'clubtools/\');
define(\'CRMTOOLS_URL\', MODX_ASSETS_URL.\'clubtools/\');
define(\'CRM_LOGS\', MODX_ASSETS_PATH.\'scrm_log/\');
        
//$modx->loadClass(\'modResource\'); // здесь потому что при сохранении в mgr 
$modx->map[\'modResource\'][\'fields\'][\'club_id\'] = 0;
$modx->map[\'modResource\'][\'fieldMeta\'][\'club_id\'] = array(
	\'dbtype\' => \'int\',
	\'phptype\' => \'integer\',
	\'null\' => false,
	\'default\' => 0,
);

if ($modx->context->key == \'web\') {
    $scrm = $modx->getService(\'scrm\', \'SCRM\', CRM_PATH);
    $userID = $scrm->user; // TODO: Удалить

    $cache_path = CRM_PREFIX.\'/clubConfig/init\';
    $club_opts = $modx->cacheManager->get($cache_path);
    if (empty($club_opts)) {
        $club_opts = clubConfig(\'site_name,site_fullname,club_key,club_logo,club_modules,https,dbXML\', 0, 1);
        if (!$club_opts[\'club_logo\']) {
            $club_opts[\'club_logo\'] = CRM_URL.\'images/sportcrm_logo.png\';
        }

        $club_opts[\'club_modules\'] = empty($club_opts[\'club_modules\'])? array() : explode(\',\', $club_opts[\'club_modules\']);
        array_unshift($club_opts[\'club_modules\'], \'clubStuff\', CRM_PREFIX);
        $club_opts[\'crm_url\'] = CRM_URL;
        $club_opts[\'crmtools_url\'] = CRMTOOLS_URL;
        $modx->cacheManager->set($cache_path, $club_opts, 86400*3); // 3 дней
    }
    
    if ($club_opts[\'dbXML\']) $scrm->dbLoad();
    

    if (!empty($club_opts[\'https\'])) {
    ## Иногда, особенно на sweb надо добавлять в конфиг
    ## $isSecureRequest = ((isset($_SERVER[\'HTTPS\']) && !empty($_SERVER[\'HTTPS\']) && strtolower($_SERVER[\'HTTPS\']) !== \'off\') || $_SERVER[\'SERVER_PORT\'] == $https_port || (isset($_SERVER[\'HTTP_X_FORWARDED_PROTO\']) && $_SERVER[\'HTTP_X_FORWARDED_PROTO\'] === \'https\'));
        
        $isHttps = (isset($_SERVER[\'HTTPS\']) && $_SERVER[\'HTTPS\'] === \'on\')
        || (isset($_SERVER[\'REQUEST_SCHEME\']) && $_SERVER[\'REQUEST_SCHEME\'] === \'https\')
        || (isset($_SERVER[\'HTTP_X_FORWARDED_PROTO\']) && $_SERVER[\'HTTP_X_FORWARDED_PROTO\'] === \'https\');
        if (!$isHttps) {
            $modx->sendRedirect(\'https://\'.$_SERVER[\'HTTP_HOST\'].$_SERVER[\'REQUEST_URI\'], array(
                \'responseCode\' => \'HTTP/1.1 301 Moved Permanently\')
            );
        } else {
            //$modx->setOption(\'site_url\', \'https://\'.$_SERVER[\'HTTP_HOST\']);
            $modx->setOption(\'server_protocol\', \'https\');
        }
    }
    
    $club_opts[\'club_name\'] = $club_opts[\'site_name\']; // TODO: Надо ли?
    $club_opts[\'scrm_ugroups\'] = $userGroups = $scrm->userGroups;
    $club_opts[\'scrm_grhash\'] = empty($scrm->userGroups)? \'empty\' : cacheHash($scrm->userGroups);
    $club_opts[\'scrm_prugv\'] = cacheHash([ CRM_PREFIX, $scrm->user, $_SESSION[\'scrm_thislogin\'], $modx->getOption(\'vers\') ]);
    
    foreach($club_opts as $okey => $oval) {
        $modx->setOption($okey, $oval);
    }
    $club_opts[\'site_url\'] = $modx->getOption(\'site_url\');
    $modx->setPlaceholders($club_opts, \'+\');
    
    $rq = explode(\'/\', $_REQUEST[\'q\']);
    
    $club_modules = implode(\',\', $club_opts[\'club_modules\']);
    define(\'CRM_START\', \'{\'. implode(\',\', [CRMTOOLS_PATH, CRM_PATH]) .\'}start/{\'. $club_modules .\'}_\');
    foreach (glob(CRM_START.\'init.php\', GLOB_BRACE) as $data_handler) require($data_handler);

    include(CRM_PATH.\'hook.php\');
}
return;
';