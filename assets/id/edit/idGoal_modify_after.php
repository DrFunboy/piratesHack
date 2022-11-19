<?php

if (!empty($row)){
    $new_status = $row->get('status');
    if ($oper == 'edit' && !empty($old_data) && ($new_status != $old_data['status'])) {
        $statusObj = $modx->getObject('idStatus', $new_status);
        if (!empty($statusObj)) {
            switch ($statusObj->get('alias')) {
                case "ready":
                    $row->set('dateend', date('c'));
                break;
            }
            $row->save();
        }
    }
}
