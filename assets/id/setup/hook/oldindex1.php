<?php

$manager = $modx->getManager();
$manager->removeIndex('idSportsmenSquad', 'uq_sp_sq');
$manager->removeIndex('idSquad', 'squad_name');
$manager->removeIndex('idSquad', 'squad_club');
$manager->removeIndex('idSportsmen', 'email');
$manager->removeIndex('idStatus', 'uq_status');
$manager->removeIndex('idInvoicePay', 'idpay');
//$manager->removeIndex('idInvoicePay', 'sportsmen');


/*
$manager->removeIndex('idLesson', 'schedule');
$manager->removeIndex('idTascom', 'datestart');
$manager->removeIndex('idInvoice', 'period');
$manager->removeIndex('idInvoice', 'residue');
$manager->removeIndex('idSchedule', 'planfact');

$manager->removeIndex('idEventMember', 'uq_event_member');
$manager->removeIndex('idSportsmenSquad', 'squad');

$manager->removeIndex('idEventMember', 'idevent');
$manager->removeIndex('idLink', 'link1');
*/
