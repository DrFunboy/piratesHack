<?php
set_time_limit(0);
$d = file_get_contents('php://input');

if (!defined('MODX_API_MODE')) {
    define('CLUB_UNAUTH', true);
    require_once(__DIR__. '/../id_init.php');
}

clubLog('1c.pays', $d);

//Авторизацию доделать
foreach(apache_request_headers() as $key => $hdr) {
//    echo "$key => $hdr \n";
}

$data = json_decode($d, true);

$log = array(
    'inn' => $data['inn'],
    'rows' => 0,
    'existpay' => 0,
    'ins_pay' => 0,
    'upd_sp' => 0,
    'nf_sp' => 0,
    'upd_sum' => 0,
    'upd_numpay' => 0,
);

$idCity = $modx->getObject('idCity', array('inn' => $data['inn']));
if (!empty($idCity)) {
    $id_city = $idCity->get('id');
    $log['id_city'] = $id_city;
    
    include_once(__DIR__.'/tools/nfpays.php'); // $nfpays_path
    clear_nfpays($nfpays_path);
    
    foreach($data['rows'] as $row) {
        $log['rows']++;
        $code1c = ($row['pay_row_cnt'] > 1)? str_replace('-', '', $row['pay_id']).$row['pay_row'] : $row['pay_id'];

        $paydata = array(
            'code1c' => $code1c,
            'sum' => $row['pay_total']*1,
            'datepay' => $row['pay_date'],
            'numpay' => trim($row['pay_number']), // Этого параметра нет
            'info' => trim($row['pay_info']),
            //'author' => $user1cID, //load1c
        );
        
        $pay_info = "{$row['pay_number']} | {$row['pay_total']} | {$row['pay_date']} | {$row['contragent_name']} | {$row['contract_number']} | {$row['pay_info']}";
        
        /*if ($paydata['sum'] < 0) {
            echo "Sum <= 0: $pay_info\n";
            continue;
        }*/
        
        $idPay = $modx->getObjectGraph('idPay', '{"idSportsmen":{}}', array('code1c' => $code1c));
        $sp_code1c = $row['contragent_id'];
        
        if (!empty($idPay)) {
            $log['existpay']++;
            if ($idPay->get('sum')*1 != $paydata['sum']) {
                $idPay->set('sum', $paydata['sum']);
                $idPay->save();
                echo "Ed. sum: {$pay_info}\n";
                $log['upd_sum']++;
            }
            if ($idPay->get('numpay') != $row['pay_number']) {
                $idPay->set('numpay', $row['pay_number']);
                $idPay->save();
                echo "Ed. numpay: {$pay_info}\n";
                $log['upd_numpay']++;
            }
            if ($idPay->getOne('idSportsmen')->get('code1c') != $sp_code1c) {
                //$modx->removeCollection('idPay', array('id' => $idPay->get('id')));
                $idPay->remove();
                $idPay = null;
            }
        }
        
        if (!$idPay) {
            if (empty($sp_code1c)) die('Empty SP_CODE1C');
            $q = array("code1c" => $sp_code1c);
            
            $contract = trim(str_replace('№', '', $row['contract_number']));
            if (!empty($contract)) $q["OR:contract:="] = $contract;
            
            $w = $modx->newQuery('idSportsmen', array(
                "city" => $id_city,
                $q,
            ));
            
            $idSportsmens = $modx->getCollection('idSportsmen', $w);
            $cnt = count($idSportsmens);

            if ($cnt == 1) {
                $sp = reset($idSportsmens);
                //$contracts[$id_contract] = $sp->get('id');
                if ($sp_code1c != $sp->get('code1c')) {
                    $sp->set('code1c', $sp_code1c);
                    $sp->save();
                    echo "Upd. sp: {$sp->get('name')} {$sp_code1c}\n";
                    $log['upd_sp']++;
                }
                $idPay = $modx->newObject('idPay', $paydata);
                $idPay->set('sportsmen', $sp->get('id'));
                $idPay->save();
                $log['ins_pay']++;
            } else {
                $paydata['contract'] = $row['contract_number'];
                $paydata['name'] = $row['contragent_name'];
                $paydata['sp_code1c'] = $sp_code1c;
                $paydata['error'] = "count_sportsmen({$cnt})";
                $paydata['cnt'] = array();
                foreach($idSportsmens as $sp) {
                    $paydata['cnt'][] = $sp->get('key');
                }
                echo "ERR {$paydata['error']}: {$pay_info}\n";
                file_put_contents($nfpays_path. $paydata['datepay'].'_' .cacheHash($pay_info). '.txt', serialize($paydata));
                $log['nf_sp']++;
            }
        }
    }
    echo "OK: ".$data['inn'];    
} else {
    echo 'ERR n/f: '.$data['inn'];
}

clubLog('1c.pays.import', $log);
