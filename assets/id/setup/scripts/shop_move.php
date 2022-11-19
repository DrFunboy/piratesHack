<?php
require_once('../../id_init.php');

$w = $modx->newQuery('idOrderItems', array(
    'orderpack' => 0,
    'status:!=' => 'cart',
));
$w->select(array('created', 'club', 'city', 'author'));
$w->groupby('created');
$w->groupby('club');
$w->groupby('city');
$w->groupby('author');

$stmt = $w->prepare();
$sql = $w->toSQL();
//echo $sql;
$stmt->execute();
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

foreach ($rows as $rr) {
    $o = $modx->newObject('idOrderPack', $rr);
    $profile = $modx->getObject('modUserProfile', array('internalKey' => $rr['author']));
    $sp = $modx->getObject('idSportsmen', array('iduser' => $rr['author']));
    if (!empty($sp)) $o->set('sportsmen', $sp->get('id'));
    if (!empty($profile)) {
        $o->set('name', $profile->get('fullname'));
        $o->set('tel', $profile->get('mobilephone'));
    }
    $o->save();
    
    foreach($modx->getCollection('idOrderItems', $rr) as $row) {
        $row->set('orderpack', $o->get('id'));
        
        $row->save();
        print_r($row->toArray());    
    }
}