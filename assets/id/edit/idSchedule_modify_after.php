<?php

if (!empty($data['start_id']) && !empty($row)) {
    $schedule = $row->get('id');
    $squad = $row->get('squad');

    if (!empty($squad)) {
        /* Найти спортсменов в группе по расписанию не в архиве, которые на этом занятии еще не были записаны и добавить на занятие*/
        // TODO: Спортсмены не будут в группе когда будут отправлены в архив
        $wmembers = $modx->newQuery('idSportsmen', array(
            //'status:!=' => 'Архив',
            /*array(
                "squad" => $squad,
                "OR:idSportsmenSquad.squad:=" => $squad,
            ),*/
            'ssq.squad' => $squad,
        ));
        $wmembers->innerJoin('idSportsmenSquad', 'ssq', 'ssq.sportsmen = idSportsmen.id AND ssq.dateend IS NULL');
        $wmembers->leftJoin('idLesson','lsn',"lsn.sportsmen = idSportsmen.id AND lsn.schedule = {$schedule}");
        $wmembers->select(array(
            'idSportsmen.id',
            'idSportsmen.name',
            'COUNT(lsn.id) as cnt',
        ));
        $wmembers->groupby('idSportsmen.id');
        
        $stmt = $wmembers->prepare();
        $out['debugSchedueStart'] = $wmembers->toSQL();
        
        $idLesson_main = getClubConfig('idLesson_main');
        foreach($modx->getIterator('idSportsmen', $wmembers) as $mrow) {
            if ($mrow->get('cnt') == 0) {
                $ins_data = array(
                    'table' => 'idLesson',
                    'status' => $idLesson_main,
                    'sportsmen' => $mrow->get('id'),
                    'schedule' => $schedule,
                );
                $modx->runSnippet('dbedit', array('data' => $ins_data));
            }
        }
    }
}