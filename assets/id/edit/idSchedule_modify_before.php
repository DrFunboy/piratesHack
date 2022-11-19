<?php

if (isset($data['duration'])) { // лажа какая-то
    $tformat = 'Y-m-d H:i:00';
    $duration = $modx->getOption('duration', $data, 45);
    $dt_start = new DateTime( $modx->getOption('datestart', $data, 'now +1day') );
    $data['datestart'] = $dt_start->format($tformat);
    $data['dateend'] = $dt_start->modify ("+{$duration} minutes")->format($tformat);
}

if (!empty($data['start_id'])) {
    if (empty($row)) $row = $modx->getObject($table, $data['start_id']);
    if (empty($row)) {
        $oper = '';
    } else {
        $oper = 'edit';
        $parent_data = $row->toArray();

        if (!empty($parent_data['repeat'])) {
            $start_w = array(
                'parent' => $parent_data['id'],
                'datestart' => $data['datestart'],
            );
            $row = $modx->getObject('idSchedule', $start_w);
            if (empty($row)) {
                $oper = 'add';
                $data = array_merge($data, $parent_data, $start_w, array(
                    // TODO: Исправить на Duration
                    'dateend' => (new DateTime($data['datestart']))->format('Y-m-d ') . (new DateTime($parent_data['dateend']))->format('H:i:00'),
                    'repeat' => 0,
                ));
            }
        }
        $data['planfact'] = 1; // TODO: Может и не 1, может будет начато но не фактически
    }
}

if ($oper=='edit' && isset($data['planfact']) && $data['planfact'] < 0) {
    // Отменить занятие. Если нет родителя, меняет планфакт и удаляет Lesson, Иначе удаляет запись и автоматом тянет за собой Lesson
    if (empty($row)) $row = $modx->getObject($table, $data['id']);
    if (empty($row->get('parent'))) {
        $data['planfact'] = 0;
        $modx->removeCollection('idLesson', array(
            'schedule' => $row->get('id'),
        ));
    } else {
        $oper='del';
    }
}
