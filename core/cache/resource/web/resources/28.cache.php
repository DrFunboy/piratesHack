<?php  return array (
  'resourceClass' => 'modDocument',
  'resource' => 
  array (
    'id' => 28,
    'type' => 'document',
    'contentType' => 'text/html',
    'pagetitle' => 'Реестр водителей',
    'longtitle' => '',
    'description' => '',
    'alias' => 'db',
    'alias_visible' => 1,
    'link_attributes' => 'data-cls="clubStuff"',
    'published' => 1,
    'pub_date' => 0,
    'unpub_date' => 0,
    'parent' => 17,
    'isfolder' => 0,
    'introtext' => '',
    'content' => '<div class="section-block my-0">
[[$dbInner?actions=`1`]]
</div>

<script>
$(\'#grmain\')
.one(\'jqGridBeforeInit\', function(e, grOpts){
    grOpts.colModel.push({
        name:\'photo\', label:\'Фото\',
        width:30, editable: false,
        search: false,
        align: \'center\',
        formatter: hasPhoto
    });
})
.one(\'jqGridAfterLoadComplete\', function(e, data){
    var spGrid = $(this).jqGridExport(),
        param = getUrlVars();

    if (param.filter) setTimeout(function() {
        spGrid.data(\'spData\').spFilter(param.filter);
    }, 500);
})
.trigger(\'sportsmenGrid\', {
    showDuedate: true,
    multiselect: true,
    sortname: \'saldo asc, name asc\',
    postData: { tableadd: \'idPhoto\' }
});

[[-$(document).one(\'OnLoadSpData\', function(e, data){
    $.observable(SCRM.idSportsmen.titleMenu).insert(\'<a href="#" class="dropdown-item">Hello</a>\');
    console.log(\'OnLoadSpData\', e, data)
})]]
</script>',
    'richtext' => 0,
    'template' => 2,
    'menuindex' => 3,
    'searchable' => 0,
    'cacheable' => 1,
    'createdby' => 1,
    'createdon' => 1668777824,
    'editedby' => 1,
    'editedon' => 1668804271,
    'deleted' => 0,
    'deletedon' => 0,
    'deletedby' => 0,
    'publishedon' => 1475570100,
    'publishedby' => 0,
    'menutitle' => 'Водители',
    'donthit' => 0,
    'privateweb' => 0,
    'privatemgr' => 0,
    'content_dispo' => 0,
    'hidemenu' => 0,
    'class_key' => 'modDocument',
    'context_key' => 'web',
    'content_type' => 1,
    'uri' => 'database/db.html',
    'uri_override' => 0,
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'properties' => NULL,
    'club_id' => 30,
    '_content' => '<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=0" />
    
    <title>Реестр водителей | [[!++site_name]]</title>

<link rel="stylesheet" href="/assets/id/wss/theme.min.css?v=1108" />

<script src="/assets/id/wss/jquery.min.js?ver=3.3.1"></script>
<script src="/js/[[!++scrm_prugv]]/start.js?v=t7" id="start_js"></script>

[[!+StartupHTMLBlock]]
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha256-eZrrJcwDc/3uDhsdt61sL2oOBY362qM3lon1gyExkL0=" crossorigin="anonymous" />
</head>
<body id="body28" class="spinner-parent" data-user="[[!+modx.user.id]]" data-clubid="30" data-mxq="[^q^]">
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
                        <h2 class="card-title" data-link="html{:title}">Реестр водителей</h2>
                        <h6 class="card-subtitle text-muted" data-link="html^{:subtitle}"></h6>
                    </div>
                    <div class="nav-scroller" id="topNavTabs" data-link="visible{:topNavTabs^length}">
                        <div class="nav nav-tabs" data-link="{for topNavTabs tmpl=\'navTab\'}"></div>
                    </div>
                  
                </header>
                <div class="page-inner">
                  
                  
                    <div class="page-section" id="pageSection1">
<div class="section-block my-0">
<div class="mb-2 d-none" id="actionsMain">
    <button class="btn btn-success btn-sm" data-link="{on ~newSportsmen}"><i class="fa fa-user-plus"></i></button>
    <div class="dropdown mx-1">
        <button data-toggle="dropdown" class="btn btn-primary btn-sm d-flex flex-nowrap align-items-center" 
            disabled="disabled" data-link="disabled{:!selRowsCnt}">
            Действия
            <small data-link="text{:selRowsCnt} css-display{if !selRowsCnt tmpl=\'none\'}" class="badge badge-pill badge-warning ml-1"></small>
        </button>
        <div class="dropdown-menu">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item prevent-default" data-pholder="Номер приказа/справки/заявление от родителей"
                data-link="{on \'click\' ~changeField \'status\'}">Сменить Статус</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' ~changeSquad}">Группа, Уровень</a>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' ~changeField \'trainer\'}">Сменить тренера</a>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' ~changeField \'razr\'}">Присвоить разряд</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' ~changeField \'price\'}">Сменить тариф</a>
            <button class="dropdown-item btn-addinvoice" data-link="{on ~addInvoices}">Начисление</button>
            <a href="#" class="dropdown-item"
                data-extaction="/database/insure-manager.html" data-grid="main">Застраховать</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~Run \'/chunk/gotoevent\'}">Мероприятие</a>
        </div>
    </div>
    <button class="btn btn-outline-primary btn-sm mr-1 d-none"
        data-link="class{merge:(!~S^f||!selRowsCnt) toggle=\'d-none\'} {on ~sendMessage}">
        <i class="fa fa-envelope"></i>
    </button>
    <div class="dropdown d-none" data-link="class{merge:!selRowsCnt toggle=\'d-none\'}">
        <button data-toggle="dropdown" class="btn btn-outline-primary btn-sm"><i class="fa fa-print"></i></button>
        <div class="dropdown-menu">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item" data-link="{on ~exportQRcard}"
                data-handler="idSportsmen_qrcard" data-tmpl="sportsmen_qrcard.docx">QR карточки</a>
            <a href="#" class="dropdown-item" data-link="{on ~exportQRcard}"
                data-handler="idSportsmen_qrtable" data-tmpl="">QR наклейки</a>
            <div data-link="visible{:selRowsCnt==1}">
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item prevent-default"
                    data-link="{on ~exportContract}">Скачать договор</a>
            </div>
        </div>
    </div>
    <div class="dropdown mx-1">
        <button data-toggle="dropdown" class="btn btn-secondary btn-sm">
            <i class="fa fa-filter"></i><span class="d-none d-sm-inline"> Фильтр</span></button>
        <div class="dropdown-menu">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' spFilter \'saldo:debts\'}">Должники</a></li>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' spFilter \'duedate:0\'}">Без абонемента</a></li>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~Run \'/chunk/sp.birth\'}">Именинники</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' spFilter \'\'}">Сбросить фильтр</a>
        </div>
    </div>
    <div class="dropdown" data-link="visible{:gridOpts.showDuedate}">
        <button data-toggle="dropdown" class="btn btn-secondary btn-sm">
            <i class="fa fa-battery-3"></i><span class="d-none d-lg-inline"> Абонементы</span>
        </button>
        <div class="dropdown-menu" data-link="{radiogroup idSchedule_main} {for ~S.clubStatus^idSchedule tmpl=\'#tpl_SchInv\'}">
        </div>
    </div>

    <div class="dropdown mx-1">
        <button data-toggle="dropdown" class="btn btn-secondary btn-sm">
            <i class="fa fa-clipboard"></i><span class="d-none d-sm-inline"> Буфер</span></button>
        <div class="dropdown-menu">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~clipAdd}">
                <i class="fa fa-user-plus dropdown-icon"></i> Добавить</a>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~clipRemove}">
                <i class="fa fa-user-times dropdown-icon"></i> Удалить</a>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~clipShow}">
                <i class="fa fa-users dropdown-icon"></i> Показать</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~clipClear}">Очистить</a>
        </div>
    </div>
    
</div>

<table id="grmain" data-entity="idSportsmen"></table>

<style>
    #TblGrid_grmain.EditTable {
        border-spacing: 2px 6px;
        border-collapse: initial;
    }
    .ui-jqdialog-content .CaptionTD {
        vertical-align: top;
        text-align: right;
    }
</style>

