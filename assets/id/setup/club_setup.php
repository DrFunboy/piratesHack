<?php
define('MODX_API_MODE', true);
require_once($_SERVER['DOCUMENT_ROOT'].'/config.core.php');
require_once(MODX_CORE_PATH.'model/modx/modx.class.php');
$modx = new modX();
$modx->initialize('web');

ignore_user_abort(true);
set_time_limit(0);
error_reporting(E_ALL & ~E_NOTICE);

if (!defined('CRM_PATH')) define('CRM_PATH', MODX_ASSETS_PATH.'id/');

$club_key = empty($_REQUEST['key'])? $modx->getOption('club_key') : $_REQUEST['key'];
if (empty($club_key)) die('Empty key. Exit');

$club_post = array(
    'key' => $club_key,
    'mode' => $modx->getOption('mode', $_REQUEST, 'file,res,db'),
);
$mode = explode(',', $club_post['mode']);

$ch = curl_init('https://w.sportcrm.club/assets/clubtools/getupdate.php');
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, $club_post);
        
if (in_array('file', $mode)) {
    $club_file = CRM_PATH . '../club.zip';
    $dest_file = @fopen($club_file, 'w');

    curl_setopt($ch, CURLOPT_FILE, $dest_file);
    curl_exec($ch);
    fclose($dest_file);
    
    if (filesize($club_file) > 0) {
        if ($zipClass = $modx->loadClass('compression.xPDOZip', XPDO_CORE_PATH, true, true)) {
            if ($zipStuff = new $zipClass($modx, $club_file)) {
                $result = $zipStuff->unpack(CRM_PATH);
                echo("Unpack club - " . sizeof($result));
            }
        }
    } else {
        echo("Error. FileSize {$club_file} = 0");
    }
} else {
    curl_exec($ch);
}
curl_close($ch);

$scrm = $modx->getService('scrm', 'SCRM', CRM_PATH);
$setup = $modx->getService('scrmsetup', 'SCRMsetup', __DIR__.'/');
$club_modules = $setup->club_modules;
echo "Модули";
print_r($club_modules);

$data = unserialize( file_get_contents(__DIR__ . '/clubStuff.txt') );
$site_url = $modx->getOption('site_url');

// Включение файлов db, res и т.д.
foreach($mode as $mode_item) {
    $mode_file = __DIR__ .'/club_setup_'. $mode_item .'.php';
    if (file_exists($mode_file)) {
        include_once($mode_file);
    }
}

$setup->sendStat();
$modx->reloadConfig();
if ($setup->emp_uid) {
    $modx->user->removeSessionContext('web');
}

echo "<br>Установка завершена<p><a href=\"{$site_url}\">Перейти на сайт</a></p>";
