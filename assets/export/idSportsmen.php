<?php

$flds = $modx->getFieldMeta('idSportsmen');
foreach($flds as $fkey => $fld) {
    if (!empty($data[$fkey])) {
        if ($fld['dbtype'] == 'date') {
            $data[$fkey] = date('d.m.Y', strtotime($data[$fkey]));
        }
        if (in_array($fld['dbtype'], ['timestamp','datetime'])) {
            $data[$fkey] = date('d.m.Y H:i', strtotime($data[$fkey]));
        }
    }
}

$Doc->setValues($data);