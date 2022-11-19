<?php
if (in_array($oper, ['add', 'edit'])) {
    //$clubConfig = clubConfig('idSportsmen_arc,autouser'); 
    //$idSportsmen_arc = explode(',', $clubConfig['idSportsmen_arc']); // Должно быть из before
    if (!empty($row)){
        $sdata = $row->toArray();
        
        if ($clubConfig['autouser'] && !$sdata['iduser'] &&
            $sdata['email'] && !in_array($sdata['status'], $idSportsmen_arc)) {
            $sdata['fullname'] = $sdata['contact'];
            $sdata['idUserRow'] = $row;
            $sdata['user_group'] = 'idSportsmen';
            $modx->runSnippet('idUser', $sdata);
        }
    
        /*if ($oper == 'add') {
            $ch = $modx->newObject('idChanges', array(
                'sportsmen' => $sdata['id'],
                'chfield' => 'status',
                'author' => $userID,
                'newvalue' => 'new',
            ));
            $ch->save();
            
            //CREATE TRIGGER `%prefix%sportsmen_ai` AFTER INSERT ON `%prefix%sportsmen` FOR EACH ROW
            //INSERT INTO %prefix%changes SET sportsmen = NEW.id, newvalue = 'new', author = NEW.author
        }*/
    }
    
    if (!empty($data['squad']) || !empty($data['status'])) {
        # Добавить основную группу если спортсмен возвращается из Архива. Событие может сработать при смене статуса.
        # Сложная выборка чтобы не добавлять уже существующую группу и не выпадать в ошибку.

        $wsp = $modx->newQuery('idSportsmen', array(
            'idSportsmen.id:IN' => $ids,
            'idSportsmen.status:NOT IN' => $idSportsmen_arc,
            'idSportsmen.squad:!=' => 0,
        ));
        $wsp->leftJoin('idSportsmenSquad', 'ssq', '(ssq.sportsmen = idSportsmen.id AND ssq.squad = idSportsmen.squad AND ssq.dateend IS NULL)');
        $wsp->select(array(
            'idSportsmen.id',
            'idSportsmen.squad',
            'ssq.id as ssq_id',
        ));
        $wsp->having('ssq_id IS NULL');
        foreach($modx->getIterator('idSportsmen', $wsp) as $sp_key => $sp_row) {
            $ssq = $modx->newObject('idSportsmenSquad', array(
                'sportsmen' => $sp_row->get('id'),
                'squad' => $sp_row->get('squad'),
                'author' => $userID,
                # 'ismain' => 42,
            ));
            $ssq->save();
        }
    }
}