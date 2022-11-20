<?

$driver = $modx->getObject("idSportsmen", array("key" => $_POST["key"]));

if (!$driver) dieJSON("Неверный ключ");


foreach ($modx->getCollection('idCar', array(
    'idsportsmen' => $driver->get("id")
)) as $row) {
    $json["rows"][] = $row->toArray();
}