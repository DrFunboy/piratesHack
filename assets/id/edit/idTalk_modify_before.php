<?php

if (!empty($data['status']) && !ctype_digit($data['status'])) {
    $idTalkStatus = getClubStatusAlias('idTalk', $data['status']);
    if (!empty($idTalkStatus)) $data['status'] = $idTalkStatus['id'];
}
