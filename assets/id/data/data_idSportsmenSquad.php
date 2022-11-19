<?php

$w->leftJoin('idSquad');
$select[] = 'idSquad.name as squad_name';

$w->leftJoin('idLevel', 'idLevel', 'idLevel.id = idSquad.lvl');
$select[] = 'idLevel.name as level_name';

$w->leftJoin('idClub', 'idClub', 'idClub.id = idSquad.club');
$select[] = 'idClub.name as club_name';

$w->leftJoin('idSport', 'idSport', 'idSport.id = idSquad.sport');
$select[] = 'idSport.name as sport_name';