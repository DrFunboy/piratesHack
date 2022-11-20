<?
//TODO Прикрутить oauth2?

$gosnum = mb_strtolower($_GET["gosnum"]);
if (!$gosnum) dieJSON('empty gos number');

$query = $modx->newQuery("idCar", array(
    array("LOWER(`gosnum`) = '$gosnum'"),
    array(
        "OR:status:=" => 0, //Не проверено
        "OR:status:=" => 1, //Начата проверка
        "OR:status:=" => 2,  //Электромобиль
        "OR:status:=" => 3  //Не электромобиль
    )
));



$car = $modx->getObject("idCar", $query);

if (!$car) dieJSON('car not found');

echo json_encode(array(
    "success" => true,
    "status" => $car->get("status")
));

