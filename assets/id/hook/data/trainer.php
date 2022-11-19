<?php
if (!isCrew()) dieJSONForbidden();

$w = array();
$key = $_REQUEST["key"];
if (!empty($key)){
    $w['uid'] = $key;
} elseif (!empty($email)) {
    $w['email'] = $email;
}

$json = array();
if (!empty($w)) {
    $wtr = $modx->newQuery('idTrainer', $w);
    $wtr->leftJoin('modUser', 'idUser');
    $wtr->select(array(
        'idTrainer.*',
        'idUser.username',
    ));

    $m = $modx->getObject('idTrainer', $wtr);
    if (!empty($m)){
        $json = $m->toArray();

        $modx->runSnippet('clubFiles', array(
            'uid' => $json['uid'],
            'cls' => 'idTrainer',
            'thumb' => 'tr_photo:md,thumb',
        ));
        $json['files'] = $files = $modx->getPlaceholder('clubFiles');
    } else {
        $json['error'] = 'Not found';
    }
} else $json['error'] = 'Empty param';
