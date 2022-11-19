<?php

$w->innerJoin('modUserGroup', 'ugrWWW', array(
    'ugrWWW.name' => 'www_' . substr(CRM_PREFIX, 0, -1)
));
//$w->innerJoin('modUserGroup', 'ugrWWW', "ugrWWW.name = 'www_" . substr(CRM_PREFIX, 0, -1) . "'");
$w->innerJoin('modUserGroupMember', 'grWWW', array(
    'grWWW.member = modUser.id',
    'grWWW.user_group = ugrWWW.id',
));

$idUser_city = getClubStatusAlias('idExtid', 'idUser_city');

$w->innerJoin('modUserProfile','Profile','Profile.internalKey = modUser.id');
//$w->leftJoin('modUserGroupMember', 'grAdm', 'grAdm.member = modUser.id AND grAdm.user_group=1');
$where['sudo:!='] = 1;  // Administrator

$w->leftJoin('idExtid', 'idExtid', "( idExtid.parent = modUser.id AND idExtid.extype={$idUser_city['id']} )");
$w->leftJoin('idCity', 'idCity', "idCity.id = idExtid.extid");

$w->leftJoin('modUserGroupMember', 'grm', 'grm.member = modUser.id');
$w->leftJoin('modUserGroup', 'gr', "gr.id = grm.user_group AND gr.name NOT LIKE 'www_%'");
$w->select(array(
    "GROUP_CONCAT(gr.name SEPARATOR ';') as ugr_name",
    'Profile.fullname',
    //'grAdm.id as fullname',
    'Profile.id as profile_id',
    'Profile.email',
    'Profile.mobilephone',
    'Profile.extended',
    //'idExtid.id as idlnk',
    'idCity.id as idcity',
    'idCity.name as city_name',
));
$groupby[] = 'modUser.id';

