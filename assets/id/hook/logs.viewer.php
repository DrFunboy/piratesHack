<?
ini_set('error_reporting', E_ALL);
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

if (!$modx->user->get('sudo')) die;//только для суперпользователя

ignore_user_abort(true);
set_time_limit(0);


$currentDir = CRM_LOGS.CRM_PREFIX.'/';

if ( !empty($_POST["date"]) && !empty($_POST["type"]) && !empty($_POST["name"]) ) {
    echo file_get_contents($currentDir.$_POST["date"]."/".$_POST["type"]."/".$_POST["name"]);
} else {
    $files = array();
    $dates = array();
    
    if ( !empty($_POST["all"]) && !empty($_POST["period"]) ) {
        function removeDirectory($dir, $datev) {
            if ( strtotime($datev) < strtotime("-".$_POST["period"]." month") ) {
                if ($objs = glob($dir."/*")) {
                    foreach($objs as $obj) {
                        is_dir($obj) ? removeDirectory($obj, $datev) : unlink($obj);
                    }
                }
                //echo 'rmdir'.$dir.'<br>';
                rmdir($dir);
            }
        };
        if ($_POST["all"] == "true") {
            $logFolder = array_diff(scandir(CRM_LOGS), array('..', '.'));
            foreach($logFolder as $hostk => $hostv){
                $scanned_directory = array_diff(scandir(CRM_LOGS.$hostv), array('..', '.'));
                foreach($scanned_directory as $datek => $datev){
                    removeDirectory(CRM_LOGS.$hostv."/".$datev, $datev);
                }
            }
        } else {
            $scanned_directory = array_diff(scandir($currentDir), array('..', '.'));
            foreach($scanned_directory as $datek => $datev){
                removeDirectory($currentDir.$datev, $datev);
            }
        }
    }
        
    
    $typesKey = array();
    $scanned_directory = array_diff(scandir($currentDir), array('..', '.'));
    foreach($scanned_directory as $datek=>$datev){
        $content = array_diff(scandir($currentDir.$datev), array('..', '.'));
        array_push($dates, array(
            "id" => $datev,
            "name" => $datev
        ));
        foreach($content as $typek => $typev){
            $typesKey[ $typev ] = array(
                "id" => $typev,
                "name" => $typev
            );
            $filePath = array_diff(scandir($currentDir.$datev.'/'.$typev), array('..', '.'));
            foreach($filePath as $filek=>$filev){
                $files[] = array(
                    "date" => $datev,
                    "type" => $typev,
                    "name" => $filev
                );
            }
        }
    }
    $json = array(
        "files" => $files,
        "types" => array_values($typesKey),
        "dates" => $dates
    );
}
