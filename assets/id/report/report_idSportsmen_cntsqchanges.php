<?php

$groupby[] = 'idSportsmen.id';
$w->innerJoin('idSportsmenSquad', 'ssq_r', 'ssq_r.sportsmen = idSportsmen.id');
$sq_params = explode(';', $rq['cnt_sqchanges']);
$where['ssq_r.squad:IN'] = explode(',', $sq_params[1]);

$w_pm = array();
foreach(explode(',', $sq_params[0]) as $param) {
    $prefix = (sizeof($w_pm) > 0)? 'OR:':'';
    if ($param=='plus') {
        $w_pm[] = array(
            $prefix.'ssq_r.created:>' => $d1,
            'ssq_r.created:<' => $d2,
        );
    } else {
        $w_pm[] = array(
            $prefix.'ssq_r.dateend:>' => $d1,
            'ssq_r.dateend:<' => $d2,
        );
    }
}
$where[] = $w_pm;

//$json['wweww'] = $where;