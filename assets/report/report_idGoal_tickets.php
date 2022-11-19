<?php

$where[] = "(idStatus.alias = 'process' OR (idGoal.dateend BETWEEN '$d1' AND '$d2') OR (idGoal.created BETWEEN '$d1' AND '$d2'))";
$w->innerJoin('idStatus');
$w->innerJoin('idLink', 'lnk', "lnk.tbl1 = 'idGoal' AND lnk.id1 = idGoal.id");
$w->leftJoin('idTag', 'tag', "tag.id = lnk.id2 AND lnk.tbl2 = 'idTag'");
$w->leftJoin('idSportsmen', 'sp', "sp.id = lnk.id2 AND lnk.tbl2 = 'idSportsmen'");
$w->where(array(
    array(
        'sp.key' => $rq['key']
    ),
    array(
        'OR:tag.name:=' => 'CRM global'
    )
));
$w->groupby('idGoal.id');

$qs = $modx->newQuery('idStatus', array('tbl' => 'idGoal'));
$qs->sortby('menuindex', 'ASC');
$qs->select(explode(',','id,name,cls,ico,ismain,alias'));
$stmt_s = $qs->prepare();
$stmt_s->execute();
$json['idStatus'] = $stmt_s->fetchAll(PDO::FETCH_UNIQUE | PDO::FETCH_ASSOC);