<?php

$rq['rows'] = 1001;

require_once('period6m.php');

if ($rq['_rtype'] == 'idSchedule') {
    $join = "(sch.datestart BETWEEN '$d1' AND '$d2')";
    
    $select = array(
        //"inv.typeinvoice",
        //"idInvoiceType.name as invoicetype",
        "COUNT(DISTINCT sch.id) as cnt_schedule",
    );
    
    $w->innerJoin('idLesson');
    $w->innerJoin('idSchedule', 'sch', 'sch.id = idLesson.schedule');
    //$w->leftJoin('idInvoicePay', 'ip', "ip.idinvoice = inv.id");
    
    //$w->groupby('inv.typeinvoice');
    
    foreach ($period as $pk => $per) {
        $d_str = "(sch.datestart BETWEEN '{$per['d1']}' AND '{$per['d2']}' AND idLesson.`status`='y')";
        //$select[] = "SUM(IF({$d_str}, inv.`sum`, 0)) as inv_{$pk}";
        $select[] = "COUNT(DISTINCT CASE WHEN $d_str THEN idLesson.sportsmen END) as sportsmen_{$pk}";
    }
    
} elseif ($rq['_rtype'] == 'idPay') {
    $where[] = "(idPay.datepay BETWEEN '$d1' AND '$d2')";
    
    $select = array(
        "SUM(idPay.`sum`) as sum_pay",
    );
    
    $w->innerJoin('idPay');
    //$w->leftJoin('idInvoicePay', 'ip', "ip.idinvoice = inv.id");
    
    //$w->groupby('inv.typeinvoice');
    
    foreach ($period as $pk => $per) {
        $d_str = "(idPay.datepay BETWEEN '{$per['d1']}' AND '{$per['d2']}')";
        $select[] = "SUM(IF({$d_str}, idPay.`sum`, 0)) as pay_{$pk}";
        $select[] = "COUNT(DISTINCT CASE WHEN $d_str THEN idPay.sportsmen END) as sportsmen_{$pk}";
        //$select[] = "SUM(CASE WHEN $d_str THEN idPay.sum END) as pay_{$pk}";
    }
    
} else {
    
    $join = "(inv.sportsmen = idSportsmen.id) AND (inv.dateinvoice BETWEEN '$d1' AND '$d2')";
    
    $select = array(
        "inv.typeinvoice",
        "idInvoiceType.name as invoicetype",
        "SUM(inv.sum) as inv_sum",
    );
    
    $w->innerJoin('idInvoice', 'inv', $join);
    $w->innerJoin('idInvoiceType', 'idInvoiceType', 'idInvoiceType.id = inv.typeinvoice');
    //$w->leftJoin('idInvoicePay', 'ip', "ip.idinvoice = inv.id");
    
    array_push($groupby, 'inv.typeinvoice');
    
    foreach ($period as $pk => $per) {
        $d_str = "(inv.dateinvoice BETWEEN '{$per['d1']}' AND '{$per['d2']}')";
        $select[] = "SUM(IF({$d_str}, inv.`sum`, 0)) as inv_{$pk}";
        $select[] = "COUNT(DISTINCT CASE WHEN $d_str THEN inv.sportsmen END) as sportsmen_{$pk}";
    }
}


/*$w->select($select);
$w->where($where);
    
$w->prepare();
$sql = $w->toSQL();

$sql = "SELECT
    qi.typeinvoice,
    qi.invoicetype,
    Count(qi.id) as cnt,
    Sum(qi.sum) as total,
    Count(DISTINCT qi.sportsmen) as cntsportsmen,
    SUM(qi.payd) as cntpay,
    SUM(qi.ipsum) as totalpay
    FROM
    ( {$sql} ) AS qi
    GROUP BY qi.typeinvoice
    ORDER BY qi.invoicetype";

$results = $modx->query($sql); 
$json["rows_inv"] = $results->fetchAll(PDO::FETCH_ASSOC);*/




