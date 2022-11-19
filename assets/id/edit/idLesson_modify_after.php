<?php

$_edited = ($oper=='edit' && sizeof($ids) > 1) || (!empty($old_data) && $e_array['status'] != $old_data['status']);

if ($_edited) {
    $modx->updateCollection('idLesson', array('idinvoice' => 0), array('id:IN' => $ids));
}

// если новая запись, если редактирование группы (отметить всех), если редактировали один и статус не равен
if ($oper=='add' || $_edited) {
    $iw = $modx->newQuery('idLesson', array(
        'id:IN' => $ids,
    ));
    $iw->innerJoin('idSchedule');
    $iw->innerJoin('idInvoice', 'inv', 'inv.sportsmen = idLesson.sportsmen AND inv.dateinvoice <= idSchedule.datestart AND inv.duedate >= idSchedule.datestart');
    $iw->innerJoin('idSInvType', 'sit', 'sit.typeinvoice = inv.typeinvoice AND sit.stype = idSchedule.stype');
    $iw->innerJoin('idConfig', 'cfg', "cfg.name = CONCAT('schedule_', sit.stype) AND cfg.val LIKE CONCAT( '%', idLesson.`status`, '%' )");
    $iw->leftJoin('idLesson', 'lsn', "lsn.idinvoice = inv.id");
    $iw->select(array(
        'idLesson.*',
        'inv.id as id_invoice',
        'cfg.val as cfg_value',
        'inv.lesson_amount',
        'COUNT(lsn.id) as cnt_lesson',
    ));
    $iw->groupby('idLesson.id, inv.id');
    $iw->having('(inv.lesson_amount=0) OR (inv.lesson_amount > cnt_lesson)');
    $iw->sortby('inv.dateinvoice');
    
    //$iw->prepare();
    //$out['sql_idLesson'] = $iw->toSQL();
    
    $les = array();
    foreach($modx->getIterator('idLesson', $iw) as $rles) {
        $r = $rles->toArray();
        if (!in_array($r['id'], $les)) {
            if (!empty($row) && ($row->get('id') == $r['id'])) {
                $row->set('idinvoice', $r['id_invoice']);
            }
            $rles->set('idinvoice', $r['id_invoice']);
            $rles->save();
            $les[] = $r['id'];
        }
    }
    //$out['les'] = $les;
}
