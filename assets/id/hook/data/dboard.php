<?php

$json = array(
    'club_city' => $city = $_SESSION['club_city'],
    'created' => date('c'),
    'sp_arc' => getClubConfig('idSportsmen_arc'),
    'ugroups' => $ugroups = $modx->user->getUserGroupNames(),
);

$w_sp = array(
    'idSportsmen.city' => $city
);
clubWhereIN($w_sp, $json['sp_arc'], 'idSportsmen.status', '!');
$modx->loadClass('idSportsmen');

function dboardSportsmen($_w) {
    global $modx;
    $q_sp = $modx->newQuery('idSportsmen');
    if (!empty($_POST['_where'])) {
        $_w = array_merge($_POST['_where'], $_w);
    }
    if (!empty($_w['idSquad.club'])) {
        $q_sp->innerJoin('idSquad');
    }
    $q_sp->where($_w);
    return $q_sp;
}
$q_sp = dboardSportsmen($w_sp);

$select_sp = array(
    'city as id',
    "count(idSportsmen.id) AS cnt_all",
    "count(if((isnull(idSportsmen.meddate) or (idSportsmen.meddate < now())), 1, NULL)) AS cnt_med",
    "count(if((isnull(idSportsmen.insdate) or (idSportsmen.insdate < now())), 1, NULL)) AS cnt_ins",
    "count(if((idSportsmen.saldo < 0), 1, NULL)) AS cnt_minus",
    "count(if((idSportsmen.saldo > 0), 1, NULL)) AS cnt_plus",
    //"count(if((idSportsmen.status = 'Больничный'), 1, NULL)) AS cnt_boln",
    //"count(if((idSportsmen.status = 'Отпуск'), 1, NULL)) AS cnt_otp",
    //"count(if((idSportsmen.status = 'Обещанный платеж'), 1, NULL)) AS cnt_waitpay",
);

$show_money = explode(',', 'idAnalytics,idAdmin');
if (!empty(array_intersect($ugroups, $show_money))) {
    $json['show_money'] = true;
    $select_sp[] = "sum(if((idSportsmen.saldo < 0), idSportsmen.saldo, 0)) AS sum_minus";
    $select_sp[] = "sum(if((idSportsmen.saldo > 0), idSportsmen.saldo, 0)) AS sum_plus";
    $modx->map['idSportsmen']['fieldMeta']['sum_minus'] = array('phptype' => 'float');
    $modx->map['idSportsmen']['fieldMeta']['sum_plus'] = array('phptype' => 'float');
}
if (in_array('idManager', $ugroups) || $json['show_money']) $json['show_stat'] = true;

$q_sp->select($select_sp);
$sp_dboard = $modx->getObject('idSportsmen', $q_sp);
$json['dboard'] = $sp_dboard->toArray('', false, true);
//foreach($modx->getIterator('idSportsmen', $q_sp) as $row) $json['rows'][] = $row->toArray();

$json["w_sp"] = $w_sp;
$q_sp = dboardSportsmen($w_sp);
$q_sp->select(array(
    "`status` AS name",
    "count(idSportsmen.id) AS cnt_all",
));
$q_sp->groupby('idSportsmen.status');
$stmt = $q_sp->prepare();
//$json["sql"] = $q_sp->toSQL();
$stmt->execute();
$json['cnt_status'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

if ($rq['2']=='start') {
    $modx->runSnippet('dbvalues', array(
        'mode' => 'idClub',
        'city' => 'my',
        'placeholder' => 'dboardValues',
    ));
    $json['dbvalues'] = $modx->getPlaceholder('dboardValues');

    # Дни рождения
    $json['cnt_birth_sp'] = $modx->getCount('idSportsmen', array_merge($w_sp, array(
        "(DATE_FORMAT(birth, CONCAT(YEAR(NOW()), '-%m-%d')) BETWEEN DATE_SUB(NOW(), INTERVAL 1 DAY) AND NOW())",
    )));
    
    $json['cnt_birth_tr'] = $modx->getCount('idTrainer', array(
        'published' => 1,
        'city' => $city,
        "(DATE_FORMAT(birth, CONCAT(YEAR(NOW()), '-%m-%d')) BETWEEN DATE_SUB(NOW(), INTERVAL 1 DAY) AND NOW())",
    ));
}