<?php

$w->leftJoin('modUserGroup', 'UserGroup');
$select[] = 'UserGroup.name as usergroup_name';
