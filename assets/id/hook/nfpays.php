<?php
if (!isCrew()) dieJSONForbidden();
include_once(__DIR__.'/tools/nfpays.php');

$file = $_REQUEST['file'];

$json = array( );
if (!empty($file)) {
    if (!unlink($nfpays_path.$file.'.txt')) {
        $json['error'] = 'Error. Unlink file';
    } else {
        $json['result'] = 'Unlink file';
    }
} else {
    $rows = array();
    $n = 1;
    foreach (glob($nfpays_path."*") as $file){
        $f = file_get_contents($file);
        $r = unserialize($f);
        
        $path_parts = pathinfo($file);
        $r['file'] = $path_parts['filename'];
        $r['id'] = $n; $n++;
        
        $rows[] = $r;
    }
    $json['rows'] = $rows;
}
