<?php
require_once('id_init.php');

$rq = ($rq)? : $_REQUEST;
$json = array(
    'table' => $table = $rq["table"],
    'club_city' => $_SESSION['club_city'],
    'rows' => array(),
    'created' => date('c'),
);
if (!empty($rq['d1'])) {
    $d1 = (new DateTime($rq['d1']))->format('Y-m-d 00:00:00');
    if (!empty($rq['d2'])) $d2 = (new DateTime($rq['d2']))->format('Y-m-d 23:59:59');
}

if (!empty($table)){
    $w = $modx->newQuery($table);
    $where = array();
    $select = array();
    $groupby = array();
    
    $fields = $modx->getFieldMeta($table);
    $fld_names = array_keys($fields);
	foreach ($fld_names as $_k) {
		$select[] = "{$table}.{$_k}";
	}

	if (!empty($rq['id'])) {
        $where["{$table}.id"] = $rq['id'];
    }

    if (!empty($rq['extype'])) {
        $w_extype = $rq['extype'];
        if (gettype($w_extype) == 'string') {
            $w_extype = ['wExtype.alias' => $w_extype];
        }
        // Если внешний тип, то включить свои правила
        if ($table != 'idExtid') {
            $wExtype = array(
                'wExtype.tbl' => 'idExtid',
                'wExtype.published' => 1,
            );
            if ($w_extype['wExtype.alias']) {
                $wExtype['wExtype.alias'] = $w_extype['wExtype.alias'];
                unset($w_extype['wExtype.alias']);
            }
            $w->innerJoin('idStatus', 'wExtype', $wExtype);
            $w_extype[] = "{$table}.id = idExtid.parent";
            $w_extype[] = "idExtid.extype = wExtype.id";
            
            if ($w_extype['join'] == 'leftJoin') {
                unset($w_extype['join']);
                $w->leftJoin('idExtid', 'idExtid', $w_extype);
            } else {
                $w->innerJoin('idExtid', 'idExtid', $w_extype);
            }
            $select[] = 'idExtid.extid';
            $select[] = 'idExtid.extoken';
            $select[] = 'idExtid.extended as extid_extended';
        } else {
            $where = array_merge($where, $w_extype);
        }
    }

    $rq_where = $rq['_where'];
    if (!empty($rq_where)) {
        if (gettype($rq_where)!=='array') {
            if ($rq_where[0]=='{') {
                // Закодирован методом JSON.stringify
                $rq_where = json_decode($rq_where, true);
            } else {
                // Строка с разделителями
                $rq_where = array();
                foreach(explode(';', $rq['_where']) as $where_row) {
                    $where_row_a = explode('=', $where_row);
                    $rq_where[ $where_row_a[0] ] = $where_row_a[1];
                }
            }
        } 
        foreach($rq_where as $where_key => $where_val) {
            clubWhereIN($where, $where_val, $where_key);
        }
    }

    if ((!empty($rq['filters']) && $rq['_search'] != 'false') || $rq['_search'] == 'true') {
    	$searchData = !empty($rq['filters']) ? json_decode($rq['filters'], true) : array(
		    'groupOp' => 'AND',
            'rules' => array(
                array(
                    'field' => $rq['searchField'],
                    'op' => $rq['searchOper'],
                    'data' => $rq['searchString'],
                )
            ),
        );

    	$orcond = (!empty($searchData['groupOp']) && $searchData['groupOp'] == 'OR')? 'OR:' : ''; 
        foreach ($searchData['rules'] as $n => $rule) {
            $str = $rule['data'];
            $field = $rule['field'];
            $wfld = ($n > 0)? $orcond.$field : $field;
            switch ($rule['op']) {
            case 'eq': $where["$wfld"] = ($str=='*')? '' : $str; break;
            case 'ne': $where["$wfld:!="] = $str; break;
            case 'bw': $where["$wfld:LIKE"] = "$str%"; break;
            case 'cn': $where["$wfld:LIKE"] = "%$str%"; break;
            case 'lt': $where["$wfld:<"] = $str; break;
            case 'le': $where["$wfld:<="] = $str; break;
            case 'gt': $where["$wfld:>"] = $str; break;
            case 'ge': $where["$wfld:>="] = $str; break;
            case 'in': $where["$wfld:IN"] = explode(',', $str); break;
            case 'db': $svalue = explode(';', $str);
                if (sizeof($svalue) == 2) {
                    $s_d1 = (new DateTime($svalue[0]))->format('Y-m-d 00:00:00');
                    $s_d2 = (new DateTime($svalue[1]))->format('Y-m-d 23:59:59');
                    $where[] = "$field BETWEEN '$s_d1' AND '$s_d2'";
                } else {
                    $where["$wfld"] = $str;
                }
                break;
            }
        }
    }

    $sidx = (empty($rq["sidx"]))? array() : explode(',', $rq["sidx"]);
	$sord = empty($rq["sord"])? 'ASC' : $rq["sord"];
	
	/*if (!empty($id_userprops["filter_{$table}"])) {
	    $where = array_merge($where, $id_userprops["filter_{$table}"]);
	}*/
    
    if (in_array($table, array('idSportsmen','idTrainer','idClub'))) {
        $where['city'] = $_SESSION['club_city'];
    }
    
    $json['where11'] = $where;
    
    foreach (glob(CRM_PATH."data/*_{$table}.php") as $file){
        require($file);
    }
    
    if (!empty($rq['_report'])) {
        $f_report = $modx->scrm->sysFilePath("report/report_{$rq['_report']}.php");
        if ($f_report) require($f_report);
    }

    if (empty($sql)) {
        $w->select($select);
        
        if (!empty($where)) {
            /*foreach($where as $w_key => $w_val) {
                $new_key = "{$table}.{$w_key}";
                if (strpos($w_key, '.')===false && !isset($where[$new_key])) {
                    unset($where[$w_key]);
                    $where[$new_key] = $w_val;
                }
            }*/
            $w->where($where);
        }

        if (!empty($groupby)) foreach(array_unique($groupby) as $grb) $w->groupby($grb);
    
        //$count = $modx->getCount($table, $w);
        //$json["count"] = $count;
    
        $stmt = $w->prepare();
        $sql = $w->toSQL();
    }
    
    
    // Сортировка после SQL но до экпорта и т.п.
    foreach($sidx as $sx) {
        $asidx = explode(' ', trim($sx));
        $w->sortby($asidx[0], 
            (!empty($asidx[1]) && in_array(strtoupper($asidx[1]), ['ASC','DESC']))? $asidx[1] : $sord
        );
    }
    
    //if (!empty($rq["excols"])) require_once('id_data_export.php'); //EXIT

    $limit = $modx->getOption('rows', $rq, 15);
    if ($limit*1 !== 1001) {
        $page = $modx->getOption('page', $rq, 1);
        
        $cnt_stmt = $modx->query("SELECT COUNT(*) as cnt_rows {$totals} FROM ($sql) cnts");
        if ($cnt_stmt && $cnt_stmt->execute()) {
            $rowdata = $cnt_stmt->fetch(PDO::FETCH_ASSOC);
            $count = intval($rowdata['cnt_rows']);
            $json["userdata"] = $rowdata;
        }
        $total_pages = ( $count > 0 && $limit > 0)? ceil($count/$limit) : 0; 
        if ($page > $total_pages) $page = $total_pages;
        $start = $limit * $page - $limit;
        if ($start < 0) $start = 0;
        
        $json["total"] = $total_pages;
        $json["records"] = $count;
        $json["page"] = $page;
        
        $w->limit($limit, $start);
    }

    $json['where'] = $where;
    $stmt = $w->prepare();
    if ($_SESSION['club_debug']) $json["sql"] = $w->toSQL();
    
    $stmt->execute();
    $json["rows"] = $stmt->fetchAll(PDO::FETCH_ASSOC);
    /*while ($rowdata = $stmt->fetch(PDO::FETCH_ASSOC)) {    
        $json["rows"][] = $rowdata;
    }*/
    if (!empty($rq['_process'])) {
        $f_process = $modx->scrm->sysFilePath("data/process_{$rq['_process']}.php");
        if ($f_process) require($f_process);
    }

    $json['fields'] = $fields;
    $json['field_names'] = implode(',', $fld_names);
}

if (!empty($rq["_export"])){
    $modx->runSnippet('createDoc', array(
        'data' => $json,
        'handler' => $rq["_export"],
        'doc_type' => $modx->getOption('doc_type', $rq, 'xlsx'),
    ));
}

if (!empty($rq['dbvalues'])) {
    $modx->runSnippet('dbvalues', array(
        'mode' => $rq['dbvalues'],
        'city' => isset($rq['dbvalues_city'])? $rq['dbvalues_city'] : 'my',
        'lessdata' => 1,
        'placeholder' => 'dbValues',
    ));
    $json['dbvalues'] = $modx->getPlaceholder('dbValues');
}

if (!empty($rq['clubStatus'])) {
    if (gettype($rq['clubStatus'])==='array') $rq['clubStatus'] = implode(',', $rq['clubStatus']);
    $json['clubStatus'] = getClubStatus($rq['clubStatus']);
}

if (!empty($rq['clubConfig'])) {
    $json['clubConfig'] = clubConfig($rq['clubConfig']);
}

$json['q'] = $modx->executedQueries;

echo json_encode($json, JSON_UNESCAPED_UNICODE);
