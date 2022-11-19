<?php

//$w->leftJoin('idPeriod', 'idPeriod');
//$select[] = "idPeriod.name as period_name";
$w->innerJoin('idInvoiceType');
$w->leftJoin('idInvoicePay', 'idInvoicePay');
$w->leftJoin('idPay', 'idPay', "idPay.id = idInvoicePay.idpay");

if ($rq['tableadd']=='idSportsmen') {
    $w->innerJoin('idSportsmen');
    $w->leftJoin('idSquad', 'idSquad', 'idSquad.id = idSportsmen.squad');
    $select[] = "idSportsmen.name as sportsmen_name";
    $select[] = "idSportsmen.key";
    $select[] = "idSportsmen.trainer";
    $select[] = "idSportsmen.squad";
    $select[] = "idSquad.name as squad_name";
    $select[] = "idSquad.sport";
    $select[] = "idSquad.club";
    $select[] = "idSquad.lvl";
}

if (!empty($where)) {
    $wi = $modx->newQuery('idLesson');
    //$wi->innerJoin('idLesson', 'idLesson', "idInvoice.id = idLesson.idinvoice");
    /*$wi = $modx->newQuery('idLesson', array(
        'sportsmen' => $where['sportsmen'],
        'idinvoice:!=' => 0,
    ));*/
    $wi->select(array(
        'idinvoice',
        'COUNT(*) as cnt_lesson',
        // min , max ?
    ));
    $wi->groupby("idinvoice");

    $wi->prepare();
    $sql_lsn = $wi->toSQL();
    $json['debug2'] = $sql_lsn;
    
    $w->query['from']['joins'][] = array(
        "type" => "LEFT JOIN",
        "table" => "({$sql_lsn})",
        "alias" => "lsn",
        "conditions" => array(
            new xPDOQueryCondition(array(
                "sql" => "idInvoice.id = lsn.idinvoice",
            )),
        ),
    );
    $select[] = 'lsn.cnt_lesson as cnt_lesson';
}


$select[] = 'idInvoiceType.name as name_typeinvoice';
$select[] = 'idInvoiceType.amount as invtype_amount';
$select[] = 'idInvoiceType.period as invtype_period';
$select[] = 'MAX(idPay.datepay) as maxdatepay';
$select[] = 'SUM(IFNULL(idInvoicePay.`sum`, 0)) as sumpay';
$select[] = "GROUP_CONCAT(CONCAT_WS(':',idInvoicePay.idpay,idInvoicePay.sum) SEPARATOR ',') as cntpay";

//$select[] = 'COUNT(idInvoicePay.id) as cntpay';
$groupby[] = 'idInvoice.id';
$totals = ", SUM(`sum`) as `sum`";