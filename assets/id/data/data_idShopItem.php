<?php

$w->groupby('idShopItem.id');

$thumb_filetype = 'photo_shop'; //$thumb_size = 'sm';

$w->leftJoin('idFiles', 'idFiles', "idFiles.uid = CONCAT('shop',idShopItem.id)");
$select[] = "GROUP_CONCAT(CONCAT_WS('.', idFiles.key, idFiles.fileext, idFiles.incloud) SEPARATOR ',') as {$thumb_filetype}";
