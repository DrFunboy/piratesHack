<?
$login = "DrFunboy";
$pass = "SportCRMSMStest";
$phone = $_POST["phone"];

if ($_POST["captcha"]){
    if ( $_POST["captcha"] != 185130) {
        echo "0";
    } else {
        $curl = curl_init();
        curl_setopt_array($curl, array(
          CURLOPT_URL => 'https://smsc.ru/sys/send.php?login='.$login.'&psw='.$pass.'&phones='.$phone.'&mes=code&call=1&fmt=3',
          CURLOPT_TIMEOUT => 0,
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_CUSTOMREQUEST => 'POST',
        ));
        $response = curl_exec($curl);
        curl_close($curl);
        $response = json_decode($response);
        $code = mb_substr($response->code, -4);
        $modx->cacheManager->delete($phone);
        $modx->cacheManager->set($phone, $code, 7200);
        echo 1;
    }
} else if ($_POST["action"] == "confirm") {
    $code = $modx->cacheManager->get($phone);
    $userCode = $_POST["code"];
    if ($userCode == $code) {
        $myBox = $modx->newObject('idIncome');
        $myBox->fromArray(array(
           'status' => $clubConfig,
           'source' => $_POST["formData"]["source"],
           'name' => $_POST["formData"]["name"],
           'medobj' => $_POST["formData"]["medobj"],
           'info' => $_POST["formData"]["info"],
           'totype' => $_POST["formData"]["totype"],
           'tel' => $_POST["formData"]["tel"],
           'email' => $_POST["formData"]["email"],
           'zip' => $_POST["formData"]["zip"],
           'address' => $_POST["formData"]["address"],
        ));
        $myBox->save();
        echo "1";
    } else {
        echo "0";
    }
}