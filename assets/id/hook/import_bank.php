<?php
if (!isCrew()) dieJSONForbidden();
set_time_limit(0);
//error_reporting(E_ALL);
$json = array();
$rows = array();
$mode = $modx->getOption('mode', $_REQUEST, 'csv');

function addPay(&$rows, $data) {
    global $modx;
    //global $json;
    
    $data['info'] = implode(PHP_EOL, $data['info']);
    $data['sum'] = str_replace([' ', ','], ['', '.'], trim($data['sum'])) * 1;
    if (empty($data['sum']) || $data['sum'] < 0) return;

    $data['datepay'] = (new DateTime($data['datepay']))->format('Y-m-d');
    $wpay = array_intersect_key($data, array_flip(['datepay', 'numpay', 'info']));
    $idPay = $modx->getObject('idPay', $wpay);
    if (empty($idPay)) {
        $srch_cnt = array();
        if (!empty($data['info'])) {
            $ww = $modx->newQuery('idSportsmen');
            $ww->innerJoin('idContact');
            $splitInfo = preg_split('/[\/;\n]+/', mb_strtoupper($data['info']));
            foreach($splitInfo as $i => $srow) {
                $srch = trim($srow);
                if (!empty($srch)) {
                    if ($i==0) {
                        $ww->where("UPPER(idContact.`name`) = '$srch'");
                    } else {
                        $ww->orCondition("UPPER(idContact.`name`) = '$srch'");
                    }
                    //$ww->orCondition("UPPER(idSportsmen.`contact`) = '$srch'");
                }
            }
            $ww->prepare();
            //$json['sql'][] = $ww->toSQL();
            foreach($modx->getCollection('idSportsmen', $ww) as $srow) {
                $data['sportsmen'] = $srow->get('id');
                $srch_cnt[] = $srow->get('key');
            }
        }
        if (sizeof($srch_cnt)==1) {
            $idPay = $modx->newObject('idPay', $data);
            $idPay->save();
        } else {
            $data['cnt'] = $srch_cnt;
            $rows[] = $data;
        }
    }
}

if (!empty($_FILES)) {
    $file = $_FILES[0];
    $path = pathinfo($file["name"]);
    //move_uploaded_file($file['tmp_name'], MODX_BASE_PATH . $dest_file)) {
    
    $opts = getClubConfig("import_pays_{$mode}", true);
    
    if (($handle = fopen($file['tmp_name'], "r")) !== FALSE) {
        $row = 0;
        
        if ($mode == 'csv') {
            $delimeter = $modx->getOption('delimeter', $opts, ';');
            $start = !empty($opts['start'])? $opts['start']*1 : 0;
            $cols = $modx->getOption('row', $opts, '0;datepay;numpay;3;sum;5;info;7;8;info');
            $cols = explode(';', $cols);
            while (($data = fgetcsv($handle, 1000, $delimeter)) !== FALSE) {
                $row++;
                if ($row < $start || sizeof($data) < sizeof($cols)  ) continue;
                $add = array(
                    'id' => $row,
                    'info' => array(),
                );
                foreach ($cols as $n => $col) {
                    switch ($col) {
                        case 'sum':
                        case 'numpay':
                        case 'datepay':
                            $add[$col] = $data[$n];
                            break;
                        case 'info':
                            $add_info = $opts['iconv']? iconv($opts['iconv'], 'UTF-8', $data[$n]) : $data[$n];
                            $add['info'][] = trim($add_info);
                            break;
                    }
                }
                
                //$rows[] = $add;
                addPay($rows, $add);
            }
        }


        if ($mode == '1c') {
            while (!feof($handle))  {
                if (empty($add)) $add = array(
                    'info' => array(),
                );
                $str = fgets($handle);
                $astr = explode('=', iconv('CP1251', 'UTF-8', trim($str)));

                switch ($astr[0]) {
                    case 'Номер':
                        $add['numpay'] = $astr[1];
                        break;
                    case 'Дата':
                        $add['datepay'] = $astr[1];
                        break;
                    case 'Сумма':
                        $add['sum'] = $astr[1];
                        break;
                    case 'Плательщик':
                    case 'НазначениеПлатежа':
                        $add['info'][] = trim($astr[1]);
                        break;
                    case 'КонецДокумента':
                        $row++;
                        $add['id'] = $row;
                        addPay($rows, $add);
                        unset($add);
                }
            }
        }
        fclose($handle);
    }
    
    include_once(__DIR__.'/tools/nfpays.php'); // $nfpays_path
    clear_nfpays($nfpays_path);
    
    foreach($rows as $paydata) {
        file_put_contents($nfpays_path. $paydata['datepay'].'_' . cacheHash($paydata). '.txt', serialize($paydata));
    }
}

$json['rows'] = $rows;
