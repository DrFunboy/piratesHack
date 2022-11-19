<?php

$cnt = count($data['rows']);
$Doc->cloneBlock('anketa', $cnt, true, true);

$rn = 1;
foreach($data['rows'] as $n => $row) {
    foreach ($row as $key => $val) {
        if ($key == 'birth' && !empty($val)) {
            $val = (new DateTime($val))->format('d.m.Y');
        }
        $Doc->setValue($key.'#'.$rn, $val, 1);
    }

    $pb = ($rn == $cnt)? '' : '<w:p><w:r><w:br w:type="page"/></w:r></w:p>';
    $Doc->setValue("pageBr#$rn", $pb, 1);
    
    $rn++;
}