<?php
require(CRM_PATH.'hook/files.php');

$modx->setPlaceholder('clubFiles', $json);
return json_encode($json, JSON_UNESCAPED_UNICODE);
return;
