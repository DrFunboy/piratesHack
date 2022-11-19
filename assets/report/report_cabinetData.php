<?php
$allow_tbl = explode(',', 'idInvoice,idPay,idLesson,idChanges,idSportsmen,idRate');
if (!in_array($table, $allow_tbl)) die('Not allowed');

if ($table=='idSportsmen') {
    unset($where['city']);
    $where['iduser'] = empty($userID)? '-' : $userID;
} else {
    $key = $rq['key'];
    if (empty($key)) die('Empty key');
    
    $w->innerJoin('idSportsmen');
    $where['idSportsmen.key'] = $key;
    
    if ($table=='idPay') {
        $where['payd'] = 1;
        $select = array(
            'idPay.id',
            'datepay',
            'idPay.info',
            'idPay.sum',
        );
    }
    
    if ($table=='idLesson') {
        $select[] = 'idSchedule.link as schedule_link';
        $sidx = ['idSchedule.datestart'];
        $sord = 'desc';
    }
    if ($table=='idRate') {
        $w->innerJoin('idSchedule');
        $select[] = 'idSchedule.datestart';
        $sidx = ['idSchedule.datestart desc'];
        //$sord = 'desc';
    }
}
