<?php

clubAllowOrigin();
ignore_user_abort(true);
set_time_limit(60);
error_reporting(E_ALL & ~E_NOTICE);

$json = array(
    'key' => $modx->getOption('club_key'),
    'vers' => $modx->getOption('vers'),
    'modules' => $modx->getOption('club_modules'),
    'modx' => $modx->getOption('settings_version'),
    'sp_arc' => getClubConfig('idSportsmen_arc'),
);


$sp_arc = "'". implode("','", explode(',', $json['sp_arc'])) ."'";
$q = $modx->newQuery('idSportsmen');
$q->select(array(
    "COUNT(IF(`status` NOT IN ($sp_arc), id, NULL)) as cnt_active",
    "COUNT(*) as cnt",
));
$stmt = $q->prepare();
$stmt->execute();
$json['idSportsmen'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

$q = $modx->newQuery('idFiles');
$q->select(array(
    "COUNT(*) as cnt",
));
$stmt = $q->prepare();
$stmt->execute();
$json['idFiles'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

$q = $modx->newQuery('idTrainer', array(
    'published' => 1,
));
$q->select(array(
    "COUNT(*) as cnt",
));
$stmt = $q->prepare();
$stmt->execute();
$json['idTrainer'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

$q = $modx->newQuery('idCity', array(
    'published' => 1,
));
$q->select(array(
    "COUNT(*) as cnt",
));
$stmt = $q->prepare();
$stmt->execute();
$json['idCity'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

$q = $modx->newQuery('idSchedule', array(
    'datestart >= DATE_ADD(NOW(), INTERVAL -1 MONTH)',
    'planfact' => 1,
));
$q->leftJoin('idLesson');
$q->select(array(
    "COUNT(DISTINCT idSchedule.id) as cnt",
    "COUNT(idLesson.id) as cnt_lesson",
));
$stmt = $q->prepare();
$stmt->execute();
$json['idSchedule'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

$q = $modx->newQuery('idInvoice', array(
    'dateinvoice >= DATE_ADD(NOW(), INTERVAL -1 MONTH)',
));
$q->select(array(
    "COUNT(*) as cnt",
    "SUM(`sum`) as `sum`",
));
$stmt = $q->prepare();
$stmt->execute();
$json['idInvoice'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

$q = $modx->newQuery('idLead', array(
    'created >= DATE_ADD(NOW(), INTERVAL -1 MONTH)',
));
$q->select(array(
    "COUNT(*) as cnt",
));
$stmt = $q->prepare();
$stmt->execute();
$json['idLead'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

$send = json_encode($json, JSON_UNESCAPED_UNICODE);

$ch = curl_init('https://w.sportcrm.club/hook/wgetstat');
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_POSTFIELDS, $send);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    'Content-Type: application/json',
));
$result = curl_exec($ch);
curl_close($ch);
