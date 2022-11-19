<?php

if ($oper=='edit' && isset($data['published'])) {
    if (empty($data['published'])) {
        /*$wsp = $modx->newQuery('idSportsmen', array(
            'ssq.id:IN' => $ids,
        ));
        $wsp->innerJoin('idSportsmenSquad', 'ssq',
            '(ssq.sportsmen = idSportsmen.id AND ssq.squad = idSportsmen.squad)');
        $wsp->select(array('ssq.sportsmen'));
        $wsp->prepare();

        $modx->updateCollection('idSportsmen', array(
            'squad' => 0,
        ), array(
            "id IN (SELECT * FROM ({$wsp->toSQL()}) AS tbl)",
        ));*/
        
        $tblSportsmenSquad = $modx->getTableName('idSportsmenSquad');
        $tblSportsmen = $modx->getTableName('idSportsmen');
        $ids_join = implode(',', $ids);
        $modx->exec("UPDATE {$tblSportsmen} AS `sp`
            JOIN {$tblSportsmenSquad} AS `ssq` ON (ssq.sportsmen = sp.id AND ssq.squad = sp.squad)
            SET sp.squad = 0
            WHERE ssq.id IN ({$ids_join})");
    }
}