<?php  return array (
  'config' => 
  array (
    'allow_tags_in_post' => '1',
    'modRequest.class' => 'modManagerRequest',
  ),
  'aliasMap' => 
  array (
  ),
  'webLinkMap' => 
  array (
  ),
  'eventMap' => 
  array (
    'OnChunkFormPrerender' => 
    array (
      1 => '1',
    ),
    'OnDocFormPrerender' => 
    array (
      8 => '8',
      1 => '1',
    ),
    'OnFileCreateFormPrerender' => 
    array (
      1 => '1',
    ),
    'OnFileEditFormPrerender' => 
    array (
      8 => '8',
      1 => '1',
    ),
    'OnHandleRequest' => 
    array (
      7 => '7',
    ),
    'OnLoadWebDocument' => 
    array (
      6 => '6',
    ),
    'OnManagerPageBeforeRender' => 
    array (
      1 => '1',
    ),
    'OnMODXInit' => 
    array (
      2 => '2',
      3 => '3',
    ),
    'OnPluginFormPrerender' => 
    array (
      1 => '1',
      8 => '8',
    ),
    'OnRichTextEditorRegister' => 
    array (
      1 => '1',
    ),
    'OnSiteRefresh' => 
    array (
      2 => '2',
    ),
    'OnSnipFormPrerender' => 
    array (
      1 => '1',
    ),
    'OnTempFormPrerender' => 
    array (
      1 => '1',
    ),
    'OnTVInputRenderList' => 
    array (
      1 => '1',
    ),
    'OnWebPagePrerender' => 
    array (
      2 => '2',
    ),
  ),
  'pluginCache' => 
  array (
    1 => 
    array (
      'id' => '1',
      'source' => '0',
      'property_preprocess' => '0',
      'name' => 'Ace',
      'description' => 'Ace code editor plugin for MODx Revolution',
      'editor_type' => '0',
      'category' => '0',
      'cache_type' => '0',
      'plugincode' => '/**
 * Ace Source Editor Plugin
 *
 * Events: OnManagerPageBeforeRender, OnRichTextEditorRegister, OnSnipFormPrerender,
 * OnTempFormPrerender, OnChunkFormPrerender, OnPluginFormPrerender,
 * OnFileCreateFormPrerender, OnFileEditFormPrerender, OnDocFormPrerender
 *
 * @author Danil Kostin <danya.postfactum(at)gmail.com>
 *
 * @package ace
 *
 * @var array $scriptProperties
 * @var Ace $ace
 */
if ($modx->event->name == \'OnRichTextEditorRegister\') {
    $modx->event->output(\'Ace\');
    return;
}

if ($modx->getOption(\'which_element_editor\', null, \'Ace\') !== \'Ace\') {
    return;
}

$corePath = $modx->getOption(\'ace.core_path\', null, $modx->getOption(\'core_path\').\'components/ace/\');
$ace = $modx->getService(\'ace\', \'Ace\', $corePath.\'model/ace/\');
$ace->initialize();

$extensionMap = array(
    \'tpl\'   => \'text/x-smarty\',
    \'htm\'   => \'text/html\',
    \'html\'  => \'text/html\',
    \'css\'   => \'text/css\',
    \'scss\'  => \'text/x-scss\',
    \'less\'  => \'text/x-less\',
    \'svg\'   => \'image/svg+xml\',
    \'xml\'   => \'application/xml\',
    \'xsl\'   => \'application/xml\',
    \'js\'    => \'application/javascript\',
    \'json\'  => \'application/json\',
    \'php\'   => \'application/x-php\',
    \'sql\'   => \'text/x-sql\',
    \'md\'    => \'text/x-markdown\',
    \'txt\'   => \'text/plain\',
    \'twig\'  => \'text/x-twig\'
);

// Define default mime for html elements(templates, chunks and html resources)
$html_elements_mime=$modx->getOption(\'ace.html_elements_mime\',null,false);
if(!$html_elements_mime){
    // this may deprecated in future because components may set ace.html_elements_mime option now
    switch (true) {
        case $modx->getOption(\'twiggy_class\'):
            $html_elements_mime = \'text/x-twig\';
            break;
        case $modx->getOption(\'pdotools_fenom_parser\'):
            $html_elements_mime = \'text/x-smarty\';
            break;
        default:
            $html_elements_mime = \'text/html\';
    }
}

// Defines wether we should highlight modx tags
$modxTags = false;
switch ($modx->event->name) {
    case \'OnSnipFormPrerender\':
        $field = \'modx-snippet-snippet\';
        $mimeType = \'application/x-php\';
        break;
    case \'OnTempFormPrerender\':
        $field = \'modx-template-content\';
        $modxTags = true;
        $mimeType = $html_elements_mime;
        break;
    case \'OnChunkFormPrerender\':
        $field = \'modx-chunk-snippet\';
        if ($modx->controller->chunk && $modx->controller->chunk->isStatic()) {
            $extension = pathinfo($modx->controller->chunk->name, PATHINFO_EXTENSION);
            if(!$extension||!isset($extensionMap[$extension])){
                $extension = pathinfo($modx->controller->chunk->getSourceFile(), PATHINFO_EXTENSION);
            }
            $mimeType = isset($extensionMap[$extension]) ? $extensionMap[$extension] : \'text/plain\';
        } else {
            $mimeType = $html_elements_mime;
        }
        $modxTags = true;
        break;
    case \'OnPluginFormPrerender\':
        $field = \'modx-plugin-plugincode\';
        $mimeType = \'application/x-php\';
        break;
    case \'OnFileCreateFormPrerender\':
        $field = \'modx-file-content\';
        $mimeType = \'text/plain\';
        break;
    case \'OnFileEditFormPrerender\':
        $field = \'modx-file-content\';
        $extension = pathinfo($scriptProperties[\'file\'], PATHINFO_EXTENSION);
        $mimeType = isset($extensionMap[$extension])
            ? $extensionMap[$extension]
            : (\'@FILE:\'.pathinfo($scriptProperties[\'file\'], PATHINFO_BASENAME));
        $modxTags = $extension == \'tpl\';
        break;
    case \'OnDocFormPrerender\':
        if (!$modx->controller->resourceArray) {
            return;
        }
        $field = \'ta\';
        $mimeType = $modx->getObject(\'modContentType\', $modx->controller->resourceArray[\'content_type\'])->get(\'mime_type\');

        if($mimeType == \'text/html\')$mimeType = $html_elements_mime;

        if ($modx->getOption(\'use_editor\')){
            $richText = $modx->controller->resourceArray[\'richtext\'];
            $classKey = $modx->controller->resourceArray[\'class_key\'];
            if ($richText || in_array($classKey, array(\'modStaticResource\',\'modSymLink\',\'modWebLink\',\'modXMLRPCResource\'))) {
                $field = false;
            }
        }
        $modxTags = true;
        break;
    case \'OnTVInputRenderList\':
        $modx->event->output($corePath . \'elements/tv/input/\');
        break;
    default:
        return;
}

$modxTags = (int) $modxTags;
$script = \'\';
if ($field) {
    $script .= "MODx.ux.Ace.replaceComponent(\'$field\', \'$mimeType\', $modxTags);";
}

if ($modx->event->name == \'OnDocFormPrerender\' && !$modx->getOption(\'use_editor\')) {
    $script .= "MODx.ux.Ace.replaceTextAreas(Ext.query(\'.modx-richtext\'));";
}

if ($script) {
    $modx->controller->addHtml(\'<script>Ext.onReady(function() {\' . $script . \'});</script>\');
}',
      'locked' => '0',
      'properties' => NULL,
      'disabled' => '0',
      'moduleguid' => '',
      'static' => '0',
      'static_file' => 'ace/elements/plugins/ace.plugin.php',
    ),
    2 => 
    array (
      'id' => '2',
      'source' => '1',
      'property_preprocess' => '0',
      'name' => 'pdoTools',
      'description' => '',
      'editor_type' => '0',
      'category' => '2',
      'cache_type' => '0',
      'plugincode' => '/** @var modX $modx */
switch ($modx->event->name) {

    case \'OnMODXInit\':
        $fqn = $modx->getOption(\'pdoTools.class\', null, \'pdotools.pdotools\', true);
        $path = $modx->getOption(\'pdotools_class_path\', null, MODX_CORE_PATH . \'components/pdotools/model/\', true);
        $modx->loadClass($fqn, $path, false, true);

        $fqn = $modx->getOption(\'pdoFetch.class\', null, \'pdotools.pdofetch\', true);
        $path = $modx->getOption(\'pdofetch_class_path\', null, MODX_CORE_PATH . \'components/pdotools/model/\', true);
        $modx->loadClass($fqn, $path, false, true);
        break;

    case \'OnSiteRefresh\':
        /** @var pdoTools $pdoTools */
        if ($pdoTools = $modx->getService(\'pdoTools\')) {
            if ($pdoTools->clearFileCache()) {
                $modx->log(modX::LOG_LEVEL_INFO, $modx->lexicon(\'refresh_default\') . \': pdoTools\');
            }
        }
        break;

    case \'OnWebPagePrerender\':
        $parser = $modx->getParser();
        if ($parser instanceof pdoParser) {
            foreach ($parser->pdoTools->ignores as $key => $val) {
                $modx->resource->_output = str_replace($key, $val, $modx->resource->_output);
            }
        }
        break;
}',
      'locked' => '0',
      'properties' => NULL,
      'disabled' => '0',
      'moduleguid' => '',
      'static' => '0',
      'static_file' => 'core/components/pdotools/elements/plugins/plugin.pdotools.php',
    ),
    3 => 
    array (
      'id' => '3',
      'source' => '0',
      'property_preprocess' => '0',
      'name' => 'clubPackage',
      'description' => '',
      'editor_type' => '0',
      'category' => '1',
      'cache_type' => '0',
      'plugincode' => '/*ini_set(\'error_reporting\', E_ALL);
ini_set(\'display_errors\', 1);
ini_set(\'display_startup_errors\', 1);*/

define(\'CRM_PATH\', MODX_ASSETS_PATH.\'id/\');
define(\'CRM_URL\', MODX_ASSETS_URL.\'id/\');
define(\'CRM_FILES\', MODX_BASE_PATH.\'files/\');

define(\'CRMTOOLS_PATH\', MODX_ASSETS_PATH.\'clubtools/\');
define(\'CRMTOOLS_URL\', MODX_ASSETS_URL.\'clubtools/\');
define(\'CRM_LOGS\', MODX_ASSETS_PATH.\'scrm_log/\');
        
//$modx->loadClass(\'modResource\'); // здесь потому что при сохранении в mgr 
$modx->map[\'modResource\'][\'fields\'][\'club_id\'] = 0;
$modx->map[\'modResource\'][\'fieldMeta\'][\'club_id\'] = array(
	\'dbtype\' => \'int\',
	\'phptype\' => \'integer\',
	\'null\' => false,
	\'default\' => 0,
);

if ($modx->context->key == \'web\') {
    $scrm = $modx->getService(\'scrm\', \'SCRM\', CRM_PATH);
    $userID = $scrm->user; // TODO: Удалить

    $cache_path = CRM_PREFIX.\'/clubConfig/init\';
    $club_opts = $modx->cacheManager->get($cache_path);
    if (empty($club_opts)) {
        $club_opts = clubConfig(\'site_name,site_fullname,club_key,club_logo,club_modules,https,dbXML\', 0, 1);
        if (!$club_opts[\'club_logo\']) {
            $club_opts[\'club_logo\'] = CRM_URL.\'images/sportcrm_logo.png\';
        }

        $club_opts[\'club_modules\'] = empty($club_opts[\'club_modules\'])? array() : explode(\',\', $club_opts[\'club_modules\']);
        array_unshift($club_opts[\'club_modules\'], \'clubStuff\', CRM_PREFIX);
        $club_opts[\'crm_url\'] = CRM_URL;
        $club_opts[\'crmtools_url\'] = CRMTOOLS_URL;
        $modx->cacheManager->set($cache_path, $club_opts, 86400*3); // 3 дней
    }
    
    if ($club_opts[\'dbXML\']) $scrm->dbLoad();
    

    if (!empty($club_opts[\'https\'])) {
    ## Иногда, особенно на sweb надо добавлять в конфиг
    ## $isSecureRequest = ((isset($_SERVER[\'HTTPS\']) && !empty($_SERVER[\'HTTPS\']) && strtolower($_SERVER[\'HTTPS\']) !== \'off\') || $_SERVER[\'SERVER_PORT\'] == $https_port || (isset($_SERVER[\'HTTP_X_FORWARDED_PROTO\']) && $_SERVER[\'HTTP_X_FORWARDED_PROTO\'] === \'https\'));
        
        $isHttps = (isset($_SERVER[\'HTTPS\']) && $_SERVER[\'HTTPS\'] === \'on\')
        || (isset($_SERVER[\'REQUEST_SCHEME\']) && $_SERVER[\'REQUEST_SCHEME\'] === \'https\')
        || (isset($_SERVER[\'HTTP_X_FORWARDED_PROTO\']) && $_SERVER[\'HTTP_X_FORWARDED_PROTO\'] === \'https\');
        if (!$isHttps) {
            $modx->sendRedirect(\'https://\'.$_SERVER[\'HTTP_HOST\'].$_SERVER[\'REQUEST_URI\'], array(
                \'responseCode\' => \'HTTP/1.1 301 Moved Permanently\')
            );
        } else {
            //$modx->setOption(\'site_url\', \'https://\'.$_SERVER[\'HTTP_HOST\']);
            $modx->setOption(\'server_protocol\', \'https\');
        }
    }
    
    $club_opts[\'club_name\'] = $club_opts[\'site_name\']; // TODO: Надо ли?
    $club_opts[\'scrm_ugroups\'] = $userGroups = $scrm->userGroups;
    $club_opts[\'scrm_grhash\'] = empty($scrm->userGroups)? \'empty\' : cacheHash($scrm->userGroups);
    $club_opts[\'scrm_prugv\'] = cacheHash([ CRM_PREFIX, $scrm->user, $_SESSION[\'scrm_thislogin\'], $modx->getOption(\'vers\') ]);
    
    foreach($club_opts as $okey => $oval) {
        $modx->setOption($okey, $oval);
    }
    $club_opts[\'site_url\'] = $modx->getOption(\'site_url\');
    $modx->setPlaceholders($club_opts, \'+\');
    
    $rq = explode(\'/\', $_REQUEST[\'q\']);
    
    $club_modules = implode(\',\', $club_opts[\'club_modules\']);
    define(\'CRM_START\', \'{\'. implode(\',\', [CRMTOOLS_PATH, CRM_PATH]) .\'}start/{\'. $club_modules .\'}_\');
    foreach (glob(CRM_START.\'init.php\', GLOB_BRACE) as $data_handler) require($data_handler);

    include(CRM_PATH.\'hook.php\');
}',
      'locked' => '0',
      'properties' => 'a:0:{}',
      'disabled' => '0',
      'moduleguid' => '',
      'static' => '0',
      'static_file' => '',
    ),
    6 => 
    array (
      'id' => '6',
      'source' => '1',
      'property_preprocess' => '0',
      'name' => 'clubScripts',
      'description' => '',
      'editor_type' => '0',
      'category' => '1',
      'cache_type' => '0',
      'plugincode' => '$res = $modx->resource;
$start = \'\'; $bottom = \'\'; $app = array(
    \'club_id\' => $res->get(\'club_id\'),
    \'club_city\' => $_SESSION[\'club_city\'],
);
if (defined(\'CRM_PREFIX\') && !empty($res->get(\'template\'))) {
    //$modx->log(modX::LOG_LEVEL_ERROR,"Log2 ".json_encode($res->toArray(), JSON_UNESCAPED_UNICODE));

    $cfg = clubConfig(\'StartupHTMLBlock,BottomHTMLBlock\'); //grid_rows
    $start = $cfg[\'StartupHTMLBlock\'];
    $bottom = $cfg[\'BottomHTMLBlock\'];
    //$app[\'res\'] = $res->toArray(\'\',false,false,true);
    //$app[\'res\'][\'content\'] = null;

    $app[\'ugroups\'] = $ugroups = $modx->getOption(\'scrm_ugroups\');
    if (!empty($ugroups)){
        $app[\'is_crew\'] = isCrew();
    }
    
    $club_modules = $modx->getOption(\'club_modules\');
    $clubStatus = getClubStatus(array(
        \'tbl\' => \'idModule\',
        \'cls:IN\' => $club_modules,
    )); //idPermission
    
    //$bottom .= \'111\'.json_encode($club_modules);
    $userID = $modx->scrm->user;
    $load_modules = array();
    $pathReplace1 = array(\'{crm}\',\'{modules}\',\'{vers}\',\'{user}\', \'{prugv}\');
    $pathReplace2 = array(
        CRM_URL,
        \'/handlers/modules/\',
        \'v=\'.$modx->getOption(\'vers\'),
        $userID,
        $modx->getOption(\'scrm_prugv\'),
    );
    
    foreach($clubStatus as $rowMod) {
        if ($rowMod[\'tbl\'] != \'idModule\') continue;
        $ext = $rowMod[\'extended\'];
        //if (!in_array($rowMod[\'cls\'], $club_modules)) continue;
        if (!empty($ext[\'group\'])) {
            if (empty($ugroups)) continue;
            $check_groups = array_merge(array(\'all\'), $ugroups);
            if (empty(array_intersect(explode(\',\', $ext[\'group\']), $check_groups))) continue;
        }
        if (!empty($ext[\'club_id\']) && !in_array($app[\'club_id\'], explode(\',\', $ext[\'club_id\']))) continue;
        if (!empty($ext[\'script\'])) {
            $bottom .= \'<script src="\'. str_replace($pathReplace1, $pathReplace2, $ext[\'script\']) .\'"></script>\';
        }
        if (!empty($ext[\'load\'])) {
            $load_modules[] = str_replace($pathReplace1, $pathReplace2, $ext[\'load\']);
        }
    }
    if (!empty($load_modules)) {
        $bottom .= \'<script>$(function(){SCRM.loadSeries(\'.json_encode($load_modules).\');});</script>\';
    }

    foreach (glob(CRM_START.\'load.php\', GLOB_BRACE) as $data_handler) require($data_handler);
}

$modx->setPlaceholders(array(
    \'StartupHTMLBlock\' => \'<script>$.extend(SCRM.app, \'. json_encode($app) .\');</script>\'.PHP_EOL.$start,
    \'BottomHTMLBlock\' => $bottom,
));',
      'locked' => '0',
      'properties' => 'a:0:{}',
      'disabled' => '0',
      'moduleguid' => '',
      'static' => '0',
      'static_file' => '',
    ),
    7 => 
    array (
      'id' => '7',
      'source' => '0',
      'property_preprocess' => '0',
      'name' => 'clubHandleRequest',
      'description' => '',
      'editor_type' => '0',
      'category' => '1',
      'cache_type' => '0',
      'plugincode' => '//if ($modx->event->name != \'OnPageNotFound\') {return false;}
// echo json_encode($json, JSON_UNESCAPED_UNICODE);
//if (defined(\'CLUB_FORWARD\')) return false;
//define(\'CLUB_FORWARD\', 1);

$rq = explode(\'/\', $_REQUEST[\'q\']);
if ($rq[0]==\'qr.html\') {
    if (!$qr = $modx->findResource(\'qr/\')) return false; // если нет раздела выход
    $modx->sendForward($qr);
}
/*if ($rq[0]==\'start\') {
    $modx->resource = $modx->newObject(\'modResource\');
    $modx->resource->set(\'cacheable\', 0);
    
    //include(\'eform.php\');
    
    $modx->resource->set(\'pagetitle\', $modx->getOption(\'title\', $json, \'33Start!!\'));
    
    $modx->setPlaceholder(\'pageBody\', \'He423lllo!\');
    $modx->sendForward($modx->findResource(\'start/\'), array(
       \'merge\' => 1,
       \'forward_merge_excludes\' => \'template,type\'
    ), false);
}*/',
      'locked' => '0',
      'properties' => NULL,
      'disabled' => '0',
      'moduleguid' => '',
      'static' => '0',
      'static_file' => '',
    ),
    8 => 
    array (
      'id' => '8',
      'source' => '0',
      'property_preprocess' => '0',
      'name' => 'bitBtn',
      'description' => '',
      'editor_type' => '0',
      'category' => '1',
      'cache_type' => '0',
      'plugincode' => '$modx->controller->addHtml("<script>
function timeout(){
    setTimeout(function() {
        if (Ext.getCmp(\'modx-action-buttons\') != undefined) {
            var toolBar = Ext.getCmp(\'modx-action-buttons\');
            var buttons = [];
            buttons.push({
                text: \'.git\',
                handler: function () {
                    var commit = prompt(\'Описание версии\'),
                    folder;
                    if ( commit != undefined ) {
                        var json = {
                            commit: commit
                        };
                        if ( Ext.getCmp(\'modx-resource-content\' ) != undefined ) {
                            json.resid = MODx.request.id;
                        } else if ( Ext.getCmp(\'modx-file-content\' ) != undefined ) {
                            json.folder = Ext.getCmp(\'modx-file-name\').value;
                        } else if ( Ext.getCmp(\'modx-template-content\' ) != undefined  ) {
                            json.tmplid = MODx.request.id;
                        } else if ( Ext.getCmp(\'modx-plugin-plugincode\') != undefined  ) {
                            json.pluginid = MODx.request.id;
                        }
                        //var json = JSON.stringify(json);
                        Ext.Ajax.request({
                           url: \'/hook/bitbucket\', // where you wanna post
                           success: function() {
                                alert(\'Saved\');
                           },   // function called on success
                           failure: function() {
                                alert(\'Failed\');
                           },
                           params: json  // your json data
                        });
                        /*var xhr = new XMLHttpRequest();
                        var json = JSON.stringify(json);
                        xhr.open(\'POST\', \'/hook/bitbucket\', true)
                        xhr.setRequestHeader(\'Content-type\', \'application/json; charset=utf-8\');
                        xhr.send(json);*/
                    }
                }
            });
            toolBar.addButton(buttons);
            toolBar.doLayout();
        } else {
            timeout();
        }
    }, 100)
}
timeout();
</script>");',
      'locked' => '0',
      'properties' => NULL,
      'disabled' => '0',
      'moduleguid' => '',
      'static' => '0',
      'static_file' => '',
    ),
  ),
  'policies' => 
  array (
    'modAccessContext' => 
    array (
      'mgr' => 
      array (
        0 => 
        array (
          'principal' => 1,
          'authority' => 0,
          'policy' => 
          array (
            'about' => true,
            'access_permissions' => true,
            'actions' => true,
            'change_password' => true,
            'change_profile' => true,
            'charsets' => true,
            'class_map' => true,
            'components' => true,
            'content_types' => true,
            'countries' => true,
            'create' => true,
            'credits' => true,
            'customize_forms' => true,
            'dashboards' => true,
            'database' => true,
            'database_truncate' => true,
            'delete_category' => true,
            'delete_chunk' => true,
            'delete_context' => true,
            'delete_document' => true,
            'delete_weblink' => true,
            'delete_symlink' => true,
            'delete_static_resource' => true,
            'delete_eventlog' => true,
            'delete_plugin' => true,
            'delete_propertyset' => true,
            'delete_role' => true,
            'delete_snippet' => true,
            'delete_template' => true,
            'delete_tv' => true,
            'delete_user' => true,
            'directory_chmod' => true,
            'directory_create' => true,
            'directory_list' => true,
            'directory_remove' => true,
            'directory_update' => true,
            'edit_category' => true,
            'edit_chunk' => true,
            'edit_context' => true,
            'edit_document' => true,
            'edit_weblink' => true,
            'edit_symlink' => true,
            'edit_static_resource' => true,
            'edit_locked' => true,
            'edit_plugin' => true,
            'edit_propertyset' => true,
            'edit_role' => true,
            'edit_snippet' => true,
            'edit_template' => true,
            'edit_tv' => true,
            'edit_user' => true,
            'element_tree' => true,
            'empty_cache' => true,
            'error_log_erase' => true,
            'error_log_view' => true,
            'events' => true,
            'export_static' => true,
            'file_create' => true,
            'file_list' => true,
            'file_manager' => true,
            'file_remove' => true,
            'file_tree' => true,
            'file_update' => true,
            'file_upload' => true,
            'file_unpack' => true,
            'file_view' => true,
            'flush_sessions' => true,
            'frames' => true,
            'help' => true,
            'home' => true,
            'import_static' => true,
            'languages' => true,
            'lexicons' => true,
            'list' => true,
            'load' => true,
            'logout' => true,
            'logs' => true,
            'menus' => true,
            'menu_reports' => true,
            'menu_security' => true,
            'menu_site' => true,
            'menu_support' => true,
            'menu_system' => true,
            'menu_tools' => true,
            'menu_user' => true,
            'messages' => true,
            'namespaces' => true,
            'new_category' => true,
            'new_chunk' => true,
            'new_context' => true,
            'new_document' => true,
            'new_document_in_root' => true,
            'new_plugin' => true,
            'new_propertyset' => true,
            'new_role' => true,
            'new_snippet' => true,
            'new_static_resource' => true,
            'new_symlink' => true,
            'new_template' => true,
            'new_tv' => true,
            'new_user' => true,
            'new_weblink' => true,
            'packages' => true,
            'policy_delete' => true,
            'policy_edit' => true,
            'policy_new' => true,
            'policy_save' => true,
            'policy_template_delete' => true,
            'policy_template_edit' => true,
            'policy_template_new' => true,
            'policy_template_save' => true,
            'policy_template_view' => true,
            'policy_view' => true,
            'property_sets' => true,
            'providers' => true,
            'publish_document' => true,
            'purge_deleted' => true,
            'remove' => true,
            'remove_locks' => true,
            'resource_duplicate' => true,
            'resourcegroup_delete' => true,
            'resourcegroup_edit' => true,
            'resourcegroup_new' => true,
            'resourcegroup_resource_edit' => true,
            'resourcegroup_resource_list' => true,
            'resourcegroup_save' => true,
            'resourcegroup_view' => true,
            'resource_quick_create' => true,
            'resource_quick_update' => true,
            'resource_tree' => true,
            'save' => true,
            'save_category' => true,
            'save_chunk' => true,
            'save_context' => true,
            'save_document' => true,
            'save_plugin' => true,
            'save_propertyset' => true,
            'save_role' => true,
            'save_snippet' => true,
            'save_template' => true,
            'save_tv' => true,
            'save_user' => true,
            'search' => true,
            'set_sudo' => true,
            'settings' => true,
            'sources' => true,
            'source_delete' => true,
            'source_edit' => true,
            'source_save' => true,
            'source_view' => true,
            'steal_locks' => true,
            'tree_show_element_ids' => true,
            'tree_show_resource_ids' => true,
            'undelete_document' => true,
            'unlock_element_properties' => true,
            'unpublish_document' => true,
            'usergroup_delete' => true,
            'usergroup_edit' => true,
            'usergroup_new' => true,
            'usergroup_save' => true,
            'usergroup_user_edit' => true,
            'usergroup_user_list' => true,
            'usergroup_view' => true,
            'view' => true,
            'view_category' => true,
            'view_chunk' => true,
            'view_context' => true,
            'view_document' => true,
            'view_element' => true,
            'view_eventlog' => true,
            'view_offline' => true,
            'view_plugin' => true,
            'view_propertyset' => true,
            'view_role' => true,
            'view_snippet' => true,
            'view_sysinfo' => true,
            'view_template' => true,
            'view_tv' => true,
            'view_unpublished' => true,
            'view_user' => true,
            'workspaces' => true,
          ),
        ),
      ),
    ),
  ),
);