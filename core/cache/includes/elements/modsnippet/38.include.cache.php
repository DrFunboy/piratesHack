<?php
$json = clubConfig($name);

if (!empty($mode) && $mode = 'setPlaceholders') {
    $modx->setPlaceholders($json);
    return "";
} else {
    $modx->setPlaceholder('clubConfig', $json);
}

return (sizeof($json) > 1)? json_encode($json, JSON_UNESCAPED_UNICODE) : $json[$name];
return;
