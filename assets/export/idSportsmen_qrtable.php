<?php

include_once(CRM_PATH. 'phplib/qr/qrlib.php');
$url = $modx->getOption('site_url') . 'qr?key=';

$tableStyle = array(
    'borderColor' => '006699',
    'borderSize'  => 6,
    'cellMargin'  => 40
);
$imgStyle = array(
    'width' => 70,
    'height' => 70,
    'wrappingStyle' => 'square',
    'positioning' => 'absolute',
    'wrapDistanceRight'    => 0,
    //'posHorizontal'    => \PhpOffice\PhpWord\Style\Image::POSITION_HORIZONTAL_LEFT,
    //'posHorizontalRel' => 'margin',
    //'posVerticalRel' => 'line',
);

$Doc->addTableStyle('QR', $tableStyle);
$section = $Doc->createSection();
$table = $section->addTable('QR');

$n = 1;
$s_style = $section->getStyle();
$position = $s_style->getPageSizeW() - $s_style->getMarginRight() - $s_style->getMarginLeft();
$width = round($position / 3);

$rn = 1;
foreach($data['rows'] as $row) {
    if (($rn % 3) == 1) $table->addRow();
    
    $cell = $table->addCell($width);
    $temp_png = tempnam(sys_get_temp_dir(), 'QRcode').'.png';
    $temp[] = $temp_png;
    QRcode::png($url.$row['key'], $temp_png, QR_ECLEVEL_L, 3, 2); // size, margin
    $cell->addImage($temp_png, $imgStyle);
    $cell->addText($row['name']);
    $rn++;
}
