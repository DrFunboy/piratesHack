<?php

//$w->leftJoin('idInvoice', 'inv', "(inv.sportsmen = idSportsmen.id) AND (inv.dateinvoice BETWEEN '$d1' AND '$d2')");
//$w->groupby('idSportsmen.id');

$wpay = $modx->newQuery('idPay', array(
    "datepay BETWEEN '$d1' AND '$d2'",
    'idSportsmen.city' => $_SESSION['club_city'],
));
$wpay->innerJoin('idSportsmen');
$wpay->select(array(
    'idPay.sportsmen',
    'SUM(idPay.`sum`) as pay_total',
));
$wpay->groupby('idPay.sportsmen');

$wpay->prepare();
$sql_pay = $wpay->toSQL();
//$json['debug2'] = $sql_residue;

$w->query['from']['joins'][] = array(
    "type" => "LEFT JOIN",
    "table" => "({$sql_pay})",
    "alias" => "_pays",
    "conditions" => array(
        new xPDOQueryCondition(array(
            "sql" => "idSportsmen.id = _pays.sportsmen",
        )),
    ),
);

$winv = $modx->newQuery('idInvoice', array(
    "dateinvoice BETWEEN '$d1' AND '$d2'",
    'idSportsmen.city' => $_SESSION['club_city'],
));
$winv->innerJoin('idSportsmen');
$winv->select(array(
    "idInvoice.sportsmen",
    'SUM(idInvoice.`sum`) as inv_total',
    "COUNT(idInvoice.id) as inv_cnt",
));
$winv->groupby("idInvoice.sportsmen");
$winv->prepare();
$sql_inv = $winv->toSQL();
//$json['debug2'] = $sql_residue;

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

$select[] = '_inv.inv_total as invoiced';
$select[] = '_inv.inv_cnt as add_cnt';
$select[] = '_pays.pay_total as payed';

$fields['invoiced']['phptype'] = 'float';
$fields['add_cnt']['phptype'] = 'integer';
$fields['payed']['phptype'] = 'float';

$totals = ", SUM(`invoiced`) as `invoiced`, SUM(`payed`) as `payed`, SUM(`add_cnt`) as `add_cnt`";

$w->having('( add_cnt IS NOT NULL ) 
	OR ( payed IS NOT NULL ) ');