<?php
$doc_name = $data['table']; // Потому что сниппет подставляет туда скорее всего не то что надо
$fields = empty($data['fields'])? array() : $data['fields']; //$modx->getFieldMeta($doc_name);

$ws = $Doc->getActiveSheet();

$styleBold = array(
    'font'  => array(
        'bold'  => true,
        //'color' => array('rgb' => 'FF0000'),
    ),
);
$styleBorders = array(
    'borders' => array(
        'allBorders' => array( //outline
            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
            'style' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
            //'color' => array('argb' => '00000000'),
        ),
    ),
);

$cols = explode(';', $_REQUEST["excols"]);
$labels = explode(';', $_REQUEST["exlabels"]);

$ecol = 'A';
foreach($labels as $label) {
    $ws->setCellValue("{$ecol}1", $label);
    $ws->getColumnDimension($ecol)->setWidth(16);
    $ecol++;
}
$highestColumn = $ws->getHighestColumn();
$ws->getStyle("A1:{$highestColumn}1")->applyFromArray($styleBold);

$idx = 2;
foreach ($data['rows'] as $row) {    
    $ecol = 'A';
    foreach($cols as $col) {
        if (isset( $row[$col] )){
            if (empty($fields[$col])) $fields[$col] = array('phptype' => 'string');
            if (in_array($fields[$col]['phptype'], ['integer', 'float'])) {
                $ws->setCellValue("{$ecol}{$idx}", $row[$col]*1);
            } elseif (in_array($fields[$col]['phptype'], ['date', 'datetime'])) {
                $ws->setCellValue("{$ecol}{$idx}", $row[$col]);
            } else {
                $ws->setCellValueExplicit(
                    "{$ecol}{$idx}",
                    $row[$col],
                    \PhpOffice\PhpSpreadsheet\Cell\DataType::TYPE_STRING
                );
            }
            //$ws->setCellValue("{$ecol}{$idx}", $fields[$col]['phptype'].' '.$row[$col]);
        }
        $ecol++;
    }
    $idx++;
}

$highestRow = $ws->getHighestRow();
$ws->getStyle("A1:{$highestColumn}{$highestRow}")->applyFromArray($styleBorders);
