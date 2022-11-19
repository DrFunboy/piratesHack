<?php

$key = "{$table}.birth";
if ($where[$key] == 'today') {
    $where[] = "DATE_FORMAT({$key},'-%m-%d') = DATE_FORMAT(NOW(),'-%m-%d')";
}
if ($where[$key] == 'tomorrow') {
    $where[] = "DATE_FORMAT({$key},'-%m-%d') = DATE_FORMAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),'-%m-%d')";
}
if ($where[$key] == 'thisweek') {
    $where[] = "DATE_FORMAT({$key}, CONCAT(YEAR(NOW()), '-%m-%d')) 
    BETWEEN DATE_ADD(DATE(NOW()), INTERVAL -WEEKDAY(NOW()) DAY) AND DATE_ADD(DATE_ADD(DATE(NOW()), INTERVAL -WEEKDAY(NOW()) DAY), INTERVAL 7 DAY)";
}
if ($where[$key] == 'nextweek') {
    $where[] = "DATE_FORMAT({$key}, CONCAT(YEAR(NOW()), '-%m-%d')) 
    BETWEEN DATE_ADD(DATE_ADD(DATE(NOW()), INTERVAL -WEEKDAY(NOW())DAY), INTERVAL 7 DAY) AND DATE_ADD(DATE_ADD(DATE( NOW()), INTERVAL -WEEKDAY(NOW())DAY), INTERVAL 14 DAY)";
}
if ($where[$key] == 'thismonth') {
    $where[] = "DATE_FORMAT({$key}, CONCAT(YEAR(NOW()), '-%m-%d')) 
    BETWEEN DATE_FORMAT(NOW(), '%Y-%m-01') AND  LAST_DAY(NOW())";
    //CAST(DATE_FORMAT(NOW(), '%Y-%m-01') as DATE)
}
if ($where[$key] == 'nextmonth') {
    $where[] = "DATE_FORMAT({$key}, CONCAT(YEAR(NOW()), '-%m-%d')) 
    BETWEEN 
    DATE_FORMAT(DATE_ADD(NOW(), INTERVAL 1 MONTH), '%Y-%m-01')
    AND 
    LAST_DAY( DATE_ADD(NOW(), INTERVAL 1 MONTH) )";
}

unset($where[$key]);