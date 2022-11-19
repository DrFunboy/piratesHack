<?php

$hooks = array(
    'hook' => "hook/{$rq[1]}.php",
    'pay' => 'hook/pay.php',
    'paycb' => 'hook/pay.php',
    'js' => 'hook/js.php',
    'data' => 'club_data.php',
    'report' => "report/{$rq[1]}.php",
    'chunk' => 'hook/chunk.php',
    'eform' => 'hook/eform.php',
    'welcome' => 'hook/page.php',
    'setup' => 'setup/hook.php',
    'files' => 'hook/thumb.php',
);
if ($hook_file = $modx->scrm->sysFilePath( $hooks[ $rq[0] ] )) {
    include($hook_file);
    if (isset($json)) {
        echo(json_encode($json, JSON_UNESCAPED_UNICODE));
    }
    if (empty($runHook)) die;
}