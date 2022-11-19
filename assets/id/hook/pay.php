<?php

/*setClubExtId(array(
    'parent' => 1,
    'extid' => 164,
    'extoken' => '546f03830429c34ba0809ebbfab4dbaf085bacbc',
), 'idCity_Pay');*/

if ($rq[0]=='paycb') {
    define('PAY_MODE', 'callback'); // callback

    $wpayCfg = $modx->newQuery('idStatus', array(
        'alias' => $rq[1],
        'tbl' => 'idPayMethod',
    ));
    //$wpayCfg->innerJoin('idStatus', 'idStatus', 'idExtid.extid = idStatus.id');
    //$wpayCfg->innerJoin('idConfig', 'idConfig', 'idExtid.extoken = idConfig.name');
    $wpayCfg->leftJoin('idConfig', 'idConfig', "idConfig.name = CONCAT('idPayMethod_', idStatus.id)");
    $wpayCfg->select(array(
        'idStatus.*',
        'idConfig.val as cfg',
        //'idStatus.alias',
    ));
    //$wpayCfg->prepare();
    //echo $wpayCfg->toSQL();
    $payCfg = $modx->getObject('idStatus', $wpayCfg);

} else {

    define('PAY_MODE', 'init'); //pay

    if (empty($rq[1])) die;
    //$paym = $rq[2]; // В типе связи будет магазин это или City
    $wpayCfg = $modx->newQuery('idStatus', $rq[2]);
    /*$wpayCfg->innerJoin('idStatus', 'idStatus', 'idExtid.extid = idStatus.id');*/
    $wpayCfg->leftJoin('idConfig', 'idConfig', "idConfig.name = CONCAT('idPayMethod_', idStatus.id)");
    $wpayCfg->select(array(
        'idStatus.*',
        //'idStatus.alias',
        //'idStatus.cls',
        //'idStatus.info',
        //'idStatus.extended as status_ext',
        'idConfig.val as cfg',
    ));
    //$wpayCfg->prepare();
    //echo $wpayCfg->toSQL();
    $payCfg = $modx->getObject('idStatus', $wpayCfg); //idExtid
    //if (empty($payCfg)) die; //TODO: Убрать. Может быть и пусто?

    $callbackUrl = $modx->getOption('site_url') ."paycb/" . $payCfg->get('alias');
    $payContact = array_intersect_key($_REQUEST, array_flip(['email', 'tel']));
    if (!empty($userID)) {
        if (empty($payContact['email'])) $payContact['email'] = $modx->user->Profile->get('email');
        if (empty($payContact['tel'])) $payContact['tel'] = $modx->user->Profile->get('mobilephone');
    }
    $extIdData = array(
        'duedate' => (new DateTime('+1 day'))->format('c'),
        'extid' => $payCfg->get('id'),
    );
    $Description = $payCfg->get('info');
    $backUrl = $modx->getOption('site_url');
    
    $rqkey = explode('-', $rq[1]);
    
    if ($rqkey[0]=='shop') {
        $extIdType = 'idOrderPack_payinit';
        $orderPack = $modx->getObject('idOrderPack', $rqkey[1]);
        if (!empty($orderPack)) {
            $orderPack = $orderPack->toArray();
            $extIdData['parent'] = $orderPack['id'];

            $woi = $modx->newQuery('idOrderItems', array('oi.orderpack' => $orderPack['id']));
            $woi->setClassAlias('oi');
            $woi->innerJoin('idShopItem');
            $woi->select($modx->getSelectColumns('idOrderItems', 'oi'));
            $woi->select(array(
                'idShopItem.name as name',
            ));
            $woi->sortby('name', 'asc');
            $stmt = $woi->prepare();
            $stmt->execute();
            $orderPack['items'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $Description = clubTmpl($Description, $orderPack); // 'Оплата Заказа [[+id]]'
            // Если будет использоваться один терминал на Спортсменов и на Магазин, брать описание из настроек, наверное
            $backUrl = $backUrl . 'shop/myorders.html';
        }
    } else {
        $extIdType = 'idSportsmen_payinit';
        $idSportsmen = $modx->getObject('idSportsmen', array(
            'key' => $rq[1],
        ));
    
        if (!empty($idSportsmen)) {
            $idSportsmen = $idSportsmen->toArray();
            $extIdData['parent'] = $idSportsmen['id'];
            if (empty($payContact['email'])) $payContact['email'] = $idSportsmen['email'];
            if (empty($payContact['tel'])) $payContact['tel'] = $idSportsmen['tel'];
            
            $total = floatval(str_replace([' ', ','], ['','.'], $_REQUEST['total']));
            if (!$total) {
                if ($idSportsmen['saldo'] < 0) {
                    $total = abs($idSportsmen['saldo']);
                } else {
                    $total = $idSportsmen['price'];
                }
            }
    
            $Description = clubTmpl($Description, $idSportsmen);
            $backUrl = $backUrl . 'sportsmens/sportsmen.html?key=' . $idSportsmen['key'];
        }
    }
}

if (!empty($payCfg)) {
    $payParams = empty($payCfg->get('cfg'))? $payCfg->get('extended') : getClubJSON($payCfg->get('cfg'));
    $payHandler = __DIR__ . "/pay/{$payCfg->get('cls')}.php";
    if (file_exists($payHandler)) {
        include_once($payHandler);
    }
}
