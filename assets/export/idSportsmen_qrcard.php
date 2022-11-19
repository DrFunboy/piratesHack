<?php

include_once(CRM_PATH. 'phplib/qr/qrlib.php');
$scrmFiles = $modx->getService('scrmfiles', 'scrmFiles', CRM_PATH);
$url = $modx->getOption('site_url') . 'qr?key=';

$cnt = count($data['rows']);
$Doc->cloneBlock('anketa', $cnt, true, true);

$rn = 1; $keys = array();
foreach($data['rows'] as $n => $row) {
    $keys[ $row['key'] ] = array($rn, $scrmFiles->emptyImg( $row['gender'] ));
    foreach ($row as $key => $val) {
        if ($key == 'birth' && !empty($val)) {
            $val = (new DateTime($val))->format('d.m.Y');
        }
        if ($key!= 'photo') $Doc->setValue($key.'#'.$rn, $val, 1);
    }
    
    $temp_png = tempnam(sys_get_temp_dir(), 'QRcode').'.png';
    $temp[] = $temp_png;
    QRcode::png($url.$row['key'], $temp_png, QR_ECLEVEL_L, 3, 0); // size, margin
    $Doc->setImageValue("qr#$rn", $temp_png);

    $pb = ($rn == $cnt)? '' : '<w:p><w:r><w:br w:type="page"/></w:r></w:p>';
    $Doc->setValue("pageBr#$rn", $pb, 1);
    
    $rn++;
}

$w = $modx->newQuery('idFiles', array(
    'uid:IN' => array_keys($keys),
    'filetype' => 'photo',
));
foreach($modx->getIterator('idFiles', $w) as $key => $file) {
    $f = $file->toArray();
    if (!empty($keys[ $f['uid'] ])) $keys[ $f['uid'] ][1] = $scrmFiles->fileUrl($f, 'sm');
}

foreach($keys as $row) {
    $Doc->setImageValue('photo#'.$row[0], $row[1]);
}
