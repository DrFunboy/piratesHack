<?php

if ($oper == 'add') {
    $data['uid'] = generateUUID();
    if (!isset($data['gender'])) $data['gender'] = getClubConfig('Gender_main');
}