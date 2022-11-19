<?php
set_time_limit(0);
require_once('../../id_init.php');

foreach($modx->getCollection('modUser') as $usr) {
    $Profile = $usr->getOne('Profile');
    $ext = $Profile->get('extended');
    if (!empty($ext['idcity'])) {
        echo $usr->get('username')."<br>";
        $mc = $modx->newObject('idLink', array(
            'id1' => $usr->get('id'),
            'tbl1' => 'modUser',
            'id2' => $ext['idcity'],
            'tbl2' => 'idCity',
        ));
        echo $mc->save();
    }
}

$w = $modx->newQuery('idLink');
$w->select(array('id1','tbl1','id2','tbl2', 'count(*) as cnt'));
$w->groupby('id1');
$w->groupby('tbl1');
$w->groupby('id2');
$w->groupby('tbl2');

$stmt = $w->prepare();
$sql = $w->toSQL();
//echo $sql;

$stmt->execute();
$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo count($rows).'--';
foreach ($rows as $rr) {
    if ($rr['cnt']>1) {
        unset($rr['cnt']);
        $n = false;
        print_r($rr);
        foreach($modx->getCollection('idLink', $rr) as $row) {
            //echo $row->get('id').'asdfasdf';
            if ($n) $row->remove();
            $n=true;
        }
    }
}
