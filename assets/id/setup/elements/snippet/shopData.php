//error_reporting(E_ALL);
//require_once('../id/id_init.php');
//if (empty($userID)) die('Empty user');

$userID = $modx->getLoginUserID();

$json = array(
    'rows' => array(),
    'photos' => array(),
);

$json['shop_config'] = getClubConfig('shop_config', 'json'); // TODO: currency

if (!empty($userID)) {
    $Profile = $modx->user->getOne('Profile')->toArray();
    $json['postData'] = array(
        'name' => $Profile['fullname'],
        'tel' => $Profile['mobilephone'],
    );
}

$oper = $modx->getOption('oper', $scriptProperties, $modx->getOption('oper', $_REQUEST, 'count'));
$shopitem = $modx->getOption('shopitem', $_REQUEST, 0);
$status = $modx->getOption('status', $scriptProperties, $_REQUEST['status']);

$wcart = array(
    'status' => 'cart',
    'author' => $userID,
);

if (!empty($shopitem) && ($oper=='order')) {
    $add = array(
        'oper' => 'add',
        'table' => 'idOrderItems',
        'shopitem' => $shopitem,
        'status' => 'cart',
        'amount' => 1,
        'opts' => $modx->getOption('opts', $_REQUEST, ''),
    );
    
    $modx->runSnippet('dbedit', array(
        'data' => $add,
    ));
    // TODO: изменение кол-ва
    // $json['id'] = $order->get('id');
}


if ($oper=='confirm') {
    $odata = $_REQUEST;
    $odata['table'] = 'idOrderPack';
    $odata['oper'] = 'add';
    $modx->runSnippet('dbedit', array(
        'data' => $odata,
    ));
    $addRow = $modx->getPlaceholder('dbeditRow');
    if (!empty($addRow)) {
        if (!empty($shopitem)) { // delivery
            $add_delivery = array(
                'table' => 'idOrderItems',
                'oper' => 'add',
                'status' => 'cart',
                'shopitem' => $shopitem,
                'amount' => 1,
            );
            $modx->runSnippet('dbedit', array(
                'data' => $add_delivery,
            ));
            //$addRow = $modx->getPlaceholder('dbeditRow');
        }
        $cnt = 0; $total = 0;
        foreach($modx->getCollection('idOrderItems', $wcart) as $item){
            $item->fromArray(array(
                'status' => 'process',
                'orderpack' => $addRow->get('id'),
            ));
            $item->save();
            $cnt++;
            $total += $item->get('total');
        }
        $addRow->set('cnt', $cnt);
        $addRow->set('total', $total);
        $addRow->save();
        $json["addRow"] = $addRow->toArray();
    }
}

if ($oper=='del'){
    $oper = 'list'; // next oper
    $status = 'cart'; // При удалении возвращаем список корзины (поскольку удалять можно только из корзины)
    $modx->removeCollection('idOrderItems', array(
        'id' => $modx->getOption('id', $_REQUEST, 0),
        'status' => 'cart',
        'author' => $userID,
    )); // Корзина: Чтобы не удалил заказ в другом статусе
}

if ($oper=='count') {
    $table = $modx->getTableName('idOrderItems');
    $sql = "SELECT `status`, count(id) as cnt FROM {$table} WHERE author = {$userID} GROUP BY `status`";
    $results = $modx->query($sql);
    $json["rows"] = $results->fetchAll(PDO::FETCH_ASSOC);
}

if ($oper=='list'){
    $w = $modx->newQuery('idOrderItems', array('oi.author' => $userID));
    $w->setClassAlias('oi');
    $w->innerJoin('idShopItem');
    $w->leftJoin('idOrderPack');
    $w->leftJoin('idClub', 'idClub', 'idClub.id = idOrderPack.club');
    $w->leftJoin('idCity', 'idCity', 'idCity.id = idOrderPack.city');
    $w->sortby('oi.created', 'desc');
    if (!empty($status)) $w->where(array('oi.status' => $status));
    $w->select(['oi.id',
        'oi.shopitem',
        'oi.created',
        'idShopItem.name as itemname',
        'oi.price', 'oi.amount', 'oi.total',
        'oi.opts',
        'oi.status',
        'oi.orderpack',
        'idOrderPack.tel', 'idOrderPack.name', 'idOrderPack.address', 'idOrderPack.club', 'idOrderPack.city',
        'idClub.name as club_name',
        'idCity.name as city_name',
    ]);

    $stmt = $w->prepare();
    //$json["sql"] = $w->toSQL();
    $stmt->execute();
    $json["cnt"] = 0;
    $json["total"] = 0;
    $fids = array();
    while ($rowdata = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $json["cnt"] += 1;
        $json["total"] += $rowdata['total'];
        $json["rows"][] = $rowdata;
        $fids['shop'.$rowdata['shopitem']] = 1;
    }
    if ($fids) {
        $files = $modx->runSnippet('runHook', array(
            'hook' => 'hook/files',
            'uid' => implode(',', array_keys($fids)),
            'thumb' => true,
        ));
        $fids = json_decode($files, true)['rows']? : array();
        foreach($fids as $file) {
            if (!$json["photos"][ $file['uid'] ]) $json["photos"][ $file['uid'] ] = $file['sm'];
        };
    }
    
    // ================ Методы оплаты ====================
    $wPaym = $modx->newQuery('idStatus', array(
        'idStatus.tbl' => 'idPayMethod',
        'idStatus.published' => 1,
    ));
    $wPaym->innerJoin('idStatus', 'idExType', array('idExType.tbl' => 'idExtid', 'idExType.alias' => 'Shop_Pay'));
    $wPaym->innerJoin('idExtid', 'idCity_Pay', array('idCity_Pay.extid = idStatus.id', 'idCity_Pay.extype=idExType.id'));
    $wPaym->sortby('idStatus.menuindex');
    $wPaym->sortby('idStatus.name');
    foreach($modx->getIterator('idStatus', $wPaym) as $payMethod) {
        if (empty($json['selPayMethod'])) $json['selPayMethod'] = (string)$payMethod->get('id');
        $json['idPayMethod'][] = $payMethod->toArray();
    }
    $json['clubStatus'] = getClubStatus('idOrderItems', 'info');
}

if ($oper=='idShopItem') {
    $w = $modx->newQuery('idShopItem', array(
        'published' => 1,
        'status' => $status? : 'c',
    ));
    $w->sortby("menuindex,name");
    foreach ($modx->getIterator('idShopItem', $w) as $row) {
        $json["rows"][] = $row->toArray();
    }
}

return json_encode($json, JSON_UNESCAPED_UNICODE);