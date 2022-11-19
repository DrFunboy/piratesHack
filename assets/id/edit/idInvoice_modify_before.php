<?php

if ($oper == 'add') {
    if (empty($data['dateinvoice'])) $data['dateinvoice'] = 'now';
    
    $id_InvoiceType = $modx->getObject('idInvoiceType', $data['typeinvoice']);
    if (!empty($id_InvoiceType)) {
        $data['lesson_amount'] = $id_InvoiceType->get('amount');
        if (empty($data['duedate'])) {
            $period = $id_InvoiceType->get('period');
            if (!empty($data['lesson_amount']) && empty($period)) $period = '+1 month -1 day';
            if (!empty($period)) {
                $dt = new DateTime($data['dateinvoice']);
                $dt->modify($period . ' 23:59:59');
                $data['duedate'] = $dt->format('c');
            }
        }
    }
}


unset($flds["isauto"]);