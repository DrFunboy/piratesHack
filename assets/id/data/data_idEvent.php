<?php
if ($where["datestart:>="]=='now') {
    $where["datestart:>="] = date('Y-m-d');
}

if ($where["dateend:>="]=='now') {
    $where["dateend:>="] = date('Y-m-d');
}

if (!empty($where["idEventMember.sportsmen"])) {
    $w->innerJoin('idEventMember');
    $w->groupby('idEvent.id');
}
