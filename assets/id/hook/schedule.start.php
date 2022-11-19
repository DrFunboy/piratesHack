<?php

$start_id = $modx->getOption('start_id', $_REQUEST, 0);
// TODO: Права на проведение занятия

$json = array();

if (!empty($start_id)) {
    $start_w = array(
        'table' => 'idSchedule',
        'start_id' => $start_id,
        'datestart' => $_REQUEST['datestart'],
    );
    
    $json['startSchedule'] = $modx->runSnippet('dbedit', array(
        'data' => $start_w,
        'placeholder' => 'startSchedule',
    ));
    $startSchedule = $modx->getPlaceholder('startSchedule');
    if (empty($startSchedule)) {
        $json['error'] = 'Empty startSchedule';
    } else {

        $json['idSchedule'] = $startSchedule->toArray();
    
        /*$squad = $startSchedule->get('squad');
        if (!empty($squad)) {
            // Найти спортсменов в группе по расписанию не в архиве, которые на этом занятии еще не были записаны и добавить на занятие
            // TODO: Спортсмены не будут в группе когда будут отправлены в архив
            $wmembers = $modx->newQuery('idSportsmen', array(
                'status:!=' => 'Архив',
                array(
                    "squad" => $squad,
                    "OR:idSportsmenSquad.squad:=" => $squad,
                ),
            ));
            $wmembers->leftJoin('idSportsmenSquad');
            $wmembers->leftJoin('idLesson','lsn',"lsn.sportsmen = idSportsmen.id AND lsn.schedule = $start_id");
            $wmembers->select(array(
                'idSportsmen.id',
                'idSportsmen.name',
                'COUNT(lsn.id) as cnt',
            ));
            $wmembers->groupby('idSportsmen.id');
            $stmt = $wmembers->prepare();
            $json['debug'] = $wmembers->toSQL();
            foreach($modx->getIterator('idSportsmen', $wmembers) as $mrow) {
                if ($mrow->get('cnt') == 0) {
                    $ins_data = array(
                        'table' => 'idLesson',
                        //'oper' => 'add',
                        'status' => 'n',
                        'sportsmen' => $mrow->get('id'),
                        'schedule' => $start_id,
                    );
                    $result = $modx->runSnippet('dbedit', array("data" => $ins_data));
                    $json['rr'][] = json_decode($result, true);
                }
            }
        }*/
        
        /*$idLesson = $modx->getTableName('idLesson');
        $idSportsmenSquad = $modx->getTableName('idSportsmenSquad');
        $idSportsmen = $modx->getTableName('idSportsmen');*/
        
        /* Если какой-то конкретный спортсмен, то поставить отметку */ 
        
        $sportsmen = $modx->getOption('sportsmen', $_REQUEST, 0);	
        if (!empty($sportsmen)) {
            $w = array(
                'table' => 'idLesson',
                'start_id' => $startSchedule->get('id'),
                'sportsmen' => $sportsmen,
                'status' => 'y',
            );
            $result = $modx->runSnippet('dbedit', array(
                'data' => $w,
            ));
        }
    }
}

/*$modx->query("INSERT INTO {$idLesson}
    SET `sportsmen` = $sportsmen,
        `schedule` = $start_id,
        `status` = 'y'
    ON DUPLICATE KEY UPDATE `status` = 'y'");
*/