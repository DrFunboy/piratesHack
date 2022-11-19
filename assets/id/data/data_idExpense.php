<?php

$w->leftJoin('idStatus', 'TypeExpence');
$select[] = "TypeExpence.name as typeexpence_name";
$select[] = "TypeExpence.menuindex";

if ($_REQUEST['tableadd'] == 'period6m') {
    include(CRM_PATH.'report/period6m.php');
    
    foreach ($period as $pk => $per) {
        $d_str = "(`dateexpence` BETWEEN '{$per['d1']}' AND '{$per['d2']}')";
        $select[] = "SUM( IF($d_str, idExpense.`sum`, 0) ) as expense_{$pk}";
    }
}

if (!empty($d1) && !empty($d2)) {
    $groupby[] = "idExpense.typeexpence";
    $select[] = 'SUM(idExpense.`sum`) as expense_sum';
    $where[] = "(`dateexpence` BETWEEN '{$d1}' AND '{$d2}')";
}
    
/*$select[] = 'SUM(IFNULL(idExpense.`sum`, 0)) as sum';
$where["date:>="] = $d1;
$where["AND:date:<="] = $d2;

if ($_POST["groupby"]) {
    $groupby[] = $_POST["groupby"];
} else $groupby[] = "idExpense.typeexpence";

$w->sortby('idStatus.menuindex', 'ASC');
$w->sortby('sum', 'ASC');*/