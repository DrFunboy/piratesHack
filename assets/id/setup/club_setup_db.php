<?php

$clubid_query = $modx->query("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.`TABLES`
    WHERE TABLE_NAME LIKE '". CRM_PREFIX ."%' AND ENGINE = 'MyISAM'");
foreach ($clubid_query->fetchAll(PDO::FETCH_ASSOC) as $row) {
    $modx->exec("ALTER TABLE `{$row['TABLE_NAME']}` ENGINE=InnoDB");
    echo "Конвертирую {$row['TABLE_NAME']}<br>";
}

$setup->setupFields(true);
$setup->setupTrigger();

$idConfig = $modx->getTableName('idConfig');
if (!empty($idConfig)) { // БД Инициализирована
    /*
    $idSportsmen = $modx->getTableName('idSportsmen');
    $idChanges = $modx->getTableName('idChanges');
    
    $modx->exec("DROP TRIGGER IF EXISTS `".CRM_PREFIX."sportsmen_ai`");
    $modx->exec("CREATE TRIGGER `".CRM_PREFIX."sportsmen_ai`
    AFTER INSERT ON $idSportsmen FOR EACH ROW
    INSERT INTO $idChanges SET sportsmen = NEW.id, newvalue = 'new', author = NEW.author;");*/
    
    //$modx->exec("ALTER TABLE {$idConfig} CHANGE `value` `val` text");

    //$idEvent = $modx->getTableName('idEvent');
    //$modx->exec("ALTER TABLE {$idEvent} MODIFY `status` varchar(70) NOT NULL DEFAULT '' ");
    
    //$modUserGroupMember = $modx->getTableName('modUserGroupMember');
    //$modx->exec("CREATE INDEX member ON {$modUserGroupMember}(member)");
    
    //$sql = "DROP TRIGGER IF EXISTS `%prefix%sportsmen_ai`";
    //$modx->exec(str_replace("%prefix%", CRM_PREFIX, $sql));
    

    /*
    $modx->exec("ALTER TABLE {$idSportsmen} MODIFY `status` varchar(25) NOT NULL DEFAULT 'Действует' ");
    $modx->updateCollection('idInvoice', array('status' => ''), array('status' => 'Не определен'));
    */
    
    $idStatus = unserialize( file_get_contents(__DIR__ . '/clubStatus.txt') );

    foreach($idStatus as $id => $status) {
        if (in_array($status['tbl'], array('idModule','idConfig')) && !in_array($status['cls'], $club_modules)) {
            // Для модулей и конфига дополнительная проверка допустим ли такой модуль
            continue;
        }

        $st = $modx->getObject('idStatus', array(
            'club_id' => $status['club_id'],
            array(
                'OR:tbl:=' => $status['tbl'],
                'alias' => $status['alias'],
            ),
        ));
        if (empty($st)) $st = $modx->newObject('idStatus', $status);
        if ($st->get('edited')) continue;
        $st->fromArray($status);
        $st->save();
        if ($status['tbl']=='idPayMethod') {
            $wPayMethod = array(
                'parent' => 0,
                'extid' => $st->get('id'),
            );
            if (empty(getClubExtId($wPayMethod, 'idCity_Pay'))) setClubExtId($wPayMethod, 'idCity_Pay');
        }
    }
    
    $cfg_def = array();
    foreach (glob(__DIR__ . "/cfg/*", GLOB_BRACE) as $cfg_file) {
        $pi = pathinfo($cfg_file);
        $cfg_def[ $pi['filename'] ] = file_get_contents($cfg_file);
    }
    if (isset($_REQUEST['key'])) $cfg_def['club_key'] = $_REQUEST['key'];
    
    foreach ($modx->getIterator('idConfig', array(
            'name:IN' => array_keys($cfg_def),
        )) as $cfg_row) {
        $cfg = $cfg_row->get('name');
        if ($cfg=='club_logo') $cfg_row->remove(); else // Закомментировать эту строку
        unset($cfg_def[$cfg]);
        /*if ($cfg == 'club_residue') {
            echo('<br>club_residue: '. $cfg_row->get('val'));
            $cfg_def['schedule_a'] = $cfg_row->get('val');
            $cfg_row->remove();
            
            $idLesson = $modx->getTableName('idLesson');
            $idInvoiceLesson = $modx->getTableName('idInvoiceLesson');
            $modx->exec("UPDATE {$idLesson} l JOIN {$idInvoiceLesson} il ON il.idlesson = l.id SET l.idinvoice = il.idinvoice");
            
            $idInvoice = $modx->getTableName('idInvoice');
            $idInvoiceType = $modx->getTableName('idInvoiceType');
            $modx->exec("UPDATE {$idInvoice} inv JOIN {$idInvoiceType} it ON (it.id = inv.typeinvoice) SET inv.lesson_amount = it.amount");
        }*/
    }

    foreach ($cfg_def as $cfg => $val) {
        $cfg_row = $modx->newObject('idConfig', array(
            'name' => $cfg,
            'val' => $val,
        ));
        $cfg_row->save();
        if ($cfg=='club_logo') {
            $scrmFiles = $modx->getService('scrmfiles', 'scrmFiles', CRM_PATH);
            $logoFile = $modx->getObject('idFiles', array('uid' => 'logoClub'));
            if ($logoFile) {
                $cfg_row->set('val', $scrmFiles->fileUrl($logoFile->toArray(), 'logo'));
                $cfg_row->save();
            }
        }
    }
    
    
    foreach (glob("tmpl/*", GLOB_BRACE) as $tpl_file) {
        $pi = pathinfo($tpl_file);
        $filename = $pi['filename'];
        $w = array('handler' => $filename);
        $tmpl = $modx->getObject('idTmpl', $w);
        if (empty($tmpl)) {
            $w['type'] = '';
            $w['name'] = $filename;
            $tmpl = $modx->newObject('idTmpl', $w);
        }
        if ($tmpl->get('type')=='') {
            $tpl_content = preg_split('/\r\n|\r|\n/', file_get_contents($tpl_file));
            $tpl_subj = array_shift($tpl_content);
            $tmpl->set('subj', $tpl_subj);
            $tmpl->set('content', implode(PHP_EOL, $tpl_content));
            $tmpl->save();
        }
    }

    
    $setup->firstData();
    $setup->fixScript();
} // end БД Загружена
