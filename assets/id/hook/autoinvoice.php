<?php
set_time_limit(0);

$invoice_type = $_REQUEST['invoicetype'];
$date = $_REQUEST['date'];

$json = array("result" => "ERROR");

if (!empty($invoice_type) && !empty($date) &&
    ($id_InvoiceType = $modx->getObject('idInvoiceType', $invoice_type))!=null) {
    $data = array(
        'isauto' => 1,
        'author' => $userID,
        'typeinvoice' => $invoice_type,
        'dateinvoice' => $date,
        'info' => $_REQUEST['info'],
        'lesson_amount' => $id_InvoiceType->get('amount'),
    );
    $period = $id_InvoiceType->get('period');
    //if (!empty($amount)&&empty($period)) $period = '+1 year';
    
    if (empty($period)) {
        $date = " = '{$date}'";
    } else {
        $dt = new DateTime($data['dateinvoice']);
        $dt->modify($period . ' 23:59:59');
        $data['duedate'] = $dt->format('c');
        $date = " BETWEEN '{$date}' AND '{$data['duedate']}'";
    }
    $where = array(
        'status:IN' => array('Действует', 'Обещанный платеж'),
    );
    $w = $modx->newQuery('idSportsmen', $where);
    $w->leftJoin('idInvoice', 'inv', "idSportsmen.id = inv.sportsmen AND inv.typeinvoice = {$invoice_type} AND inv.dateinvoice {$date}");
    $w->select(array(
        'idSportsmen.id',
        'idSportsmen.price',
        'COUNT(inv.id) as cnt_invoice',
    ));
    if ($_REQUEST['allcity']!=='true') $w->where(array(
        'idSportsmen.city' => $_SESSION['club_city']
    ));
    if ($_REQUEST['add0']!=='true') $w->where(array(
        'idSportsmen.price:!=' => 0,
    ));
    $w->groupby('idSportsmen.id');
    $w->having('cnt_invoice = 0');

    $stmt = $w->prepare();
    $json['sql'] = $w->toSQL();
    $stmt->execute();
    $json["total"] = 0;
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $data['sportsmen'] = $row['id'];
        $data['sum'] = $row['price'];
        $idInvoice = $modx->newObject('idInvoice', $data);
        $idInvoice->save();
        $json["total"]++;
        //$json["rows"][] = $row;
    }
    $json["result"] = "OK";
} else {
    $json["comment"] = "Empty param";
}

/*
$date = $_REQUEST['date'];

$out = array(
    "result" => "ERROR",
);

if (!empty($idInvoiceType)) {
    $rs = $modx->query("call id_autoinvoice_all({$idInvoiceType}, '{$date} 00:00:00', {$userID}, @total)");
    if ($rs) {
        $row = $rs->fetch(PDO::FETCH_ASSOC);
        $out = array_merge($out, $row);
        $out["result"] = "OK";
    } else {
        $out["comment"] = "Empty procedure result";
    }
} else {
    $out["comment"] = "Empty param";
}
echo $modx->toJSON($out);*/