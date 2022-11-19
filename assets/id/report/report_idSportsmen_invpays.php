<?php

$rowid = $_REQUEST['rowid'];
$join = "(idPay.sportsmen = idSportsmen.id) AND (idPay.datepay BETWEEN '$d1' AND '$d2')";
$w->innerJoin('idPay', 'idPay', $join);
$w->innerJoin('idInvoicePay', 'ip', "ip.idpay = idPay.id");

if (empty($rowid)) {
    $rq['rows'] = 1001;
    /*$select = array(
        "idPay.id",
        "idPay.sportsmen",
        "idPay.code1c",
        "ip.sum",
        "inv.typeinvoice",
        "idInvoiceType.name as invoice_name",
        "DATE_FORMAT(inv.dateinvoice, '%Y-%m') as invoice_period",
        
        //"IF((inv.sum = SUM(ip.sum)) OR (inv.sum = 0), 1, 0) as payd",
        //"IFNULL(SUM(ip.sum), 0) as ipsum",
    );
    
    
    
    $w->innerJoin('idInvoiceType', 'idInvoiceType', 'idInvoiceType.id = inv.typeinvoice');

    //$w->groupby('inv.id, inv.typeinvoice, ip.sum, inv.sportsmen');
    //$w->groupby('YEAR(inv.dateinvoice), MONTH(inv.dateinvoice)');
    
    $w->select($select);
    $w->where($where);
        
    $w->prepare();
    $sql = $w->toSQL();
    $json['deb2'] = $sql; 
    
    $sql = "SELECT
        qi.typeinvoice,
        qi.invoice_name,
        qi.invoice_period,
        Count(qi.id) as cnt,
        Sum(qi.sum) as total,
        Sum(IF(qi.code1c = '', qi.sum, 0)) as cache_total,
        Sum(IF(qi.code1c != '', qi.sum, 0 )) as ncache_total,
        Count(DISTINCT qi.sportsmen) as cntsportsmen
        FROM
        ( {$sql} ) AS qi
        GROUP BY qi.typeinvoice, qi.invoice_period
        ORDER BY qi.invoice_name, qi.invoice_period DESC";
    
    $results = $modx->query($sql); 
    $json["rows_pay"] = $results->fetchAll(PDO::FETCH_ASSOC);*/
    
    /* ------******************++++++++++++++++****************--------- */
    $w->innerJoin('idInvoice', 'inv', 'inv.id = ip.idinvoice');
    $w->where($where);
    $w->select(array(
        "idPay.id",
        "idPay.sportsmen",
        "idPay.code1c",
        "ip.sum",
        "inv.typeinvoice",
        "DATE_FORMAT(inv.dateinvoice, '%Y-%m') as invoice_period",
    ));
    
    $w->prepare();
    $sql_pay = $w->toSQL();
    $json['debug_sql'] = $sql_pay;
    
    $w = $modx->newQuery('idInvoiceType');
    $w->query['from']['joins'][] = array(
        "type" => "JOIN",
        "table" => "({$sql_pay})",
        "alias" => "_ip",
        "conditions" => array(
            new xPDOQueryCondition(array(
                "sql" => "idInvoiceType.id = _ip.typeinvoice",
            )),
        ),
    );
    
    $select = array(
        '_ip.typeinvoice',
        'idInvoiceType.`name` AS typeinvoice_name',
        '_ip.invoice_period',
        'SUM(_ip.sum) as total',
        'COUNT(_ip.id) as cnt',
        'COUNT(DISTINCT _ip.sportsmen) as cnt_sportsmen',
        "SUM(IF(_ip.code1c = '', _ip.sum, 0)) as cache_total",
        "SUM(IF(_ip.code1c != '', _ip.sum, 0 )) as ncache_total",
    );
    $where = array();
    $sidx = array('typeinvoice_name', '_ip.invoice_period');
    $groupby = array('idInvoiceType.id', '_ip.invoice_period');    
} else {
    $qparams = explode('#', $rowid);
    $w->innerJoin('idInvoice', 'inv', "inv.id = ip.idinvoice AND (inv.typeinvoice ={$qparams[0]}) AND (DATE_FORMAT(inv.dateinvoice, '%Y-%m') = '{$qparams[1]}')");
    //$w->where()
    
    
    $select[] = "count(idPay.id) as add_cnt";
    //$idInvoicePay = $modx->getTableName('idInvoicePay');
    $select[] = "SUM(ip.`sum`) as payed";
    //$select[] = "SUM((SELECT IFNULL(SUM(ip.`sum`),0) FROM {$idInvoicePay} ip WHERE ip.idinvoice = inv.id)) as payed";
    $select[] = "GROUP_CONCAT(DISTINCT inv.`info` SEPARATOR ';\n') as add_info";
    //$select[] = "GROUP_CONCAT(DISTINCT inv.`status` SEPARATOR ', ') as add_status";
    //if ($_REQUEST['having']=='debts') $w->having('invoiced-payed > 0');
    $w->groupby('idSportsmen.id');
    $totals = ", SUM(`saldo`) as `saldo`, SUM(`payed`) as `payed`, SUM(`add_cnt`) as `add_cnt`";
}