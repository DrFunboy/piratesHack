<?php

$idSportsmenLesson = array();
$idLessonSchedule = $where['idLesson.schedule'];
if (!empty($idLessonSchedule)) {
    $idSchedule = $modx->getObjectGraph('idSchedule', '{"idEvent": {} }', $idLessonSchedule);
    $idSportsmenLesson = $idSchedule->toArray('', false, false, true); //['idSchedule']
    $idSportsmenLesson['stype_cfg'] = getClubConfig('schedule_'.$idSchedule->get('stype'));
    
    $modx->runSnippet('clubFiles', array(
        'uid' => "idSchedule{$idLessonSchedule}",
        'thumb' => 'photo_lesson:md,thumb',
    ));
    $idSportsmenLesson['photo'] = $modx->getPlaceholder('clubFiles');

    if (!empty($idSchedule->get('squad'))) {
        $idSportsmenLesson['leadStatus'] = array();
        $statusIN = array();
        foreach (getClubStatus('idLead') as $statusRow) {
            $idSportsmenLesson['leadStatus'][ $statusRow['alias'] ] = $statusRow;
            if (!empty($statusRow['extended']['idSchedule'])) { // Здесь может будет тип Урока (Инд. и гр.)
                $statusIN[] = $statusRow['alias'];
            }
        }
        
        $idSportsmenLesson['idLead'] = array();
        $qLead = $modx->newQuery('idLead', array(
            array(
                'squad' => $idSchedule->get('squad'),
                'OR:trainer:=' => $idSchedule->get('trainer'),
            ),
            'status:IN' => $statusIN,
        ));
        //$qLead->prepare();
        //$json['idLeadSQL'] = $qLead->toSQL();
        foreach($modx->getCollection('idLead', $qLead) as $leadRow) {
            $idSportsmenLesson['idLead'][] = $leadRow->toArray(); //'', false, false, true
        }
    }
}
$json['idSportsmenLesson'] = $idSportsmenLesson;