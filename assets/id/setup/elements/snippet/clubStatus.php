$tbl = array(
    'tbl' => $modx->getOption('tbl', $scriptProperties, 'idSportsmen'),
);
if ($cls) $tbl['cls'] = $cls;
if ($alias) $tbl['alias'] = $alias;
$addfields = $modx->getOption('addfields', $scriptProperties, '');
$json = getClubStatus($tbl, $addfields);

$placeholderName = $modx->getOption('placeholder', $scriptProperties, 0);
$keyfield = $modx->getOption('keyfield', $scriptProperties, '');
if (!empty($keyfield)) {
    $statuses = array();
    foreach ($json as $status) {
        $key = $status[$keyfield];
        if (!empty( $key )) $statuses[$key] = $status;
    }
    $placeholderName = ($placeholderName)? :'clubStatus';
    $json = $statuses;
}

if (!empty($placeholderName)) $modx->setPlaceholder($placeholderName, $json);

return json_encode($json, JSON_UNESCAPED_UNICODE);