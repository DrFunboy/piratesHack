<?php  return array (
  'resourceClass' => 'modDocument',
  'resource' => 
  array (
    'id' => 83,
    'type' => 'document',
    'contentType' => 'text/html',
    'pagetitle' => 'Камера',
    'longtitle' => '',
    'description' => '',
    'alias' => 'камера',
    'alias_visible' => 1,
    'link_attributes' => '',
    'published' => 1,
    'pub_date' => 0,
    'unpub_date' => 0,
    'parent' => 0,
    'isfolder' => 0,
    'introtext' => '',
    'content' => ' <style>
 video::-webkit-media-controls {
  display: none;
 }
  .camera{
      display: flex;
      align-content: center;
      justify-content: center;
      align-items: center;
  }

</style>
 <body onload="init();">
    <h3>Вы можете отсканировать элетромобиль и проверить его по нашей базе</h3>
   Сделайте фото или загрузите его.
     <p>
    <button onclick="startWebcam();">Сделать фото</button>
    <button>Загрузить фото</button>
    </p>
    <video onclick="snapshot(this);"  autoplay="autoplay" width=400 height=400 id="video" controls autoplay></video>
 <!--<button onclick="snapshot();">Take Snapshot</button>-->
  <p>
            Ваше фото : <p>
            <div class="camera">
      <canvas  id="myCanvas" width="300%" height="300%"></canvas>
      </div>
  </body>
  <script>
      //--------------------
      // GET USER MEDIA CODE
      //--------------------
          navigator.getUserMedia = ( navigator.getUserMedia ||
                             navigator.webkitGetUserMedia ||
                             navigator.mozGetUserMedia ||
                             navigator.msGetUserMedia);
      var video;
      var webcamStream;
      function startWebcam() {
        if (navigator.getUserMedia) {
           navigator.getUserMedia (
              // constraints
              {
                 video: { facingMode:   "environment" },
                 audio: false,
                  
              },
              // successCallback
              function(localMediaStream) {
                  video = document.querySelector(\'video\');
                 video.srcObject=localMediaStream;
                 webcamStream = localMediaStream;
              },
              // errorCallback
              function(err) {
                 console.log("The following error occured: " + err);
              }
           );
        } else {
           console.log("getUserMedia not supported");
        }
      }
      function stopWebcam() {
          webcamStream.stop();
      }
      //---------------------
      // TAKE A SNAPSHOT CODE
      //---------------------
      var canvas, ctx;
      function init() {
        // Get the canvas and obtain a context for
        // drawing in it
        canvas = document.getElementById("myCanvas");
        ctx = canvas.getContext(\'2d\');
      }
      function snapshot() {
         // Draws current image from the video element into the canvas
        ctx.drawImage(video, 0,0, canvas.width, canvas.height);
      }
  </script>
   </body> ',
    'richtext' => 0,
    'template' => 2,
    'menuindex' => 22,
    'searchable' => 0,
    'cacheable' => 1,
    'createdby' => 3,
    'createdon' => 1668838627,
    'editedby' => 3,
    'editedon' => 1668843101,
    'deleted' => 0,
    'deletedon' => 0,
    'deletedby' => 0,
    'publishedon' => 1668838620,
    'publishedby' => 3,
    'menutitle' => '',
    'donthit' => 0,
    'privateweb' => 0,
    'privatemgr' => 0,
    'content_dispo' => 0,
    'hidemenu' => 1,
    'class_key' => 'modDocument',
    'context_key' => 'web',
    'content_type' => 1,
    'uri' => 'камера.html',
    'uri_override' => 0,
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'properties' => NULL,
    'club_id' => 0,
    '_content' => '<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0" />
    
    <title>Камера | [[!++site_name]]</title>

<link rel="stylesheet" href="/assets/id/wss/theme.min.css?v=1108" />

<script src="/assets/id/wss/jquery.min.js?ver=3.3.1"></script>
<script src="/js/[[!++scrm_prugv]]/start.js?v=t7" id="start_js"></script>

[[!+StartupHTMLBlock]]
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha256-eZrrJcwDc/3uDhsdt61sL2oOBY362qM3lon1gyExkL0=" crossorigin="anonymous" />
</head>
<body id="body83" class="spinner-parent" data-user="[[!+modx.user.id]]" data-clubid="0" data-mxq="[^q^]">
<div class="app">
    <nav class="app-header app-header-dark d-print-none start-data-link">
        <div class="top-bar">
            
            <a class="top-bar-brand" href="/">
                [[!++site_name]]
            </a>
          <div class="top-bar-list">
            <div class="top-bar-item px-2 d-lg-none">
                <button class="hamburger hamburger-squeeze" type="button" data-toggle="modal" data-target="#mmenuModal">
                    <span class="hamburger-inner"></span>
                </button>
            </div>
            <!-- .top-bar-item -->
            <div class="top-bar-item top-bar-item-right px-0">
              <ul class="header-nav nav">
                <li class="nav-item dropdown header-nav-dropdown1" id="scrmHelpMenu">
                    <!--
                    <a class="nav-link" href="#" data-toggle="dropdown"><span class="fa fa-question-circle"></span></a>
                    <div class="dropdown-menu dropdown-menu-right">
                        <div class="dropdown-arrow"></div>
                        <a class="dropdown-item prevent-default" href="#" data-run="/chunk/help.kb">База знаний</a>
                        <a class="dropdown-item" href="/help/integration.html"
                                data-link="visible{:ugroups.indexOf(\'idAdmin\')>=0}">Интеграции</a>
                        <a class="dropdown-item prevent-default" href="#"
                            data-link="visible{:ugroups.indexOf(\'idSportsmen\')>=0}" data-run="/chunk/help.adm">Написать в администрацию</a>
                        <div data-link="visible{:is_crew}">
                            <div class="dropdown-divider"></div>
                            <div class="dropdown-header"><small>Служба заботы</small></div>
                            <a class="dropdown-item prevent-default" href="#" data-run="Techat">Онлайн-чат</a>
                            <a class="dropdown-item prevent-default" href="#" data-run="/chunk/help.tech">Техническая поддержка</a>
                            
                        </div>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item prevent-default" href="https://sportcrm.club?utm_source=about-link" target="_blank" data-run="/chunk/about">О системе</a>
                        
                    </div> -->
                </li>
              </ul>
              <!-- .btn-account -->
              <div class="dropdown d-flex d-sm-flex1">
    [[!Login?
        &loginTpl=`idLoginMenu4`
        &logoutTpl=`idLogoutMenu4`
        &loginViaEmail=`1`
        &logoutResourceId=`1`
        &errTpl=`idLoginErrTpl`
    ]]
              </div><!-- /.btn-account -->
            </div><!-- /.top-bar-item -->
          </div><!-- /.top-bar-list -->
        </div><!-- /.top-bar -->
    </nav>

    <div id="page" class="d-flex min-vh-100">
        <aside class="border-right d-print-none d-none d-lg-block">
            <div class="color-line"></div>
            <nav id="main-menu" class="mb-5">
            [[!clubMenu]]
            </nav>
        </aside>
        
        <main class="app-main1 flex-grow-1 d-flex flex-column">
            <div class="wrapper1 flex-grow-1">
              <div class="page1">
                <header class="page-navs shadow-sm pr-3 d-print-none start-data-link">
                    <div class="account-summary" data-link="visible{:!topNavTabs^length}">
                        <h2 class="card-title" data-link="html{:title}">Камера</h2>
                        <h6 class="card-subtitle text-muted" data-link="html^{:subtitle}"></h6>
                    </div>
                    <div class="nav-scroller" id="topNavTabs" data-link="visible{:topNavTabs^length}">
                        <div class="nav nav-tabs" data-link="{for topNavTabs tmpl=\'navTab\'}"></div>
                    </div>
                  
                </header>
                <div class="page-inner">
                  
                  
                    <div class="page-section" id="pageSection1">
 <style>
 video::-webkit-media-controls {
  display: none;
 }
  .camera{
      display: flex;
      align-content: center;
      justify-content: center;
      align-items: center;
  }

</style>
 <body onload="init();">
    <h3>Вы можете отсканировать элетромобиль и проверить его по нашей базе</h3>
   Сделайте фото или загрузите его.
     <p>
    <button onclick="startWebcam();">Сделать фото</button>
    <button>Загрузить фото</button>
    </p>
    <video onclick="snapshot(this);"  autoplay="autoplay" width=400 height=400 id="video" controls autoplay></video>
 <!--<button onclick="snapshot();">Take Snapshot</button>-->
  <p>
            Ваше фото : <p>
            <div class="camera">
      <canvas  id="myCanvas" width="300%" height="300%"></canvas>
      </div>
  </body>
  <script>
      //--------------------
      // GET USER MEDIA CODE
      //--------------------
          navigator.getUserMedia = ( navigator.getUserMedia ||
                             navigator.webkitGetUserMedia ||
                             navigator.mozGetUserMedia ||
                             navigator.msGetUserMedia);
      var video;
      var webcamStream;
      function startWebcam() {
        if (navigator.getUserMedia) {
           navigator.getUserMedia (
              // constraints
              {
                 video: { facingMode:   "environment" },
                 audio: false,
                  
              },
              // successCallback
              function(localMediaStream) {
                  video = document.querySelector(\'video\');
                 video.srcObject=localMediaStream;
                 webcamStream = localMediaStream;
              },
              // errorCallback
              function(err) {
                 console.log("The following error occured: " + err);
              }
           );
        } else {
           console.log("getUserMedia not supported");
        }
      }
      function stopWebcam() {
          webcamStream.stop();
      }
      //---------------------
      // TAKE A SNAPSHOT CODE
      //---------------------
      var canvas, ctx;
      function init() {
        // Get the canvas and obtain a context for
        // drawing in it
        canvas = document.getElementById("myCanvas");
        ctx = canvas.getContext(\'2d\');
      }
      function snapshot() {
         // Draws current image from the video element into the canvas
        ctx.drawImage(video, 0,0, canvas.width, canvas.height);
      }
  </script>
   </body> 
                    </div>
                  
                  
                </div><!-- /.page-inner -->
              </div><!-- /.page -->
            </div><!-- /.wrapper -->
            
            <footer class="d-print-none bg^light border^top app-footer start-data-link">
                <ul class="list-inline" data-link="visible{:bottomNavLinks^length} {for bottomNavLinks ~itemCls=\'text-muted\' tmpl=\'#tplListInlineItem\'}"></ul>
                <div class="copyright">
                    <img src="/assets/id/images/favicon-32x32.png?v=21" style="width:16px;height:16px" alt="SCRM" class="mr-1" data-run="/chunk/about">
                    [[!++site_fullname]]
                </div>
            </footer>
        </main>
    </div>
</div>



<div class="modal modal-drawer fade" id="mmenuModal" tabindex="-1" role="dialog" aria-labelledby="mmenuLabel">
    <div class="modal-dialog modal-drawer-left" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <b id="mmenuLabel" class="modal-title">[[!++site_name]]</b>
                <button class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body p-0"></div>
        </div>
    </div>
</div>

<script id="tplListInlineItem" type="text/x-jsrender">
    <li class="list-inline-item" data-link="{include tmpl=\'#tplMenuItem\'}"></li>
</script>
<script id="tplMenuItem" type="text/x-jsrender">
{{if !href tmpl=#data}}
{{else href==\'-\'}}
    <div class="dropdown-divider"></div>
{{else}}
    <a data-link="html{:html} href{:href} class{:~itemCls||\'dropdown-item\'}"></a>
{{/if}}
</script>
<script id="tpl_topNavTab" type="text/x-jsrender">
    <a class="nav-link" data-toggle="tab"
        data-link="html{:html} href{:href} class{merge:active toggle=\'active\'} visible{:!hidden}"></a>
</script>

<script>
    SCRM.app.title = \'Камера\';
    $(\'.start-data-link\').link(true, SCRM.app);
</script>



<script src="/assets/id/wss/bootstrap.js?ver=4.6.0"></script>
[[!+BottomHTMLBlock]]
</body>
</html>',
    '_isForward' => false,
  ),
  'contentType' => 
  array (
    'id' => 1,
    'name' => 'HTML',
    'description' => 'HTML content',
    'mime_type' => 'text/html',
    'file_extensions' => '.html',
    'headers' => NULL,
    'binary' => 0,
  ),
  'policyCache' => 
  array (
  ),
  'sourceCache' => 
  array (
    'modChunk' => 
    array (
      'idLoginMenu4' => 
      array (
        'fields' => 
        array (
          'id' => 14,
          'source' => 1,
          'property_preprocess' => false,
          'name' => 'idLoginMenu4',
          'description' => '',
          'editor_type' => 0,
          'category' => 5,
          'cache_type' => 0,
          'snippet' => '[[-<li><a href="/?action=login" class="showLogin"><i class="fa fa-sign-in"></i> Войти</a></li>]]

<a href="/?action=login" class="btn-account showLogin"><i class="fa fa-sign-in"></i>&nbsp;Войти</a>',
          'locked' => false,
          'properties' => 
          array (
          ),
          'static' => false,
          'static_file' => '',
          'content' => '[[-<li><a href="/?action=login" class="showLogin"><i class="fa fa-sign-in"></i> Войти</a></li>]]

<a href="/?action=login" class="btn-account showLogin"><i class="fa fa-sign-in"></i>&nbsp;Войти</a>',
        ),
        'policies' => 
        array (
        ),
        'source' => 
        array (
          'id' => 1,
          'name' => 'Filesystem',
          'description' => '',
          'class_key' => 'sources.modFileMediaSource',
          'properties' => 
          array (
          ),
          'is_stream' => true,
        ),
      ),
    ),
    'modSnippet' => 
    array (
      'Login' => 
      array (
        'fields' => 
        array (
          'id' => 16,
          'source' => 0,
          'property_preprocess' => false,
          'name' => 'Login',
          'description' => 'Displays a login and logout form.',
          'editor_type' => 0,
          'category' => 3,
          'cache_type' => 0,
          'snippet' => '/**
 * Login
 *
 * Copyright 2010 by Jason Coward <jason@modx.com> and Shaun McCormick
 * <shaun@modx.com>
 *
 * Login is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option) any
 * later version.
 *
 * Login is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Login; if not, write to the Free Software Foundation, Inc., 59 Temple
 * Place, Suite 330, Boston, MA 02111-1307 USA
 *
 * @package login
 */
/**
 * MODx Login Snippet
 *
 * This snippet handles login POSTs, sending the user back to where they came from or to a specific
 * location if specified in the POST.
 *
 * @package login
 *
 * @property textfield actionKey The REQUEST variable containing the action to take.
 * @property textfield loginKey The actionKey for login.
 * @property textfield logoutKey The actionKey for logout.
 * @property boolean loginViaEmail Enable login via username or email address (either one!) [default: false]
 * @property list tplType The type of template to expect for the views:
 *  modChunk - name of chunk to use
 *  file - full path to file to use as tpl
 *  embedded - the tpl is embedded in the page content
 *  inline - the tpl is inline content provided directly
 * @property textfield loginTpl The template for the login view (content based on tplType)
 * @property textfield logoutTpl The template for the logout view (content based on tplType)
 * @property textfield errTpl The template for any errors that occur when processing an view
 * @property list errTplType The type of template to expect for the error messages:
 *  modChunk - name of chunk to use
 *  file - full path to file to use as tpl
 *  inline - the tpl is inline content provided directly
 * @property integer logoutResourceId An explicit resource id to redirect users to on logout
 * @property string loginMsg The string to use for the login action. Defaults to
 * the lexicon string "login".
 * @property string logoutMsg The string to use for the logout action. Defaults
 * to the lexicon string "login.logout"
 */
require_once $modx->getOption(\'login.core_path\',null,$modx->getOption(\'core_path\').\'components/login/\').\'model/login/login.class.php\';
$login = new Login($modx,$scriptProperties);
if (!is_object($login) || !($login instanceof Login)) return \'\';

$controller = $login->loadController(\'Login\');
$output = $controller->run($scriptProperties);
return $output;',
          'locked' => false,
          'properties' => 
          array (
            'actionKey' => 
            array (
              'name' => 'actionKey',
              'desc' => 'prop_login.actionkey_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => 'service',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Переменная REQUEST, которая указывает, какое действие предпринять.',
              'area_trans' => '',
            ),
            'loginKey' => 
            array (
              'name' => 'loginKey',
              'desc' => 'prop_login.loginkey_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => 'login',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Ключ действия входа.',
              'area_trans' => '',
            ),
            'logoutKey' => 
            array (
              'name' => 'logoutKey',
              'desc' => 'prop_login.logoutkey_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => 'logout',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Ключ действия выхода.',
              'area_trans' => '',
            ),
            'loginViaEmail' => 
            array (
              'name' => 'loginViaEmail',
              'desc' => 'prop_login.loginviaemail_desc',
              'type' => 'combo-boolean',
              'options' => '',
              'value' => false,
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Включение входа через имя пользователя или адрес электронной почты.',
              'area_trans' => '',
            ),
            'tplType' => 
            array (
              'name' => 'tplType',
              'desc' => 'prop_login.tpltype_desc',
              'type' => 'list',
              'options' => 
              array (
                0 => 
                array (
                  'value' => 'modChunk',
                  'text' => 'opt_register.chunk',
                  'name' => 'Чанк',
                ),
                1 => 
                array (
                  'value' => 'file',
                  'text' => 'opt_register.file',
                  'name' => 'Файл',
                ),
                2 => 
                array (
                  'value' => 'inline',
                  'text' => 'opt_register.inline',
                  'name' => 'Встроенный',
                ),
                3 => 
                array (
                  'value' => 'embedded',
                  'text' => 'opt_register.embedded',
                  'name' => 'Встроенное',
                ),
              ),
              'value' => 'modChunk',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Тип tpls, который предоставляется для формы входа и выхода.',
              'area_trans' => '',
            ),
            'loginTpl' => 
            array (
              'name' => 'loginTpl',
              'desc' => 'prop_login.logintpl_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => 'lgnLoginTpl',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Форма входа tpl.',
              'area_trans' => '',
            ),
            'logoutTpl' => 
            array (
              'name' => 'logoutTpl',
              'desc' => 'prop_login.logouttpl_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => 'lgnLogoutTpl',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Выход tpl.',
              'area_trans' => '',
            ),
            'preHooks' => 
            array (
              'name' => 'preHooks',
              'desc' => 'prop_login.prehooks_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => '',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Какие скрипты нужно запустить, если они есть, перед тем, как пользователь войдет в систему или выйдет из нее. Это может быть список хуков, разделенных запятыми, и если первый хук выполнить не получится, все последующие также не сработают. Хук, также, может являться именем сниппета, который будет выполнять этот снимет.',
              'area_trans' => '',
            ),
            'postHooks' => 
            array (
              'name' => 'postHooks',
              'desc' => 'prop_login.posthooks_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => '',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Какие скрипты нужно запустить, если они есть, после того, как пользователь войдет в систему или выйдет из нее. Это может быть список хуков, разделенных запятыми, и если первый хук выполнить не получится, все последующие также не сработают. Хук, также, может являться именем сниппета, который будет выполнять этот сниппет.',
              'area_trans' => '',
            ),
            'errTpl' => 
            array (
              'name' => 'errTpl',
              'desc' => 'prop_login.errtpl_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => 'lgnErrTpl',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Ошибка tpl.',
              'area_trans' => '',
            ),
            'errTplType' => 
            array (
              'name' => 'errTplType',
              'desc' => 'prop_login.errtpltype_desc',
              'type' => 'list',
              'options' => 
              array (
                0 => 
                array (
                  'value' => 'modChunk',
                  'text' => 'opt_register.chunk',
                  'name' => 'Чанк',
                ),
                1 => 
                array (
                  'value' => 'file',
                  'text' => 'opt_register.file',
                  'name' => 'Файл',
                ),
                2 => 
                array (
                  'value' => 'inline',
                  'text' => 'opt_register.inline',
                  'name' => 'Встроенный',
                ),
                3 => 
                array (
                  'value' => 'embedded',
                  'text' => 'opt_register.embedded',
                  'name' => 'Встроенное',
                ),
              ),
              'value' => 'modChunk',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Тип ошибки tpl.',
              'area_trans' => '',
            ),
            'loginResourceId' => 
            array (
              'name' => 'loginResourceId',
              'desc' => 'prop_login.loginresourceid_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => '0',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Ресурс для перенаправления пользователей на успешный вход в систему. Значение 0 перенаправит на себя.',
              'area_trans' => '',
            ),
            'loginResourceParams' => 
            array (
              'name' => 'loginResourceParams',
              'desc' => 'prop_login.loginresourceparams_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => '',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Массив JSON параметров для добавления в URL при перенаправлении на авторизацию. Пример: {"test":123}',
              'area_trans' => '',
            ),
            'logoutResourceId' => 
            array (
              'name' => 'logoutResourceId',
              'desc' => 'prop_login.logoutresourceid_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => '0',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'ID ресурса для перенаправления пользователей на успешный выход из системы. Значение 0 перенаправит на себя.',
              'area_trans' => '',
            ),
            'logoutResourceParams' => 
            array (
              'name' => 'logoutResourceParams',
              'desc' => 'prop_login.logoutresourceparams_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => '',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Массив JSON параметров для добавления в URL при перенаправлении на разавторизацию. Пример: {"test":123}',
              'area_trans' => '',
            ),
            'loginMsg' => 
            array (
              'name' => 'loginMsg',
              'desc' => 'prop_login.loginmsg_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => '',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Необязательное сообщение для авторизации. Если пустое, будет использоваться строка словаря для входа.',
              'area_trans' => '',
            ),
            'logoutMsg' => 
            array (
              'name' => 'logoutMsg',
              'desc' => 'prop_login.logoutmsg_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => '',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Необязательное сообщение для разавторизации. Если пустое, будет использоваться строка словаря для выхода.',
              'area_trans' => '',
            ),
            'redirectToPrior' => 
            array (
              'name' => 'redirectToPrior',
              'desc' => 'prop_login.redirecttoprior_desc',
              'type' => 'combo-boolean',
              'options' => '',
              'value' => false,
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Если установлено значение "Да", при успешном входе перенаправляется на страницу,с которой был осуществлен переход (HTTP_REFER).',
              'area_trans' => '',
            ),
            'redirectToOnFailedAuth' => 
            array (
              'name' => 'redirectToOnFailedAuth',
              'desc' => 'prop_login.redirecttoonfailedauth_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => '',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Если установлено ненулевое число, то пользователь будет перенаправлен на эту страницу, если его попытка авторизации не удалась.',
              'area_trans' => '',
            ),
            'rememberMeKey' => 
            array (
              'name' => 'rememberMeKey',
              'desc' => 'prop_login.remembermekey_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => 'rememberme',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Необязательно. Имя поля переключателя "Запомнить меня", чтобы сохранить состояние авторизации. По умолчанию `rememberme`.',
              'area_trans' => '',
            ),
            'contexts' => 
            array (
              'name' => 'contexts',
              'desc' => 'prop_login.contexts_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => '',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => '(Экспериментально) Список контекстов для авторизации, разделенных запятыми. По умолчанию текущий контекст, если явно не задан.',
              'area_trans' => '',
            ),
            'toPlaceholder' => 
            array (
              'name' => 'toPlaceholder',
              'desc' => 'prop_login.toplaceholder_desc',
              'type' => 'textfield',
              'options' => '',
              'value' => '',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Если указано, вывод сниппета будет устанавливаться на плейсхолдер этого имени вместо непосредственного вывода возвращаемого содержимого.',
              'area_trans' => '',
            ),
            'recaptchaTheme' => 
            array (
              'name' => 'recaptchaTheme',
              'desc' => 'prop_register.recaptchaTheme_desc',
              'type' => 'list',
              'options' => 
              array (
                0 => 
                array (
                  'value' => 'red',
                  'text' => 'opt_register.red',
                  'name' => 'Красный',
                ),
                1 => 
                array (
                  'value' => 'white',
                  'text' => 'opt_register.white',
                  'name' => 'Белый',
                ),
                2 => 
                array (
                  'value' => 'clean',
                  'text' => 'opt_register.clean',
                  'name' => 'Чистый',
                ),
                3 => 
                array (
                  'value' => 'blackglass',
                  'text' => 'opt_register.blackglass',
                  'name' => 'Чёрное Стекло',
                ),
              ),
              'value' => 'clean',
              'lexicon' => 'login:properties',
              'area' => '',
              'desc_trans' => 'Если `recaptcha` установлен как preHook, это значение выберет тему для виджета reCaptcha.',
              'area_trans' => '',
            ),
          ),
          'moduleguid' => '',
          'static' => false,
          'static_file' => '',
          'content' => '/**
 * Login
 *
 * Copyright 2010 by Jason Coward <jason@modx.com> and Shaun McCormick
 * <shaun@modx.com>
 *
 * Login is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the Free
 * Software Foundation; either version 2 of the License, or (at your option) any
 * later version.
 *
 * Login is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * Login; if not, write to the Free Software Foundation, Inc., 59 Temple
 * Place, Suite 330, Boston, MA 02111-1307 USA
 *
 * @package login
 */
/**
 * MODx Login Snippet
 *
 * This snippet handles login POSTs, sending the user back to where they came from or to a specific
 * location if specified in the POST.
 *
 * @package login
 *
 * @property textfield actionKey The REQUEST variable containing the action to take.
 * @property textfield loginKey The actionKey for login.
 * @property textfield logoutKey The actionKey for logout.
 * @property boolean loginViaEmail Enable login via username or email address (either one!) [default: false]
 * @property list tplType The type of template to expect for the views:
 *  modChunk - name of chunk to use
 *  file - full path to file to use as tpl
 *  embedded - the tpl is embedded in the page content
 *  inline - the tpl is inline content provided directly
 * @property textfield loginTpl The template for the login view (content based on tplType)
 * @property textfield logoutTpl The template for the logout view (content based on tplType)
 * @property textfield errTpl The template for any errors that occur when processing an view
 * @property list errTplType The type of template to expect for the error messages:
 *  modChunk - name of chunk to use
 *  file - full path to file to use as tpl
 *  inline - the tpl is inline content provided directly
 * @property integer logoutResourceId An explicit resource id to redirect users to on logout
 * @property string loginMsg The string to use for the login action. Defaults to
 * the lexicon string "login".
 * @property string logoutMsg The string to use for the logout action. Defaults
 * to the lexicon string "login.logout"
 */
require_once $modx->getOption(\'login.core_path\',null,$modx->getOption(\'core_path\').\'components/login/\').\'model/login/login.class.php\';
$login = new Login($modx,$scriptProperties);
if (!is_object($login) || !($login instanceof Login)) return \'\';

$controller = $login->loadController(\'Login\');
$output = $controller->run($scriptProperties);
return $output;',
        ),
        'policies' => 
        array (
        ),
        'source' => 
        array (
        ),
      ),
      'clubMenu' => 
      array (
        'fields' => 
        array (
          'id' => 21,
          'source' => 1,
          'property_preprocess' => false,
          'name' => 'clubMenu',
          'description' => '',
          'editor_type' => 0,
          'category' => 1,
          'cache_type' => 0,
          'snippet' => '$menuGroups = $modx->getOption(\'scrm_grhash\');
$id = $modx->resource->get(\'id\');

$cache_path = CRM_PREFIX."/clubMenu/{$menuGroups}_".$id;
$menu = $modx->cacheManager->get($cache_path);
if (empty($menu)) {
    foreach($modx->getOption(\'club_modules\') as $midx => $module) {
        $menuWhere[] = \'"\'.$midx.\'":{"\'.
        (($midx==0)? \'\':\'OR:\').
        \'link_attributes:LIKE":"%\'. $module .\'%"}\';
    }
    $menuWhere = \'{ "0":{\'. implode(\',\', $menuWhere) .\' } }\';
    $menu = $modx->runSnippet(\'pdoMenu\', array(
        \'level\' => 2,
        \'scheme\' => \'abs\',
        \'useWeblinkUrl\' => 1,
        \'parents\' => 0,
        \'firstClass\' => 0,
        \'lastClass\' => 0,
        \'checkPermissions\' => \'list\',
        \'where\' => $menuWhere,
        //\'where\' => \'{"0":{"0":{"link_attributes:LIKE":"%clubStuff%"}, "1":{"OR:link_attributes:LIKE":"%clubShop1%"} } }\',
        \'showLog\' => 0,
        \'tplParentRow\' => \'@INLINE <li[[+classes]] id="menuitem[[+id]]">
        <a href="#menuwrapper[[+id]]" class="nav-link collapsed" data-toggle="collapse" [[+attributes]]>[[+menutitle]]</a>
        <div id="menuwrapper[[+id]]" class="collapse" data-parent="#left-menu">
        <ul class="nav flex-column">[[+wrapper]]</ul>
        </div>
        </li>\',
        \'tpl\' => \'@INLINE <li[[+classes]] id="mmenuitem[[+id]]"><a href="[[+link]]"[[+attributes]] class="nav-link">[[+menutitle]]</a>[[+wrapper]]</li>\',
        
        \'tplInner\' => \'@INLINE [[+wrapper]]\',
        \'tplOuter\' => \'@INLINE <ul id="left-menu" class="nav nav-pills flex-column">[[+wrapper]]</ul>\',
        \'rowClass\' => \'nav-item\',
    ));

    $modx->cacheManager->set($cache_path, $menu, 604800); //7 дней
}
return $menu;

/*
[[!pdoMenu?
    
    &parents=`0`
    &firstClass=`0` &lastClass=`0`
    
    &checkPermissions=`list`
    &cache=`1`
    &cache_key=`club_[[!#SESSION.club_groups]]`

    &tplParentRow=`@INLINE <li[[+classes]]>
        <a href="#menu[[+id]]" class="nav-link collapsed" data-toggle="collapse" [[+attributes]]>[[+menutitle]]</a>
        <div id="menu[[+id]]" class="collapse" data-parent="#left-menu">
        <ul class="nav flex-column">[[+wrapper]]</ul>
        </div>
    </li>`
    &tpl=`@INLINE <li[[+classes]]><a href="[[+link]]"[[+attributes]] class="nav-link">[[+menutitle]]</a>[[+wrapper]]</li>`
    &rowClass=`nav-item`
    &tplInner=`@INLINE [[+wrapper]]`
    &tplOuter=`@INLINE <ul id="left-menu" class="nav nav-pills flex-column">[[+wrapper]]</ul>`
    
    &showLog=`0`
]]
*/',
          'locked' => false,
          'properties' => 
          array (
          ),
          'moduleguid' => '',
          'static' => false,
          'static_file' => '',
          'content' => '$menuGroups = $modx->getOption(\'scrm_grhash\');
$id = $modx->resource->get(\'id\');

$cache_path = CRM_PREFIX."/clubMenu/{$menuGroups}_".$id;
$menu = $modx->cacheManager->get($cache_path);
if (empty($menu)) {
    foreach($modx->getOption(\'club_modules\') as $midx => $module) {
        $menuWhere[] = \'"\'.$midx.\'":{"\'.
        (($midx==0)? \'\':\'OR:\').
        \'link_attributes:LIKE":"%\'. $module .\'%"}\';
    }
    $menuWhere = \'{ "0":{\'. implode(\',\', $menuWhere) .\' } }\';
    $menu = $modx->runSnippet(\'pdoMenu\', array(
        \'level\' => 2,
        \'scheme\' => \'abs\',
        \'useWeblinkUrl\' => 1,
        \'parents\' => 0,
        \'firstClass\' => 0,
        \'lastClass\' => 0,
        \'checkPermissions\' => \'list\',
        \'where\' => $menuWhere,
        //\'where\' => \'{"0":{"0":{"link_attributes:LIKE":"%clubStuff%"}, "1":{"OR:link_attributes:LIKE":"%clubShop1%"} } }\',
        \'showLog\' => 0,
        \'tplParentRow\' => \'@INLINE <li[[+classes]] id="menuitem[[+id]]">
        <a href="#menuwrapper[[+id]]" class="nav-link collapsed" data-toggle="collapse" [[+attributes]]>[[+menutitle]]</a>
        <div id="menuwrapper[[+id]]" class="collapse" data-parent="#left-menu">
        <ul class="nav flex-column">[[+wrapper]]</ul>
        </div>
        </li>\',
        \'tpl\' => \'@INLINE <li[[+classes]] id="mmenuitem[[+id]]"><a href="[[+link]]"[[+attributes]] class="nav-link">[[+menutitle]]</a>[[+wrapper]]</li>\',
        
        \'tplInner\' => \'@INLINE [[+wrapper]]\',
        \'tplOuter\' => \'@INLINE <ul id="left-menu" class="nav nav-pills flex-column">[[+wrapper]]</ul>\',
        \'rowClass\' => \'nav-item\',
    ));

    $modx->cacheManager->set($cache_path, $menu, 604800); //7 дней
}
return $menu;

/*
[[!pdoMenu?
    
    &parents=`0`
    &firstClass=`0` &lastClass=`0`
    
    &checkPermissions=`list`
    &cache=`1`
    &cache_key=`club_[[!#SESSION.club_groups]]`

    &tplParentRow=`@INLINE <li[[+classes]]>
        <a href="#menu[[+id]]" class="nav-link collapsed" data-toggle="collapse" [[+attributes]]>[[+menutitle]]</a>
        <div id="menu[[+id]]" class="collapse" data-parent="#left-menu">
        <ul class="nav flex-column">[[+wrapper]]</ul>
        </div>
    </li>`
    &tpl=`@INLINE <li[[+classes]]><a href="[[+link]]"[[+attributes]] class="nav-link">[[+menutitle]]</a>[[+wrapper]]</li>`
    &rowClass=`nav-item`
    &tplInner=`@INLINE [[+wrapper]]`
    &tplOuter=`@INLINE <ul id="left-menu" class="nav nav-pills flex-column">[[+wrapper]]</ul>`
    
    &showLog=`0`
]]
*/',
        ),
        'policies' => 
        array (
        ),
        'source' => 
        array (
          'id' => 1,
          'name' => 'Filesystem',
          'description' => '',
          'class_key' => 'sources.modFileMediaSource',
          'properties' => 
          array (
          ),
          'is_stream' => true,
        ),
      ),
    ),
    'modTemplateVar' => 
    array (
    ),
  ),
);