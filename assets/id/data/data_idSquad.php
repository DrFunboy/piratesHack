<?php

$w->innerJoin('idClub', 'idClub');
$where['idClub.city'] = $_SESSION['club_city'];
//$select[] = 'idClub.`name` as club_name';

$w->leftJoin('idTrainer');
$select[] = 'idTrainer.`name` as trainer_name';

$w->leftJoin('idLevel');
$select[] = 'idLevel.`name` as level_name';

/*
$w->leftJoin('idSport');
$select[] = 'idSport.`name` as sport_name';
$select[] = 'idSport.shortname as ssport_name';*/

if ($rq['tableadd']=='idSportsmen') {
    $groupby[] = 'idSquad.id';

    $w->leftJoin('idSportsmenSquad', 'ssq', '(ssq.squad=idSquad.id AND ssq.dateend IS NULL)');
    
    if (isset($rq['sq_ismain'])) {
        $w->leftJoin('idSportsmen', 'ssq_sp', '(ssq_sp.squad=ssq.squad AND ssq_sp.id=ssq.sportsmen)');
        if ($rq['sq_ismain']>0) {
            $select[] = 'COUNT(ssq_sp.id) AS cnt_sportsmen';
        } else {
            $select[] = 'COUNT(IF(ssq_sp.id IS NULL, ssq.sportsmen, null)) AS cnt_sportsmen';
        }
    } else {
        //$select[] = 'COUNT(DISTINCT ssq.sportsmen) AS cnt_sportsmen';
        $select[] = 'COUNT(ssq.sportsmen) AS cnt_sportsmen';
    }
    
    $q2 = $modx->newQuery('idSchedule', array(
        array(
            'datestart > NOW()',
            'OR:repeat:=' => 1,
        ),
        'sch_club.city' => $_SESSION['club_city'],
    ));
    $q2->innerJoin('idSquad', 'sch_sq', 'sch_sq.id = idSchedule.squad AND sch_sq.published = 1');
    $q2->innerJoin('idClub', 'sch_club', 'sch_club.id = idSchedule.club AND sch_club.published = 1');
    $q2->innerJoin('idTrainer', 'sch_tr', 'sch_tr.id = idSchedule.trainer AND sch_tr.published = 1');
    // TODO: Убрать как только отработаем архив тренеров
    
    $q2->select(array(
        'idSchedule.squad',
        'COUNT(idSchedule.id) as cnt',
    ));
    $q2->groupby('idSchedule.squad');

    $q2->prepare();
    $q2sql = $q2->toSQL();

    $w->query['from']['joins'][] = array(
        'type' => 'LEFT JOIN',
        'table' => "({$q2sql})",
        'alias' => 'sch',
        'conditions' => array(
            new xPDOQueryCondition(array(
                "sql" => 'sch.squad = idSquad.id',
            )),
        ),
    );
    //$select[] = "SUM(IF(sp.`status` = 'Архив', 1, 0)) as cnt_arc";
    //$select[] = "SUM(IF(sp.`status` != 'Архив', 1, 0)) as cnt_sportsmen";
    $select[] = "sch.cnt as cnt_schedule";
    
    //$select[] = "(SELECT count(id) from {$modx->getTableName('idSchedule')} where squad = idSquad.id and planfact = 0) as cnt_schedule";
    
    if (!empty($rq['cnt_changes'])) {
        $q3 = $modx->newQuery('idSportsmenSquad', array(
            array(
                'created:>=' => $d1,
                'created:<=' => $d2,
            ),
            array(
                'OR:dateend:>=' => $d1,
                'dateend:<=' => $d2,
            ),
        ));
        $q3->select(array(
            'squad',
            "COUNT(DISTINCT IF(`created` BETWEEN '{$d1}' AND '{$d2}', sportsmen, null)) as cnt_plus",
            "COUNT(DISTINCT IF(`dateend` BETWEEN '{$d1}' AND '{$d2}', sportsmen, null)) as cnt_minus",
            //'idSportsmenSquad.created',
            //'idSportsmenSquad.dateend',
            //'idSportsmenSquad.sportsmen',
        ));
        $q3->groupby('squad');
    
        $q3->prepare();
        $q3sql = $q3->toSQL();
        $json['debug3'] = $q3sql;
    
        $w->query['from']['joins'][] = array(
            "type" => "LEFT JOIN",
            "table" => "({$q3sql})",
            "alias" => "cnt_changes",
            "conditions" => array(
                new xPDOQueryCondition(array(
                    "sql" => "cnt_changes.squad = idSquad.id",
                )),
            ),
        );
        $select[] = 'cnt_changes.cnt_plus';
        $select[] = 'cnt_changes.cnt_minus';
        //$select[] = "SUM(IF(cnt_changes.`created` BETWEEN '{$d1}' AND '{$d2}')) as cnt_plus";
        //$select[] = "SUM(IF(cnt_changes.`dateend` BETWEEN '{$d1}' AND '{$d2}')) as cnt_minus";
    } else {
        if (sizeof(array_intersect(['cnt_plus','cnt_minus'],$sidx))>0) $sidx = ['cnt_sportsmen'];
    }
}

if (empty($sidx)) {
    $w->sortby("idClub.name", "asc");
    $w->sortby("idLevel.name", "asc");
    $w->sortby("idSquad.name", "asc");
}

