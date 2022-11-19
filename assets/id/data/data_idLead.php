<?php

$w->innerJoin('idStatus', 'Gender');
$select[] = "Gender.name as gender_name";

if ($where['status']=='narc') {
    unset($where['status']);
    //$w->innerJoin('idStatus');
    $arc = getClubConfig('idLead_arc');
    if (!empty($arc)) clubWhereIN($where, $arc, 'idLead.status', '!');
}

$select[] = 'TIMESTAMPDIFF(YEAR, idLead.birth, curdate()) AS birth_y';
$select[] = '(TIMESTAMPDIFF(MONTH, idLead.birth, curdate()) - TIMESTAMPDIFF(YEAR, idLead.birth, curdate())*12) AS birth_m';

$w->leftJoin('idSport');
$select[] = 'idSport.name as sport_name';

$w->leftJoin('idClub');
$select[] = 'idClub.name as club_name';

$w->leftJoin('idSquad');
$select[] = 'idSquad.name as squad_name';

$w->leftJoin('idLevel', 'idLevel', 'idLevel.id = idSquad.lvl');
$select[] = 'idLevel.name as level_name';

$w->leftJoin('idSportsmen');
$select[] = 'idSportsmen.name as sportsmen_name';
$select[] = 'idSportsmen.key as sportsmen_key';

$where[] = array(
    'idClub.city' => $_SESSION['club_city'],
    'OR:idLead.club:=' => 0,
);

if (!empty($where['scheduleSquad'])) {
    $sidx[] = 'idLead.name';

    $leadStatus = array();
    $statusIN = array();
    foreach (getClubStatus('idLead') as $statusRow) {
        $leadStatus[ $statusRow['alias'] ] = $statusRow;
        if (!empty($statusRow['extended']['idSchedule'])) { // Здесь может будет тип Урока (Инд. и гр.)
            $statusIN[] = $statusRow['alias'];
        }
    }
    $json['leadStatus'] = $leadStatus;
    $where['idLead.status:IN'] = $statusIN;
    $where['idLead.squad'] = $where['scheduleSquad'];
    unset($where['scheduleSquad']);
}