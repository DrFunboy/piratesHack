<?php

if ($oper == 'fix') {
    $idPay = $modx->getTableName('idPay');
    $idInvoice = $modx->getTableName('idInvoice');
    $idInvoicePay = $modx->getTableName('idInvoicePay');
    
    $modx->exec("DELETE FROM {$idInvoicePay} WHERE
        `idinvoice` IN (SELECT `id` FROM {$idInvoice} WHERE `sportsmen` = {$data['id']})
        OR `idpay` IN (SELECT `id` FROM {$idPay} WHERE `sportsmen` = {$data['id']})");
    $qInvoice = $modx->newQuery('idInvoice', array(
        'sportsmen' => $data['id'],
        'sum:>' => 0,
    ))
    ->select(array('idInvoice.*'))
    ->sortby('dateinvoice', 'ASC')
    ->prepare();
    $qInvoice->execute();
    $rInvoice = $out["rows1"] = $qInvoice->fetchAll(PDO::FETCH_ASSOC);
    
    $qPays = $modx->newQuery('idPay', array(
        'sportsmen' => $data['id'],
        'sum:>' => 0,
        'payd' => 1,
    ))
    ->select(array('idPay.*'))
    ->sortby('datepay', 'ASC')
    ->prepare();
    $qPays->execute();

    while ($pay = $qPays->fetch(PDO::FETCH_ASSOC)) {
        $paysum = $pay['sum']*1;
        /*foreach($rInvoice as $idx => $invoice) {
            if ($invoice['sum']*1 == $paysum) {
                $nd = $modx->newObject('idInvoicePay', array(
                    'idinvoice' => $invoice['id'],
                    'idpay' => $pay['id'],
                    'sum' => $paysum,
                ));
                $nd->save();
                $out["inx".$idx] = $invoice;
                $paysum = 0;
                unset($rInvoice[$idx]);
                break;
            }
        }*/
        foreach($rInvoice as $idx => $invoice) {
            if ($paysum <= 0) break;
            $sum = min($paysum, $invoice['sum']);
            $nd = $modx->newObject('idInvoicePay', array(
                'idinvoice' => $invoice['id'],
                'idpay' => $pay['id'],
                'sum' => $sum,
            ));
            $nd->save();
            $paysum -= $sum;
            $newinvoice = $invoice['sum']*1 - $sum;
            if ($newinvoice <= 0) unset($rInvoice[$idx]); else $rInvoice[$idx]['sum'] = $newinvoice;
        }
        
        $out["pays"][] = $pay;
    }

    $modx->exec("CALL ". CRM_PREFIX ."sportsmen_calc_saldo({$data['id']})");
}
