<?php

class SCRM {
    public $modx;
    public $user;
    public $userGroups = array();
    public $d1d2 = null;

    function __construct(modX &$modx) {
        $this->modx =& $modx;
        $this->user = !$this->modx->user? 0 : $this->modx->user->get('id');
        include_once(CRM_PATH.'club_func.php');
        
        $http_host = strtolower($_SERVER['HTTP_HOST']);
        $prefixDIR = __DIR__.'/../scrm_prefix/';
        $prefixFILE = "{$prefixDIR}{$http_host}.php";
        include_once( file_exists($prefixFILE)? $prefixFILE : __DIR__.'/setup/prefix.php' );

        /*$prefix = empty($www[$http_host])? 'id' : $www[$http_host]['prefix'];
        define('CRM_PREFIX', $prefix.'_');*/
        
        if ($this->user) {
            $this->userGroups = $this->modx->user->getUserGroupNames();
            if (!in_array('www_'.substr(CRM_PREFIX, 0, -1), $this->userGroups) && !in_array('Administrator', $this->userGroups)) {
                $this->modx->user->endSession();
                $this->sendRedirect('/');
            }
        }
    
        $this->modx->addPackage('idDB', CRM_PATH.'start/model/', CRM_PREFIX);
    }
    
    function d1d2($d=1) {
        if (!$this->d1d2) {
            $this->d1d2 = array(
                $_REQUEST['d1']? (new DateTime($_REQUEST['d1']))->format('Y-m-d 00:00:00') : null, 
                $_REQUEST['d2']? (new DateTime($_REQUEST['d2']))->format('Y-m-d 23:59:59') : null,
            );
        }
        return $this->d1d2[$d-1];
    }
    
    function dbLoad() {
        $sections = ['fields', 'fieldMeta', 'composites', 'aggregates', 'indexes'];
        $modelPath = CRMTOOLS_PATH.'start/model/';
        $dbPath = $modelPath.CRM_PREFIX.'DB/';
        include($dbPath.'metadata.mysql.php');
        $loadClass = array(); $loadPack = false;
        foreach ($xpdo_meta_map as $topClassName => $cls) {
            foreach ($cls as $className) {
                if (in_array($className, $this->modx->classMap[$topClassName])) {
                    $loadClass[] = $className;
                } else {
                    $loadPack = true;
                }
            }
        }
        foreach ($loadClass as $className) {
            $clsPath = $dbPath.'mysql/'. strtolower($className) . '.map.inc.php';
            if (file_exists($clsPath)) {
                include($clsPath);
                $this->modx->loadClass($className);
                foreach($sections as $s) {
                    if ($xpdo_meta_map[$className][$s]) {
                        $this->modx->map[$className][$s] = array_merge($this->modx->map[$className][$s], $xpdo_meta_map[$className][$s]);
                    }
                }
            }
        }
        if ($loadPack) $this->modx->addPackage(CRM_PREFIX.'DB', $modelPath, CRM_PREFIX);
        //print_r($this->modx->map);
    }

    function sendRedirect($url, $options = []) {
        echo "<!DOCTYPE html>
        <html>
          <head>
            <meta http-equiv=\"refresh\" content=\"0; url='{$url}'\" />
          </head>
          <body>
            <h3><a href=\"{$url}\">Click me ...</a></h3>
            <script>setTimeout(function(){window.location='{$url}';}, 1000);</script>
          </body>
        </html>";
        $this->modx->sendRedirect($url, $options);
    }
    
    function sysFilePath($path) {
        if ($path) {
            $pi = pathinfo($path);
            $filename = explode('.', $pi['filename']);
            $path2 = $pi['dirname'] . '/' . implode('/', $filename) . '.' . $pi['extension'];
            $crm_path = implode(',', [CRMTOOLS_PATH, CRM_PATH]); // Заканчивается на '/'
            $file_path = implode(',', array(
                $pi['basename'],
                implode('/', $filename) . '.' . $pi['extension'],
            ));
            foreach (glob('{'. $crm_path .'}'. $pi['dirname'] .'/{'. $file_path .'}', GLOB_BRACE) as $hf) {
                return $hf;
            }
        }
        return null;
    }
}