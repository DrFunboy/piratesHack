<?php

if (!empty($row)) {
    $new_status = $row->get('status');
    if ($oper=='edit' && !empty($old_data) && $old_data['status'] != $new_status) {
        $makeMsg = true;
        
        $idStatus = getClubStatusAlias('idLead', $new_status);
        if (!empty($idStatus)) {
            $ext = $idStatus['extended'];

            if (!empty($ext) && !empty($ext['idSportsmen'])) {
                $dataSportsmen = array(
                    'table' => 'idSportsmen',
                );
                
                $ldata = $row->toArray();
                if (!empty($ldata['sportsmen']) && empty($idSportsmen)) {
                    $idSportsmen = $modx->getObject('idSportsmen', $ldata['sportsmen']);
                }

                // Добавление в массив непустых незапрещенных колонок
                foreach ($ldata as $k => $val) {
                    if (!empty($val) && !in_array($k, ['id', 'status'])) {
                        if (!empty($idSportsmen) && !empty($idSportsmen->get($k))) continue; // Если поле заполнено в Sportsmen, то не обновлять!
                        $dataSportsmen[$k] = $ldata[$k];
                    }
                }

                $dataSportsmen['oper'] = empty($idSportsmen)? 'add' : 'edit';
                $dataSportsmen = array_merge($dataSportsmen, $ext['idSportsmen']); // Обычно в $ext только Статус, но может быть и еще что-то

                $out['idSportsmen'] = $modx->runSnippet('dbedit', array(
                    'data' => $dataSportsmen,
                    'placeholder' => 'extRow',
                    'row' => empty($idSportsmen)? null : $idSportsmen,
                ));
                $extRow = $modx->getPlaceholder('extRow');
                if (!empty($extRow) && ($extRow->get('id') != $ldata['sportsmen'])) {
                    $row->set('sportsmen', $extRow->get('id'));
                    $row->save();
                }
            }
        }
    }
    
    /*if (!empty($data['ext_data']) && !empty($data['ext_data']['table'])) {
        $ldata = $row->toArray();
        foreach($ldata as $k => $val)
            if(empty($val) || in_array($k, ['id','status','key']))
                unset($ldata[$k]);
        //unset($ldata['id'], $ldata['status'], $ldata['key']);
        $modx->runSnippet('dbedit', array(
            'data' => array_merge($ldata, $data['ext_data']),
            'placeholder' => 'extRow',
        ));
        $extRow = $modx->getPlaceholder('extRow');
        if ($data['ext_data']['table']=='idSportsmen' && !empty($extRow) && !empty($extRow->get('id'))){
            $row->set('sportsmen', $extRow->get('id'));
            $row->save();
        }
    }*/
    
    if ($oper=='add' || $makeMsg) {
        $data['idClub'] = '';
        if (!empty($row->get('club'))) {
            $leadClub = $modx->getObjectGraph('idClub', '{"idCity":{}}', $row->get('club'));
            $data['idClub'] = $leadClub->toArray('', false, false, true);
        }
        $modx->runSnippet('makeMsg', array(
            'handler' => "idLead_".$new_status,
            'data' => array_merge($data, $row->toArray()),
        ));
    }
}