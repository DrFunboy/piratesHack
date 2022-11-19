<?php
$hook_name = 'eq.tinkoff';

if (empty($modx)) {
    // {"TerminalKey":"1571913858776DEMO","OrderId":"43","Success":true,"Status":"CONFIRMED","PaymentId":134124080,"ErrorCode":"0","Amount":30000,"CardId":24066027,"Pan":"430000******0777","ExpDate":"1122","Token":"011a2bc6254f1413e3f5e35b290685be31940aaf286f9351b91a3c8fd6eb9287"}
    
    $hook_log = file_get_contents('php://input');
    if (!empty($hook_log)) {
        require_once('eq.include.php');
        
        $result = json_decode($hook_log, true);
        if ($result['Status']=='CONFIRMED') {
            $oPack = $modx->getObject('idOrderPack', $result['OrderId']);
            if (!empty($oPack)) {
                $ext = $oPack->get('extended');
                if (empty($ext['cb'])) $ext['cb'] = array();
                $ext['cb'][] = $result;
                $oPack->set('extended', $ext);
                
                $oi = $modx->getCollection('idOrderItems', array('orderpack' => $oPack->get('id')));
                $total = 0;
                foreach ($oi as $oi_row) {
                    $total += $oi_row->get('total');
                }
                
                $eq_total = $result['Amount'] / 100;
                if ($total == $eq_total) {
                    $oPack->set('datepay', date('c'));
                    foreach ($oi as $oi_row) {
                        $oi_row->set('status', 'payd');
                        $oi_row->save();
                    }
                }
                $oPack->save();
            }
        }
        echo "OK";
    }
}
