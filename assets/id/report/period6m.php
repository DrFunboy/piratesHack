<?php

$period = array();
$d1 = new DateTime('first day of this month');
for ($i = 0; $i < 6; $i++) {
    $d2 = clone $d1;
    $d2->modify("+1 month -1 day");
    $period[$i] = array(
        'name' => strftime('%m.%Y', $d1->getTimestamp()),
        'd1' => $d1->format('Y-m-d 00:00:00'),
        'd2' => $d2->format('Y-m-d 23:59:59'),
        'm' => $d1->format("m"),
    );
    $d1->modify("-1 month");
}
$json['period'] = $period;
$d2 = $period[0]['d2'];
$d1 = end($period)['d1'];