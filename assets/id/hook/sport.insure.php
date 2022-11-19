<?php
if (!defined('MODX_API_MODE')) {
    define('CLUB_UNAUTH', true);
    require_once(__DIR__. '/../id_init.php');
}

clubLog('sportinsure', $_REQUEST);

$policies = $_REQUEST['policies'];
$order = $_REQUEST['order'];
if (!empty($order)&&!empty($policies)&&gettype($policies)=='array'){
    $userIns = $modx->getObject('modUser', array('username' => 'insurance'));
    $userInsID = (empty($userIns))? 0 : $userIns->get('id');
    
    foreach ($policies as $polis) if (!empty($polis['cardnum'])) {
        $end = new DateTime($polis['end']);
        $idSportsmen = $modx->getObject('idSportsmen', $polis['cardnum']);
        if (!empty($idSportsmen)) {
            $insdate = new DateTime($idSportsmen->get('insdate'));
            $ch_insert = array (
                'sportsmen' => $idSportsmen->id,
                'chfield' => 'insdate',
                'author' => $userInsID, //insurance
                'oldvalue' => $idSportsmen->insdate,
                'newvalue' => $polis['end'],
                'info' => "Заказ {$order}, Полис ".$polis['id'],
            );
            $ch = $modx->newObject('idChanges', $ch_insert);
            $ch->save();
            if ($insdate < $end) {
                $idSportsmen->set('insdate', $end->format('Y-m-d H:i:s'));
                $idSportsmen->save();
            }
        }
    }
}

include_once(CRM_PATH.'id_log.php');
id_setlog("sport.insure.callback", json_encode($_REQUEST, JSON_UNESCAPED_UNICODE));

echo "OK";