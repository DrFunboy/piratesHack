$where = array();
$key = $modx->getOption('key', $_REQUEST, '');
if (empty($key)) {
    $ids = $modx->getOption('ids', $_REQUEST, '');
    if (!empty($ids) && isCrew()) {
        clubWhereIN($where, $ids, 'id');
    }
} else {
    $where["key"] = $key;    
}

$data = array(
    'rows' => array(),
    'config' => $cfg = clubConfig('insure_module,insure_promo'),
    'user' => $modx->user->Profile->toArray(),
);

if (!empty($where)){
    $stmt = $modx->newQuery('idSportsmen', $where)->select(array('idSportsmen.*'))->prepare();
    $stmt->execute();
    $data['rows'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
    if (!empty($data['rows'])) {
        $city = $modx->getObject('idCity', $data['rows'][0]['city']);
        if (!empty($city)) $data['city'] = $city->toArray();
    }
}

$tel = $data['user']['mobilephone'];
if (!empty($tel)) {
    $tel = preg_replace("/[^0-9]/", '', $tel);
    $tel = substr($tel, -10);
    $data['phonedig'] = $tel;
}

$insure_module = CRM_PATH."hook/chunk/{$cfg['insure_module']}.html";
if (file_exists($insure_module)) {
    $insure_module = file_get_contents($insure_module);
}

return '<script>$.extend(SCRM, {insureData: '. json_encode($data, JSON_UNESCAPED_UNICODE) .'});</script>'.$insure_module;