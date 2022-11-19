<?php

if (empty($id_city)) $id_city = $_SESSION['club_city'];
$nfpays_path = CRMTOOLS_PATH . "data/nfpays/".CRM_PREFIX.$id_city."/";
if (!file_exists($nfpays_path)) {
    mkdir($nfpays_path, 0755, true );
}

function clear_nfpays($nfpays_path) {
    foreach (glob($nfpays_path."*") as $file){
        unlink($file);
    }
}