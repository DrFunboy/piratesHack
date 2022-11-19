<?php

$w->leftJoin('idSInvType');
$w->leftJoin('idStatus', 'idSt', "idSt.alias = idSInvType.stype AND idSt.tbl = 'idSchedule' AND idSt.published = 1");
$select[] = "GROUP_CONCAT(idSt.name SEPARATOR ', ') as stype";
$groupby[] = 'idInvoiceType.id';