<script id="tpl_SchInv" type="text/x-jsrender">
    {{if #index==0}}<div class="dropdown-arrow"></div>{{/if}}
    <label class="custom-control custom-radio">
        <input type="radio" class="custom-control-input" name="SchInv" value="{{:alias}}">
        <span class="custom-control-label">{{:name}}</span>
    </label>
</script>

<script id="tpl_sp_search" type="text/x-jsrender">
<p class="text-muted">Введите ФИО, мы поищем в базе, чтобы не создавать дубликаты</p>
{{include ~placeholder="ФИО" tmpl="#tpl_searchinput"/}}

<div class="list-group list-group-flush list-group-bordered mt-2" data-link="visible{:idSportsmens}">
    {^{for idSportsmens ~cls="fa-pencil" tmpl=\'#tpl_rowSportsmen\' /}}
    <a href="#" class="list-group-item list-group-item-action list-group-item-success" data-link="{on ~chSportsmen}">
        <div class="list-group-item-body">Создать <b data-link="srch_txt"></b></div>
        <div class="list-group-item-figure">
            <i class="fa fa-plus"></i>
        </div>
    </a>
</div>
</script>

<script id="tpl_searchinput" type="text/x-jsrender">
<form class="input-group input-group-alt srch-group" action="" data-link="{on \'submit\' ~srchSubmit}">
    <input type="text" class="srch-input form-control clubmodal-focus" 
        data-link="{:srchTxt:} placeholder{:~placeholder}" />
    <div class="input-group-append">
        <button type="submit" class="btn btn-secondary"><i class="fa fa-search"></i></button>
    </div>
</form>
</script>

<script id="tpl_rowSportsmen" type="text/x-jsrender">
<a href="#" class="list-group-item list-group-item-action list-group-item-primary" data-link="{on ~chSportsmen}">
    <div class="list-group-item-body">
    <h4 class="list-group-item-title">{{:name}}</h4>
    <h5 class="list-group-item-subtitle">{{formatDate:birth}}</h5>
    </div>
    <div class="list-group-item-figure">
        <i data-link="class{:\'fa \' + (~cls? ~cls:\'fa-plus\')}"></i>
    </div>
</a>
</script>

<script>
window.dbValues = SCRM.dbValues || {};

$.extend(true, SCRM.lexicon, {
    idSportsmen:{
        status:\'Статус\',
        name:\'Ф.И.О.\',
        gender:\'Пол\',
        birth:\'Дата рождения\',
        doc:\'N Свидетельства\',
        contract:\'N Договора\',
        contractdate:\'Дата договора\',
        contact:\'Контакт\',
        pasp:\'Паспорт\',
        email:\'Email\',
        tel:\'Телефон\',
        price:\'Стоимость\',
        discount:\'Скидка\',
        saldo:\'Баланс\',
        duedate:\'Абонемент\',
        meddate:\'Срок мед. справки\',
        insdate:\'Срок страховки\',
        razr:\'Разряд\',
        club_name:\'Зал\',
        sport_name:\'Дисциплина\',
        level_name:\'Уровень\',
        squad:\'Зал, Группа\',
        squad_name:\'Группа\',
        trainer:\'Тренер\',
        trainer_name:\'Тренер\',
        info:\'Заметки\',
        height:\'Рост\',
        weight:\'Вес\',
        username: \'Кабинет\'
    }
});

function get_clipSportsmen() {
    return getObjectFromLocalStorage(\'club_clip_sportsmen\') || [ ];
}

/* ============ sportsmenGrid =============== */


$(document)
.on(\'sportsmenGrid\', \'table\', function(e, initOpts) { //, \'[data-entity="idSportsmen"]\'
    var spGrid = $(e.target),
        spData = spGrid.data(\'spData\');

    if (!spData) {
        
        spData = $.extend({
            url: window.location.origin,
            grid: spGrid,
            wrapper: $(\'<div class="spgrid-wrapper"></div>\').insertBefore(spGrid)
                .append( $(\'#actionsMain\').clone().toggleClass(\'d-flex d-none\') )
                .append(spGrid),
            pnlSp: $(\'<div class="mt-2" data-link="visible{:spVisible}"></div>\').insertAfter(spGrid), //.next(\'#panelSportsmen\'),
            needReload: false,
            spFilter: function(filter, e) {
                if (!filter) {
                    spGrid.jqGrid(\'setGridParam\', {
                        postData: {
                            filters: spGrid.data(\'init-filters\')
                        }
                    }).setGridFilter([]);
                } else {
                    var filters = $.map(filter.split(\';\'),
                    function(fltrow, i) {
                        var fltr = fltrow.split(\':\');
                        if (fltr[1]==\'debts\') {
                            return {fld: fltr[0], value: 0, oper: \'lt\'};
                        }
                        return {fld: fltr[0], value: decodeURI(fltr[1]), oper: fltr[2]};
                    });
                    spGrid.setGridFilter(filters);
                }
            },
            reloadGrid: function(e) {
                spGrid.trigger(\'reloadGrid\', [{current:true}]);
            },
            reloadGridData: function(e) {
                spGrid
                .trigger(\'clearSelection\')
                .trigger(\'reloadGrid\');
            }
        }, [[!clubConfig?name=`idSchedule_main,Gender_main`]]);

        spGrid
        .data(\'spData\', spData)
        .on(\'hide.spGrid\', function(e) {
            spData.wrapper.hide();
        })
        .on(\'show.spGrid\', function(e) {
            clubScroll( spData.wrapper.show() );
        });
        
        spData.gridOpts = $.extend(true, {
            postData: {},
            gridEntity: \'idSportsmen\',
            colModel: [],
            fltrToolbar: true,
            rownumbers: true,
            search: true,
            multiSort: true,
            sortname: \'name\', sortorder: \'asc\',
            autowidth: true,
            rowattr: function(data) {
                if ($.inArray(data.status, SCRM.app.sp_arc) != -1) {
                    return {\'class\': \'rowArc\'};
                }
            },
            searching: {
    			//showQuery: true,
    			loadFilterDefaults: true,
    			multipleSearch: true,
    			//multipleGroup: true,
    			closeOnEscape: true,
    			searchOperators: true,
    			searchOnEnter: true
    		},
            formEditing: {
                width: 700,
                labelswidth: 50
            },
            reloadAlert: true,
            showDuedate: false,
            navOpts: {add:false, edit:true, del:false}
        }, initOpts);
        
        SCRM.loadWSS(\'grid\', function() {
            $.link(true, spData.wrapper, spData, {
                newSportsmen: function(){
                    var srchData = {
                        body: \'#tpl_sp_search\',
                        title: \'Новый спортсмен\'
                    };
                    club_Modal(srchData, { // handlers
                        srchSubmit: function(e, data) {
                            e.preventDefault();
                            SCRM.link(srchData, {idSportsmens: null}); //hide results
                            if (!srchData.srchTxt||srchData.srchTxt.length<2) return;
                            pDATA(\'idSportsmen\', {
                                rows: 100,
                                filters: SCRM.obj2Filter({name: {data: srchData.srchTxt, op: \'bw\'}})
                            }, function(data){
                                SCRM.link(srchData, {idSportsmens: data.rows});
                            });
                        },
                        chSportsmen: function(e, data){
                            e.preventDefault();
                            var d = data.linkCtx.data;
                            if (d.id){
                                spGrid
                                .one(\'jqGridSerializeGridData\', function(e, pd) {
                                    var gr = $(e.target);
                                    //var oldPostData = $.extend({}, pd);
                                    gr.one(\'jqGridAfterLoadComplete\', function(e, data){
                                        gr
                                        .jqGrid(\'setSelection\', d.id)
                                        .jqGrid(\'editGridRow\', d.id);
                                        SCRM.link(spData, {needReload: true});
                                        //.jqGrid(\'setGridParam\', {postData: oldPostData})
                                    });
                                    return { _where: {id: d.id} };
                                })
                                //.jqGrid(\'showCol\', \'id\')
                                .trigger(\'reloadGrid\');
                            } else {
                                spGrid
                                .one(\'jqGridAddEditInitializeForm\', function(e, form) {
                                    $(\'#name\', form).val( srchData.srchTxt );
                                })
                                .jqGrid(\'editGridRow\', \'new\');
                            }
                            srchData.mdl_hide();
                        }
                    });
                }, // end newSportsmen
                changeField: function(chfield, e){
                    SCRM._run.call(e, \'/chunk/sp.changefield\', {
                        chfield: chfield,
                        postData: {
                            id: spData.selRows.join(\',\')
                        },
                        callback: spData.clearReload
                    });
                },
                addInvoices: function(e){
                    SCRM._run(\'/chunk/newinvoice\', {
                        modal: {
                            title: \'Массовые начисления\',
                            ok: \'Начислить\'
                        },
                        post: {
                            addmulti: \'sportsmen\',
                            sportsmen: spData.selRows.join(\',\')
                        }
                    });
                },
                changeSquad: function(e, data) {
                    SCRM._run(\'/chunk/squadlist\', {
                        post: {
                            ismain: \'1\',
                            sportsmen: spData.selRows.join(\',\')
                        },
                        callback: spData.clearReload
                    });
                    /*squadAdd({
                        ismain: \'1\',
                        sportsmen: spData.selRows.join(\',\')
                    }, function(data) {
                        spData.reloadGrid();
                        // TODO: Удалить, потому что окно будет закрыто ?
                        SCRM._runLoader(\'spCard\')();
                        //clubSpCard.loadData();
                    });*/
                },
                exportQRcard: function(e, data) {
                    e.preventDefault();
                    var lnk = $(e.target);
                    var data = $.extend({ // Чтобы не изменить Post
                        doc_type: \'docx\',
                        _export: lnk.data(\'handler\'),
                        tmpl: lnk.data(\'tmpl\'),
                    }, spGrid.jqGrid(\'getGridParam\', \'postData\'), {
                        _where: \'id=\' + spData.selRows.join(\',\'),
                        filters: \'\',
                        rows: 1001 // Безлимитно
                    });
                    clubPostForm(spGrid.jqGrid(\'getGridParam\', \'url\'), data);
                },
                exportContract: function(e, data){
                    clubPostForm(\'/data/sportsmen\', {
                        key: spData.sp.key,
                        mode: \'export\'
                    });
                },
                sendMessage: function(e, data){
                    pDATA(\'idSportsmen\', {
                        _where: {id: spData.selRows.join(\',\')},
                        rows: 1001
                    }, function(data){
                        SCRM._service.sendMessage(data.rows);
                    });
                },
                clipAdd: function(e) {
                    getGridSelRows(spGrid, function(selIDs){
                        var clipSportsmen = get_clipSportsmen();
                        $.each(selIDs, function(i, v){
                            var itemIndex = $.inArray(v, clipSportsmen);
                            if (itemIndex == -1) clipSportsmen.push(v);
                        });
                        saveObjectInLocalStorage(\'club_clip_sportsmen\', clipSportsmen);
                    });
                },
                clipRemove: function(e){
                    getGridSelRows(spGrid, function(selIDs){
                        var clipSportsmen = get_clipSportsmen();
                        $.each(selIDs, function(i, v){
                            var itemIndex = $.inArray(v, clipSportsmen);
                            if (itemIndex > -1) clipSportsmen.splice(itemIndex, 1);
                        });
                        saveObjectInLocalStorage(\'club_clip_sportsmen\', clipSportsmen);
                    });
                },
                clipClear: function(e){
                    removeObjectFromLocalStorage(\'club_clip_sportsmen\');
                    SCRM.msg("Буфер обмена пуст!", "Успешно");
                },
                clipShow: function(e) {
                    spGrid.setGridFilter(\'id\', get_clipSportsmen().join(\',\'));
                }
            });
    
            $.observe(spData, \'idSchedule_main\', function(e, data){
                spGrid.trigger(\'reloadGrid\');
            });
        
            function saldoCls(row) {
                var cellCls = [\'saldoCell\'];
                if (row.saldo*1 > 0) cellCls.push(\'text-success\'); else {
                    if (row.saldo*1 < 0) cellCls.push(\'text-danger\',\'font-weight-bold\');
                    if (row.price && row.price*1 != 0  && row.saldo*1 < 0-row.price*1) cellCls.push(\'rowWarn\');
                }
                return cellCls;
            }
            
            
            
            var narc = {id: \'narc\', name: \'[Не в архиве]\'};
            var gridOpts = spData.gridOpts;
            gridOpts.colModel.push(
                {name: \'id\', template: idFieldTemplate},
                {name: \'created\', template: createdTemplate},
                {name: \'status\', width: 50, align: \'center\',
                    template: lookTemplate,
                    cellattr: function(rowId, cellValue, rawObject, cm, rdata){
                        return arr2clstring( saldoCls(rawObject) );
                    },
                    formatter: function(cv){
                        return SCRM.statusFmt(\'idSportsmen\', cv, \'name\', true);
                    },
                    unformat: function(cellValue, options, cell) {
                        return $(cell).find(\'i\').data(\'status\');
                    },
                    searchoptions: {
                        defaultValue: \'narc\'
                    },
                    clubStatus: \'idSportsmen\', lookupKey: \'name\'
                },
                {name: \'name\', //index: \'idSportsmen.name\',
                    width: 200, editable: true, setROW: true, // Может обновляться через fieldEDIT
                    formoptions: {rowpos: 1, colpos: 1},
                    editrules: {edithidden: true, required: true}
                },
                {name: \'gender\', index: \'idSportsmen.gender\',
                    width: 40, hidden: true,
                    editable: true,
                    editoptions: {
                        defaultValue: spData.Gender_main
                    },
                    formoptions: {rowpos: 1, colpos: 2},
                    template: selTemplate,
                    clubStatus: \'Gender\', lookupKey: \'alias\'
                },
                //{name:\'num\', width:50, hidden: true, sorttype:\'int\'},
                {name: \'birth\', index: \'idSportsmen.birth\',
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:2, colpos:1},
                    template: dateTemplate,
                    cellattr: cellEmptyColor
                },
                {name: \'doc\', width: 100, hidden:true,
                    editable: true, editrules: {edithidden:true}, setROW: true,
                    formoptions:{rowpos: 2, colpos: 2},
                    cellattr: cellEmptyColor
                },
                {name:\'contract\', width:80,
                    editable: true, editrules: {edithidden:true}, setROW: true,
                    formoptions:{rowpos:3, colpos:1},
                    cellattr: cellEmptyColor
                },
                {name:\'contractdate\',
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:3, colpos:2},
                    template: dateTemplate,
                    cellattr: cellEmptyColor
                },
                {name:\'contact\', width:100,
                    editable: true, editrules: {edithidden:true}, setROW: true,
                    formoptions:{rowpos:4, colpos:1},
                    cellattr: cellEmptyColor,
                    inCard: true
                },
                {name:\'pasp\', hidden:true,
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:4, colpos:2},
                    template: \'booleanCheckboxFa\',
                    inCard: true
                },
                {name:\'email\', hidden: true, template: emailTemplate,
                    editable: true,
                    editrules: {edithidden: true}, //, email: true
                    formoptions: {rowpos: 5, colpos: 1}
                },
                {name:\'tel\', template: telTemplate,
                    editable: true,
                    editrules: {edithidden: true},
                    formoptions:{rowpos: 5, colpos: 2},
                    cellattr: cellEmptyColor
                },
                {name: \'price\',
                    editable: true, editrules: {edithidden: true},
                    formoptions:{rowpos: 7, colpos: 1},
                    template: numberTemplate
                },
                {name: \'discount\', width: 45, align: \'right\',
                    editable: true, editrules: {edithidden:true},
                    formoptions: {rowpos:7, colpos:2},
                    template: selTemplate,
                    //dbvalues: dbValues.Discount,
                    clubStatus: \'Discount\', lookupKey: \'name\',
                    dbvalues0: \'\'
                },      
        
                {name:\'saldo\',
                    template: numberTemplate,
                    cellattr: function(rowId, cellValue, rawObject, cm, rdata){
                        return arr2clstring( saldoCls(rawObject) );
                    }
                },
                // duedate
                {name: \'meddate\',
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos: 9, colpos: 1},
                    template: dateTemplate,
                    cellattr: cellInsuranceColor
                },
                {name: \'insdate\',
                    editable: true, editrules: {edithidden: true},
                    formoptions:{rowpos: 9, colpos: 2},
                    template: dateTemplate,
                    cellattr: cellInsuranceColor
                },
                {name: \'razr\', width: 50,
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:10, colpos:1},
                    template: selTemplate,
                    clubStatus: \'idSportsmenGrade\', lookupKey: \'name\',
                    dbvalues0: \'\'
                },
        
                {name:\'level_name\', index:\'idSquad.lvl\', width: 55,
                    template: lookTemplate,
                    dbvalues: \'idLevel\'
                },
                {name:\'squad_name\', index:\'idSquad.name\', width: 55},
                {name:\'trainer_name\', index: \'idTrainer.name\', width: 100},
                {name:\'club_name\', index:\'idSquad.club\', width: 85,
                    template: lookTemplate,
                    dbvalues: \'idClub\'
                },
                {name:\'sport_name\', index:\'idSquad.sport\', width: 100,
                    template: lookTemplate,
                    dbvalues: \'idSport\'
                },
                {name: \'squad\', hidden: true, hidedlg: true,
                    searchrules: { integer: true },
                    editable: true, editrules: {edithidden:true}, //, required:true, integer:true
                    formoptions:{rowpos:11, colpos:1},
                    edittype: \'custom\',
                    editoptions:{
                        custom_element: function(value, edopt) {
                            var el = $(\'<select><option>...</option></select>\');
                            SCRM._run(\'/chunk/squadlist\', function(html) {
                                el.html(html).val(value||0);
                            });
                            return el;
                        }
                    }
                },
                {name:\'trainer\', editable: true,
                    hidden:true, hidedlg: true, editrules: {edithidden: true},
                    formoptions: {rowpos: 11, colpos: 2},
                    template: selTemplate,
                    dbvalues: \'idTrainer\', dbvalues0: 0
                },
                {name: \'info\', hidden: true,
                    template: infoTemplate,
                    editable: true, editrules: {edithidden:true}, setROW: true,
                    formoptions: {rowpos:12, colpos:1},
                    inCard: true
                },
                {name: \'height\', width:50, hidden: true,
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:13, colpos:1},
                    inCard: true
                },
                {name:\'weight\', width:50, hidden: true,
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:13, colpos:2},
                    inCard: true
                },
                {name:\'username\',
                    width:30, editable: false,
                    search: false,
                    align: \'center\',
                    formatter: hasUser
                },
                {name:\'key\', hidden: true, editable: false}
            );

            
            if (gridOpts.showDuedate) {
                gridOpts.colModel.splice(16, 0, {
                    name:\'duedate\', width: 110, hidden: false,
                    align: \'right\',
                    searchoptions: {
                        sopt: [\'eq\']
                    },
                    formatter: function(cv, options, row){
                        var str = [];
                        //row.debt_lesson = row.lesson_amount*1 - row.cnt_lesson*1;
                        if (row.duedate) {
                            //if (row.debt_lesson != 0) 
                            if (row.cnt_lesson > 0) str.push(row.cnt_lesson);
                            str.push( str2date(row.duedate,\'d\') );
                            // if (diff > -90 || row.name_typeinvoice || residue===0) // Если < 3 мес или idInvoice
                        }
                        return str.join(\' ~ \'); // если пустое, будет пустая строка
                    },
                    cellattr: function(rowId, cellValue, data, cm, row){
                        if (data.duedate) {
                            return arr2clstring([\'text-success\']);
                        }
                        /*var cellCls = []; //, diff = diffNow(row.duedate);
                        if (data.duedate && (data.debt_lesson > 0 || data.lesson_amount == 0)) {
                            cellCls.push(\'text-success\');
                        } else {
                            cellCls.push(\'text-muted\');
                        }
                        return arr2clstring(cellCls);*/
                    }
                });
            }
            
            
            if (gridOpts.ipcFields) {
                function cellSaldoColor2(rowId, cellValue, rawObject, cm, rdata){
                    return rawObject.tmp_cls;
                }
                var ipcFields = {
                    invoiced: {
                        label: \'Начислено\',
                        width: 90,
                        template: numberTemplate,
                        formatter: function(cv, options, row) {
                            if (options.rowId == \'\') return (row.invoiced)? row.invoiced : \'\'; // if footer
                            return numberFormatter(cv);
                        },
                        cellattr: cellSaldoColor2,
                        inCard: true
                    },
                    add_cnt: {
                        label: \'Количество\',
                        template: numberTemplate,
                        cellattr: cellSaldoColor2,
                        inCard: true
                    },
                    payed: {
                        label: \'Оплачено\',
                        width: 90,
                        template: numberTemplate,
                        cellattr: cellSaldoColor2,
                        inCard: true
                    },
                    add_info: {
                        template: infoTemplate,
                        inCard: true
                    }
                };
                $.each(gridOpts.ipcFields.split(\',\'), function(i, v){
                    var fld = ipcFields[v];
                    if (fld) {
                        fld.name = v;
                        gridOpts.colModel.push(fld);
                    }
                });
                $.extend(gridOpts, {
                    footerrow: true,
                    userDataOnFooter: true,
                    multiselect: false
                });
                spGrid.one(\'jqGridAfterInit\', function(e){
                    var hideCols = \'doc,orderdate,meddate,insdate,pasp,razr,contact,tel\'.split(\',\');
                    $(this)
                    .jqGrid(\'hideCol\', hideCols)
                    .jqGridExport();
                });
            }
        
            grids.main = spGrid
            .one(\'jqGridBeforeInit\', function(e, grOpts) {
                var editedRows,
                gr = $(this)
                .one(\'jqGridAfterInit\', function(e, grOpts){
                    $.each(gr.jqGrid(\'getGridParam\', \'colModel\'), function(i, v) {
                        if (!v.label) {
                            var nlabel = SCRM.lexicon.idSportsmen[v.name];
                            if (nlabel && nlabel != v.name) { // Есть в справочнике
                                gr.jqGrid(\'setLabel\', v.name, nlabel);
                                v.label = nlabel;
                            }
                        }
                    });
                    grOpts.reloadAlert.link(true, spData);
                    spData.pnlSp.link(true, spData);
                    
                    gr
                    .jqGridColumns()
                    .data(\'init-filters\', gr.jqGrid(\'getGridParam\', \'postData\').filters);
                })
                .on(\'jqGridAddEditBeforeInitData\', function (e, form, ddd) { // Редактируется строка
                    var id = gr.jqGrid(\'getGridParam\', \'selrow\');
                    console.log(\'jqGridAddEditBeforeInitData\',  e, form, ddd, id, editedRows);
                    if (id in editedRows) {
                        SCRM.alert(\'Данные в строке неактуальны. Обновите таблицу\');
                        return false;
                    }
                })
                .on(\'jqGridBeforeRequest.spGrid\', function(e) {
                    var sstatus = gr.data(\'start_status\');
                    if (sstatus) {
                        var col = gr.jqGrid(\'getColProp\', \'status\');
                        col.searchoptions.defaultValue = (sstatus==\'*\')? \'\' : sstatus;
                        gr.data(\'start_status\', null);
                    }
                })
                .on(\'jqGridSerializeGridData.spGrid\', function(e, postData) {
                    if (gridOpts.showDuedate) postData._stype = spData.idSchedule_main;
                    if (postData.clubStatus) postData.clubStatus.push(\'idSchedule\');
                })
                .on(\'jqGridBeforeSetLookup\', function(e, params){
                    if (params.f.name == \'status\') {
                        params.rows.unshift(narc);
                    }
                })
                .on(\'jqGridAfterLoadComplete.spGrid\', function(e, data) {
                    editedRows = {};
                    if (data.sp_arc) SCRM.app.sp_arc = data.sp_arc.split(\',\');
                    if (data.dbvalues && data.dbvalues.idTrainer) {
                        SCRM.dbValues.idTrainer = data.dbvalues.idTrainer;
                    }
                    SCRM.link(spData, {needReload: false});
                })
                .on(\'needReload.spGrid\', function(e, data) {
                    SCRM.link(spData, {needReload: true});
                });
                
                // При изменении данных в eCard
                $(document)
                .on(\'eCardSpEdit\', function(e, data){
                    var id = \'\'+data.id,
                        ids = gr.jqGrid(\'getDataIDs\');
                    if (in_array(id, ids)) {
                        editedRows[id] = true;
                        SCRM.link(spData, {needReload: true});
                    }
                });
                
                // TODO: Выпилить, чтобы было однообразно
                $(document)
                .on(\'OnRefreshSpData\', function(e, data) {
                    // Если при обновлении карточки меняется
                    var id = (data.sp||{}).id,
                        ids = gr.jqGrid(\'getDataIDs\');
                    if (in_array(id, ids)) SCRM.link(spData, {needReload: true});
                });
            })
            .jqGridInit(gridOpts)
            .on(\'jqGridAddEditInitializeForm\', function(e, form, oper) {
                var tr = $(\'tr#tr_info\', form);
                $(\'td:eq(1)\', tr).attr(\'colspan\', 3); 
                $(\'td:gt(1)\', tr).remove();
                
                var gen = $(\'#gender\', form).css(\'width\', \'auto\');
                $(\'select.customelement\', form).addClass( gen.attr(\'class\') );
            })
            .on(\'jqGridSelectRow jqGridSelectAll\', function(e, rid, sel) {
                var grid = $(this);
                //console.log(e, rid, sel)
                var selRows = getGridSelRows(grid);
                var nsd = {
                    //loading: 1,
                    spVisible: false,
                    selRows: selRows,
                    selRowsCnt: selRows.length // spCount
                };
        
                if (selRows.length == 1) {
                    nsd.spVisible = true;
                    nsd.spID = selRows[0];
                    nsd.sp = grid.jqGrid(\'getRowData\', nsd.spID);
        
                    var tr = grid.jqGrid(\'getGridRowById\', nsd.spID);
                    var mainCols = grid.jqGrid(\'getGridParam\', \'colModel\');
                    
                    nsd.cardHolder = spData.pnlSp;
                    //nsd.cardModal = true;
                    SCRM._runLoader(\'spCard\')(nsd); // spVisible = true
                    //clubSpCard.loadData(); 
                }
                SCRM.link(spData, nsd);
            })
            .on(\'jqGridDeleteBeforeShowForm\', function (e, form) {
                $(\'.delmsg\', form).html(\'Удаляются спортсмены только в статусе <b>\'+ 
                    SCRM.app.sp_arc.join(\', \') +\'</b>.<br>Продолжить?\');
            })
            .on(\'jqGridDeleteAfterComplete\', function(e, rowid, jqXhrOrBool, postData, options) {
                $(this).trigger(\'clearSelection\');
            });
        });
    } else {
        if (initOpts && spGrid.hasClass(\'ui-jqgrid-btable\')) {
            spGrid.jqGrid(\'setGridParam\', initOpts);
        }
        spGrid.trigger(\'reloadGrid\');
    }
});
</script>


</div>

<script>
$(\'#grmain\')
.one(\'jqGridBeforeInit\', function(e, grOpts){
    grOpts.colModel.push({
        name:\'photo\', label:\'Фото\',
        width:30, editable: false,
        search: false,
        align: \'center\',
        formatter: hasPhoto
    });
})
.one(\'jqGridAfterLoadComplete\', function(e, data){
    var spGrid = $(this).jqGridExport(),
        param = getUrlVars();

    if (param.filter) setTimeout(function() {
        spGrid.data(\'spData\').spFilter(param.filter);
    }, 500);
})
.trigger(\'sportsmenGrid\', {
    showDuedate: true,
    multiselect: true,
    sortname: \'saldo asc, name asc\',
    postData: { tableadd: \'idPhoto\' }
});


</script>
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
    SCRM.app.title = \'Реестр водителей\';
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
  'resourceGroups' => 
  array (
    26 => 
    array (
      'id' => 26,
      'document_group' => 2,
      'document' => 28,
    ),
  ),
  'policyCache' => 
  array (
    'modAccessResourceGroup' => 
    array (
      2 => 
      array (
        0 => 
        array (
          'principal' => '2',
          'authority' => '9999',
          'policy' => 
          array (
            'add_children' => true,
            'create' => true,
            'copy' => true,
            'delete' => true,
            'list' => true,
            'load' => true,
            'move' => true,
            'publish' => true,
            'remove' => true,
            'save' => true,
            'steal_lock' => true,
            'undelete' => true,
            'unpublish' => true,
            'view' => true,
          ),
        ),
        1 => 
        array (
          'principal' => '4',
          'authority' => '9999',
          'policy' => 
          array (
            'add_children' => true,
            'create' => true,
            'copy' => true,
            'delete' => true,
            'list' => true,
            'load' => true,
            'move' => true,
            'publish' => true,
            'remove' => true,
            'save' => true,
            'steal_lock' => true,
            'undelete' => true,
            'unpublish' => true,
            'view' => true,
          ),
        ),
        2 => 
        array (
          'principal' => '9',
          'authority' => '9999',
          'policy' => 
          array (
            'add_children' => true,
            'create' => true,
            'copy' => true,
            'delete' => true,
            'list' => true,
            'load' => true,
            'move' => true,
            'publish' => true,
            'remove' => true,
            'save' => true,
            'steal_lock' => true,
            'undelete' => true,
            'unpublish' => true,
            'view' => true,
          ),
        ),
      ),
    ),
  ),
  'elementCache' => 
  array (
    '[[$tplSearch]]' => '<script id="tpl_searchinput" type="text/x-jsrender">
<form class="input-group input-group-alt srch-group" action="" data-link="{on \'submit\' ~srchSubmit}">
    <input type="text" class="srch-input form-control clubmodal-focus" 
        data-link="{:srchTxt:} placeholder{:~placeholder}" />
    <div class="input-group-append">
        <button type="submit" class="btn btn-secondary"><i class="fa fa-search"></i></button>
    </div>
</form>
</script>

<script id="tpl_rowSportsmen" type="text/x-jsrender">
<a href="#" class="list-group-item list-group-item-action list-group-item-primary" data-link="{on ~chSportsmen}">
    <div class="list-group-item-body">
    <h4 class="list-group-item-title">{{:name}}</h4>
    <h5 class="list-group-item-subtitle">{{formatDate:birth}}</h5>
    </div>
    <div class="list-group-item-figure">
        <i data-link="class{:\'fa \' + (~cls? ~cls:\'fa-plus\')}"></i>
    </div>
</a>
</script>',
    '[[$dbInner?actions=`1`]]' => '<div class="mb-2 d-none" id="actionsMain">
    <button class="btn btn-success btn-sm" data-link="{on ~newSportsmen}"><i class="fa fa-user-plus"></i></button>
    <div class="dropdown mx-1">
        <button data-toggle="dropdown" class="btn btn-primary btn-sm d-flex flex-nowrap align-items-center" 
            disabled="disabled" data-link="disabled{:!selRowsCnt}">
            Действия
            <small data-link="text{:selRowsCnt} css-display{if !selRowsCnt tmpl=\'none\'}" class="badge badge-pill badge-warning ml-1"></small>
        </button>
        <div class="dropdown-menu">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item prevent-default" data-pholder="Номер приказа/справки/заявление от родителей"
                data-link="{on \'click\' ~changeField \'status\'}">Сменить Статус</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' ~changeSquad}">Группа, Уровень</a>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' ~changeField \'trainer\'}">Сменить тренера</a>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' ~changeField \'razr\'}">Присвоить разряд</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' ~changeField \'price\'}">Сменить тариф</a>
            <button class="dropdown-item btn-addinvoice" data-link="{on ~addInvoices}">Начисление</button>
            <a href="#" class="dropdown-item"
                data-extaction="/database/insure-manager.html" data-grid="main">Застраховать</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~Run \'/chunk/gotoevent\'}">Мероприятие</a>
        </div>
    </div>
    <button class="btn btn-outline-primary btn-sm mr-1 d-none"
        data-link="class{merge:(!~S^f||!selRowsCnt) toggle=\'d-none\'} {on ~sendMessage}">
        <i class="fa fa-envelope"></i>
    </button>
    <div class="dropdown d-none" data-link="class{merge:!selRowsCnt toggle=\'d-none\'}">
        <button data-toggle="dropdown" class="btn btn-outline-primary btn-sm"><i class="fa fa-print"></i></button>
        <div class="dropdown-menu">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item" data-link="{on ~exportQRcard}"
                data-handler="idSportsmen_qrcard" data-tmpl="sportsmen_qrcard.docx">QR карточки</a>
            <a href="#" class="dropdown-item" data-link="{on ~exportQRcard}"
                data-handler="idSportsmen_qrtable" data-tmpl="">QR наклейки</a>
            <div data-link="visible{:selRowsCnt==1}">
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item prevent-default"
                    data-link="{on ~exportContract}">Скачать договор</a>
            </div>
        </div>
    </div>
    <div class="dropdown mx-1">
        <button data-toggle="dropdown" class="btn btn-secondary btn-sm">
            <i class="fa fa-filter"></i><span class="d-none d-sm-inline"> Фильтр</span></button>
        <div class="dropdown-menu">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' spFilter \'saldo:debts\'}">Должники</a></li>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' spFilter \'duedate:0\'}">Без абонемента</a></li>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~Run \'/chunk/sp.birth\'}">Именинники</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' spFilter \'\'}">Сбросить фильтр</a>
        </div>
    </div>
    <div class="dropdown" data-link="visible{:gridOpts.showDuedate}">
        <button data-toggle="dropdown" class="btn btn-secondary btn-sm">
            <i class="fa fa-battery-3"></i><span class="d-none d-lg-inline"> Абонементы</span>
        </button>
        <div class="dropdown-menu" data-link="{radiogroup idSchedule_main} {for ~S.clubStatus^idSchedule tmpl=\'#tpl_SchInv\'}">
        </div>
    </div>

    <div class="dropdown mx-1">
        <button data-toggle="dropdown" class="btn btn-secondary btn-sm">
            <i class="fa fa-clipboard"></i><span class="d-none d-sm-inline"> Буфер</span></button>
        <div class="dropdown-menu">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~clipAdd}">
                <i class="fa fa-user-plus dropdown-icon"></i> Добавить</a>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~clipRemove}">
                <i class="fa fa-user-times dropdown-icon"></i> Удалить</a>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~clipShow}">
                <i class="fa fa-users dropdown-icon"></i> Показать</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~clipClear}">Очистить</a>
        </div>
    </div>
    
</div>

<table id="grmain" data-entity="idSportsmen"></table>

<style>
    #TblGrid_grmain.EditTable {
        border-spacing: 2px 6px;
        border-collapse: initial;
    }
    .ui-jqdialog-content .CaptionTD {
        vertical-align: top;
        text-align: right;
    }
</style>

<script id="tpl_SchInv" type="text/x-jsrender">
    {{if #index==0}}<div class="dropdown-arrow"></div>{{/if}}
    <label class="custom-control custom-radio">
        <input type="radio" class="custom-control-input" name="SchInv" value="{{:alias}}">
        <span class="custom-control-label">{{:name}}</span>
    </label>
</script>

<script id="tpl_sp_search" type="text/x-jsrender">
<p class="text-muted">Введите ФИО, мы поищем в базе, чтобы не создавать дубликаты</p>
{{include ~placeholder="ФИО" tmpl="#tpl_searchinput"/}}

<div class="list-group list-group-flush list-group-bordered mt-2" data-link="visible{:idSportsmens}">
    {^{for idSportsmens ~cls="fa-pencil" tmpl=\'#tpl_rowSportsmen\' /}}
    <a href="#" class="list-group-item list-group-item-action list-group-item-success" data-link="{on ~chSportsmen}">
        <div class="list-group-item-body">Создать <b data-link="srch_txt"></b></div>
        <div class="list-group-item-figure">
            <i class="fa fa-plus"></i>
        </div>
    </a>
</div>
</script>

<script id="tpl_searchinput" type="text/x-jsrender">
<form class="input-group input-group-alt srch-group" action="" data-link="{on \'submit\' ~srchSubmit}">
    <input type="text" class="srch-input form-control clubmodal-focus" 
        data-link="{:srchTxt:} placeholder{:~placeholder}" />
    <div class="input-group-append">
        <button type="submit" class="btn btn-secondary"><i class="fa fa-search"></i></button>
    </div>
</form>
</script>

<script id="tpl_rowSportsmen" type="text/x-jsrender">
<a href="#" class="list-group-item list-group-item-action list-group-item-primary" data-link="{on ~chSportsmen}">
    <div class="list-group-item-body">
    <h4 class="list-group-item-title">{{:name}}</h4>
    <h5 class="list-group-item-subtitle">{{formatDate:birth}}</h5>
    </div>
    <div class="list-group-item-figure">
        <i data-link="class{:\'fa \' + (~cls? ~cls:\'fa-plus\')}"></i>
    </div>
</a>
</script>

<script>
window.dbValues = SCRM.dbValues || {};

$.extend(true, SCRM.lexicon, {
    idSportsmen:{
        status:\'Статус\',
        name:\'Ф.И.О.\',
        gender:\'Пол\',
        birth:\'Дата рождения\',
        doc:\'N Свидетельства\',
        contract:\'N Договора\',
        contractdate:\'Дата договора\',
        contact:\'Контакт\',
        pasp:\'Паспорт\',
        email:\'Email\',
        tel:\'Телефон\',
        price:\'Стоимость\',
        discount:\'Скидка\',
        saldo:\'Баланс\',
        duedate:\'Абонемент\',
        meddate:\'Срок мед. справки\',
        insdate:\'Срок страховки\',
        razr:\'Разряд\',
        club_name:\'Зал\',
        sport_name:\'Дисциплина\',
        level_name:\'Уровень\',
        squad:\'Зал, Группа\',
        squad_name:\'Группа\',
        trainer:\'Тренер\',
        trainer_name:\'Тренер\',
        info:\'Заметки\',
        height:\'Рост\',
        weight:\'Вес\',
        username: \'Кабинет\'
    }
});

function get_clipSportsmen() {
    return getObjectFromLocalStorage(\'club_clip_sportsmen\') || [ ];
}

/* ============ sportsmenGrid =============== */


$(document)
.on(\'sportsmenGrid\', \'table\', function(e, initOpts) { //, \'[data-entity="idSportsmen"]\'
    var spGrid = $(e.target),
        spData = spGrid.data(\'spData\');

    if (!spData) {
        
        spData = $.extend({
            url: window.location.origin,
            grid: spGrid,
            wrapper: $(\'<div class="spgrid-wrapper"></div>\').insertBefore(spGrid)
                .append( $(\'#actionsMain\').clone().toggleClass(\'d-flex d-none\') )
                .append(spGrid),
            pnlSp: $(\'<div class="mt-2" data-link="visible{:spVisible}"></div>\').insertAfter(spGrid), //.next(\'#panelSportsmen\'),
            needReload: false,
            spFilter: function(filter, e) {
                if (!filter) {
                    spGrid.jqGrid(\'setGridParam\', {
                        postData: {
                            filters: spGrid.data(\'init-filters\')
                        }
                    }).setGridFilter([]);
                } else {
                    var filters = $.map(filter.split(\';\'),
                    function(fltrow, i) {
                        var fltr = fltrow.split(\':\');
                        if (fltr[1]==\'debts\') {
                            return {fld: fltr[0], value: 0, oper: \'lt\'};
                        }
                        return {fld: fltr[0], value: decodeURI(fltr[1]), oper: fltr[2]};
                    });
                    spGrid.setGridFilter(filters);
                }
            },
            reloadGrid: function(e) {
                spGrid.trigger(\'reloadGrid\', [{current:true}]);
            },
            reloadGridData: function(e) {
                spGrid
                .trigger(\'clearSelection\')
                .trigger(\'reloadGrid\');
            }
        }, [[!clubConfig?name=`idSchedule_main,Gender_main`]]);

        spGrid
        .data(\'spData\', spData)
        .on(\'hide.spGrid\', function(e) {
            spData.wrapper.hide();
        })
        .on(\'show.spGrid\', function(e) {
            clubScroll( spData.wrapper.show() );
        });
        
        spData.gridOpts = $.extend(true, {
            postData: {},
            gridEntity: \'idSportsmen\',
            colModel: [],
            fltrToolbar: true,
            rownumbers: true,
            search: true,
            multiSort: true,
            sortname: \'name\', sortorder: \'asc\',
            autowidth: true,
            rowattr: function(data) {
                if ($.inArray(data.status, SCRM.app.sp_arc) != -1) {
                    return {\'class\': \'rowArc\'};
                }
            },
            searching: {
    			//showQuery: true,
    			loadFilterDefaults: true,
    			multipleSearch: true,
    			//multipleGroup: true,
    			closeOnEscape: true,
    			searchOperators: true,
    			searchOnEnter: true
    		},
            formEditing: {
                width: 700,
                labelswidth: 50
            },
            reloadAlert: true,
            showDuedate: false,
            navOpts: {add:false, edit:true, del:false}
        }, initOpts);
        
        SCRM.loadWSS(\'grid\', function() {
            $.link(true, spData.wrapper, spData, {
                newSportsmen: function(){
                    var srchData = {
                        body: \'#tpl_sp_search\',
                        title: \'Новый спортсмен\'
                    };
                    club_Modal(srchData, { // handlers
                        srchSubmit: function(e, data) {
                            e.preventDefault();
                            SCRM.link(srchData, {idSportsmens: null}); //hide results
                            if (!srchData.srchTxt||srchData.srchTxt.length<2) return;
                            pDATA(\'idSportsmen\', {
                                rows: 100,
                                filters: SCRM.obj2Filter({name: {data: srchData.srchTxt, op: \'bw\'}})
                            }, function(data){
                                SCRM.link(srchData, {idSportsmens: data.rows});
                            });
                        },
                        chSportsmen: function(e, data){
                            e.preventDefault();
                            var d = data.linkCtx.data;
                            if (d.id){
                                spGrid
                                .one(\'jqGridSerializeGridData\', function(e, pd) {
                                    var gr = $(e.target);
                                    //var oldPostData = $.extend({}, pd);
                                    gr.one(\'jqGridAfterLoadComplete\', function(e, data){
                                        gr
                                        .jqGrid(\'setSelection\', d.id)
                                        .jqGrid(\'editGridRow\', d.id);
                                        SCRM.link(spData, {needReload: true});
                                        //.jqGrid(\'setGridParam\', {postData: oldPostData})
                                    });
                                    return { _where: {id: d.id} };
                                })
                                //.jqGrid(\'showCol\', \'id\')
                                .trigger(\'reloadGrid\');
                            } else {
                                spGrid
                                .one(\'jqGridAddEditInitializeForm\', function(e, form) {
                                    $(\'#name\', form).val( srchData.srchTxt );
                                })
                                .jqGrid(\'editGridRow\', \'new\');
                            }
                            srchData.mdl_hide();
                        }
                    });
                }, // end newSportsmen
                changeField: function(chfield, e){
                    SCRM._run.call(e, \'/chunk/sp.changefield\', {
                        chfield: chfield,
                        postData: {
                            id: spData.selRows.join(\',\')
                        },
                        callback: spData.clearReload
                    });
                },
                addInvoices: function(e){
                    SCRM._run(\'/chunk/newinvoice\', {
                        modal: {
                            title: \'Массовые начисления\',
                            ok: \'Начислить\'
                        },
                        post: {
                            addmulti: \'sportsmen\',
                            sportsmen: spData.selRows.join(\',\')
                        }
                    });
                },
                changeSquad: function(e, data) {
                    SCRM._run(\'/chunk/squadlist\', {
                        post: {
                            ismain: \'1\',
                            sportsmen: spData.selRows.join(\',\')
                        },
                        callback: spData.clearReload
                    });
                    /*squadAdd({
                        ismain: \'1\',
                        sportsmen: spData.selRows.join(\',\')
                    }, function(data) {
                        spData.reloadGrid();
                        // TODO: Удалить, потому что окно будет закрыто ?
                        SCRM._runLoader(\'spCard\')();
                        //clubSpCard.loadData();
                    });*/
                },
                exportQRcard: function(e, data) {
                    e.preventDefault();
                    var lnk = $(e.target);
                    var data = $.extend({ // Чтобы не изменить Post
                        doc_type: \'docx\',
                        _export: lnk.data(\'handler\'),
                        tmpl: lnk.data(\'tmpl\'),
                    }, spGrid.jqGrid(\'getGridParam\', \'postData\'), {
                        _where: \'id=\' + spData.selRows.join(\',\'),
                        filters: \'\',
                        rows: 1001 // Безлимитно
                    });
                    clubPostForm(spGrid.jqGrid(\'getGridParam\', \'url\'), data);
                },
                exportContract: function(e, data){
                    clubPostForm(\'/data/sportsmen\', {
                        key: spData.sp.key,
                        mode: \'export\'
                    });
                },
                sendMessage: function(e, data){
                    pDATA(\'idSportsmen\', {
                        _where: {id: spData.selRows.join(\',\')},
                        rows: 1001
                    }, function(data){
                        SCRM._service.sendMessage(data.rows);
                    });
                },
                clipAdd: function(e) {
                    getGridSelRows(spGrid, function(selIDs){
                        var clipSportsmen = get_clipSportsmen();
                        $.each(selIDs, function(i, v){
                            var itemIndex = $.inArray(v, clipSportsmen);
                            if (itemIndex == -1) clipSportsmen.push(v);
                        });
                        saveObjectInLocalStorage(\'club_clip_sportsmen\', clipSportsmen);
                    });
                },
                clipRemove: function(e){
                    getGridSelRows(spGrid, function(selIDs){
                        var clipSportsmen = get_clipSportsmen();
                        $.each(selIDs, function(i, v){
                            var itemIndex = $.inArray(v, clipSportsmen);
                            if (itemIndex > -1) clipSportsmen.splice(itemIndex, 1);
                        });
                        saveObjectInLocalStorage(\'club_clip_sportsmen\', clipSportsmen);
                    });
                },
                clipClear: function(e){
                    removeObjectFromLocalStorage(\'club_clip_sportsmen\');
                    SCRM.msg("Буфер обмена пуст!", "Успешно");
                },
                clipShow: function(e) {
                    spGrid.setGridFilter(\'id\', get_clipSportsmen().join(\',\'));
                }
            });
    
            $.observe(spData, \'idSchedule_main\', function(e, data){
                spGrid.trigger(\'reloadGrid\');
            });
        
            function saldoCls(row) {
                var cellCls = [\'saldoCell\'];
                if (row.saldo*1 > 0) cellCls.push(\'text-success\'); else {
                    if (row.saldo*1 < 0) cellCls.push(\'text-danger\',\'font-weight-bold\');
                    if (row.price && row.price*1 != 0  && row.saldo*1 < 0-row.price*1) cellCls.push(\'rowWarn\');
                }
                return cellCls;
            }
            
            
            
            var narc = {id: \'narc\', name: \'[Не в архиве]\'};
            var gridOpts = spData.gridOpts;
            gridOpts.colModel.push(
                {name: \'id\', template: idFieldTemplate},
                {name: \'created\', template: createdTemplate},
                {name: \'status\', width: 50, align: \'center\',
                    template: lookTemplate,
                    cellattr: function(rowId, cellValue, rawObject, cm, rdata){
                        return arr2clstring( saldoCls(rawObject) );
                    },
                    formatter: function(cv){
                        return SCRM.statusFmt(\'idSportsmen\', cv, \'name\', true);
                    },
                    unformat: function(cellValue, options, cell) {
                        return $(cell).find(\'i\').data(\'status\');
                    },
                    searchoptions: {
                        defaultValue: \'narc\'
                    },
                    clubStatus: \'idSportsmen\', lookupKey: \'name\'
                },
                {name: \'name\', //index: \'idSportsmen.name\',
                    width: 200, editable: true, setROW: true, // Может обновляться через fieldEDIT
                    formoptions: {rowpos: 1, colpos: 1},
                    editrules: {edithidden: true, required: true}
                },
                {name: \'gender\', index: \'idSportsmen.gender\',
                    width: 40, hidden: true,
                    editable: true,
                    editoptions: {
                        defaultValue: spData.Gender_main
                    },
                    formoptions: {rowpos: 1, colpos: 2},
                    template: selTemplate,
                    clubStatus: \'Gender\', lookupKey: \'alias\'
                },
                //{name:\'num\', width:50, hidden: true, sorttype:\'int\'},
                {name: \'birth\', index: \'idSportsmen.birth\',
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:2, colpos:1},
                    template: dateTemplate,
                    cellattr: cellEmptyColor
                },
                {name: \'doc\', width: 100, hidden:true,
                    editable: true, editrules: {edithidden:true}, setROW: true,
                    formoptions:{rowpos: 2, colpos: 2},
                    cellattr: cellEmptyColor
                },
                {name:\'contract\', width:80,
                    editable: true, editrules: {edithidden:true}, setROW: true,
                    formoptions:{rowpos:3, colpos:1},
                    cellattr: cellEmptyColor
                },
                {name:\'contractdate\',
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:3, colpos:2},
                    template: dateTemplate,
                    cellattr: cellEmptyColor
                },
                {name:\'contact\', width:100,
                    editable: true, editrules: {edithidden:true}, setROW: true,
                    formoptions:{rowpos:4, colpos:1},
                    cellattr: cellEmptyColor,
                    inCard: true
                },
                {name:\'pasp\', hidden:true,
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:4, colpos:2},
                    template: \'booleanCheckboxFa\',
                    inCard: true
                },
                {name:\'email\', hidden: true, template: emailTemplate,
                    editable: true,
                    editrules: {edithidden: true}, //, email: true
                    formoptions: {rowpos: 5, colpos: 1}
                },
                {name:\'tel\', template: telTemplate,
                    editable: true,
                    editrules: {edithidden: true},
                    formoptions:{rowpos: 5, colpos: 2},
                    cellattr: cellEmptyColor
                },
                {name: \'price\',
                    editable: true, editrules: {edithidden: true},
                    formoptions:{rowpos: 7, colpos: 1},
                    template: numberTemplate
                },
                {name: \'discount\', width: 45, align: \'right\',
                    editable: true, editrules: {edithidden:true},
                    formoptions: {rowpos:7, colpos:2},
                    template: selTemplate,
                    //dbvalues: dbValues.Discount,
                    clubStatus: \'Discount\', lookupKey: \'name\',
                    dbvalues0: \'\'
                },      
        
                {name:\'saldo\',
                    template: numberTemplate,
                    cellattr: function(rowId, cellValue, rawObject, cm, rdata){
                        return arr2clstring( saldoCls(rawObject) );
                    }
                },
                // duedate
                {name: \'meddate\',
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos: 9, colpos: 1},
                    template: dateTemplate,
                    cellattr: cellInsuranceColor
                },
                {name: \'insdate\',
                    editable: true, editrules: {edithidden: true},
                    formoptions:{rowpos: 9, colpos: 2},
                    template: dateTemplate,
                    cellattr: cellInsuranceColor
                },
                {name: \'razr\', width: 50,
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:10, colpos:1},
                    template: selTemplate,
                    clubStatus: \'idSportsmenGrade\', lookupKey: \'name\',
                    dbvalues0: \'\'
                },
        
                {name:\'level_name\', index:\'idSquad.lvl\', width: 55,
                    template: lookTemplate,
                    dbvalues: \'idLevel\'
                },
                {name:\'squad_name\', index:\'idSquad.name\', width: 55},
                {name:\'trainer_name\', index: \'idTrainer.name\', width: 100},
                {name:\'club_name\', index:\'idSquad.club\', width: 85,
                    template: lookTemplate,
                    dbvalues: \'idClub\'
                },
                {name:\'sport_name\', index:\'idSquad.sport\', width: 100,
                    template: lookTemplate,
                    dbvalues: \'idSport\'
                },
                {name: \'squad\', hidden: true, hidedlg: true,
                    searchrules: { integer: true },
                    editable: true, editrules: {edithidden:true}, //, required:true, integer:true
                    formoptions:{rowpos:11, colpos:1},
                    edittype: \'custom\',
                    editoptions:{
                        custom_element: function(value, edopt) {
                            var el = $(\'<select><option>...</option></select>\');
                            SCRM._run(\'/chunk/squadlist\', function(html) {
                                el.html(html).val(value||0);
                            });
                            return el;
                        }
                    }
                },
                {name:\'trainer\', editable: true,
                    hidden:true, hidedlg: true, editrules: {edithidden: true},
                    formoptions: {rowpos: 11, colpos: 2},
                    template: selTemplate,
                    dbvalues: \'idTrainer\', dbvalues0: 0
                },
                {name: \'info\', hidden: true,
                    template: infoTemplate,
                    editable: true, editrules: {edithidden:true}, setROW: true,
                    formoptions: {rowpos:12, colpos:1},
                    inCard: true
                },
                {name: \'height\', width:50, hidden: true,
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:13, colpos:1},
                    inCard: true
                },
                {name:\'weight\', width:50, hidden: true,
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:13, colpos:2},
                    inCard: true
                },
                {name:\'username\',
                    width:30, editable: false,
                    search: false,
                    align: \'center\',
                    formatter: hasUser
                },
                {name:\'key\', hidden: true, editable: false}
            );

            
            if (gridOpts.showDuedate) {
                gridOpts.colModel.splice(16, 0, {
                    name:\'duedate\', width: 110, hidden: false,
                    align: \'right\',
                    searchoptions: {
                        sopt: [\'eq\']
                    },
                    formatter: function(cv, options, row){
                        var str = [];
                        //row.debt_lesson = row.lesson_amount*1 - row.cnt_lesson*1;
                        if (row.duedate) {
                            //if (row.debt_lesson != 0) 
                            if (row.cnt_lesson > 0) str.push(row.cnt_lesson);
                            str.push( str2date(row.duedate,\'d\') );
                            // if (diff > -90 || row.name_typeinvoice || residue===0) // Если < 3 мес или idInvoice
                        }
                        return str.join(\' ~ \'); // если пустое, будет пустая строка
                    },
                    cellattr: function(rowId, cellValue, data, cm, row){
                        if (data.duedate) {
                            return arr2clstring([\'text-success\']);
                        }
                        /*var cellCls = []; //, diff = diffNow(row.duedate);
                        if (data.duedate && (data.debt_lesson > 0 || data.lesson_amount == 0)) {
                            cellCls.push(\'text-success\');
                        } else {
                            cellCls.push(\'text-muted\');
                        }
                        return arr2clstring(cellCls);*/
                    }
                });
            }
            
            
            if (gridOpts.ipcFields) {
                function cellSaldoColor2(rowId, cellValue, rawObject, cm, rdata){
                    return rawObject.tmp_cls;
                }
                var ipcFields = {
                    invoiced: {
                        label: \'Начислено\',
                        width: 90,
                        template: numberTemplate,
                        formatter: function(cv, options, row) {
                            if (options.rowId == \'\') return (row.invoiced)? row.invoiced : \'\'; // if footer
                            return numberFormatter(cv);
                        },
                        cellattr: cellSaldoColor2,
                        inCard: true
                    },
                    add_cnt: {
                        label: \'Количество\',
                        template: numberTemplate,
                        cellattr: cellSaldoColor2,
                        inCard: true
                    },
                    payed: {
                        label: \'Оплачено\',
                        width: 90,
                        template: numberTemplate,
                        cellattr: cellSaldoColor2,
                        inCard: true
                    },
                    add_info: {
                        template: infoTemplate,
                        inCard: true
                    }
                };
                $.each(gridOpts.ipcFields.split(\',\'), function(i, v){
                    var fld = ipcFields[v];
                    if (fld) {
                        fld.name = v;
                        gridOpts.colModel.push(fld);
                    }
                });
                $.extend(gridOpts, {
                    footerrow: true,
                    userDataOnFooter: true,
                    multiselect: false
                });
                spGrid.one(\'jqGridAfterInit\', function(e){
                    var hideCols = \'doc,orderdate,meddate,insdate,pasp,razr,contact,tel\'.split(\',\');
                    $(this)
                    .jqGrid(\'hideCol\', hideCols)
                    .jqGridExport();
                });
            }
        
            grids.main = spGrid
            .one(\'jqGridBeforeInit\', function(e, grOpts) {
                var editedRows,
                gr = $(this)
                .one(\'jqGridAfterInit\', function(e, grOpts){
                    $.each(gr.jqGrid(\'getGridParam\', \'colModel\'), function(i, v) {
                        if (!v.label) {
                            var nlabel = SCRM.lexicon.idSportsmen[v.name];
                            if (nlabel && nlabel != v.name) { // Есть в справочнике
                                gr.jqGrid(\'setLabel\', v.name, nlabel);
                                v.label = nlabel;
                            }
                        }
                    });
                    grOpts.reloadAlert.link(true, spData);
                    spData.pnlSp.link(true, spData);
                    
                    gr
                    .jqGridColumns()
                    .data(\'init-filters\', gr.jqGrid(\'getGridParam\', \'postData\').filters);
                })
                .on(\'jqGridAddEditBeforeInitData\', function (e, form, ddd) { // Редактируется строка
                    var id = gr.jqGrid(\'getGridParam\', \'selrow\');
                    console.log(\'jqGridAddEditBeforeInitData\',  e, form, ddd, id, editedRows);
                    if (id in editedRows) {
                        SCRM.alert(\'Данные в строке неактуальны. Обновите таблицу\');
                        return false;
                    }
                })
                .on(\'jqGridBeforeRequest.spGrid\', function(e) {
                    var sstatus = gr.data(\'start_status\');
                    if (sstatus) {
                        var col = gr.jqGrid(\'getColProp\', \'status\');
                        col.searchoptions.defaultValue = (sstatus==\'*\')? \'\' : sstatus;
                        gr.data(\'start_status\', null);
                    }
                })
                .on(\'jqGridSerializeGridData.spGrid\', function(e, postData) {
                    if (gridOpts.showDuedate) postData._stype = spData.idSchedule_main;
                    if (postData.clubStatus) postData.clubStatus.push(\'idSchedule\');
                })
                .on(\'jqGridBeforeSetLookup\', function(e, params){
                    if (params.f.name == \'status\') {
                        params.rows.unshift(narc);
                    }
                })
                .on(\'jqGridAfterLoadComplete.spGrid\', function(e, data) {
                    editedRows = {};
                    if (data.sp_arc) SCRM.app.sp_arc = data.sp_arc.split(\',\');
                    if (data.dbvalues && data.dbvalues.idTrainer) {
                        SCRM.dbValues.idTrainer = data.dbvalues.idTrainer;
                    }
                    SCRM.link(spData, {needReload: false});
                })
                .on(\'needReload.spGrid\', function(e, data) {
                    SCRM.link(spData, {needReload: true});
                });
                
                // При изменении данных в eCard
                $(document)
                .on(\'eCardSpEdit\', function(e, data){
                    var id = \'\'+data.id,
                        ids = gr.jqGrid(\'getDataIDs\');
                    if (in_array(id, ids)) {
                        editedRows[id] = true;
                        SCRM.link(spData, {needReload: true});
                    }
                });
                
                // TODO: Выпилить, чтобы было однообразно
                $(document)
                .on(\'OnRefreshSpData\', function(e, data) {
                    // Если при обновлении карточки меняется
                    var id = (data.sp||{}).id,
                        ids = gr.jqGrid(\'getDataIDs\');
                    if (in_array(id, ids)) SCRM.link(spData, {needReload: true});
                });
            })
            .jqGridInit(gridOpts)
            .on(\'jqGridAddEditInitializeForm\', function(e, form, oper) {
                var tr = $(\'tr#tr_info\', form);
                $(\'td:eq(1)\', tr).attr(\'colspan\', 3); 
                $(\'td:gt(1)\', tr).remove();
                
                var gen = $(\'#gender\', form).css(\'width\', \'auto\');
                $(\'select.customelement\', form).addClass( gen.attr(\'class\') );
            })
            .on(\'jqGridSelectRow jqGridSelectAll\', function(e, rid, sel) {
                var grid = $(this);
                //console.log(e, rid, sel)
                var selRows = getGridSelRows(grid);
                var nsd = {
                    //loading: 1,
                    spVisible: false,
                    selRows: selRows,
                    selRowsCnt: selRows.length // spCount
                };
        
                if (selRows.length == 1) {
                    nsd.spVisible = true;
                    nsd.spID = selRows[0];
                    nsd.sp = grid.jqGrid(\'getRowData\', nsd.spID);
        
                    var tr = grid.jqGrid(\'getGridRowById\', nsd.spID);
                    var mainCols = grid.jqGrid(\'getGridParam\', \'colModel\');
                    
                    nsd.cardHolder = spData.pnlSp;
                    //nsd.cardModal = true;
                    SCRM._runLoader(\'spCard\')(nsd); // spVisible = true
                    //clubSpCard.loadData(); 
                }
                SCRM.link(spData, nsd);
            })
            .on(\'jqGridDeleteBeforeShowForm\', function (e, form) {
                $(\'.delmsg\', form).html(\'Удаляются спортсмены только в статусе <b>\'+ 
                    SCRM.app.sp_arc.join(\', \') +\'</b>.<br>Продолжить?\');
            })
            .on(\'jqGridDeleteAfterComplete\', function(e, rowid, jqXhrOrBool, postData, options) {
                $(this).trigger(\'clearSelection\');
            });
        });
    } else {
        if (initOpts && spGrid.hasClass(\'ui-jqgrid-btable\')) {
            spGrid.jqGrid(\'setGridParam\', initOpts);
        }
        spGrid.trigger(\'reloadGrid\');
    }
});
</script>

',
  ),
  'sourceCache' => 
  array (
    'modChunk' => 
    array (
      'dbInner' => 
      array (
        'fields' => 
        array (
          'id' => 19,
          'source' => 0,
          'property_preprocess' => false,
          'name' => 'dbInner',
          'description' => 'Chunk',
          'editor_type' => 0,
          'category' => 1,
          'cache_type' => 0,
          'snippet' => '<div class="mb-2 d-none" id="actionsMain">
    <button class="btn btn-success btn-sm" data-link="{on ~newSportsmen}"><i class="fa fa-user-plus"></i></button>
    <div class="dropdown mx-1"[[- data-link="css-display{if !spCount tmpl=\'none\'}"]]>
        <button data-toggle="dropdown" class="btn btn-primary btn-sm d-flex flex-nowrap align-items-center" 
            disabled="disabled" data-link="disabled{:!selRowsCnt}">
            Действия
            <small data-link="text{:selRowsCnt} css-display{if !selRowsCnt tmpl=\'none\'}" class="badge badge-pill badge-warning ml-1"></small>
        </button>
        <div class="dropdown-menu">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item prevent-default" data-pholder="Номер приказа/справки/заявление от родителей"
                data-link="{on \'click\' ~changeField \'status\'}">Сменить Статус</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' ~changeSquad}">Группа, Уровень</a>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' ~changeField \'trainer\'}">Сменить тренера</a>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' ~changeField \'razr\'}">Присвоить разряд</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' ~changeField \'price\'}">Сменить тариф</a>
            <button class="dropdown-item btn-addinvoice" data-link="{on ~addInvoices}">Начисление</button>
            <a href="#" class="dropdown-item"
                data-extaction="/database/insure-manager.html" data-grid="main">Застраховать</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~Run \'/chunk/gotoevent\'}">Мероприятие</a>
        </div>
    </div>
    <button class="btn btn-outline-primary btn-sm mr-1 d-none"
        data-link="class{merge:(!~S^f||!selRowsCnt) toggle=\'d-none\'} {on ~sendMessage}">
        <i class="fa fa-envelope"></i>
    </button>
    <div class="dropdown d-none" data-link="class{merge:!selRowsCnt toggle=\'d-none\'}">
        <button data-toggle="dropdown" class="btn btn-outline-primary btn-sm"><i class="fa fa-print"></i></button>
        <div class="dropdown-menu">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item" data-link="{on ~exportQRcard}"
                data-handler="idSportsmen_qrcard" data-tmpl="sportsmen_qrcard.docx">QR карточки</a>
            <a href="#" class="dropdown-item" data-link="{on ~exportQRcard}"
                data-handler="idSportsmen_qrtable" data-tmpl="">QR наклейки</a>
            <div data-link="visible{:selRowsCnt==1}">
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item prevent-default"
                    data-link="{on ~exportContract}">Скачать договор</a>
            </div>
        </div>
    </div>
    <div class="dropdown mx-1">
        <button data-toggle="dropdown" class="btn btn-secondary btn-sm">
            <i class="fa fa-filter"></i><span class="d-none d-sm-inline"> Фильтр</span></button>
        <div class="dropdown-menu">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' spFilter \'saldo:debts\'}">Должники</a></li>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' spFilter \'duedate:0\'}">Без абонемента</a></li>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~Run \'/chunk/sp.birth\'}">Именинники</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' spFilter \'\'}">Сбросить фильтр</a>
        </div>
    </div>
    <div class="dropdown" data-link="visible{:gridOpts.showDuedate}">
        <button data-toggle="dropdown" class="btn btn-secondary btn-sm">
            <i class="fa fa-battery-3"></i><span class="d-none d-lg-inline"> Абонементы</span>
        </button>
        <div class="dropdown-menu" data-link="{radiogroup idSchedule_main} {for ~S.clubStatus^idSchedule tmpl=\'#tpl_SchInv\'}">
        </div>
    </div>

    <div class="dropdown mx-1">
        <button data-toggle="dropdown" class="btn btn-secondary btn-sm">
            <i class="fa fa-clipboard"></i><span class="d-none d-sm-inline"> Буфер</span></button>
        <div class="dropdown-menu">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~clipAdd}">
                <i class="fa fa-user-plus dropdown-icon"></i> Добавить</a>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~clipRemove}">
                <i class="fa fa-user-times dropdown-icon"></i> Удалить</a>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~clipShow}">
                <i class="fa fa-users dropdown-icon"></i> Показать</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~clipClear}">Очистить</a>
        </div>
    </div>
    [[-<div class="dropdown">
        <button data-toggle="dropdown" class="btn btn-secondary btn-sm"><i class="fa fa-gear"></i></button>
        <div class="dropdown-menu" id="grmain_Cols">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item" data-ch="1" data-fields="birth,doc">Личное</a>
            <a href="#" class="dropdown-item" data-ch="1" data-fields="contract,contractdate">Договор</a>
            <a href="#" class="dropdown-item" data-ch="1" data-fields="contact,tel,email,pasp">Контакты</a>
            <a href="#" class="dropdown-item" data-ch="1" data-fields="price,saldo,discount">Финансы</a>
            <a href="#" class="dropdown-item" data-fields="residue">Абонементы</a>
            <a href="#" class="dropdown-item" data-ch="1" data-fields="meddate,insdate">Справки, страховки</a>
            <a href="#" class="dropdown-item" data-ch="1" data-fields="razr,squad_name,trainer_name,level_name,sport_name,club_name">Группа, разряды</a>
        </div>
    </div>]]
</div>

<table id="grmain" data-entity="idSportsmen"></table>

<style>
    #TblGrid_grmain.EditTable {
        border-spacing: 2px 6px;
        border-collapse: initial;
    }
    .ui-jqdialog-content .CaptionTD {
        vertical-align: top;
        text-align: right;
    }
</style>

<script id="tpl_SchInv" type="text/x-jsrender">
    {{if #index==0}}<div class="dropdown-arrow"></div>{{/if}}
    <label class="custom-control custom-radio">
        <input type="radio" class="custom-control-input" name="SchInv" value="{{:alias}}">
        <span class="custom-control-label">{{:name}}</span>
    </label>
</script>

<script id="tpl_sp_search" type="text/x-jsrender">
<p class="text-muted">Введите ФИО, мы поищем в базе, чтобы не создавать дубликаты</p>
{{include ~placeholder="ФИО" tmpl="#tpl_searchinput"/}}

<div class="list-group list-group-flush list-group-bordered mt-2" data-link="visible{:idSportsmens}">
    {^{for idSportsmens ~cls="fa-pencil" tmpl=\'#tpl_rowSportsmen\' /}}
    <a href="#" class="list-group-item list-group-item-action list-group-item-success" data-link="{on ~chSportsmen}">
        <div class="list-group-item-body">Создать <b data-link="srch_txt"></b></div>
        <div class="list-group-item-figure">
            <i class="fa fa-plus"></i>
        </div>
    </a>
</div>
</script>

[[$tplSearch]]

<script>
window.dbValues = SCRM.dbValues || {};

$.extend(true, SCRM.lexicon, {
    idSportsmen:{
        status:\'Статус\',
        name:\'Ф.И.О.\',
        gender:\'Пол\',
        birth:\'Дата рождения\',
        doc:\'N Свидетельства\',
        contract:\'N Договора\',
        contractdate:\'Дата договора\',
        contact:\'Контакт\',
        pasp:\'Паспорт\',
        email:\'Email\',
        tel:\'Телефон\',
        price:\'Стоимость\',
        discount:\'Скидка\',
        saldo:\'Баланс\',
        duedate:\'Абонемент\',
        meddate:\'Срок мед. справки\',
        insdate:\'Срок страховки\',
        razr:\'Разряд\',
        club_name:\'Зал\',
        sport_name:\'Дисциплина\',
        level_name:\'Уровень\',
        squad:\'Зал, Группа\',
        squad_name:\'Группа\',
        trainer:\'Тренер\',
        trainer_name:\'Тренер\',
        info:\'Заметки\',
        height:\'Рост\',
        weight:\'Вес\',
        username: \'Кабинет\'
    }
});

function get_clipSportsmen() {
    return getObjectFromLocalStorage(\'club_clip_sportsmen\') || [ ];
}

/* ============ sportsmenGrid =============== */


$(document)
.on(\'sportsmenGrid\', \'table\', function(e, initOpts) { //, \'[data-entity="idSportsmen"]\'
    var spGrid = $(e.target),
        spData = spGrid.data(\'spData\');

    if (!spData) {
        
        spData = $.extend({
            url: window.location.origin,
            grid: spGrid,
            wrapper: $(\'<div class="spgrid-wrapper"></div>\').insertBefore(spGrid)
                [[+actions:notempty=`.append( $(\'#actionsMain\').clone().toggleClass(\'d-flex d-none\') )`]]
                .append(spGrid),
            pnlSp: $(\'<div class="mt-2" data-link="visible{:spVisible}"></div>\').insertAfter(spGrid), //.next(\'#panelSportsmen\'),
            needReload: false,
            spFilter: function(filter, e) {
                if (!filter) {
                    spGrid.jqGrid(\'setGridParam\', {
                        postData: {
                            filters: spGrid.data(\'init-filters\')
                        }
                    }).setGridFilter([]);
                } else {
                    var filters = $.map(filter.split(\';\'),
                    function(fltrow, i) {
                        var fltr = fltrow.split(\':\');
                        if (fltr[1]==\'debts\') {
                            return {fld: fltr[0], value: 0, oper: \'lt\'};
                        }
                        return {fld: fltr[0], value: decodeURI(fltr[1]), oper: fltr[2]};
                    });
                    spGrid.setGridFilter(filters);
                }
            },
            reloadGrid: function(e) {
                spGrid.trigger(\'reloadGrid\', [{current:true}]);
            },
            reloadGridData: function(e) {
                spGrid
                .trigger(\'clearSelection\')
                .trigger(\'reloadGrid\');
            }
        }, [[!clubConfig?name=`idSchedule_main,Gender_main`]]);

        spGrid
        .data(\'spData\', spData)
        .on(\'hide.spGrid\', function(e) {
            spData.wrapper.hide();
        })
        .on(\'show.spGrid\', function(e) {
            clubScroll( spData.wrapper.show() );
        });
        
        spData.gridOpts = $.extend(true, {
            postData: {},
            gridEntity: \'idSportsmen\',
            colModel: [],
            fltrToolbar: true,
            rownumbers: true,
            search: true,
            multiSort: true,
            sortname: \'name\', sortorder: \'asc\',
            autowidth: true,
            rowattr: function(data) {
                if ($.inArray(data.status, SCRM.app.sp_arc) != -1) {
                    return {\'class\': \'rowArc\'};
                }
            },
            searching: {
    			//showQuery: true,
    			loadFilterDefaults: true,
    			multipleSearch: true,
    			//multipleGroup: true,
    			closeOnEscape: true,
    			searchOperators: true,
    			searchOnEnter: true
    		},
            formEditing: {
                width: 700,
                labelswidth: 50
            },
            reloadAlert: true,
            showDuedate: false,
            navOpts: {add:false, edit:true, del:false}
        }, initOpts);
        
        SCRM.loadWSS(\'grid\', function() {
            $.link(true, spData.wrapper, spData, {
                newSportsmen: function(){
                    var srchData = {
                        body: \'#tpl_sp_search\',
                        title: \'Новый спортсмен\'
                    };
                    club_Modal(srchData, { // handlers
                        srchSubmit: function(e, data) {
                            e.preventDefault();
                            SCRM.link(srchData, {idSportsmens: null}); //hide results
                            if (!srchData.srchTxt||srchData.srchTxt.length<2) return;
                            pDATA(\'idSportsmen\', {
                                rows: 100,
                                filters: SCRM.obj2Filter({name: {data: srchData.srchTxt, op: \'bw\'}})
                            }, function(data){
                                SCRM.link(srchData, {idSportsmens: data.rows});
                            });
                        },
                        chSportsmen: function(e, data){
                            e.preventDefault();
                            var d = data.linkCtx.data;
                            if (d.id){
                                spGrid
                                .one(\'jqGridSerializeGridData\', function(e, pd) {
                                    var gr = $(e.target);
                                    //var oldPostData = $.extend({}, pd);
                                    gr.one(\'jqGridAfterLoadComplete\', function(e, data){
                                        gr
                                        .jqGrid(\'setSelection\', d.id)
                                        .jqGrid(\'editGridRow\', d.id);
                                        SCRM.link(spData, {needReload: true});
                                        //.jqGrid(\'setGridParam\', {postData: oldPostData})
                                    });
                                    return { _where: {id: d.id} };
                                })
                                //.jqGrid(\'showCol\', \'id\')
                                .trigger(\'reloadGrid\');
                            } else {
                                spGrid
                                .one(\'jqGridAddEditInitializeForm\', function(e, form) {
                                    $(\'#name\', form).val( srchData.srchTxt );
                                })
                                .jqGrid(\'editGridRow\', \'new\');
                            }
                            srchData.mdl_hide();
                        }
                    });
                }, // end newSportsmen
                changeField: function(chfield, e){
                    SCRM._run.call(e, \'/chunk/sp.changefield\', {
                        chfield: chfield,
                        postData: {
                            id: spData.selRows.join(\',\')
                        },
                        callback: spData.clearReload
                    });
                },
                addInvoices: function(e){
                    SCRM._run(\'/chunk/newinvoice\', {
                        modal: {
                            title: \'Массовые начисления\',
                            ok: \'Начислить\'
                        },
                        post: {
                            addmulti: \'sportsmen\',
                            sportsmen: spData.selRows.join(\',\')
                        }
                    });
                },
                changeSquad: function(e, data) {
                    SCRM._run(\'/chunk/squadlist\', {
                        post: {
                            ismain: \'1\',
                            sportsmen: spData.selRows.join(\',\')
                        },
                        callback: spData.clearReload
                    });
                    /*squadAdd({
                        ismain: \'1\',
                        sportsmen: spData.selRows.join(\',\')
                    }, function(data) {
                        spData.reloadGrid();
                        // TODO: Удалить, потому что окно будет закрыто ?
                        SCRM._runLoader(\'spCard\')();
                        //clubSpCard.loadData();
                    });*/
                },
                exportQRcard: function(e, data) {
                    e.preventDefault();
                    var lnk = $(e.target);
                    var data = $.extend({ // Чтобы не изменить Post
                        doc_type: \'docx\',
                        _export: lnk.data(\'handler\'),
                        tmpl: lnk.data(\'tmpl\'),
                    }, spGrid.jqGrid(\'getGridParam\', \'postData\'), {
                        _where: \'id=\' + spData.selRows.join(\',\'),
                        filters: \'\',
                        rows: 1001 // Безлимитно
                    });
                    clubPostForm(spGrid.jqGrid(\'getGridParam\', \'url\'), data);
                },
                exportContract: function(e, data){
                    clubPostForm(\'/data/sportsmen\', {
                        key: spData.sp.key,
                        mode: \'export\'
                    });
                },
                sendMessage: function(e, data){
                    pDATA(\'idSportsmen\', {
                        _where: {id: spData.selRows.join(\',\')},
                        rows: 1001
                    }, function(data){
                        SCRM._service.sendMessage(data.rows);
                    });
                },
                clipAdd: function(e) {
                    getGridSelRows(spGrid, function(selIDs){
                        var clipSportsmen = get_clipSportsmen();
                        $.each(selIDs, function(i, v){
                            var itemIndex = $.inArray(v, clipSportsmen);
                            if (itemIndex == -1) clipSportsmen.push(v);
                        });
                        saveObjectInLocalStorage(\'club_clip_sportsmen\', clipSportsmen);
                    });
                },
                clipRemove: function(e){
                    getGridSelRows(spGrid, function(selIDs){
                        var clipSportsmen = get_clipSportsmen();
                        $.each(selIDs, function(i, v){
                            var itemIndex = $.inArray(v, clipSportsmen);
                            if (itemIndex > -1) clipSportsmen.splice(itemIndex, 1);
                        });
                        saveObjectInLocalStorage(\'club_clip_sportsmen\', clipSportsmen);
                    });
                },
                clipClear: function(e){
                    removeObjectFromLocalStorage(\'club_clip_sportsmen\');
                    SCRM.msg("Буфер обмена пуст!", "Успешно");
                },
                clipShow: function(e) {
                    spGrid.setGridFilter(\'id\', get_clipSportsmen().join(\',\'));
                }
            });
    
            $.observe(spData, \'idSchedule_main\', function(e, data){
                spGrid.trigger(\'reloadGrid\');
            });
        
            function saldoCls(row) {
                var cellCls = [\'saldoCell\'];
                if (row.saldo*1 > 0) cellCls.push(\'text-success\'); else {
                    if (row.saldo*1 < 0) cellCls.push(\'text-danger\',\'font-weight-bold\');
                    if (row.price && row.price*1 != 0  && row.saldo*1 < 0-row.price*1) cellCls.push(\'rowWarn\');
                }
                return cellCls;
            }
            
            [[-function residueCls(row){
                var cellCls = [\'residueCell\'], diff = diffNow(row.duedate);
                if (diff < 0 && (row.residue > 0 || row.invtype_amount == 0)) {
                    cellCls.push(\'text-success\');
                } else {
                    cellCls.push(\'text-muted\');
                }
                return cellCls;
            }]]
            
            var narc = {id: \'narc\', name: \'[Не в архиве]\'};
            var gridOpts = spData.gridOpts;
            gridOpts.colModel.push(
                {name: \'id\', template: idFieldTemplate},
                {name: \'created\', template: createdTemplate},
                {name: \'status\', width: 50, align: \'center\',
                    template: lookTemplate,
                    cellattr: function(rowId, cellValue, rawObject, cm, rdata){
                        return arr2clstring( saldoCls(rawObject) );
                    },
                    formatter: function(cv){
                        return SCRM.statusFmt(\'idSportsmen\', cv, \'name\', true);
                    },
                    unformat: function(cellValue, options, cell) {
                        return $(cell).find(\'i\').data(\'status\');
                    },
                    searchoptions: {
                        defaultValue: \'narc\'
                    },
                    clubStatus: \'idSportsmen\', lookupKey: \'name\'
                },
                {name: \'name\', //index: \'idSportsmen.name\',
                    width: 200, editable: true, setROW: true, // Может обновляться через fieldEDIT
                    formoptions: {rowpos: 1, colpos: 1},
                    editrules: {edithidden: true, required: true}
                },
                {name: \'gender\', index: \'idSportsmen.gender\',
                    width: 40, hidden: true,
                    editable: true,
                    editoptions: {
                        defaultValue: spData.Gender_main
                    },
                    formoptions: {rowpos: 1, colpos: 2},
                    template: selTemplate,
                    clubStatus: \'Gender\', lookupKey: \'alias\'
                },
                //{name:\'num\', width:50, hidden: true, sorttype:\'int\'},
                {name: \'birth\', index: \'idSportsmen.birth\',
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:2, colpos:1},
                    template: dateTemplate,
                    cellattr: cellEmptyColor
                },
                {name: \'doc\', width: 100, hidden:true,
                    editable: true, editrules: {edithidden:true}, setROW: true,
                    formoptions:{rowpos: 2, colpos: 2},
                    cellattr: cellEmptyColor
                },
                {name:\'contract\', width:80,
                    editable: true, editrules: {edithidden:true}, setROW: true,
                    formoptions:{rowpos:3, colpos:1},
                    cellattr: cellEmptyColor
                },
                {name:\'contractdate\',
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:3, colpos:2},
                    template: dateTemplate,
                    cellattr: cellEmptyColor
                },
                {name:\'contact\', width:100,
                    editable: true, editrules: {edithidden:true}, setROW: true,
                    formoptions:{rowpos:4, colpos:1},
                    cellattr: cellEmptyColor,
                    inCard: true
                },
                {name:\'pasp\', hidden:true,
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:4, colpos:2},
                    template: \'booleanCheckboxFa\',
                    inCard: true
                },
                {name:\'email\', hidden: true, template: emailTemplate,
                    editable: true,
                    editrules: {edithidden: true}, //, email: true
                    formoptions: {rowpos: 5, colpos: 1}
                },
                {name:\'tel\', template: telTemplate,
                    editable: true,
                    editrules: {edithidden: true},
                    formoptions:{rowpos: 5, colpos: 2},
                    cellattr: cellEmptyColor
                },
                {name: \'price\',
                    editable: true, editrules: {edithidden: true},
                    formoptions:{rowpos: 7, colpos: 1},
                    template: numberTemplate
                },
                {name: \'discount\', width: 45, align: \'right\',
                    editable: true, editrules: {edithidden:true},
                    formoptions: {rowpos:7, colpos:2},
                    template: selTemplate,
                    //dbvalues: dbValues.Discount,
                    clubStatus: \'Discount\', lookupKey: \'name\',
                    dbvalues0: \'\'
                },      
        
                {name:\'saldo\',
                    template: numberTemplate,
                    cellattr: function(rowId, cellValue, rawObject, cm, rdata){
                        return arr2clstring( saldoCls(rawObject) );
                    }
                },
                // duedate
                {name: \'meddate\',
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos: 9, colpos: 1},
                    template: dateTemplate,
                    cellattr: cellInsuranceColor
                },
                {name: \'insdate\',
                    editable: true, editrules: {edithidden: true},
                    formoptions:{rowpos: 9, colpos: 2},
                    template: dateTemplate,
                    cellattr: cellInsuranceColor
                },
                {name: \'razr\', width: 50,
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:10, colpos:1},
                    template: selTemplate,
                    clubStatus: \'idSportsmenGrade\', lookupKey: \'name\',
                    dbvalues0: \'\'
                },
        
                {name:\'level_name\', index:\'idSquad.lvl\', width: 55,
                    template: lookTemplate,
                    dbvalues: \'idLevel\'
                },
                {name:\'squad_name\', index:\'idSquad.name\', width: 55},
                {name:\'trainer_name\', index: \'idTrainer.name\', width: 100},
                {name:\'club_name\', index:\'idSquad.club\', width: 85,
                    template: lookTemplate,
                    dbvalues: \'idClub\'
                },
                {name:\'sport_name\', index:\'idSquad.sport\', width: 100,
                    template: lookTemplate,
                    dbvalues: \'idSport\'
                },
                {name: \'squad\', hidden: true, hidedlg: true,
                    searchrules: { integer: true },
                    editable: true, editrules: {edithidden:true}, //, required:true, integer:true
                    formoptions:{rowpos:11, colpos:1},
                    edittype: \'custom\',
                    editoptions:{
                        custom_element: function(value, edopt) {
                            var el = $(\'<select><option>...</option></select>\');
                            SCRM._run(\'/chunk/squadlist\', function(html) {
                                el.html(html).val(value||0);
                            });
                            return el;
                        }
                    }
                },
                {name:\'trainer\', editable: true,
                    hidden:true, hidedlg: true, editrules: {edithidden: true},
                    formoptions: {rowpos: 11, colpos: 2},
                    template: selTemplate,
                    dbvalues: \'idTrainer\', dbvalues0: 0
                },
                {name: \'info\', hidden: true,
                    template: infoTemplate,
                    editable: true, editrules: {edithidden:true}, setROW: true,
                    formoptions: {rowpos:12, colpos:1},
                    inCard: true
                },
                {name: \'height\', width:50, hidden: true,
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:13, colpos:1},
                    inCard: true
                },
                {name:\'weight\', width:50, hidden: true,
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:13, colpos:2},
                    inCard: true
                },
                {name:\'username\',
                    width:30, editable: false,
                    search: false,
                    align: \'center\',
                    formatter: hasUser
                },
                {name:\'key\', hidden: true, editable: false}
            );

            
            if (gridOpts.showDuedate) {
                gridOpts.colModel.splice(16, 0, {
                    name:\'duedate\', width: 110, hidden: false,
                    align: \'right\',
                    searchoptions: {
                        sopt: [\'eq\']
                    },
                    formatter: function(cv, options, row){
                        var str = [];
                        //row.debt_lesson = row.lesson_amount*1 - row.cnt_lesson*1;
                        if (row.duedate) {
                            //if (row.debt_lesson != 0) 
                            if (row.cnt_lesson > 0) str.push(row.cnt_lesson);
                            str.push( str2date(row.duedate,\'d\') );
                            // if (diff > -90 || row.name_typeinvoice || residue===0) // Если < 3 мес или idInvoice
                        }
                        return str.join(\' ~ \'); // если пустое, будет пустая строка
                    },
                    cellattr: function(rowId, cellValue, data, cm, row){
                        if (data.duedate) {
                            return arr2clstring([\'text-success\']);
                        }
                        /*var cellCls = []; //, diff = diffNow(row.duedate);
                        if (data.duedate && (data.debt_lesson > 0 || data.lesson_amount == 0)) {
                            cellCls.push(\'text-success\');
                        } else {
                            cellCls.push(\'text-muted\');
                        }
                        return arr2clstring(cellCls);*/
                    }
                });
            }
            
            
            if (gridOpts.ipcFields) {
                function cellSaldoColor2(rowId, cellValue, rawObject, cm, rdata){
                    return rawObject.tmp_cls;
                }
                var ipcFields = {
                    invoiced: {
                        label: \'Начислено\',
                        width: 90,
                        template: numberTemplate,
                        formatter: function(cv, options, row) {
                            if (options.rowId == \'\') return (row.invoiced)? row.invoiced : \'\'; // if footer
                            return numberFormatter(cv);
                        },
                        cellattr: cellSaldoColor2,
                        inCard: true
                    },
                    add_cnt: {
                        label: \'Количество\',
                        template: numberTemplate,
                        cellattr: cellSaldoColor2,
                        inCard: true
                    },
                    payed: {
                        label: \'Оплачено\',
                        width: 90,
                        template: numberTemplate,
                        cellattr: cellSaldoColor2,
                        inCard: true
                    },
                    add_info: {
                        template: infoTemplate,
                        inCard: true
                    }
                };
                $.each(gridOpts.ipcFields.split(\',\'), function(i, v){
                    var fld = ipcFields[v];
                    if (fld) {
                        fld.name = v;
                        gridOpts.colModel.push(fld);
                    }
                });
                $.extend(gridOpts, {
                    footerrow: true,
                    userDataOnFooter: true,
                    multiselect: false
                });
                spGrid.one(\'jqGridAfterInit\', function(e){
                    var hideCols = \'doc,orderdate,meddate,insdate,pasp,razr,contact,tel\'.split(\',\');
                    $(this)
                    .jqGrid(\'hideCol\', hideCols)
                    .jqGridExport();
                });
            }
        
            grids.main = spGrid
            .one(\'jqGridBeforeInit\', function(e, grOpts) {
                var editedRows,
                gr = $(this)
                .one(\'jqGridAfterInit\', function(e, grOpts){
                    $.each(gr.jqGrid(\'getGridParam\', \'colModel\'), function(i, v) {
                        if (!v.label) {
                            var nlabel = SCRM.lexicon.idSportsmen[v.name];
                            if (nlabel && nlabel != v.name) { // Есть в справочнике
                                gr.jqGrid(\'setLabel\', v.name, nlabel);
                                v.label = nlabel;
                            }
                        }
                    });
                    grOpts.reloadAlert.link(true, spData);
                    spData.pnlSp.link(true, spData);
                    
                    gr
                    .jqGridColumns()
                    .data(\'init-filters\', gr.jqGrid(\'getGridParam\', \'postData\').filters);
                })
                .on(\'jqGridAddEditBeforeInitData\', function (e, form, ddd) { // Редактируется строка
                    var id = gr.jqGrid(\'getGridParam\', \'selrow\');
                    console.log(\'jqGridAddEditBeforeInitData\',  e, form, ddd, id, editedRows);
                    if (id in editedRows) {
                        SCRM.alert(\'Данные в строке неактуальны. Обновите таблицу\');
                        return false;
                    }
                })
                .on(\'jqGridBeforeRequest.spGrid\', function(e) {
                    var sstatus = gr.data(\'start_status\');
                    if (sstatus) {
                        var col = gr.jqGrid(\'getColProp\', \'status\');
                        col.searchoptions.defaultValue = (sstatus==\'*\')? \'\' : sstatus;
                        gr.data(\'start_status\', null);
                    }
                })
                .on(\'jqGridSerializeGridData.spGrid\', function(e, postData) {
                    if (gridOpts.showDuedate) postData._stype = spData.idSchedule_main;
                    if (postData.clubStatus) postData.clubStatus.push(\'idSchedule\');
                })
                .on(\'jqGridBeforeSetLookup\', function(e, params){
                    if (params.f.name == \'status\') {
                        params.rows.unshift(narc);
                    }
                })
                .on(\'jqGridAfterLoadComplete.spGrid\', function(e, data) {
                    editedRows = {};
                    if (data.sp_arc) SCRM.app.sp_arc = data.sp_arc.split(\',\');
                    if (data.dbvalues && data.dbvalues.idTrainer) {
                        SCRM.dbValues.idTrainer = data.dbvalues.idTrainer;
                    }
                    SCRM.link(spData, {needReload: false});
                })
                .on(\'needReload.spGrid\', function(e, data) {
                    SCRM.link(spData, {needReload: true});
                });
                
                // При изменении данных в eCard
                $(document)
                .on(\'eCardSpEdit\', function(e, data){
                    var id = \'\'+data.id,
                        ids = gr.jqGrid(\'getDataIDs\');
                    if (in_array(id, ids)) {
                        editedRows[id] = true;
                        SCRM.link(spData, {needReload: true});
                    }
                });
                
                // TODO: Выпилить, чтобы было однообразно
                $(document)
                .on(\'OnRefreshSpData\', function(e, data) {
                    // Если при обновлении карточки меняется
                    var id = (data.sp||{}).id,
                        ids = gr.jqGrid(\'getDataIDs\');
                    if (in_array(id, ids)) SCRM.link(spData, {needReload: true});
                });
            })
            .jqGridInit(gridOpts)
            .on(\'jqGridAddEditInitializeForm\', function(e, form, oper) {
                var tr = $(\'tr#tr_info\', form);
                $(\'td:eq(1)\', tr).attr(\'colspan\', 3); 
                $(\'td:gt(1)\', tr).remove();
                
                var gen = $(\'#gender\', form).css(\'width\', \'auto\');
                $(\'select.customelement\', form).addClass( gen.attr(\'class\') );
            })
            .on(\'jqGridSelectRow jqGridSelectAll\', function(e, rid, sel) {
                var grid = $(this);
                //console.log(e, rid, sel)
                var selRows = getGridSelRows(grid);
                var nsd = {
                    //loading: 1,
                    spVisible: false,
                    selRows: selRows,
                    selRowsCnt: selRows.length // spCount
                };
        
                if (selRows.length == 1) {
                    nsd.spVisible = true;
                    nsd.spID = selRows[0];
                    nsd.sp = grid.jqGrid(\'getRowData\', nsd.spID);
        
                    var tr = grid.jqGrid(\'getGridRowById\', nsd.spID);
                    var mainCols = grid.jqGrid(\'getGridParam\', \'colModel\');
                    [[-nsd.infoTable = $.map(mainCols, function(col, i){
                        if (!col.inCard) return null;
                        var cdata = $.jgrid.getDataFieldOfCell.call(grid[0], tr, i);
                        col.HTML = cdata.html();
                        col.CLS = cdata.attr(\'class\');
                        return col;
                    });]]
                    nsd.cardHolder = spData.pnlSp;
                    //nsd.cardModal = true;
                    SCRM._runLoader(\'spCard\')(nsd); // spVisible = true
                    //clubSpCard.loadData(); 
                }
                SCRM.link(spData, nsd);
            })
            .on(\'jqGridDeleteBeforeShowForm\', function (e, form) {
                $(\'.delmsg\', form).html(\'Удаляются спортсмены только в статусе <b>\'+ 
                    SCRM.app.sp_arc.join(\', \') +\'</b>.<br>Продолжить?\');
            })
            .on(\'jqGridDeleteAfterComplete\', function(e, rowid, jqXhrOrBool, postData, options) {
                $(this).trigger(\'clearSelection\');
            });
        });
    } else {
        if (initOpts && spGrid.hasClass(\'ui-jqgrid-btable\')) {
            spGrid.jqGrid(\'setGridParam\', initOpts);
        }
        spGrid.trigger(\'reloadGrid\');
    }
});
</script>

[[-
colModel:
        {name: \'act\', template: \'actions\', width: 38}
    ,
    actionsNavOptions: {
        editbutton: false
    }
]]',
          'locked' => false,
          'properties' => NULL,
          'static' => false,
          'static_file' => '',
          'content' => '<div class="mb-2 d-none" id="actionsMain">
    <button class="btn btn-success btn-sm" data-link="{on ~newSportsmen}"><i class="fa fa-user-plus"></i></button>
    <div class="dropdown mx-1"[[- data-link="css-display{if !spCount tmpl=\'none\'}"]]>
        <button data-toggle="dropdown" class="btn btn-primary btn-sm d-flex flex-nowrap align-items-center" 
            disabled="disabled" data-link="disabled{:!selRowsCnt}">
            Действия
            <small data-link="text{:selRowsCnt} css-display{if !selRowsCnt tmpl=\'none\'}" class="badge badge-pill badge-warning ml-1"></small>
        </button>
        <div class="dropdown-menu">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item prevent-default" data-pholder="Номер приказа/справки/заявление от родителей"
                data-link="{on \'click\' ~changeField \'status\'}">Сменить Статус</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' ~changeSquad}">Группа, Уровень</a>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' ~changeField \'trainer\'}">Сменить тренера</a>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' ~changeField \'razr\'}">Присвоить разряд</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' ~changeField \'price\'}">Сменить тариф</a>
            <button class="dropdown-item btn-addinvoice" data-link="{on ~addInvoices}">Начисление</button>
            <a href="#" class="dropdown-item"
                data-extaction="/database/insure-manager.html" data-grid="main">Застраховать</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~Run \'/chunk/gotoevent\'}">Мероприятие</a>
        </div>
    </div>
    <button class="btn btn-outline-primary btn-sm mr-1 d-none"
        data-link="class{merge:(!~S^f||!selRowsCnt) toggle=\'d-none\'} {on ~sendMessage}">
        <i class="fa fa-envelope"></i>
    </button>
    <div class="dropdown d-none" data-link="class{merge:!selRowsCnt toggle=\'d-none\'}">
        <button data-toggle="dropdown" class="btn btn-outline-primary btn-sm"><i class="fa fa-print"></i></button>
        <div class="dropdown-menu">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item" data-link="{on ~exportQRcard}"
                data-handler="idSportsmen_qrcard" data-tmpl="sportsmen_qrcard.docx">QR карточки</a>
            <a href="#" class="dropdown-item" data-link="{on ~exportQRcard}"
                data-handler="idSportsmen_qrtable" data-tmpl="">QR наклейки</a>
            <div data-link="visible{:selRowsCnt==1}">
                <div class="dropdown-divider"></div>
                <a href="#" class="dropdown-item prevent-default"
                    data-link="{on ~exportContract}">Скачать договор</a>
            </div>
        </div>
    </div>
    <div class="dropdown mx-1">
        <button data-toggle="dropdown" class="btn btn-secondary btn-sm">
            <i class="fa fa-filter"></i><span class="d-none d-sm-inline"> Фильтр</span></button>
        <div class="dropdown-menu">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' spFilter \'saldo:debts\'}">Должники</a></li>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' spFilter \'duedate:0\'}">Без абонемента</a></li>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~Run \'/chunk/sp.birth\'}">Именинники</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default"
                data-link="{on \'click\' spFilter \'\'}">Сбросить фильтр</a>
        </div>
    </div>
    <div class="dropdown" data-link="visible{:gridOpts.showDuedate}">
        <button data-toggle="dropdown" class="btn btn-secondary btn-sm">
            <i class="fa fa-battery-3"></i><span class="d-none d-lg-inline"> Абонементы</span>
        </button>
        <div class="dropdown-menu" data-link="{radiogroup idSchedule_main} {for ~S.clubStatus^idSchedule tmpl=\'#tpl_SchInv\'}">
        </div>
    </div>

    <div class="dropdown mx-1">
        <button data-toggle="dropdown" class="btn btn-secondary btn-sm">
            <i class="fa fa-clipboard"></i><span class="d-none d-sm-inline"> Буфер</span></button>
        <div class="dropdown-menu">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~clipAdd}">
                <i class="fa fa-user-plus dropdown-icon"></i> Добавить</a>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~clipRemove}">
                <i class="fa fa-user-times dropdown-icon"></i> Удалить</a>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~clipShow}">
                <i class="fa fa-users dropdown-icon"></i> Показать</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~clipClear}">Очистить</a>
        </div>
    </div>
    [[-<div class="dropdown">
        <button data-toggle="dropdown" class="btn btn-secondary btn-sm"><i class="fa fa-gear"></i></button>
        <div class="dropdown-menu" id="grmain_Cols">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item" data-ch="1" data-fields="birth,doc">Личное</a>
            <a href="#" class="dropdown-item" data-ch="1" data-fields="contract,contractdate">Договор</a>
            <a href="#" class="dropdown-item" data-ch="1" data-fields="contact,tel,email,pasp">Контакты</a>
            <a href="#" class="dropdown-item" data-ch="1" data-fields="price,saldo,discount">Финансы</a>
            <a href="#" class="dropdown-item" data-fields="residue">Абонементы</a>
            <a href="#" class="dropdown-item" data-ch="1" data-fields="meddate,insdate">Справки, страховки</a>
            <a href="#" class="dropdown-item" data-ch="1" data-fields="razr,squad_name,trainer_name,level_name,sport_name,club_name">Группа, разряды</a>
        </div>
    </div>]]
</div>

<table id="grmain" data-entity="idSportsmen"></table>

<style>
    #TblGrid_grmain.EditTable {
        border-spacing: 2px 6px;
        border-collapse: initial;
    }
    .ui-jqdialog-content .CaptionTD {
        vertical-align: top;
        text-align: right;
    }
</style>

<script id="tpl_SchInv" type="text/x-jsrender">
    {{if #index==0}}<div class="dropdown-arrow"></div>{{/if}}
    <label class="custom-control custom-radio">
        <input type="radio" class="custom-control-input" name="SchInv" value="{{:alias}}">
        <span class="custom-control-label">{{:name}}</span>
    </label>
</script>

<script id="tpl_sp_search" type="text/x-jsrender">
<p class="text-muted">Введите ФИО, мы поищем в базе, чтобы не создавать дубликаты</p>
{{include ~placeholder="ФИО" tmpl="#tpl_searchinput"/}}

<div class="list-group list-group-flush list-group-bordered mt-2" data-link="visible{:idSportsmens}">
    {^{for idSportsmens ~cls="fa-pencil" tmpl=\'#tpl_rowSportsmen\' /}}
    <a href="#" class="list-group-item list-group-item-action list-group-item-success" data-link="{on ~chSportsmen}">
        <div class="list-group-item-body">Создать <b data-link="srch_txt"></b></div>
        <div class="list-group-item-figure">
            <i class="fa fa-plus"></i>
        </div>
    </a>
</div>
</script>

[[$tplSearch]]

<script>
window.dbValues = SCRM.dbValues || {};

$.extend(true, SCRM.lexicon, {
    idSportsmen:{
        status:\'Статус\',
        name:\'Ф.И.О.\',
        gender:\'Пол\',
        birth:\'Дата рождения\',
        doc:\'N Свидетельства\',
        contract:\'N Договора\',
        contractdate:\'Дата договора\',
        contact:\'Контакт\',
        pasp:\'Паспорт\',
        email:\'Email\',
        tel:\'Телефон\',
        price:\'Стоимость\',
        discount:\'Скидка\',
        saldo:\'Баланс\',
        duedate:\'Абонемент\',
        meddate:\'Срок мед. справки\',
        insdate:\'Срок страховки\',
        razr:\'Разряд\',
        club_name:\'Зал\',
        sport_name:\'Дисциплина\',
        level_name:\'Уровень\',
        squad:\'Зал, Группа\',
        squad_name:\'Группа\',
        trainer:\'Тренер\',
        trainer_name:\'Тренер\',
        info:\'Заметки\',
        height:\'Рост\',
        weight:\'Вес\',
        username: \'Кабинет\'
    }
});

function get_clipSportsmen() {
    return getObjectFromLocalStorage(\'club_clip_sportsmen\') || [ ];
}

/* ============ sportsmenGrid =============== */


$(document)
.on(\'sportsmenGrid\', \'table\', function(e, initOpts) { //, \'[data-entity="idSportsmen"]\'
    var spGrid = $(e.target),
        spData = spGrid.data(\'spData\');

    if (!spData) {
        
        spData = $.extend({
            url: window.location.origin,
            grid: spGrid,
            wrapper: $(\'<div class="spgrid-wrapper"></div>\').insertBefore(spGrid)
                [[+actions:notempty=`.append( $(\'#actionsMain\').clone().toggleClass(\'d-flex d-none\') )`]]
                .append(spGrid),
            pnlSp: $(\'<div class="mt-2" data-link="visible{:spVisible}"></div>\').insertAfter(spGrid), //.next(\'#panelSportsmen\'),
            needReload: false,
            spFilter: function(filter, e) {
                if (!filter) {
                    spGrid.jqGrid(\'setGridParam\', {
                        postData: {
                            filters: spGrid.data(\'init-filters\')
                        }
                    }).setGridFilter([]);
                } else {
                    var filters = $.map(filter.split(\';\'),
                    function(fltrow, i) {
                        var fltr = fltrow.split(\':\');
                        if (fltr[1]==\'debts\') {
                            return {fld: fltr[0], value: 0, oper: \'lt\'};
                        }
                        return {fld: fltr[0], value: decodeURI(fltr[1]), oper: fltr[2]};
                    });
                    spGrid.setGridFilter(filters);
                }
            },
            reloadGrid: function(e) {
                spGrid.trigger(\'reloadGrid\', [{current:true}]);
            },
            reloadGridData: function(e) {
                spGrid
                .trigger(\'clearSelection\')
                .trigger(\'reloadGrid\');
            }
        }, [[!clubConfig?name=`idSchedule_main,Gender_main`]]);

        spGrid
        .data(\'spData\', spData)
        .on(\'hide.spGrid\', function(e) {
            spData.wrapper.hide();
        })
        .on(\'show.spGrid\', function(e) {
            clubScroll( spData.wrapper.show() );
        });
        
        spData.gridOpts = $.extend(true, {
            postData: {},
            gridEntity: \'idSportsmen\',
            colModel: [],
            fltrToolbar: true,
            rownumbers: true,
            search: true,
            multiSort: true,
            sortname: \'name\', sortorder: \'asc\',
            autowidth: true,
            rowattr: function(data) {
                if ($.inArray(data.status, SCRM.app.sp_arc) != -1) {
                    return {\'class\': \'rowArc\'};
                }
            },
            searching: {
    			//showQuery: true,
    			loadFilterDefaults: true,
    			multipleSearch: true,
    			//multipleGroup: true,
    			closeOnEscape: true,
    			searchOperators: true,
    			searchOnEnter: true
    		},
            formEditing: {
                width: 700,
                labelswidth: 50
            },
            reloadAlert: true,
            showDuedate: false,
            navOpts: {add:false, edit:true, del:false}
        }, initOpts);
        
        SCRM.loadWSS(\'grid\', function() {
            $.link(true, spData.wrapper, spData, {
                newSportsmen: function(){
                    var srchData = {
                        body: \'#tpl_sp_search\',
                        title: \'Новый спортсмен\'
                    };
                    club_Modal(srchData, { // handlers
                        srchSubmit: function(e, data) {
                            e.preventDefault();
                            SCRM.link(srchData, {idSportsmens: null}); //hide results
                            if (!srchData.srchTxt||srchData.srchTxt.length<2) return;
                            pDATA(\'idSportsmen\', {
                                rows: 100,
                                filters: SCRM.obj2Filter({name: {data: srchData.srchTxt, op: \'bw\'}})
                            }, function(data){
                                SCRM.link(srchData, {idSportsmens: data.rows});
                            });
                        },
                        chSportsmen: function(e, data){
                            e.preventDefault();
                            var d = data.linkCtx.data;
                            if (d.id){
                                spGrid
                                .one(\'jqGridSerializeGridData\', function(e, pd) {
                                    var gr = $(e.target);
                                    //var oldPostData = $.extend({}, pd);
                                    gr.one(\'jqGridAfterLoadComplete\', function(e, data){
                                        gr
                                        .jqGrid(\'setSelection\', d.id)
                                        .jqGrid(\'editGridRow\', d.id);
                                        SCRM.link(spData, {needReload: true});
                                        //.jqGrid(\'setGridParam\', {postData: oldPostData})
                                    });
                                    return { _where: {id: d.id} };
                                })
                                //.jqGrid(\'showCol\', \'id\')
                                .trigger(\'reloadGrid\');
                            } else {
                                spGrid
                                .one(\'jqGridAddEditInitializeForm\', function(e, form) {
                                    $(\'#name\', form).val( srchData.srchTxt );
                                })
                                .jqGrid(\'editGridRow\', \'new\');
                            }
                            srchData.mdl_hide();
                        }
                    });
                }, // end newSportsmen
                changeField: function(chfield, e){
                    SCRM._run.call(e, \'/chunk/sp.changefield\', {
                        chfield: chfield,
                        postData: {
                            id: spData.selRows.join(\',\')
                        },
                        callback: spData.clearReload
                    });
                },
                addInvoices: function(e){
                    SCRM._run(\'/chunk/newinvoice\', {
                        modal: {
                            title: \'Массовые начисления\',
                            ok: \'Начислить\'
                        },
                        post: {
                            addmulti: \'sportsmen\',
                            sportsmen: spData.selRows.join(\',\')
                        }
                    });
                },
                changeSquad: function(e, data) {
                    SCRM._run(\'/chunk/squadlist\', {
                        post: {
                            ismain: \'1\',
                            sportsmen: spData.selRows.join(\',\')
                        },
                        callback: spData.clearReload
                    });
                    /*squadAdd({
                        ismain: \'1\',
                        sportsmen: spData.selRows.join(\',\')
                    }, function(data) {
                        spData.reloadGrid();
                        // TODO: Удалить, потому что окно будет закрыто ?
                        SCRM._runLoader(\'spCard\')();
                        //clubSpCard.loadData();
                    });*/
                },
                exportQRcard: function(e, data) {
                    e.preventDefault();
                    var lnk = $(e.target);
                    var data = $.extend({ // Чтобы не изменить Post
                        doc_type: \'docx\',
                        _export: lnk.data(\'handler\'),
                        tmpl: lnk.data(\'tmpl\'),
                    }, spGrid.jqGrid(\'getGridParam\', \'postData\'), {
                        _where: \'id=\' + spData.selRows.join(\',\'),
                        filters: \'\',
                        rows: 1001 // Безлимитно
                    });
                    clubPostForm(spGrid.jqGrid(\'getGridParam\', \'url\'), data);
                },
                exportContract: function(e, data){
                    clubPostForm(\'/data/sportsmen\', {
                        key: spData.sp.key,
                        mode: \'export\'
                    });
                },
                sendMessage: function(e, data){
                    pDATA(\'idSportsmen\', {
                        _where: {id: spData.selRows.join(\',\')},
                        rows: 1001
                    }, function(data){
                        SCRM._service.sendMessage(data.rows);
                    });
                },
                clipAdd: function(e) {
                    getGridSelRows(spGrid, function(selIDs){
                        var clipSportsmen = get_clipSportsmen();
                        $.each(selIDs, function(i, v){
                            var itemIndex = $.inArray(v, clipSportsmen);
                            if (itemIndex == -1) clipSportsmen.push(v);
                        });
                        saveObjectInLocalStorage(\'club_clip_sportsmen\', clipSportsmen);
                    });
                },
                clipRemove: function(e){
                    getGridSelRows(spGrid, function(selIDs){
                        var clipSportsmen = get_clipSportsmen();
                        $.each(selIDs, function(i, v){
                            var itemIndex = $.inArray(v, clipSportsmen);
                            if (itemIndex > -1) clipSportsmen.splice(itemIndex, 1);
                        });
                        saveObjectInLocalStorage(\'club_clip_sportsmen\', clipSportsmen);
                    });
                },
                clipClear: function(e){
                    removeObjectFromLocalStorage(\'club_clip_sportsmen\');
                    SCRM.msg("Буфер обмена пуст!", "Успешно");
                },
                clipShow: function(e) {
                    spGrid.setGridFilter(\'id\', get_clipSportsmen().join(\',\'));
                }
            });
    
            $.observe(spData, \'idSchedule_main\', function(e, data){
                spGrid.trigger(\'reloadGrid\');
            });
        
            function saldoCls(row) {
                var cellCls = [\'saldoCell\'];
                if (row.saldo*1 > 0) cellCls.push(\'text-success\'); else {
                    if (row.saldo*1 < 0) cellCls.push(\'text-danger\',\'font-weight-bold\');
                    if (row.price && row.price*1 != 0  && row.saldo*1 < 0-row.price*1) cellCls.push(\'rowWarn\');
                }
                return cellCls;
            }
            
            [[-function residueCls(row){
                var cellCls = [\'residueCell\'], diff = diffNow(row.duedate);
                if (diff < 0 && (row.residue > 0 || row.invtype_amount == 0)) {
                    cellCls.push(\'text-success\');
                } else {
                    cellCls.push(\'text-muted\');
                }
                return cellCls;
            }]]
            
            var narc = {id: \'narc\', name: \'[Не в архиве]\'};
            var gridOpts = spData.gridOpts;
            gridOpts.colModel.push(
                {name: \'id\', template: idFieldTemplate},
                {name: \'created\', template: createdTemplate},
                {name: \'status\', width: 50, align: \'center\',
                    template: lookTemplate,
                    cellattr: function(rowId, cellValue, rawObject, cm, rdata){
                        return arr2clstring( saldoCls(rawObject) );
                    },
                    formatter: function(cv){
                        return SCRM.statusFmt(\'idSportsmen\', cv, \'name\', true);
                    },
                    unformat: function(cellValue, options, cell) {
                        return $(cell).find(\'i\').data(\'status\');
                    },
                    searchoptions: {
                        defaultValue: \'narc\'
                    },
                    clubStatus: \'idSportsmen\', lookupKey: \'name\'
                },
                {name: \'name\', //index: \'idSportsmen.name\',
                    width: 200, editable: true, setROW: true, // Может обновляться через fieldEDIT
                    formoptions: {rowpos: 1, colpos: 1},
                    editrules: {edithidden: true, required: true}
                },
                {name: \'gender\', index: \'idSportsmen.gender\',
                    width: 40, hidden: true,
                    editable: true,
                    editoptions: {
                        defaultValue: spData.Gender_main
                    },
                    formoptions: {rowpos: 1, colpos: 2},
                    template: selTemplate,
                    clubStatus: \'Gender\', lookupKey: \'alias\'
                },
                //{name:\'num\', width:50, hidden: true, sorttype:\'int\'},
                {name: \'birth\', index: \'idSportsmen.birth\',
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:2, colpos:1},
                    template: dateTemplate,
                    cellattr: cellEmptyColor
                },
                {name: \'doc\', width: 100, hidden:true,
                    editable: true, editrules: {edithidden:true}, setROW: true,
                    formoptions:{rowpos: 2, colpos: 2},
                    cellattr: cellEmptyColor
                },
                {name:\'contract\', width:80,
                    editable: true, editrules: {edithidden:true}, setROW: true,
                    formoptions:{rowpos:3, colpos:1},
                    cellattr: cellEmptyColor
                },
                {name:\'contractdate\',
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:3, colpos:2},
                    template: dateTemplate,
                    cellattr: cellEmptyColor
                },
                {name:\'contact\', width:100,
                    editable: true, editrules: {edithidden:true}, setROW: true,
                    formoptions:{rowpos:4, colpos:1},
                    cellattr: cellEmptyColor,
                    inCard: true
                },
                {name:\'pasp\', hidden:true,
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:4, colpos:2},
                    template: \'booleanCheckboxFa\',
                    inCard: true
                },
                {name:\'email\', hidden: true, template: emailTemplate,
                    editable: true,
                    editrules: {edithidden: true}, //, email: true
                    formoptions: {rowpos: 5, colpos: 1}
                },
                {name:\'tel\', template: telTemplate,
                    editable: true,
                    editrules: {edithidden: true},
                    formoptions:{rowpos: 5, colpos: 2},
                    cellattr: cellEmptyColor
                },
                {name: \'price\',
                    editable: true, editrules: {edithidden: true},
                    formoptions:{rowpos: 7, colpos: 1},
                    template: numberTemplate
                },
                {name: \'discount\', width: 45, align: \'right\',
                    editable: true, editrules: {edithidden:true},
                    formoptions: {rowpos:7, colpos:2},
                    template: selTemplate,
                    //dbvalues: dbValues.Discount,
                    clubStatus: \'Discount\', lookupKey: \'name\',
                    dbvalues0: \'\'
                },      
        
                {name:\'saldo\',
                    template: numberTemplate,
                    cellattr: function(rowId, cellValue, rawObject, cm, rdata){
                        return arr2clstring( saldoCls(rawObject) );
                    }
                },
                // duedate
                {name: \'meddate\',
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos: 9, colpos: 1},
                    template: dateTemplate,
                    cellattr: cellInsuranceColor
                },
                {name: \'insdate\',
                    editable: true, editrules: {edithidden: true},
                    formoptions:{rowpos: 9, colpos: 2},
                    template: dateTemplate,
                    cellattr: cellInsuranceColor
                },
                {name: \'razr\', width: 50,
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:10, colpos:1},
                    template: selTemplate,
                    clubStatus: \'idSportsmenGrade\', lookupKey: \'name\',
                    dbvalues0: \'\'
                },
        
                {name:\'level_name\', index:\'idSquad.lvl\', width: 55,
                    template: lookTemplate,
                    dbvalues: \'idLevel\'
                },
                {name:\'squad_name\', index:\'idSquad.name\', width: 55},
                {name:\'trainer_name\', index: \'idTrainer.name\', width: 100},
                {name:\'club_name\', index:\'idSquad.club\', width: 85,
                    template: lookTemplate,
                    dbvalues: \'idClub\'
                },
                {name:\'sport_name\', index:\'idSquad.sport\', width: 100,
                    template: lookTemplate,
                    dbvalues: \'idSport\'
                },
                {name: \'squad\', hidden: true, hidedlg: true,
                    searchrules: { integer: true },
                    editable: true, editrules: {edithidden:true}, //, required:true, integer:true
                    formoptions:{rowpos:11, colpos:1},
                    edittype: \'custom\',
                    editoptions:{
                        custom_element: function(value, edopt) {
                            var el = $(\'<select><option>...</option></select>\');
                            SCRM._run(\'/chunk/squadlist\', function(html) {
                                el.html(html).val(value||0);
                            });
                            return el;
                        }
                    }
                },
                {name:\'trainer\', editable: true,
                    hidden:true, hidedlg: true, editrules: {edithidden: true},
                    formoptions: {rowpos: 11, colpos: 2},
                    template: selTemplate,
                    dbvalues: \'idTrainer\', dbvalues0: 0
                },
                {name: \'info\', hidden: true,
                    template: infoTemplate,
                    editable: true, editrules: {edithidden:true}, setROW: true,
                    formoptions: {rowpos:12, colpos:1},
                    inCard: true
                },
                {name: \'height\', width:50, hidden: true,
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:13, colpos:1},
                    inCard: true
                },
                {name:\'weight\', width:50, hidden: true,
                    editable: true, editrules: {edithidden:true},
                    formoptions:{rowpos:13, colpos:2},
                    inCard: true
                },
                {name:\'username\',
                    width:30, editable: false,
                    search: false,
                    align: \'center\',
                    formatter: hasUser
                },
                {name:\'key\', hidden: true, editable: false}
            );

            
            if (gridOpts.showDuedate) {
                gridOpts.colModel.splice(16, 0, {
                    name:\'duedate\', width: 110, hidden: false,
                    align: \'right\',
                    searchoptions: {
                        sopt: [\'eq\']
                    },
                    formatter: function(cv, options, row){
                        var str = [];
                        //row.debt_lesson = row.lesson_amount*1 - row.cnt_lesson*1;
                        if (row.duedate) {
                            //if (row.debt_lesson != 0) 
                            if (row.cnt_lesson > 0) str.push(row.cnt_lesson);
                            str.push( str2date(row.duedate,\'d\') );
                            // if (diff > -90 || row.name_typeinvoice || residue===0) // Если < 3 мес или idInvoice
                        }
                        return str.join(\' ~ \'); // если пустое, будет пустая строка
                    },
                    cellattr: function(rowId, cellValue, data, cm, row){
                        if (data.duedate) {
                            return arr2clstring([\'text-success\']);
                        }
                        /*var cellCls = []; //, diff = diffNow(row.duedate);
                        if (data.duedate && (data.debt_lesson > 0 || data.lesson_amount == 0)) {
                            cellCls.push(\'text-success\');
                        } else {
                            cellCls.push(\'text-muted\');
                        }
                        return arr2clstring(cellCls);*/
                    }
                });
            }
            
            
            if (gridOpts.ipcFields) {
                function cellSaldoColor2(rowId, cellValue, rawObject, cm, rdata){
                    return rawObject.tmp_cls;
                }
                var ipcFields = {
                    invoiced: {
                        label: \'Начислено\',
                        width: 90,
                        template: numberTemplate,
                        formatter: function(cv, options, row) {
                            if (options.rowId == \'\') return (row.invoiced)? row.invoiced : \'\'; // if footer
                            return numberFormatter(cv);
                        },
                        cellattr: cellSaldoColor2,
                        inCard: true
                    },
                    add_cnt: {
                        label: \'Количество\',
                        template: numberTemplate,
                        cellattr: cellSaldoColor2,
                        inCard: true
                    },
                    payed: {
                        label: \'Оплачено\',
                        width: 90,
                        template: numberTemplate,
                        cellattr: cellSaldoColor2,
                        inCard: true
                    },
                    add_info: {
                        template: infoTemplate,
                        inCard: true
                    }
                };
                $.each(gridOpts.ipcFields.split(\',\'), function(i, v){
                    var fld = ipcFields[v];
                    if (fld) {
                        fld.name = v;
                        gridOpts.colModel.push(fld);
                    }
                });
                $.extend(gridOpts, {
                    footerrow: true,
                    userDataOnFooter: true,
                    multiselect: false
                });
                spGrid.one(\'jqGridAfterInit\', function(e){
                    var hideCols = \'doc,orderdate,meddate,insdate,pasp,razr,contact,tel\'.split(\',\');
                    $(this)
                    .jqGrid(\'hideCol\', hideCols)
                    .jqGridExport();
                });
            }
        
            grids.main = spGrid
            .one(\'jqGridBeforeInit\', function(e, grOpts) {
                var editedRows,
                gr = $(this)
                .one(\'jqGridAfterInit\', function(e, grOpts){
                    $.each(gr.jqGrid(\'getGridParam\', \'colModel\'), function(i, v) {
                        if (!v.label) {
                            var nlabel = SCRM.lexicon.idSportsmen[v.name];
                            if (nlabel && nlabel != v.name) { // Есть в справочнике
                                gr.jqGrid(\'setLabel\', v.name, nlabel);
                                v.label = nlabel;
                            }
                        }
                    });
                    grOpts.reloadAlert.link(true, spData);
                    spData.pnlSp.link(true, spData);
                    
                    gr
                    .jqGridColumns()
                    .data(\'init-filters\', gr.jqGrid(\'getGridParam\', \'postData\').filters);
                })
                .on(\'jqGridAddEditBeforeInitData\', function (e, form, ddd) { // Редактируется строка
                    var id = gr.jqGrid(\'getGridParam\', \'selrow\');
                    console.log(\'jqGridAddEditBeforeInitData\',  e, form, ddd, id, editedRows);
                    if (id in editedRows) {
                        SCRM.alert(\'Данные в строке неактуальны. Обновите таблицу\');
                        return false;
                    }
                })
                .on(\'jqGridBeforeRequest.spGrid\', function(e) {
                    var sstatus = gr.data(\'start_status\');
                    if (sstatus) {
                        var col = gr.jqGrid(\'getColProp\', \'status\');
                        col.searchoptions.defaultValue = (sstatus==\'*\')? \'\' : sstatus;
                        gr.data(\'start_status\', null);
                    }
                })
                .on(\'jqGridSerializeGridData.spGrid\', function(e, postData) {
                    if (gridOpts.showDuedate) postData._stype = spData.idSchedule_main;
                    if (postData.clubStatus) postData.clubStatus.push(\'idSchedule\');
                })
                .on(\'jqGridBeforeSetLookup\', function(e, params){
                    if (params.f.name == \'status\') {
                        params.rows.unshift(narc);
                    }
                })
                .on(\'jqGridAfterLoadComplete.spGrid\', function(e, data) {
                    editedRows = {};
                    if (data.sp_arc) SCRM.app.sp_arc = data.sp_arc.split(\',\');
                    if (data.dbvalues && data.dbvalues.idTrainer) {
                        SCRM.dbValues.idTrainer = data.dbvalues.idTrainer;
                    }
                    SCRM.link(spData, {needReload: false});
                })
                .on(\'needReload.spGrid\', function(e, data) {
                    SCRM.link(spData, {needReload: true});
                });
                
                // При изменении данных в eCard
                $(document)
                .on(\'eCardSpEdit\', function(e, data){
                    var id = \'\'+data.id,
                        ids = gr.jqGrid(\'getDataIDs\');
                    if (in_array(id, ids)) {
                        editedRows[id] = true;
                        SCRM.link(spData, {needReload: true});
                    }
                });
                
                // TODO: Выпилить, чтобы было однообразно
                $(document)
                .on(\'OnRefreshSpData\', function(e, data) {
                    // Если при обновлении карточки меняется
                    var id = (data.sp||{}).id,
                        ids = gr.jqGrid(\'getDataIDs\');
                    if (in_array(id, ids)) SCRM.link(spData, {needReload: true});
                });
            })
            .jqGridInit(gridOpts)
            .on(\'jqGridAddEditInitializeForm\', function(e, form, oper) {
                var tr = $(\'tr#tr_info\', form);
                $(\'td:eq(1)\', tr).attr(\'colspan\', 3); 
                $(\'td:gt(1)\', tr).remove();
                
                var gen = $(\'#gender\', form).css(\'width\', \'auto\');
                $(\'select.customelement\', form).addClass( gen.attr(\'class\') );
            })
            .on(\'jqGridSelectRow jqGridSelectAll\', function(e, rid, sel) {
                var grid = $(this);
                //console.log(e, rid, sel)
                var selRows = getGridSelRows(grid);
                var nsd = {
                    //loading: 1,
                    spVisible: false,
                    selRows: selRows,
                    selRowsCnt: selRows.length // spCount
                };
        
                if (selRows.length == 1) {
                    nsd.spVisible = true;
                    nsd.spID = selRows[0];
                    nsd.sp = grid.jqGrid(\'getRowData\', nsd.spID);
        
                    var tr = grid.jqGrid(\'getGridRowById\', nsd.spID);
                    var mainCols = grid.jqGrid(\'getGridParam\', \'colModel\');
                    [[-nsd.infoTable = $.map(mainCols, function(col, i){
                        if (!col.inCard) return null;
                        var cdata = $.jgrid.getDataFieldOfCell.call(grid[0], tr, i);
                        col.HTML = cdata.html();
                        col.CLS = cdata.attr(\'class\');
                        return col;
                    });]]
                    nsd.cardHolder = spData.pnlSp;
                    //nsd.cardModal = true;
                    SCRM._runLoader(\'spCard\')(nsd); // spVisible = true
                    //clubSpCard.loadData(); 
                }
                SCRM.link(spData, nsd);
            })
            .on(\'jqGridDeleteBeforeShowForm\', function (e, form) {
                $(\'.delmsg\', form).html(\'Удаляются спортсмены только в статусе <b>\'+ 
                    SCRM.app.sp_arc.join(\', \') +\'</b>.<br>Продолжить?\');
            })
            .on(\'jqGridDeleteAfterComplete\', function(e, rowid, jqXhrOrBool, postData, options) {
                $(this).trigger(\'clearSelection\');
            });
        });
    } else {
        if (initOpts && spGrid.hasClass(\'ui-jqgrid-btable\')) {
            spGrid.jqGrid(\'setGridParam\', initOpts);
        }
        spGrid.trigger(\'reloadGrid\');
    }
});
</script>

[[-
colModel:
        {name: \'act\', template: \'actions\', width: 38}
    ,
    actionsNavOptions: {
        editbutton: false
    }
]]',
        ),
        'policies' => 
        array (
        ),
        'source' => 
        array (
        ),
      ),
      'tplSearch' => 
      array (
        'fields' => 
        array (
          'id' => 29,
          'source' => 0,
          'property_preprocess' => false,
          'name' => 'tplSearch',
          'description' => 'Chunk',
          'editor_type' => 0,
          'category' => 1,
          'cache_type' => 0,
          'snippet' => '<script id="tpl_searchinput" type="text/x-jsrender">
<form class="input-group input-group-alt srch-group" action="" data-link="{on \'submit\' ~srchSubmit}">
    <input type="text" class="srch-input form-control clubmodal-focus" 
        data-link="{:srchTxt:} placeholder{:~placeholder}" />
    <div class="input-group-append">
        <button type="submit" class="btn btn-secondary"><i class="fa fa-search"></i></button>
    </div>
</form>
</script>

<script id="tpl_rowSportsmen" type="text/x-jsrender">
<a href="#" class="list-group-item list-group-item-action list-group-item-primary" data-link="{on ~chSportsmen}">
    <div class="list-group-item-body">
    <h4 class="list-group-item-title">{{:name}}</h4>
    <h5 class="list-group-item-subtitle">{{formatDate:birth}}</h5>
    </div>
    <div class="list-group-item-figure">
        <i data-link="class{:\'fa \' + (~cls? ~cls:\'fa-plus\')}"></i>
    </div>
</a>
</script>',
          'locked' => false,
          'properties' => NULL,
          'static' => false,
          'static_file' => '',
          'content' => '<script id="tpl_searchinput" type="text/x-jsrender">
<form class="input-group input-group-alt srch-group" action="" data-link="{on \'submit\' ~srchSubmit}">
    <input type="text" class="srch-input form-control clubmodal-focus" 
        data-link="{:srchTxt:} placeholder{:~placeholder}" />
    <div class="input-group-append">
        <button type="submit" class="btn btn-secondary"><i class="fa fa-search"></i></button>
    </div>
</form>
</script>

<script id="tpl_rowSportsmen" type="text/x-jsrender">
<a href="#" class="list-group-item list-group-item-action list-group-item-primary" data-link="{on ~chSportsmen}">
    <div class="list-group-item-body">
    <h4 class="list-group-item-title">{{:name}}</h4>
    <h5 class="list-group-item-subtitle">{{formatDate:birth}}</h5>
    </div>
    <div class="list-group-item-figure">
        <i data-link="class{:\'fa \' + (~cls? ~cls:\'fa-plus\')}"></i>
    </div>
</a>
</script>',
        ),
        'policies' => 
        array (
        ),
        'source' => 
        array (
        ),
      ),
      'idLogoutMenu4' => 
      array (
        'fields' => 
        array (
          'id' => 13,
          'source' => 1,
          'property_preprocess' => false,
          'name' => 'idLogoutMenu4',
          'description' => '',
          'editor_type' => 0,
          'category' => 5,
          'cache_type' => 0,
          'snippet' => '<button class="btn-account" type="button" data-toggle="dropdown"[[- data-display="static" aria-haspopup="true" aria-expanded="false"]]>
    <span class="d-block d-md-none">
        <i class="fa fa-user-circle-o"></i>
    </span>
    <span class="account-summary d-none d-md-block">
        <span class="account-name">[[!#SESSION.user_fullname]]</span>
        <span class="account-description">[[!#SESSION.club_cityname]]</span>
    </span>
</button>
<!-- .dropdown-menu -->
<div class="dropdown-menu dropdown-menu-right">
    <div class="dropdown-arrow"></div>
    <h6 class="dropdown-header d-md-none" id="user_fullname">[[!#SESSION.user_fullname]]</h6>
[[#SESSION.club_manager:notempty=`
    <a class="dropdown-item" href="/database/db.html" id="chCity">
        <i class="dropdown-icon fa fa-map-marker"></i> [[#SESSION.club_cityname]]
    </a>
`]]
    <a class="dropdown-item" href="/login/profile.html"><i class="dropdown-icon fa fa-id-card-o"></i> Профиль</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="[[+logoutUrl]]"><i class="dropdown-icon fa fa-sign-out"></i> Выход</a>
</div>
<!-- /.dropdown-menu -->
[[-#SESSION.club_manager:notempty=`
<li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="chCity" aria-expanded="false">
        <i class="fa fa-map-marker"></i> 
        [[-#SESSION.club_cityname]]
        <span class="caret"></span>
    </a>
    
    <ul class="dropdown-menu">
        <li><a href="/database/db.html">База данных</a></li>
    </ul>
</li>
`]]',
          'locked' => false,
          'properties' => 
          array (
          ),
          'static' => false,
          'static_file' => '',
          'content' => '<button class="btn-account" type="button" data-toggle="dropdown"[[- data-display="static" aria-haspopup="true" aria-expanded="false"]]>
    <span class="d-block d-md-none">
        <i class="fa fa-user-circle-o"></i>
    </span>
    <span class="account-summary d-none d-md-block">
        <span class="account-name">[[!#SESSION.user_fullname]]</span>
        <span class="account-description">[[!#SESSION.club_cityname]]</span>
    </span>
</button>
<!-- .dropdown-menu -->
<div class="dropdown-menu dropdown-menu-right">
    <div class="dropdown-arrow"></div>
    <h6 class="dropdown-header d-md-none" id="user_fullname">[[!#SESSION.user_fullname]]</h6>
[[#SESSION.club_manager:notempty=`
    <a class="dropdown-item" href="/database/db.html" id="chCity">
        <i class="dropdown-icon fa fa-map-marker"></i> [[#SESSION.club_cityname]]
    </a>
`]]
    <a class="dropdown-item" href="/login/profile.html"><i class="dropdown-icon fa fa-id-card-o"></i> Профиль</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="[[+logoutUrl]]"><i class="dropdown-icon fa fa-sign-out"></i> Выход</a>
</div>
<!-- /.dropdown-menu -->
[[-#SESSION.club_manager:notempty=`
<li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#" id="chCity" aria-expanded="false">
        <i class="fa fa-map-marker"></i> 
        [[-#SESSION.club_cityname]]
        <span class="caret"></span>
    </a>
    
    <ul class="dropdown-menu">
        <li><a href="/database/db.html">База данных</a></li>
    </ul>
</li>
`]]',
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
      'clubConfig' => 
      array (
        'fields' => 
        array (
          'id' => 38,
          'source' => 0,
          'property_preprocess' => false,
          'name' => 'clubConfig',
          'description' => '',
          'editor_type' => 0,
          'category' => 1,
          'cache_type' => 0,
          'snippet' => '$json = clubConfig($name);

if (!empty($mode) && $mode = \'setPlaceholders\') {
    $modx->setPlaceholders($json);
    return "";
} else {
    $modx->setPlaceholder(\'clubConfig\', $json);
}

return (sizeof($json) > 1)? json_encode($json, JSON_UNESCAPED_UNICODE) : $json[$name];',
          'locked' => false,
          'properties' => NULL,
          'moduleguid' => '',
          'static' => false,
          'static_file' => '',
          'content' => '$json = clubConfig($name);

if (!empty($mode) && $mode = \'setPlaceholders\') {
    $modx->setPlaceholders($json);
    return "";
} else {
    $modx->setPlaceholder(\'clubConfig\', $json);
}

return (sizeof($json) > 1)? json_encode($json, JSON_UNESCAPED_UNICODE) : $json[$name];',
        ),
        'policies' => 
        array (
        ),
        'source' => 
        array (
        ),
      ),
    ),
    'modTemplateVar' => 
    array (
    ),
  ),
);