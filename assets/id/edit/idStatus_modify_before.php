<?php

if ($oper=='add' && empty($data['alias'])) {
    $data['alias'] = uniqid();
}

if ($oper == 'del') {
    if (empty($row)) $row = $modx->getObject($table, $ids[0]);
    if (!empty($row->get('club_id'))) {
        $oper = '';
        $idStatus = unserialize( file_get_contents(CRM_PATH . 'setup/clubStatus.txt') );
        $data = $idStatus[ $row->get('club_id') ];
        $data['edited'] = null;
        $data['editedby'] = 0;
        $row->fromArray($data);
        $row->save();
    }
}