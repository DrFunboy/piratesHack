<?php
$rq['rows'] = 1001;
$sidx = array('idStatus.menuindex','idStatus.name');
$groupby = array('idSportsmen.status');
$select = array(
    'idSportsmen.status',
    'COUNT(_invdebt.duedate) as cnt',
    'COUNT(*) as cnt_all',
);