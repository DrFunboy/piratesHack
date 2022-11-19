<?php
//$modx->log(modX::LOG_LEVEL_ERROR, json_encode($data, JSON_UNESCAPED_UNICODE));

$data = ($data)? : $_REQUEST;

if (!empty($row)) {
    $table = $row->_class;
    if (!$data['oper']) $data['oper'] = $row->_new? 'add' : 'edit';
    if (!$data["id"] && $data['oper']!='add') $data["id"] = $row->get('id');
} else {
    $table = $data['table'];
}
$oper = $modx->getOption('oper', $data, 'add');
$ids = array_filter(explode(',', $data["id"]? :'')); //  Все пустые значения массива будут удалены. Смотрите empty()
$out = array(
    'user_id' => $userID = $modx->scrm->user,
    'table' => $table,
);

if (empty($table) || ($oper !== 'add' && empty($ids)) ){ // || empty($userID)
    $out['error'] = 'Error: empty important param';
} else {
    $flds = $modx->getFieldMeta($table);

    unset($data["author"]);
    unset($data["edited"]);
    unset($data["editedby"]);

    $data_path = CRM_PATH."edit/{$table}_{modify,$oper}*_";
    foreach (glob($data_path."before.php", GLOB_BRACE) as $data_handler) {
        require($data_handler);
    }

    $out['oper'] = $oper;
    if (!empty($row)) {
        $ids = [ $row->get('id') ]; // Может в обработчике появиться $row
    }
    
    unset($flds["id"]);
    unset($flds["created"]);

    if (in_array($oper, ["add", "edit"])) {
        $e_array = array();
        
        if ($oper=="add") {
            $data['author'] = $userID;
            if (array_key_exists('city', $flds) && !$data['city'] && $_SESSION['club_city']) $data['city'] = $_SESSION['club_city'];
        } else {
            $data['edited'] = date('c');
            $data['editedby'] = $userID;
        }
        
        foreach ($flds as $_f => $fld) {
            if (array_key_exists($_f, $data)) {
                $_value = $data[$_f];
                if (in_array($fld['dbtype'], ['timestamp', 'datetime', 'date', 'smallint'])) {
                    if (empty($_value)) $_value = ($fld['null'] == 1)? null : '';
                    if (gettype($_value) == 'string' && strlen($_value) == 4) $_value.= '-01-01';
                } elseif ($fld['phptype'] == 'json') {
                    if (!empty($_value) && gettype($_value)=='string') $_value = json_decode($_value, true);
                    if (empty($_value)) $_value = null;
                } elseif ($fld['phptype'] == 'string') {
                    $_value = trim($_value);
                    if ($_f == 'email') {
                        $_value = $email = strtolower($_value);
                    }
                }
                $e_array[$_f] = $_value;
            }
        }
        //clubLog('dbedit', $data);
        
        if ($oper == "add") {
            $mfield = $data['addmulti'];
            foreach (explode(',', $data[$mfield]) as $mvalue) {
                if (!empty($mfield)) $e_array[$mfield] = $mvalue;
                if (($row = $modx->newObject($table, $e_array)) != null) {
                    $row->save();
                    $ids[] = $row->get('id');
                }
            }
        } elseif (sizeof($ids) == 1) { //редактируется один элемент
            if (empty($row)) $row = $modx->getObject($table, $ids[0]);
            if (!empty($row)) {
                $old_data = $row->toArray();
                $row->fromArray($e_array);
                $row->save();
            }
        } else {
            $out['result'] = $modx->updateCollection($table, $e_array, array("id:IN" => $ids));
        }
        
        $out['data'] = $e_array;
    } // END add or edit
    
    if ( $oper == "del" ) {
        if (empty($del_rows)) $del_rows = $modx->getIterator($table, array('id:IN' => $ids));
        foreach ($del_rows as $del_row) {
            $del_row->remove();
        }
        //$modx->removeCollection($table, array("id:IN" => $ids));
    }
    
    $out['ids'] = $ids;
    $out['id'] = implode(',', $ids);

    foreach (glob($data_path."after.php", GLOB_BRACE) as $data_handler) {
        require($data_handler);
    }
    
    if (!empty($row)) {
        $modx->setPlaceholder($modx->getOption('placeholder', $scriptProperties, 'dbeditRow'), $row);
        $out['row'] = $row->toArray();
    }
}

return json_encode($out, JSON_UNESCAPED_UNICODE);
return;
