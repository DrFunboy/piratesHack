<?php

if (empty($sidx)) $sidx = array('idSportsmen.name asc');

if (!empty($where['idSportsmen.birth'])) {
    require(CRM_PATH .'report/periods.php');
}

$w->innerJoin('idStatus', 'Gender');
$select[] = "Gender.name as gender_name";

if ($where["meddate"]=='0') {
    unset($where["meddate"]);
    $where[] = '((idSportsmen.meddate IS NULL) or (idSportsmen.meddate < NOW()))';
}
if ($where["insdate"]=='0') {
    unset($where["insdate"]);
    $where[] = '((idSportsmen.insdate IS NULL) or (idSportsmen.insdate < NOW()))';
}

if (!empty($where["id"]) && (strpos($where["id"], ',') !== false)) {
    $where['id:IN'] = explode(',', $where["id"]);
    unset($where["id"]);
}

if (!empty($where['evc.idevent']) || !empty($where['evc.id'])) {
    $w->innerJoin('idEventMember');
    $w->leftJoin('idEventCategory', 'evc', 'evc.id = idEventMember.ideventcategory');
    if (!empty($where['evc.idevent'])) {
        $where[] = array(
            'idEventMember.idevent' => $where['evc.idevent'],
            'OR:evc.idevent:=' => $where['evc.idevent'],
        );
        unset($where['evc.idevent']);
    }

    //$select[] = 'evc.name as eventcategory_name';
    //$select[] = 'idEventMember.id as ideventmember';
    $select[] = "idEventMember.idevent";
    $select[] = "idEventMember.team as ev_team";
    $select[] = "idEventMember.place as ev_place";
    $select[] = "idEventMember.result as ev_result";
    $select[] = "GROUP_CONCAT(evc.name SEPARATOR ', ') as eventcategory_name";
    //$where["idEventMember.idevent"] = $_REQUEST['idevent'];
    unset($where['city']);
    $groupby[] = 'idSportsmen.id';
}

if (isset($where['idLesson.schedule'])||isset($where['idLesson.id'])) {
    $w->innerJoin('idLesson');
    //$w->innerJoin('idSchedule');
    $w->select(array(
        'idLesson.id as lsn_id',
        'idLesson.status as lsn_status',
        'idLesson.info as lsn_info',
        'idLesson.idinvoice as lsn_invoice',
        'idLesson.mark as lsn_mark',
    ));
    unset($where['city']);
}

if (isset($where['trainer']) && $where['trainer']=='me') {
    if (!empty($userID)) {
        $sesname = 'sportsmen_trainer'; //.$_SESSION['club_city'] - у тренера могут быть разные города?
        if (empty($_SESSION[$sesname])) {
            $idTrainer = $modx->getObject('idTrainer', array('iduser' => $userID));
            $_SESSION[$sesname] = empty($idTrainer)? null : $idTrainer->get('id');
        }
        $json['sportsmen_trainer'] = $_SESSION[$sesname];
        unset($where['trainer']);
        unset($where['city']);
        $w->innerJoin('idTrainer', 'idTrainer', "idSportsmen.trainer = idTrainer.id AND idTrainer.iduser = $userID");
    } else {
        $json['error'] = 'Empty user';
    } 
} else {
    $w->leftJoin('idTrainer');
}

if (isset($where['iduser']) && $where['iduser']=='me') {
    if (!empty($userID)) {
        unset($where['city']);
        $where['iduser'] = $userID;
    } else {
        $json['error'] = 'Empty user';
    }
}

if (isset($where['squad'])||isset($where['squad:IN'])) {
    $sq_join = 'ssq_w.sportsmen = idSportsmen.id AND ssq_w.dateend IS NULL';
    if ($where['squad']=='-') {
        $w->leftJoin('idSportsmenSquad', 'ssq_w', $sq_join);
        $where['ssq_w.id'] = null;
    } else {
        // в конкретной группе
        $w->innerJoin('idSportsmenSquad', 'ssq_w', $sq_join);
        if (isset($where['squad'])) $where['ssq_w.squad'] = $where['squad'];
        if (isset($where['squad:IN'])) $where['ssq_w.squad:IN'] = $where['squad:IN'];
        if (isset($rq['sq_ismain'])) {
            if ($rq['sq_ismain']>0) {
                $where[] = 'ssq_w.squad = idSportsmen.squad';
            } else {
                $where[] = 'ssq_w.squad != idSportsmen.squad';
            }
        }
        $groupby[] = 'idSportsmen.id';
    }
    unset($where['squad'], $where['squad:IN']);
}


//$w->leftJoin('idSportsmenSquad', 'ssq', 'ssq.squad = idSportsmen.squad AND ssq.sportsmen = idSportsmen.id AND ssq.dateend IS NULL');
if (!empty($where['idSquad.club'])) {
    $w->innerJoin('idSquad');
    unset($where['city']);
} else {
    $w->leftJoin('idSquad');
}

$select[] = 'idSquad.club as club';
$select[] = 'idSquad.sport as sport';

