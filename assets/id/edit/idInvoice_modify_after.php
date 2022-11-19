<?php
if ($oper=='add' && !empty($data['addpay']) && !empty($data['sum'])) {
    $add_data = array_merge($data, array(
        'table' => 'idPay',
        'datepay' => $data['dateinvoice'],
    ));
    $modx->runSnippet('dbedit', array(
        "data" => $add_data,
    ));
}

//($oper=='edit' && ($row->get('dateinvoice') != $old_data['dateinvoice'] || $row->get('duedate') != $old_data['duedate']))
/*if (in_array($oper, ['del', 'edit'])) {
    $modx->updateCollection('idLesson', array('idinvoice' => 0), array('idinvoice:IN' => $ids));
}

if (in_array($oper, ['add', 'edit'])) {
    $wInvoice = $modx->newQuery('idInvoice', array(
        'idInvoice.id:IN' => $ids,
        //'idInvoice.lesson_amount:>' => 0,
    ));
    $wInvoice->innerJoin('idSInvType');
    $wInvoice->innerJoin('idConfig', 'cfg', "cfg.name = CONCAT('schedule_', idSInvType.stype)");
    $wInvoice->select(array(
        'idInvoice.*',
        "GROUP_CONCAT(CONCAT(idSInvType.stype, ':', cfg.val)) as cfg_stype",
    ));
    $wInvoice->groupby('idInvoice.id');

    //$wInvoice->prepare();
    //$out['sql_idInvoice'] = $wInvoice->toSQL();

    foreach($modx->getIterator('idInvoice', $wInvoice) as $idInvoice) {
        $amount = $lsn_amount = $idInvoice->get('lesson_amount')*1;

        $w_stype = [];
        foreach(explode(',', $idInvoice->get('cfg_stype')) as $n => $cfg_stype) {
            $stype = explode(':', $cfg_stype);
            $w_stype[] = array(
                (($n>0)? 'OR:':'').'idSchedule.stype:=' => $stype[0],
                'idLesson.status:IN' => str_split($stype[1]),
            );
        }

        $wles = $modx->newQuery('idLesson', array(
            'idLesson.sportsmen' => $idInvoice->get('sportsmen'),
            'idLesson.idinvoice' => 0,
            'idSchedule.datestart:>=' => $idInvoice->get('dateinvoice'),
            'idSchedule.datestart:<=' => $idInvoice->get('duedate'),
            $w_stype,
        ));
        $wles->innerJoin('idSchedule');
        $wles->sortby('idSchedule.datestart');
        
        //$stmt = $wles->prepare();
        //$out['sql_idLesson'] = $wles->toSQL();
        foreach($modx->getCollection('idLesson', $wles) as $rles) {
            if ($lsn_amount>0 && $amount<1) break;
            $rles->set('idinvoice', $idInvoice->get('id'));
            $rles->save();
            $amount += -1;
        }
    }
}*/