<?php

$manager = $modx->getManager();
$manager->removeIndex('idInvoicePay', 'idpay');
$modx->removeCollection('idInvoicePay', array());
$manager->addIndex('idInvoicePay', 'uq_invoicepay');
$cnt = 0;
foreach($modx->getIterator('idSportsmen') as $sp) {
    $modx->exec("CALL ". CRM_PREFIX ."invoice2pay({$sp->get('id')}, 0, 0, 0);");
    $cnt++;
}

echo "<p>invoicepay-recalc: {$cnt}</p>";