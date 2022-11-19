<?php

class SCRMsetup {
    public $modx;
    public $emp_uid;
    public $club_modules;

    function __construct(modX &$modx) {
        $this->modx =& $modx;
        
        $this->emp_uid = empty($modx->user) || !$modx->user->hasSessionContext('web');
        if ($this->emp_uid) {
            $modx->user = $modx->getObject('modUser', 1);
            $modx->user->addSessionContext('web');
            $modx->invokeEvent('OnWebLogin',array(
                'user' => $modx->user,
                'returnUrl' => '/', // чтобы не перебрасывал автоматом
            ));
            echo '<h6 style="color:red;">Не залогинен</h6>';
        }
        
        $this->club_modules = array('clubStuff', 'clubLogin', 'clubModules');
        $oclub_modules = $modx->getOption('club_modules'); // 'clubShop', etc...
        if (!empty($oclub_modules)) {
            if (gettype($oclub_modules) == 'string') $oclub_modules = explode(',', $oclub_modules);
            $this->club_modules = array_unique(array_merge($this->club_modules, $oclub_modules));
        }
        
        if ($modx->user->get('sudo')) {
            $ugroups = $modx->user->getUserGroupNames();
            if (!in_array('idManager', $ugroups)) $modx->user->joinGroup('idManager','Member', 5);
            if (!in_array('idAdmin', $ugroups)) $modx->user->joinGroup('idAdmin','Member', 7);
        }
    }
    
    function setupFields($debug = false) {
        $modx = $this->modx;
        include(__DIR__.'/setup_db_fields.php');
    }

    function setupTrigger() {
        foreach (['TRIGGER','PROCEDURE','TRIGGER.del','PROCEDURE.del'] as $sql_dir) {
            foreach (glob(__DIR__."/sql/{$sql_dir}/*", GLOB_BRACE) as $sql_file) {
                $sql_type = explode('.', $sql_dir);
                $pi = pathinfo($sql_file);
                $sql_name = str_replace("@@@", CRM_PREFIX, $pi['filename']);
                $this->modx->exec("DROP {$sql_type[0]} IF EXISTS `{$sql_name}`");
                if (!$sql_type[1]) {
                    $sql_text = str_replace("@@@", CRM_PREFIX, file_get_contents($sql_file));
                    $this->modx->exec("CREATE {$sql_type[0]} `{$sql_name}` ".$sql_text);
                }
            }
        }
    }
    
    function dirDel ($dir) {
        if (!file_exists($dir)) return false;
        $d=opendir($dir);  
        while(($entry=readdir($d))!==false) { 
            if ($entry != "." && $entry != "..") { 
                if (is_dir($dir."/".$entry)) {
                    $this->dirDel($dir."/".$entry);  
                } else {
                    unlink ($dir."/".$entry);  
                } 
            } 
        } 
        closedir($d);  
        rmdir($dir);  
    }
    
    function delOldFiles() {
        foreach (explode(PHP_EOL, file_get_contents(__DIR__.'/delFile.txt')) as $dfile){
            $dfile = MODX_BASE_PATH.$dfile;
            if (file_exists($dfile)) unlink($dfile);
        }
        foreach (explode(PHP_EOL, file_get_contents(__DIR__.'/delDir.txt')) as $ddir){
            $this->dirDel(MODX_BASE_PATH.$ddir);
        }
    }
    
    function firstData(){
        $modx = $this->modx;
        if ($modx->getCount('idCity') == 0) {
            $modx->newObject('idCity', array(
                'name' => 'City1',
                'alias' => 'city1',
            ))->save();
        }
        
        if ($modx->getCount('idClub') == 0) {
            $city = $modx->getObject('idCity', array('id:!=' => null));
            $idClub = $modx->newObject('idClub', array(
                'name' => 'Club1',
                'city' => $city->get('id'),
            ));
            $idClub->save();
            $idSquad = $modx->newObject('idSquad', array(
                'name' => 'Group1',
                'club' => $idClub->get('id'),
            ));
            $idSquad->save();
        }
        
        if ($modx->getCount('idSport') == 0) {
            $modx->newObject('idSport', array(
                'name' => 'Sport1',
                'shortname' => 'SP',
                'color' => '#E8FFD1',
            ))->save();
        }
        
        if ($modx->getCount('idLevel') == 0) {
            $modx->newObject('idLevel', array(
                'name' => 'Beginner',
            ))->save();
        }
        
        if ($modx->getCount('idInvoiceType') == 0) {
            $pass = $modx->newObject('idInvoiceType', array(
                'name' => 'Group Pass',
                'period' => 'last day of this month'
            ));
            $pass->save();
            $modx->newObject('idSInvType', array(
                'stype' => 'a',
                'typeinvoice' => $pass->get('id'),
            ))->save();
        }
    }
    
    function fixScript(){
        $modx = $this->modx;
        foreach($modx->getIterator('idStatus', array(
            'tbl' => 'SetupScript',
            'published' => 1,
        )) as $script) {
            $sfile = __DIR__ . '/hook/'. $script->get('alias') . '.php';
            if (file_exists($sfile)) include($sfile);
            $script->set('published', 0);
            $script->save();
        }
    }
    
    function sendStat() {
        $modx = $this->modx;
        include_once(CRM_PATH.'hook/wsendstat.php');
    }
}