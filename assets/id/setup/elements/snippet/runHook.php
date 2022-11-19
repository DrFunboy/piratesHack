# включение хуков во время исполнения, полная версия в плагине clubPackage

$runHook = $modx->getOption('hook', $scriptProperties, null);
$rq = explode('/', $runHook);
include(CRM_PATH.'hook.php');