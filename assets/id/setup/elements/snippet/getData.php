$rq = explode('/', $modx->getOption('data', $scriptProperties, ''));
array_unshift($rq, 'data');

include_once(CRM_PATH.'club_data.php');
return empty($json)? '' : json_encode($json, JSON_UNESCAPED_UNICODE);