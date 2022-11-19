<?php

$json = array();
define('CLUB_UNAUTH', true);
require_once(__DIR__ . '/../id_init.php');

clubLog('handlers_ext_pay', $_REQUEST);

//Авторизацию доделать
foreach(apache_request_headers() as $key => $hdr) {
    //$json['headers'][$key] = $hdr;
    //if ($key == 'X-CRM-APIKey') $json
    // echo "$key => $hdr \n";
}

if (!empty($_REQUEST['search'])){
    $q = $modx->newQuery('idSportsmen', array(
        'name:LIKE' => $_REQUEST['search'].'%',
        'OR:contract:=' => $_REQUEST['search'],
    ));
    $q->sortby('name','ASC')->select(array('idSportsmen.*'));
    $stmt = $q->prepare();
    $stmt->execute();
    $json['rows'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
}

if (!empty($_REQUEST['sum']) && !empty($_REQUEST['sportsmen'])){
    if (!empty($_REQUEST['typeinvoice'])) {
        $dataInvoice = array(
            'table' => 'idInvoice',
            'oper' => 'add',
            'sportsmen' => $_REQUEST['sportsmen'],
            'sum' => $_REQUEST['sum'],
            'dateinvoice' => $modx->getOption('dateinvoice', $_REQUEST, date('c')),
            'typeinvoice' => $_REQUEST['typeinvoice'],
            'info' => $_REQUEST['info'],
        );
        $modx->runSnippet('dbedit', array(
            'data' => $dataInvoice,
            'placeholder' => 'idInvoice',
        ));
        $idInvoice = $modx->getPlaceholder('idInvoice');
        $json['idInvoice'] = $idInvoice->toArray();
    }
    
    $dataPay = array(
        'table' => 'idPay',
        'oper' => 'add',
        'sportsmen' => $_REQUEST['sportsmen'],
        'sum' => $_REQUEST['sum'],
        'numpay' => $_REQUEST['numpay'],
        'datepay' => date('c'),
        'info' => $_REQUEST['info'],
    );
    $modx->runSnippet('dbedit', array(
        'data' => $dataPay,
        'placeholder' => 'idPay',
    ));
    $idPay = $modx->getPlaceholder('idPay');
    $json['idPay'] = $idPay->toArray();
}

echo json_encode($json, JSON_UNESCAPED_UNICODE);