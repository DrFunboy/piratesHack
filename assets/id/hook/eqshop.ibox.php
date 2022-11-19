<?php
$hook_name = 'eq.ibox';

if (empty($modx) && !empty($_REQUEST['sign'])) {
    require_once('eq.include.php');

    $oPack = $modx->getObject('idOrderPack', $_REQUEST['participantOrderId']);
    if (!empty($oPack)) {
        $ext = $oPack->get('extended');
        if (empty($ext['cb'])) $ext['cb'] = array();
        $ext['cb'][] = $_REQUEST;
        $oPack->set('extended', $ext);
        
        $oi = $modx->getCollection('idOrderItems', array('orderpack' => $oPack->get('id')));
        $total = 0;
        foreach ($oi as $oi_row) {
            $total += $oi_row->get('total');
        }
        
        $eq_total = $_REQUEST['amount']*1;
        if ($total == $eq_total) {
            $oPack->set('datepay', $_REQUEST['time']);
            foreach ($oi as $oi_row) {
                $oi_row->set('status', 'payd');
                $oi_row->save();
            }
        }
        $oPack->save();
        echo "OK";
    }
}
