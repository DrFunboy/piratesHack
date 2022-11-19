<?php


$payInit = array(
    'sp' => $idSportsmen,
    'total' => $total,
    'paytext' => $Description,
    'cfg' => $payParams,
    //'sta' => $payCfg->toArray(),
);
//print_r($payInit);


$idCity = $modx->getObject('idCity', $idSportsmen['city']);
if (!empty($idCity)) $payInit['idCity'] = $idCity->toArray();

$tmpl = file_get_contents(__DIR__.'/pd4.html');
echo clubTmpl($tmpl, array(
    'payInit' => json_encode($payInit, JSON_UNESCAPED_UNICODE),
));