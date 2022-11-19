<?
$extypeId = getClubStatusAlias("idExtid", "idSportsmen_notes")["id"];
$w = $modx->newQuery('idExtid', array(
    'idExtid.extype' => $extypeId
));
$w->prepare();
$json["sql"] = $w->toSQL();
    
foreach ($modx->getCollection('idExtid', $w) as $row) {
    $json["rows"][] = $row->toArray();
}