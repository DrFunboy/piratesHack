<?php
foreach ($data as $data_key => $data_value) {
    //$modx->log(modX::LOG_LEVEL_ERROR, "RRR $data_key");
    $a_data_key = explode('_', $data_key);
    if ($a_data_key[0] == 'tv') {
        array_shift($a_data_key);
        $data_key = implode('_', $a_data_key);
        $row->setTVValue($data_key, $data_value);
    }
}