if (empty($rq['lessdata'])) {
    $select[] = 'idTrainer.name as trainer_name';
    $select[] = 'idSquad.name as squad_name';
    
    $w->leftJoin('idLevel', 'idLevel', 'idLevel.id = idSquad.lvl');
    $select[] = 'idLevel.name as level_name';
    
    $w->leftJoin('idClub', 'idClub', 'idClub.id = idSquad.club');
    $select[] = 'idClub.name as club_name';
    
    $w->leftJoin('idSport', 'idSport', 'idSport.id = idSquad.sport');
    $select[] = 'idSport.name as sport_name';

    /* --- invles BEGIN --- */
    if (!empty($rq['_stype'])) {
        $wnow = array(
            'idInvoice.duedate >= NOW()',
            'idInvoice.dateinvoice <= NOW()',// DATE_ADD(NOW(), INTERVAL -1 MONTH)
        );
        $_stype = explode(',', $rq['_stype']);
        $wnow['idSInvType.stype:IN'] = $_stype;
        
        $wsit = "sit.typeinvoice = idInvoice.typeinvoice AND sit.stype = '{$rq['_stype']}'";
        
        $wles = $modx->newQuery('idInvoice', $wnow);
        $wles->innerJoin('idSInvType');
        //$wles->innerJoin('idSInvType', 'sit', $wsit);
        $wles->leftJoin('idLesson','les','les.idinvoice = idInvoice.id');
        $wles->select(array(
            'idInvoice.sportsmen',
            //'SUM(idInvoice.lesson_amount) as sum_amount',
            'idInvoice.lesson_amount',
            'idInvoice.duedate',
            //'SUM(IF(idInvoice.lesson_amount=0, 1, 0)) AS lesson0amount',
            //'COUNT(IF(idInvoice.lesson_amount>0, les.id, null)) AS cnt_lesson',
            //'SUM(idInvoice.lesson_amount) - COUNT(IF(idInvoice.lesson_amount>0, les.id, null)) as cnt_lesson',
            //'idInvoice.id',
            //'COUNT(IF(idInvoice.lesson_amount > 0, les.id, NULL)) AS cnt_lesson',
            'COUNT(les.id) AS cnt_lesson',
        ));
        $wles->groupby("idInvoice.id");
        //$wles->groupby("idInvoice.sportsmen");
        //$wles->having("lesson0amount > 0 OR cnt_lesson > 0");
        
        $wles->prepare();
        $sql_invles = $wles->toSQL();
        $sql_invles = "SELECT
            sportsmen, MAX(duedate) as duedate,
            SUM(IF(lesson_amount != 0, lesson_amount - cnt_lesson, 0 )) AS cnt_lesson
            FROM ($sql_invles) as inv_les
            WHERE lesson_amount = 0 OR lesson_amount > cnt_lesson
            GROUP BY sportsmen";
        $json['debug_invles1'] = $sql_invles;
        
        /*$wi = $modx->newQuery('idInvoice', $wnow);
        $wi->innerJoin('idSInvType', 'sit', $wsit);
        $wi->select(array(
            'idInvoice.sportsmen',
            'MAX(IF(idInvoice.lesson_amount = 0 OR idInvoice.lesson_amount > IFNULL(_invles.cnt_lesson, 0), idInvoice.duedate, NULL)) as duedate',
            'SUM(idInvoice.lesson_amount - IFNULL(_invles.cnt_lesson, 0)) as cnt_lesson',
        ));
        $wi->groupby("idInvoice.sportsmen");
        
        $wi->query['from']['joins'][] = array(
            "type" => "LEFT JOIN",
            "table" => "({$sql_invles})",
            "alias" => "_invles",
            "conditions" => array(
                new xPDOQueryCondition(array(
                    "sql" => "idInvoice.id = _invles.id",
                )),
            ),
        );
        
        $wi->prepare();
        $json['debug_invles2'] = $sql_invles = $wi->toSQL();*/
        
        
        
        $w->query['from']['joins'][] = array(
            "type" => "LEFT JOIN",
            "table" => "({$sql_invles})",
            "alias" => "_invdebt",
            "conditions" => array(
                new xPDOQueryCondition(array(
                    "sql" => "idSportsmen.id = _invdebt.sportsmen",
                )),
            ),
        );

        $select[] = '_invdebt.duedate';
        $select[] = '_invdebt.cnt_lesson';
        //$select[] = '_invdebt.cnt_lesson2';
    }
    if (isset($where['duedate'])) {
        if ($where['duedate'] == 0) {
            $where['_invdebt.duedate'] = null;
            /*$where[] = array(
                '_invdebt.cnt_lesson' => 0,
                'OR:_invdebt.cnt_lesson:=' => null,
            );*/
        } else {
            $where['_invdebt.cnt_lesson'] = $where['duedate'];
        }
        unset($where['duedate']);
    }
    /* --- invles END --- */
}

$json['sp_arc'] = getClubConfig('idSportsmen_arc');
if ($where['status']=='narc') {
    unset($where['status']);
    //$w->innerJoin('idStatus');
    clubWhereIN($where, $json['sp_arc'], 'idSportsmen.status', '!');
    /*array(
        'idStatus.alias:!=' => 'arc',
    );*/
    //$w->innerJoin('idStatus');
    //Не используется $select[] = 'idStatus.name as status_name';
    //$where['idStatus.alias:!='] = 'arc';
}

if (!empty($rq['tableadd'])){
    $groupby[] = 'idSportsmen.id';
    $idFiles_w = array('idFiles.uid = idSportsmen.key');
    if ($rq['tableadd'] == 'idPhoto') {
        $thumb_filetype = 'photo';
        $idFiles_w[] = "idFiles.filetype='{$thumb_filetype}'";
        $w->leftJoin('idFiles', 'idFiles', $idFiles_w);
        $select[] = "GROUP_CONCAT(CONCAT_WS('.', idFiles.key, idFiles.fileext, idFiles.incloud) SEPARATOR ',') as {$thumb_filetype}";
    }
    if ($rq['tableadd'] == 'idFiles') {
        if ($where['filedate']) {
            $idFiles_w[] = "idFiles.filetype='{$where['filedate']}'";
            unset($where['filedate']);
        }
        $w->leftJoin('idFiles', 'idFiles', $idFiles_w);
        $select[] = "MAX(idFiles.created) as filedate";
    }
    $w->leftJoin('modUser', 'idUser', 'idUser.id = idSportsmen.iduser');
    $select[] = 'idUser.username';
}

