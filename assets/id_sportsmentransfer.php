<?php
require_once('id_init.php');

$from = $_REQUEST['from'];
$to = $_REQUEST['to'];

if (!empty($from) && !empty($to)) {
    $modx->updateCollection('idChanges', array(
        'sportsmen' => $to
    ), array(
        'sportsmen:IN' => array($from)
    ));
    $modx->updateCollection('idEventMember', array(
        'sportsmen' => $to
    ), array(
        'sportsmen:IN' => array($from)
    ));
    $modx->updateCollection('idInvoice', array(
        'sportsmen' => $to
    ), array(
        'sportsmen:IN' => array($from)
    ));
    $modx->updateCollection('idPay', array(
        'sportsmen' => $to
    ), array(
        'sportsmen:IN' => array($from)
    ));
    $modx->updateCollection('idSportsmenSquad', array(
        'sportsmen' => $to
    ), array(
        'sportsmen:IN' => array($from)
    ));
    $modx->updateCollection('idLesson', array(
        'sportsmen' => $to
    ), array(
        'sportsmen:IN' => array($from)
    ));
    $modx->updateCollection('idRate', array(
        'sportsmen' => $to
    ), array(
        'sportsmen:IN' => array($from)
    ));
    $modx->updateCollection('idLead', array(
        'sportsmen' => $to
    ), array(
        'sportsmen:IN' => array($from)
    ));
    $modx->updateCollection('idOrderPack', array(
        'sportsmen' => $to
    ), array(
        'sportsmen:IN' => array($from)
    ));

    $out = "Transferred";
} else {
    $out = "Empty params";
}
echo $out;