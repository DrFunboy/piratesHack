$json = array(
    'club_city' => $_SESSION['club_city'],    
);

$mode = $modx->getOption('mode', $scriptProperties, $_REQUEST['mode']);
$city = $modx->getOption('city', $scriptProperties, $_REQUEST['city']);
$lessdata = $modx->getOption('lessdata', $scriptProperties, $_REQUEST['lessdata']);

if ($city == 'my') $city = $_SESSION['club_city'];
$mode = empty($mode)? array() : explode(',', $mode);

if (in_array('idLevel', $mode)) {
    $q = $modx->newQuery('idLevel');
    $q->sortby('name','ASC')->select(array('idLevel.*'));
    $stmt = $q->prepare();
    $stmt->execute();
    $json['idLevel'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

if (in_array('idInvoiceType', $mode)) {
    $q = $modx->newQuery('idInvoiceType', array(
        'published' => 1,
    ));
    $stype = $modx->getOption('stype', $scriptProperties, $_REQUEST['stype']);
    if (empty($stype)) {
        $q->leftJoin('idSInvType');
    } else {
        $q->innerJoin('idSInvType');
        $q->where(array(
            'idSInvType.stype' => $stype,
        ));
    }
    $q->groupby('idInvoiceType.id');
    $q->sortby('menuindex','ASC');
    $q->sortby('name','ASC');
    $q->select(array(
        'idInvoiceType.*', // Так выдает нормально все поля
        "GROUP_CONCAT(idSInvType.stype SEPARATOR ',') as stype",
        //'idSInvType.stype',
    ));
    $q->prepare(); //$json['sqq'] = $q->toSQL();
    $q->stmt->execute();
    $json['idInvoiceType'] = $q->stmt->fetchAll(PDO::FETCH_ASSOC);
}

if (empty($mode) || in_array('idSport', $mode)) {
    $q = $modx->newQuery('idSport', array(
        'published' => 1,
    ));
    $q->sortby('menuindex','ASC');
    $q->sortby('name','ASC');
    $q->select(array('idSport.*'));
    $stmt = $q->prepare();
    $stmt->execute();
    $json['idSport'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

if (empty($mode) || in_array('idTrainer', $mode)) {
    $q = $modx->newQuery('idTrainer', array(
        'published' => 1,
        'name:!=' => '_',
    ));
    $q->sortby('name','ASC');
    $tr_select = array('idTrainer.id', 'idTrainer.name', 'idTrainer.city', 'idTrainer.uid', 'gender', 'categ', 'iduser');
    if (!$lessdata) {
        $q->select('content');
        $q->groupby('idTrainer.id');
        $q->leftJoin('idFiles', 'idFiles', array('idFiles.uid = idTrainer.uid', "idFiles.filetype='tr_photo'"));
        $tr_select[] = "GROUP_CONCAT(CONCAT_WS('.', idFiles.key, idFiles.fileext, idFiles.incloud) SEPARATOR ',') as photo";
    }
    $q->select($tr_select);
    
    if (!empty($city)) $q->where(array('city' => $city));
    $stmt = $q->prepare();
    $stmt->execute();
    $json['idTrainer'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    if (!$lessdata) {
        $scrmFiles = $modx->getService('scrmfiles', 'scrmFiles', CRM_PATH);
        $thumb_size = $modx->getOption('size', $scriptProperties, 'md');
        foreach($json['idTrainer'] as $n => $v) {
            $fn = explode(',', $v['photo'])[0];
            $json['idTrainer'][$n]['photo'] = !$fn ? $scrmFiles->emptyImg($v['gender'], true) : $scrmFiles->fileUrlFromString($fn, 'tr_photo', $thumb_size);
        }
    }
}

if (in_array('idSquad', $mode)) {
    $q = $modx->newQuery('idSquad', array(
        'published' => 1,
    ));
    if (!empty($city)) {
        $q->where(array('idClub.city' => $city));
        $q->innerJoin('idClub');
    }
    $q->leftJoin('idLevel');
    $q->leftJoin('idSport');
    $q->sortby('lvl_name','ASC');
    $q->sortby('idSquad.name','ASC');
    $q->select(array(
        'idSquad.id',
        'idSquad.name',
        'club',
        "CONCAT_WS(', ', idLevel.name, idSquad.name) as squad_name",
        'idLevel.name as lvl_name',
        'idSport.name as sport_name',
        'idSport.shortname as ssport_name'
    ));
    $stmt = $q->prepare();
    $stmt->execute();
    
    $json['idSquad'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
}

if (empty($mode) || in_array('idClub', $mode)) {
    $q = $modx->newQuery('idClub', array(
        'published' => 1,
    ));
    if (!empty($city)) $q->where(array('city' => $city));
    $q->sortby('name','ASC');
    $q->select(explode(',','id,name,address,city'));
    $stmt = $q->prepare();
    $stmt->execute();
    
    $json['idClub'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
    if (!empty($json['idSquad'])) {
        foreach ($json['idClub'] as $idx => $club) {
            $inner = array();
            foreach($json['idSquad'] as $row) {
                if ($row['club'] == $club['id']) $inner[] = $row;
            }
            $json['idClub'][$idx]['idSquad'] = $inner;
        }
        //unset($json['idSquad']);
    }
}

if (empty($mode) || in_array('idCity', $mode)) {
    $q = $modx->newQuery('idCity', array(
        'published' => 1,
    ));
    if (!empty($city)) $q->where(array('id' => $city));
    $q->sortby('menuindex','ASC');
    $q->sortby('name','ASC');
    $q->select(explode(',','id,name,fullname,alias,inn,kpp,bankbik,bankrs,bankks,chief,email,tel'));
    $stmt = $q->prepare();
    $stmt->execute();
    $json['idCity'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

    foreach ($json['idCity'] as $idx => $city){
        if (!empty($json['idClub'])) {
            $inner = array();
            foreach($json['idClub'] as $idClub) {
                if ($idClub['city'] == $city['id']) $inner[] = $idClub;
            }
            $json['idCity'][$idx]['idClub'] = $inner;
        }
        
        if (!empty($json['idTrainer'])) {
            $inner = array();
            foreach($json['idTrainer'] as $idTrainer) {
                if ($idTrainer['city'] == $city['id']) $inner[] = $idTrainer;
            }
            $json['idCity'][$idx]['idTrainer'] = $inner;
        }
    }
    unset($json['idClub']);
    unset($json['idTrainer']);
}

if (!empty($placeholder)) $modx->setPlaceholder($placeholder, $json);
clubAllowOrigin();
return json_encode($json, JSON_UNESCAPED_UNICODE);