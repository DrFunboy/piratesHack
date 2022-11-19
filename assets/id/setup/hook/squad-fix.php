<?php

echo "SquadFix";

$modx->removeCollection('idSportsmenSquad', array('sportsmen' => 0));

    $modx->updateCollection('idSportsmenSquad', array(
        'published' => null,
        'dateend' => '2020-08-31',
        'editedby' => 0,
    ), array(
        "sportsmen IN (SELECT id FROM {$idSportsmen} where status = 'Архив')",
        'dateend' => null,
    ));
$qarcSquad = $modx->newQuery('idSportsmen', array(
    'status' => 'Архив',
    'squad' => 0,
));
$qarcSquad->innerJoin('idSportsmenSquad');
$qarcSquad->groupby('idSportsmen.id');
$qarcSquad->select(array(
    'idSportsmen.id',
    'idSportsmen.squad',
    'MAX(idSportsmenSquad.dateend) as dateend',
));

foreach ($modx->getCollection('idSportsmen', $qarcSquad) as $row) {
    //print_r($row->toArray());
    $qssq = $modx->newQuery('idSportsmenSquad', array(
        'sportsmen' => $row->get('id'),
        'dateend' => $row->get('dateend'),
        //"idSquad.name NOT LIKE '%Online%'",
        //"idSquad.name NOT LIKE '%Онлайн%'",
        //"idSquad.name NOT LIKE '%Вратари%'",
        //"idSquad.name NOT LIKE '%Улица%'",
        //"idSquad.name NOT LIKE '%параллель%'",
    ));
    $qssq->innerJoin('idSquad');
    $qssq->select(array(
        'idSportsmenSquad.sportsmen as id',
        'idSportsmenSquad.dateend',
        'GROUP_CONCAT(DISTINCT idSportsmenSquad.squad ORDER BY idSportsmenSquad.squad) as sq',
        'COUNT(*) as cnt',
    ));
    $qssq->groupby('idSportsmenSquad.sportsmen');
    //$qssq->prepare();
    //echo $qssq->toSQL();
    foreach ($modx->getIterator('idSportsmenSquad', $qssq) as $rowssq) {
        //print_r($rowssq->get('cnt'));
        if ($rowssq->get('cnt') > 1) {
            echo "{$rowssq->get('id')} - {$rowssq->get('cnt')}<br>";
            //print_r($rowssq->toArray());
        } else {
            $sp = $modx->getObject('idSportsmen', $row->get('id'));
            //echo "-{$rowssq->get('sq')}-<br>";
            $sp->set('squad', $rowssq->get('sq'));
            $sp->save();
            //print_r($rowssq->toArray());
        }
    }
}