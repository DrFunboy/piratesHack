<?php

$w->innerJoin('idStatus');
$select[] = 'idStatus.name as status_name';
$select[] = 'idStatus.alias as status_alias';
$select[] = 'idStatus.cls as status_cls';
