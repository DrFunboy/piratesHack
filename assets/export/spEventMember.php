<?php

$cnt = sizeof($data['rows']);
if ($cnt > 0) {
    $idEvent = $modx->getObject('idEvent', $data['rows'][0]['idevent']);
    if (!empty($idEvent)) {
        $Doc->setValue('idEvent_name', $idEvent->get('name'));
        $Doc->setValue('idEvent_place', $idEvent->get('place'));
        $Doc->setValue('idEvent_datestart', (new DateTime( $idEvent->get('datestart') ))->format('d.m.Y'));
        $Doc->setValue('idEvent_dateend', (new DateTime( $idEvent->get('dateend') ))->format('d.m.Y'));
    }

    $Doc->cloneRow('row', $cnt);
    $rn = 1;
    foreach($data['rows'] as $row) {
        $row['row'] = $rn;
        foreach ($row as $key => $val) {
            if ($key == 'birth' && !empty($val)) {
                $val = (new DateTime($val))->format('d.m.Y');
            }
            $Doc->setValue($key.'#'.$rn, $val, 1);
        }
        $rn++;
    }
}
