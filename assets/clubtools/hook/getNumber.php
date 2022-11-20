<?php


$url = "https://data.av100.ru/numberrecognize.ashx";
$request_params = array(
    "key" => "60b84eaf-aa77-474b-96fe-ff7e0fbdcd2a",
);
$imgUp = $_FILES['file'];

// Подготавливаем изображение
$img = file_get_contents($imgUp['tmp_name']);
$data = base64_encode($img);


// Готовим заголовок и тело запроса
define('MULTIPART_BOUNDARY', '--------------------------'.microtime(true));
define('FORM_FIELD', 'img');
$header = 'Content-Type: multipart/form-data; boundary='.MULTIPART_BOUNDARY;
$content =  "--".MULTIPART_BOUNDARY."\r\n".
"Content-Disposition: form-data; name=\"".FORM_FIELD."\"".
"\r\n\r\n".$data."\r\n"."--".MULTIPART_BOUNDARY."--\r\n";



$context = stream_context_create(array(
    'https' => array(
          'method' => 'POST',
          'header' => $header,
          'content' => $content,
    )
));



$get_params = http_build_query($request_params);
var_dump($url."?".$get_params, false, $context);

// Запрос к серверу
$response = file_get_contents($url."?".$get_params, false, $context);
// Преобразование ответа
$result = json_decode($response);

$res = $result -> result[0];

print_r($result);