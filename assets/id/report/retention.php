<?php

$d1 = $modx->getOption('d1', $_REQUEST, 'first day of this month -3 month');
$d1 = new DateTime($d1);
$d2 = $modx->getOption('d2', $_REQUEST, 'last day of this month');
$d2 = new DateTime($d2);

$period = array();
$temp_d1 = clone $d1;
while ($temp_d1 < $d2) {
    $temp_d2 = clone $temp_d1;
    $temp_d2->modify("+1 month -1 day");
    $period[] = array(
        'name' => strftime('%B %Y', $temp_d1->getTimestamp()),
        'd1' => $temp_d1->format('Y-m-d 00:00:00'),
        'd2' => $temp_d2->format('Y-m-d 23:59:59'),
        'm' => $temp_d1->format("m"),
        'key' => strftime("%Y%m", $temp_d1->getTimestamp()),
    );
    $temp_d1->modify("+1 month");
}

$json = array(
    'd1' => $d1->format('Y-m-d'),
    'd2' => $d2->format('Y-m-d 23:59:59'),
    'period' => $period,
);

$w = $modx->newQuery('idSportsmen', array(
    //'idChanges.chfield' => 'status',
    'idChanges.newvalue' => 'new',
    'idChanges.created:>=' => $period[0]['d1'],
    'idChanges.created:<=' => $period[0]['d2'],
));
$w->innerJoin('idChanges');
$w->leftJoin('idLesson');
$w->select(array(
    'idSportsmen.id',
    'idSportsmen.name',
    'idSportsmen.key',
    'idSportsmen.id',
    'idSportsmen.status',
    'COUNT(idLesson.id) as lsn_cnt',
    '_inv.*',
));
$w->groupby('idSportsmen.id');


$wi = $modx->newQuery('idInvoice', array(
    'dateinvoice:>=' => $d1->format('Y-m-d'),
    'dateinvoice:<=' => $d2->format('Y-m-d 23:59:59'),
));
$wi->leftJoin('idInvoicePay');
$wi->groupby('idInvoice.sportsmen');

$wi_select = array(
    'idInvoice.sportsmen',
);
foreach ($period as $pk => $per) {
    $d_str = "(dateinvoice BETWEEN '{$per['d1']}' AND '{$per['d2']}')";
    //$d_str = "(DATE_FORMAT(idInvoice.dateinvoice, '%Y%m') = '{$per['key']}')";
    
    $wi_select[] = "SUM(IF({$d_str}, idInvoicePay.`sum`, 0)) as ipsum_{$pk}";
    $wi_select[] = "SUM(IF({$d_str}, idInvoice.`sum`, 0)) as invsum_{$pk}";
    $wi_select[] = "COUNT(IF({$d_str}, idInvoice.sportsmen, NULL)) as invcnt_{$pk}";//DISTINCT
    
    //$wi_select[] = "COUNT(IF({$d_str}, idInvoice.`sum` - IFNULL(_ip.`sum_ip`, 0), 0)) as saldo_{$pk}";

    /*$select[] = "_inv.invoice_{$pk}";
    $select[] = "_inv.saldo_{$pk}";
    $select[] = "_inv.status_{$pk}";*/
}
$wi->select($wi_select);
$stmt = $wi->prepare();
//$json['periodsql2'] = 
$sql_inv = $wi->toSQL();


$w->query['from']['joins'][] = array(
    "type" => "LEFT JOIN",
    "table" => "({$sql_inv})",
    "alias" => "_inv",
    "conditions" => array(
        new xPDOQueryCondition(array(
            "sql" => "_inv.sportsmen = idSportsmen.id",
        )),
    ),
);


/*$w->query['from']['joins'][] = array(
    "type" => "LEFT JOIN",
    "table" => "({$sql_inv})",
    "alias" => "_inv",
    "conditions" => array(
        new xPDOQueryCondition(array(
            "sql" => "idSportsmen.id = _inv.sportsmen",
        )),
    ),
);*/

$stmt = $w->prepare();
$json['sql_sp'] = $sql_sp = $w->toSQL();
$stmt->execute();
$json["rows"] = $stmt->fetchAll(PDO::FETCH_ASSOC);

/*



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

*/
