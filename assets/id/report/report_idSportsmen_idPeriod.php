<?php

$w->groupby('idSportsmen.id');

$period = array();
$d1 = new DateTime('first day of this month');
$d2 = new DateTime('last day of this month');
for ($i = 0; $i < 12; $i++) {
    $period[$i] = array(
        "name" => strftime("%b %Y", $d1->getTimestamp()),
        "d1" => $d1->format("Y-m-d 00:00:00"),
        "d2" => $d2->format("Y-m-d 23:59:59"),
        "key" => strftime("%Y%m", $d1->getTimestamp()),
    );
    $d2 = clone $d1;
    $d2->modify("-1 day");
    $d1->modify("-1 month");
}
$json['period'] = $period;

$w_inv = array(
    'typeinvoice' => $rq['typeinvoice'],
    'dateinvoice:>=' => $d1->format("Y-m-d 00:00:00"),
    'idSportsmen.city' => $_SESSION['club_city'],
);

$wp = $modx->newQuery('idInvoice', $w_inv);
$wp->innerJoin('idSportsmen');
$wp->innerJoin('idInvoicePay');

$wp->select(array(
    'idInvoice.id',
    'SUM(idInvoicePay.sum) as sum_ip',
));
$wp->groupby("idInvoice.id");

$wp->prepare();
$json['periodsql1'] = $sql_ip = $wp->toSQL();

$wi = $modx->newQuery('idInvoice', $w_inv);
$wi->innerJoin('idSportsmen');
$wi->groupby("idInvoice.sportsmen");
$wi->query['from']['joins'][] = array(
    "type" => "LEFT JOIN",
    "table" => "({$sql_ip})",
    "alias" => "_ip",
    "conditions" => array(
        new xPDOQueryCondition(array(
            "sql" => "idInvoice.id = _ip.id",
        )),
    ),
);


/*$wi->select(array(
    'idInvoice.id',
    'idInvoice.sportsmen',
    //'idInvoice.status',
    "IF(idInvoice.`status`='' AND idInvoice.isauto=1 AND idInvoice.edited IS NOT NULL, 'na', idInvoice.`status`) as status",
    //'idInvoice.dateinvoice',
    'idInvoice.sum',
    'DATE_FORMAT(idInvoice.dateinvoice, "%Y%m") as ym',
    //'SUM(IF(lesson_amount>0 AND (lsn.id IS NOT NULL), 1, 0)) as cnt_lesson',
    'SUM(idInvoicePay.sum) as sum_ip',
    //'SUM(IF(idInvoice.duedate > NOW(), idInvoiceLesson.amount, 0)) as residue',
));*/


/*$json['debug_ip'] = $sql_ip = "SELECT
ip.sportsmen,
SUM(ip.`sum`) as sum_i,
SUM(IFNULL(ip.`sum_ip`,0)) as sum_ip,
GROUP_CONCAT(DISTINCT IF(ip.`status`!='', ip.`status`, NULL) SEPARATOR ', ') as status_i
FROM ({$sql_ip}) as ip
GROUP BY ip.sportsmen";*/

$wi_select = array(
    'idInvoice.sportsmen',
);
foreach ($period as $pk => $per) {
    $d_str = "(dateinvoice BETWEEN '{$per['d1']}' AND '{$per['d2']}')";
    //$d_str = "(DATE_FORMAT(idInvoice.dateinvoice, '%Y%m') = '{$per['key']}')";
    
    $wi_select[] = "SUM(IF({$d_str}, idInvoice.`sum`, 0)) as invoice_{$pk}";
    $wi_select[] = "SUM(IF({$d_str}, idInvoice.`sum` - IFNULL(_ip.`sum_ip`, 0), 0)) as saldo_{$pk}";
    $wi_select[] = "GROUP_CONCAT(DISTINCT IF({$d_str}, IF(idInvoice.`status`='' AND idInvoice.isauto=1 AND idInvoice.edited IS NOT NULL, 'na', idInvoice.`status`), '') SEPARATOR ',') AS status_{$pk}";
    
    $select[] = "_inv.invoice_{$pk}";
    $select[] = "_inv.saldo_{$pk}";
    $select[] = "_inv.status_{$pk}";
}
$wi->select($wi_select);
$wi->prepare();
$json['periodsql2'] = $sql_inv = $wi->toSQL();

$w->query['from']['joins'][] = array(
    "type" => "LEFT JOIN",
    "table" => "({$sql_inv})",
    "alias" => "_inv",
    "conditions" => array(
        new xPDOQueryCondition(array(
            "sql" => "idSportsmen.id = _inv.sportsmen",
        )),
    ),
);

/*if (count($sidx)==1 && substr($sidx[0], 0, 6 ) === "saldo_"){
    $sidx[] = str_replace("saldo_", "invoice_", $sidx[0]).' DESC';
}*/