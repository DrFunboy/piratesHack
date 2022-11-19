if (!empty($unauth)) define('CLUB_UNAUTH', true);

$rq = array_merge($_REQUEST, $scriptProperties);
//$rq['table'] = $modx->getOption('table', $scriptProperties, $rq['table']);
require(CRM_PATH.'id_data.php');