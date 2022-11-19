<?php

$totals = ", SUM(`sum`) as `sum`, AVG(`sum`) as `avrg`";

if ($_REQUEST['tableadd'] == 'period6m') {
    include(CRM_PATH.'report/period6m.php');
    $_REQUEST['tableadd'] = 'idInvoiceType';
    
    foreach ($period as $pk => $per) {
        $d_str = "(`datepay` BETWEEN '{$per['d1']}' AND '{$per['d2']}')";
        $select[] = "SUM( IF($d_str, IFNULL(idInvoicePay.`sum`, idPay.`sum`), 0) ) as pay_{$pk}";
    }
}
    

if (!empty($d1) && !empty($d2)) {
    $w->leftJoin('idInvoicePay', 'idInvoicePay', 'idInvoicePay.idpay = idPay.id');
    $w->leftJoin('idSportsmen');
    
    $where[] = array(
        'idSportsmen.city' => $_SESSION['club_city'],
        'OR:sportsmen:=' => 0,
    );
    $where[] = "(datepay BETWEEN '{$d1}' AND '{$d2}')";

    if ($_REQUEST['tableadd'] == 'idInvoiceType') {
        $w->leftJoin("idInvoice", "idInvoice", "idInvoicePay.idinvoice = idInvoice.id");
        $w->leftJoin("idInvoiceType", "idInvoiceType", "idInvoiceType.id = idInvoice.typeinvoice");
        
        $select[] = 'idInvoice.typeinvoice';
        $select[] = 'idInvoiceType.name AS typeinvoice_name';
        $select[] = 'idInvoiceType.menuindex AS menuindex';
        $select[] = "SUM(IFNULL(idInvoicePay.sum, idPay.sum)) as pay_sum";

        $groupby[] = 'idInvoiceType.id';
        /*$w->sortby('idInvoiceType.menuindex', 'ASC');
        $w->sortby('idInvoiceType.name', 'ASC');
        $w->sortby('pay_sum', 'ASC');*/
        
    } else {
        $w->leftJoin('idTrainer', 'idTrainer', 'idTrainer.id = idSportsmen.trainer');
        $select[] = "idSportsmen.name";
        $select[] = "idSportsmen.key as sportsmen_key";
        $select[] = "idTrainer.name as trainer_name";
        $groupby[] = 'idPay.id';
        
        $select[] = "idPay.sum - SUM(IFNULL(idInvoicePay.sum, 0)) as rest";
        $fields['rest']['phptype'] = 'float';
        $totals .= ", SUM(`rest`) as `rest`";
    }
    
    $select[] = "SUM(IFNULL(idInvoicePay.sum, 0)) as spent";
    //$select[] = "SUM(idPay.sum) - SUM(IFNULL(idInvoicePay.sum, 0)) as rest";
    

    $fields['spent']['phptype'] = 'float';
    $totals .= ", SUM(`spent`) as `spent`";

    if (isset($where['idPay.code1c'])) {
        if ($where['idPay.code1c']=='bank') {
            $where['idPay.code1c:!='] = '';
            unset($where['idPay.code1c']);
        } else $where['idPay.code1c'] = '';
    }
}
