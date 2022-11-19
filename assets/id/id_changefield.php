<?php
require_once('id_init.php');

$out = array(
    "rows" => array(),
    "old" => array(),
    "ids" => $_REQUEST['ids'],
);

$table = $out['table'] = $_REQUEST['table'];
$chfield = $out['chfield'] = $_REQUEST['chfield'];
$chvalue = $out['chvalue'] = $_REQUEST['chvalue'];

if (!empty($out['ids']) && !empty($table) && (mb_strlen($chvalue) > 0) && !empty($chfield)){
    $w = $modx->newQuery($table, array(
        "id:IN" =>  $out['ids'],   
    ));
    
    //$stmt = $w->prepare();
    //$out["sql"] = $w->toSQL();
    
    foreach($modx->getCollection($table, $w) as $row){
        $old = $row->get($chfield);
        $charray = explode(':', $chvalue);
        $chvalue0 = $charray[0];
        if ("{$old}" != "{$chvalue0}") {
            $out["old"][] = $old;
            $row->set($chfield, $chvalue0);
            $row->save();
            if ($table == 'idSportsmen'){
                $ch_insert = array(
                    'sportsmen' => $row->id,
                    'chfield' => $chfield,
                    'author' => $userID,
                    'oldvalue' => $old,
                    'newvalue' => $chvalue,
                    'info' => $_REQUEST['info']? :'',
                );
                if (sizeof($charray)>1){
                    $ch_insert["chid"] = $chvalue0;
                    $ch_insert["newvalue"] = $charray[1];
                }
                
                $ch = $modx->newObject('idChanges', $ch_insert);
                $ch->save();
                $out["rows"][] = $row->get('name');
            }
        }
    }
}

echo json_encode($out);