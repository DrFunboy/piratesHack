<?php  return '$json = array(
    \'key\' => $key = $modx->getOption(\'key\', $scriptProperties, $_REQUEST[\'key\']),
);

$mode = $modx->getOption(\'mode\', $scriptProperties, $_REQUEST["mode"]);

$wsp = $modx->newQuery(\'idSportsmen\', array(\'idSportsmen.key\' => $key));
$wsp->innerJoin(\'idStatus\', \'Gender\');
$wsp->leftJoin(\'idTrainer\');
$wsp->leftJoin(\'idSquad\', \'idSquad\', "idSquad.id = idSportsmen.squad AND idSquad.published = 1");
$wsp->leftJoin(\'idLevel\', \'idLevel\', \'idLevel.id = idSquad.lvl\');
$wsp->leftJoin(\'idClub\', \'idClub\', \'idClub.id = idSquad.club\');
$wsp->leftJoin(\'idSport\', \'idSport\', \'idSport.id = idSquad.sport\');
$wsp->leftJoin(\'modUser\', \'idUser\', "idUser.id = idSportsmen.iduser");
$wsp->select(array(
    \'idSportsmen.*\',
    \'Gender.name as gender_name\',
    \'idUser.username\',
    \'idTrainer.name as trainername\',
    \'idSquad.name as squad_name\',
    \'idSquad.club as club\',
    \'idLevel.name as level_name\',
    \'idClub.name as club_name\',
    \'idSport.name as sport_name\',
));
$sp = $modx->getObject(\'idSportsmen\', $wsp);
//$sp = $modx->getObjectGraph(\'idSportsmen\', \'{"idCity":{}}\', $wsp);

if (empty($sp)){
    $redirect = $modx->getOption(\'redirect\', $scriptProperties, false);
    if (!empty($redirect)) $modx->sendRedirect(\'/\');
} else {
    $json = $sp->toArray();

    $json[\'opts\'] = $opts = clubConfig(\'paym,hide0paym,idSportsmen_arc\');
    $payms = explode(\',\', $opts[\'paym\']);
    //$json[\'club_residue\'] = $opts[\'club_residue\'];
    
    $wi = $modx->newQuery(\'idInvoice\', array(
        \'sportsmen\' => $json[\'id\'],
        \'duedate > NOW()\'
    ));
    $wi->innerJoin(\'idInvoiceType\');
    $wi->leftJoin(\'idSInvType\');
    $wi->leftJoin(\'idLesson\', \'lsn\', \'lsn.idinvoice = idInvoice.id\');
    $wi->select(array(
        \'idInvoice.id\',
        \'idInvoice.duedate\',
        \'idInvoiceType.name as invoice_name\',
        \'idInvoice.lesson_amount\',
        \'GROUP_CONCAT(DISTINCT idSInvType.stype) as stype\',
        \'COUNT(DISTINCT lsn.id) as cnt_lesson\',
    ));
    $wi->sortby(\'idInvoice.duedate\', \'asc\');
    $wi->groupby(\'idInvoice.id\');
    $wi->having(\'(lesson_amount=0) OR (lesson_amount > cnt_lesson)\');
    $stmt = $wi->prepare();
    //$json[\'sqlidSInvType\'] = $wi->toSQL();
    $stmt->execute();
    $json[\'rest_lesson\'] = 0;
    $json[\'InvoiceLesson\'] = array();
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $json[\'InvoiceLesson\'][] = $row;
        $json[\'duedate\'] = $row[\'duedate\'];
        if (!empty($row[\'lesson_amount\']))
            $json[\'rest_lesson\'] += ($row[\'lesson_amount\'] - $row[\'cnt_lesson\']);
        $json[\'lesson_amount\'] = $row[\'lesson_amount\'];
    }
    
    /* --- idSportsmenSquad --- */
    $wsq = $modx->newQuery(\'idSportsmenSquad\', array(
        \'sportsmen\' => $json[\'id\'],
        //\'dateend\' => null,
    ));
    
    $wsq->innerJoin(\'idSquad\');
    $wsq->leftJoin(\'idSportsmen\', \'sp\', \'sp.id=idSportsmenSquad.sportsmen AND idSportsmenSquad.squad=sp.squad\');
    $wsq->leftJoin(\'idLevel\', \'idLevel\', "idLevel.id = idSquad.lvl");
    $wsq->leftJoin(\'idClub\', \'idClub\', "idClub.id = idSquad.club");
    $wsq->leftJoin(\'idSport\', \'idSport\', "idSport.id = idSquad.sport");
    $wsq->select(array(
        "idSportsmenSquad.*",
        "idSquad.club",
		"idSquad.name as squad_name",
		"idLevel.name as level_name",
		"idClub.name as club_name",
		"idSport.name as sport_name",
		\'sp.squad as is_main\',
    ));
    $wsq->sortby(\'is_main\', \'desc\');
    $wsq->sortby(\'dateend\', \'desc\');
    $wsq->sortby(\'created\', \'desc\');
    //$wsq->sortby(\'idLevel.name\', \'asc\');
    //$wsq->sortby(\'idSquad.name\', \'asc\');
    $stmt = $wsq->prepare();
    
    //$json[\'sssql\'] = $wsq->toSQL();
    $stmt->execute();
    $json[\'idSportsmenSquad\'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    $wcn = $modx->newQuery(\'idContact\', array(
        \'sportsmen\' => $json[\'id\'],
    ));
    $wcn->select(array(\'idContact.*\')); // Массив + Таблица = выдает поля нормально
    $wcn->sortby(\'name\', \'asc\');
    $stmt = $wcn->prepare();
    //$json[\'sql33\'] = $wcn->toSQL();
    $stmt->execute();
    $json[\'idContact\'] = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $idCity = $sp->getOne(\'idCity\');
    if (!empty($idCity)) {
        $json[\'idCity\'] = $idCity->toArray();
        if (empty($_SESSION[\'club_city\'])) $modx->runSnippet(\'setUserCity\', array(
            \'idCity\' => $idCity,
        ));
    }

    //$modx->setPlaceholders($json, \'ids.\');
    
    // $json[\'total\'] = $_REQUEST[\'total\'];
    // $json[\'paym\'] = $modx->getOption(\'paym\', $scriptProperties, $_REQUEST[\'paym\']);
    if ($mode == \'pay\') {
        $paym = $modx->getOption(\'paym\', $scriptProperties, $_REQUEST[\'paym\']);
        if (empty($paym)) $paym = $payms[0];
        if (!empty($paym)) {
            $paydata = getClubConfig($paym);
            $paydata = (empty($paydata))? array() : json_decode($paydata, true);
            //$json[\'pd\'] = $paydata;
            $paydata[\'sportsmen\'] = $json[\'id\'];
            $paydata[\'total\'] = $modx->getOption(\'total\', $_REQUEST, abs($json[\'saldo\']))*1;
            $paydata[\'email\'] = $modx->getOption(\'email\', $_REQUEST, $json[\'email\']);
            $site_url = $modx->getOption(\'site_url\');
            $paydata[\'backUrl\'] = $site_url ."sportsmens/sportsmen.html?key=". $json[\'key\'];

            if (empty($paydata[\'tmpl\'])) $paydata[\'tmpl\'] = \'Оплата по договору [[+contract]]<br>[[+name]]\';
            $paydata[\'paytext\'] = clubTmpl($paydata[\'tmpl\'], $json);

            $idPay = $modx->newObject(\'idPay\', array(
                \'sportsmen\' => $json[\'id\'],
                \'sum\' => $paydata[\'total\'],
                \'payd\' => 0,
            ));
            
            if (!empty($paydata[\'multiply\'])) $paydata[\'total\'] += $paydata[\'total\']*$paydata[\'multiply\'];
            
            /*$paydata[\'items\'] = array(
                array(
                    \'price\' => $paydata[\'total\'],
                    \'total\' => $paydata[\'total\'],
                    \'amount\' => 1,
                    \'name\' => $paydata[\'paytext\'],
                ),    
            );*/
            
            $paym_file = CRM_PATH. \'hook/\' .$paym. \'.php\';
            if (file_exists($paym_file)) require($paym_file);
            
            $json[\'paydata\'] =  $paydata;
        }
    } else {
        $modx->runSnippet(\'clubFiles\', array(
            \'uid\' => $json[\'key\'],
            \'cls\' => \'idSportsmen\',
            \'thumb\' => true,
        ));
        $json[\'files\'] = $modx->getPlaceholder(\'clubFiles\');
    }
    
    # ================= Новые методы оплаты
    $wPaym = $modx->newQuery(\'idStatus\', array(
        \'idStatus.tbl\' => \'idPayMethod\',
        \'idStatus.published\' => 1,
        \'idCity_Pay.parent:IN\' => array(0, $sp->get(\'city\')) ,
    ));
    $wPaym->innerJoin(\'idStatus\', \'idExType\', array(
        \'idExType.tbl\' => \'idExtid\', 
        \'idExType.alias\' => \'idCity_Pay\',
    ));
    $wPaym->innerJoin(\'idExtid\', \'idCity_Pay\', array(
        \'idCity_Pay.extid = idStatus.id\',
        \'idCity_Pay.extype = idExType.id\',
    ));
    $wPaym->sortby(\'idStatus.menuindex\');
    $wPaym->sortby(\'idStatus.name\');
    foreach($modx->getIterator(\'idStatus\', $wPaym) as $payMethod) {
        if (empty($json[\'selPayMethod\'])) $json[\'selPayMethod\'] = (string)$payMethod->get(\'id\');
        $json[\'idPayMethod\'][] = $payMethod->toArray();
    }
    # ================= END Новые методы оплаты
    
    if ($mode == \'cabinet\') {
        $json[\'clubStatus\'] = getClubStatus(\'idSchedule,idLesson\');
        $squads = array_map(
            function($sq) {
                if (!empty($sq[\'published\'])) return \'club\'.$sq[\'club\'];
            },
            $json[\'idSportsmenSquad\']
        );
        if (!empty($json[\'club\'])) $squads[] = \'club\'.$json[\'club\'];
        
        if (!empty($squads)) {
            $modx->runSnippet(\'clubFiles\', array(
                \'uid\' => implode(\',\', $squads),
                \'cls\' => \'idClub\',
            ));
            $json[\'clubDocs\'] = $modx->getPlaceholder(\'clubFiles\');
        }
        
        if (empty($opts[\'hide0paym\']) || $json[\'saldo\']*1 < 0) {
            //$idCity_Pay = getClubStatusAlias(\'idExtid\',\'idCity_Pay\');
            //$json[\'idCity_Pay\'] = $idCity_Pay;

            if (!empty($payms[0])) {
                foreach ($payms as $paym) {
                    $paym_file = CRM_PATH. \'hook/\' .$paym. \'.php\';
                    if (file_exists($paym_file)) require($paym_file);
                }
            }
        }
    }
}

//$json[\'created\'] = 
$json[\'now\'] = date(\'c\');

if ($mode==\'export\'){
    $modx->runSnippet(\'createDoc\', array(
        \'data\' => $json,
        \'handler\' => \'idSportsmen\',
        \'tmpl\' => $modx->getOption(\'tmpl\', $_REQUEST, \'sportsmen_contract.docx\'),
    ));
}

$modx->setPlaceholder(\'idGetSportsmen\', $json);
return json_encode($json, JSON_UNESCAPED_UNICODE);
return;
';