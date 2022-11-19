<?php

clubWhereIN($where, $json['sp_arc'], 'idSportsmen.status', '!');
$ugroups = $modx->user->getUserGroupNames();

$mode = $modx->getOption('_mode', $rq, '');
$rq['rows'] = 1001;
switch ($mode) {
    case '':
    case 'dboard':
        $json['ugroups'] = $ugroups;
        $select = array(
            "sum(idSportsmen.saldo) AS sum_saldo",
            "count(idSportsmen.id) AS cnt_all",
            "count(if((isnull(idSportsmen.meddate) or (idSportsmen.meddate < now())), 1, NULL)) AS cnt_med",
            "count(if((isnull(idSportsmen.insdate) or (idSportsmen.insdate < now())), 1, NULL)) AS cnt_ins",
            "count(if((idSportsmen.saldo < 0), 1, NULL)) AS cnt_minus",
            "count(if((idSportsmen.saldo > 0),1,NULL)) AS cnt_plus",
            "count(if((idSportsmen.status = 'Больничный'), 1, NULL)) AS cnt_boln",
            "count(if((idSportsmen.status = 'Отпуск'), 1, NULL)) AS cnt_otp",
            "count(if((idSportsmen.status = 'Обещанный платеж'), 1, NULL)) AS cnt_waitpay",
        );

        $show_money = explode(',', 'idAnalytics,idAdmin');
        if (!empty(array_intersect($ugroups, $show_money))) {
            $json['show_money'] = true;
            $select[] = "sum(if((idSportsmen.saldo < 0), idSportsmen.saldo, 0)) AS sum_minus";
            $select[] = "sum(if((idSportsmen.saldo > 0), idSportsmen.saldo, 0)) AS sum_plus";
        }
        if (in_array('idManager', $ugroups) || $json['show_money']) $json['show_stat'] = true;
        
        if ($mode==''){
            if (in_array('idAdmin', $ugroups)){
                unset($where['city']);
                $where['idCity.published'] = 1;
            }
            
            $w->innerJoin('idCity');
            $w->select(array(
                "idSportsmen.city",
                "idCity.name AS cityname",
                "idSquad.club AS club",
                "idClub.name AS clubname",
            ));
    
            array_push($sidx, 'cityname', 'clubname');
            array_push($groupby, 'idSportsmen.city', 'idSquad.club');
        }
        break;
    case 'status':
        $select = array(
            "`status` AS name",
            "count(idSportsmen.id) AS cnt_all",
        );
        
        $sidx[] = 'idSportsmen.status'; 
        $groupby[] = 'idSportsmen.status';
        
        break;
    case 'analytics':
        $select = array(
            "IFNULL(idSquad.club, 0) as club",
            "IFNULL(idSportsmen.squad, 0) as squad",
            "IFNULL(idSportsmen.trainer, 0) as trainer",
            "IFNULL(idSquad.sport, 0) as sport",
            
            "IFNULL(idClub.name, '---') as club_name",
            "IFNULL(idSport.name, '---') as sport_name",
            "IFNULL(idTrainer.name, '---') as trainer_name",
            "IFNULL(CONCAT(idLevel.name, ', ', idSquad.name), '---') as squad_name",
            "razr",
            "count(idSportsmen.id) AS cnt",
            "sum(if((idSportsmen.saldo < 0), idSportsmen.saldo, 0)) AS sum_minus",
            "sum(if((idSportsmen.saldo > 0), idSportsmen.saldo, 0)) AS sum_plus",
        );
        
        array_push($sidx, 'club_name', 'sport_name', 'squad_name', 'trainer_name');
        array_push($groupby, 'idClub.id', 'idSportsmen.squad', 'idSportsmen.sport', 'trainer_name', 'idSportsmen.razr');
}