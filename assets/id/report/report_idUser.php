<?php

$w->leftJoin('modUser', 'idUser');
$select[] = 'idUser.username';