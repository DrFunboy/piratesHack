<?php  return array (
  'resourceClass' => 'modDocument',
  'resource' => 
  array (
    'id' => 40,
    'type' => 'document',
    'contentType' => 'text/html',
    'pagetitle' => 'spCard',
    'longtitle' => '',
    'description' => '',
    'alias' => 'spcard',
    'alias_visible' => 1,
    'link_attributes' => 'data-cls="clubStuff"',
    'published' => 1,
    'pub_date' => 0,
    'unpub_date' => 0,
    'parent' => 27,
    'isfolder' => 0,
    'introtext' => '',
    'content' => '[[$tplFiles]]

<script>
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

SCRM._fieldName = function(field){
    return SCRM.lexicon.idSportsmen[field] || field || \'\';
}

window.clubSpCard = {
    sp: {},
    spTabs: [
        {id: \'t_spInfo\', name: \'Инфо\', active: true, tpl: \'-\'},
        {id: \'t_car\', name: \'Транспорт\', tpl: \'-\'},
        {id: \'t_spChanges\', name: \'История\', tpl: \'-\'}
    ],
    titleMenu: [ ],
    dbValues: {
        idTrainer: [ ]
    },
    clubStatus: {},
    _fields: SCRM.lexicon.idSportsmen,
    pnlSp: $(\'<div class="spinner-parent"></div>\').appendTo(\'body\'),
    loading: true,
    selSpEvent: null,
    changeField: function(chfield, e, data) {
        SCRM._run(\'/chunk/sp.changefield\', {
            e: e,
            chfield: chfield,
            postData: {
                id: clubSpCard.sp.id
            }
        });
    },
    changeSportsmenSquad: function(data) {
        pEDIT(\'idSportsmenSquad\', data, clubSpCard.refreshData);
    },
    refreshTabs: function(tabs, refreshData) {
        if (tabs) $.each(tabs.split(\',\'), function(i, v){
            $(\'[href="\'+ v +\'"]\', clubSpCard.sptabs).addClass(\'calculate\');
        });
        if (refreshData) clubSpCard.refreshData();
    },
    refreshData: function() {
        clubSpCard.reloadData(function(data) {
            clubSpCard.pnlSp.trigger(\'OnRefreshSpData\', data);
        });
    },
    reloadData: function(callback) {
        var tabInfo = $(\'#t_spInfo\', clubSpCard.pnlSp);
        spinnr(true, tabInfo);
        SCRM.link(clubSpCard, {loading: true});
        $(\'form.roinplace-container button[type="reset"]\', clubSpCard.pnlSp).click(); // Выйти из режима редактора в полях
        
        pJSON(\'/data/sportsmen\', {
            key: clubSpCard.key
        }, function(data) {
            var nd = {
                idSportsmen_arc: data.opts.idSportsmen_arc.split(\',\'),
                sp: data,
                loading: false,
                arcSportsmenSquad: []
            };
            nd.sp_arc = in_array(nd.sp.status, nd.idSportsmen_arc);
            
            nd.idSportsmenSquad = $.map(data.idSportsmenSquad, function(v, i) {
                if (!v.dateend) return v;
                nd.arcSportsmenSquad.push(v);
            });
            
            SCRM.link(clubSpCard, nd);
            
            $(\'[data-linkfile]\').trigger(data.key, $.extend(data.files, {
                gender: data.gender
            }));
            
            var tab = $(\'[data-toggle="tab"].calculate.active\', clubSpCard.sptabs).trigger(\'calculate\');
            console.log(\'LoaddCalculate\', tab);
            
            SCRM._run(\'/chunk/ecard\', {
                edata: clubSpCard.sp,
                block: clubSpCard.eCardSpContact,
                ecard: \'spContact\',
                ev: \'setROW.idSportsmen\'
            });
            
            SCRM._run(\'/chunk/ecard\', {
                edata: clubSpCard.sp,
                block: $(\'.eCard_spManager\', clubSpCard.pnlSp),
                ecard: \'spManager\',
                ev: \'setROW.idSportsmen\'
            });

            if (callback) callback(clubSpCard);
            clubSpCard.pnlSp.trigger(\'OnLoadSpData\', clubSpCard);
            spinnr(false, tabInfo);
        });
    }
};
clubSpCard.addMenu = clubSpCard.spTabs; // TODO: Убрать. Оставлено для совместимости

SCRM.setClubStatus([[!clubStatus?tbl=`idSportsmen,idSchedule,Gender`]]);
SCRM.setClubStatus([[!clubStatus?tbl=`ecard` &alias=`spContact,spManager,spSysinfo`]])

$.views.tags(\'spCardMoneyMenu\', {
    contentCtx: true,
    template: \'#tpl_spCardMoneyMenu\'
});

$.templates(\'#tpl_sportsmenCard\').link(clubSpCard.pnlSp, clubSpCard, {
    spFieldEdit: function(e, data, txt) {
        var d = data.linkCtx.data;
        if (d.sp) {
            var edata = {
                id: d.sp.id
            };
            edata[ $(e.target).data(\'name\') ] = txt;
            pEDIT(\'idSportsmen\', edata, d.refreshData);
        }
    },
    eCardSpEdit: function(e, data, postData, edata) {
        //console.log("eCardSpEdit", e, data, postData, edata)
        SCRM.link(clubSpCard.sp, edata);
    },
    addSquad: function(e, data) {
        SCRM._run(\'/chunk/squadlist\', {
            post: {
                ismain: \'0\',
                sportsmen: clubSpCard.sp.id
            },
            callback: clubSpCard.refreshData
        });
    },
    mainSquad: function(e, data) {
        pEDIT(\'idSportsmen\', {
            id: data.linkCtx.data.sportsmen,
            squad: data.linkCtx.data.squad,
            ignore_squad: 1
        }, clubSpCard.refreshData);
        /*clubSpCard.changeSportsmenSquad({
            id: data.linkCtx.data.id,
            //oper: \'add\', // Добавление архивирует старую главную группу
            //squad: data.linkCtx.data.squad,
            //sportsmen: clubSpCard.sp.id,
            ismain: 1
        });*/
    },
    deleteSquad: function(e, data){
        rocnfrm(\'Удалить из группы?\', function(){
            clubSpCard.changeSportsmenSquad({
                id: data.linkCtx.data.id,
                published: \'\'
            });
        });
    },
    unDeleteSquad: function(e, data){
        clubSpCard.changeSportsmenSquad({
            id: data.linkCtx.data.id,
            published: 1
        });
    },
    addInvoice: function(paymode, e){
        //e.preventDefault();
        var opts = {
            key: clubSpCard.key,
            paymode: paymode,
            payd: paymode,
            modal: {
                ok: \'Записать\'
            }
        };
        SCRM._run(\'/chunk/newinvoice\', opts);
    },
    recoverInvoice: function(e) {
        pEDIT(\'idInvoicePay\', {
            oper: \'fix\',
            id: clubSpCard.sp.id
        }, function(){
            clubSpCard.refreshTabs(\'#t_spInvoice\', true);
        });
    },
    addContact: function(e, data){
        SCRM.prompt(\'Добавить контакт\', function(txt){
            pEDIT(\'idContact\', {
                oper: \'add\',
                sportsmen: clubSpCard.sp.id,
                name: txt
            }, clubSpCard.refreshData);
        });
    },
    deleteContact: function(e, data){
        rocnfrm(\'Удалить контакт?\', function(){
            pEDIT(\'idContact\', {
                oper: \'del\',
                id: data.linkCtx.data.id
            }, clubSpCard.refreshData);
        });
    },
    idUser: function(e, data) {
        e.preventDefault();
        var d = data.linkCtx.data;
        //var checked = $(e.target).prop(\'checked\');
        //$(e.target).prop(\'checked\', !checked);
        if (!d.sp.iduser) {
            SCRM._run(\'/chunk/newcabinet\', {
                postData: {
                    user_group: \'idSportsmen\',
                    email: d.sp.email,
                    iduser_row: d.sp.id,
                    name: d.sp.name,
                    fullname: d.sp.contact || d.sp.name
                },
                success: d.refreshData
            });
        } else rocnfrm(\'Отключить Кабинет?\', function(){
            pEDIT(\'idSportsmen\', {
                id: d.sp.id,
                iduser: 0
            }, d.refreshData);
        });
    },
    cutPay: function(e, data) {
        SCRM.link(clubSpCard, {memPay: clubSpCard.selPay});
    },
    pastePay: function(e, data) {
        pEDIT(\'idPay\', {
            oper: \'move\',
            id: clubSpCard.memPay,
            sportsmen: clubSpCard.sp.id
        }, function(data){
            SCRM.link(clubSpCard, {memPay: data.id});
            clubSpCard.refreshTabs(\'#t_spPays,#t_spInvoice\', true);
        });
    },
    showGridFilter: function(e) {
        $(e.currentTarget).hide()
        .closest(\'.gridBlock\').find(\'[data-entity]\').eq(0).jqGridFilterToolbar(true);
    }
});
clubSpCard.eCardSpContact = $(\'.eCardSpContact\', clubSpCard.pnlSp);

$.observe(clubSpCard, \'sp\', function(e, data){
    SCRM.link(SCRM, {idSportsmen: data.value});
});
clubSpCard.sptabs = $(\'.sptabs\', clubSpCard.pnlSp);

SCRM._service.spCard = function(sp_data, callback) {
    if (sp_data) {
        if (!sp_data.key && sp_data.sp) sp_data.key = sp_data.sp.key;
        if (clubSpCard.key != sp_data.key) {
            $(\'[data-toggle="tab"]\', clubSpCard.sptabs).addClass(\'calculate\');
        }
    }
    SCRM.link(clubSpCard, sp_data);
    if (clubSpCard.key) {
        if (clubSpCard.cardHolder == \'modal\') {
            if (!clubSpCard._mdl) {
                var _mdlData = {
                    zindex: 1035,
                    cm_size: \'lg\',
                    spCard: clubSpCard,
                    hideRemove: false,
                    title: \'#tpl_sportsmenCardTitle\'
                };
                clubSpCard._mdl = club_Drawer(_mdlData)
                .on(\'shown.bs.modal\', function(e){
                    $(document).off(\'focusin.bs.modal\'); //TODO: зачем?
                });
                //console.log(clubSpCard._mdl, _mdlData);
                
            } else if (!clubSpCard._mdl.hasClass(\'show\')) {
                clubSpCard._mdl.modal(\'show\');
            }
            clubSpCard._mdl.find(\'.modal-body\').append(clubSpCard.pnlSp);
        } else {
            clubSpCard.pnlSp.appendTo(clubSpCard.cardHolder);
        }

        clubSpCard.reloadData(callback);
    } else {
        if (callback) callback(clubSpCard);
    }
}

$(document)
.on(\'clubUpdateSpData\', function(e, data){ // Если что-то где-то на странице обновляет спортсмена - эта штука срабатывает
    if (data.id == (clubSpCard.sp||{}).id) {
        clubSpCard.refreshTabs(data.tab||\'#t_spPays,#t_spInvoice\', true);
    }
})
.on(\'changeGridData.idSportsmen\', function(e, params) {
    if (params.id == (clubSpCard.sp||{}).id) {
        clubSpCard.reloadData();
    }
})
.on(\'setROW.idSportsmen\', function(e, params) {
    if ((params || {}).id == (clubSpCard.sp||{}).id) {
        SCRM.link(clubSpCard.sp, params);
    }
});


$("#grinvoice")
.one(\'reloadGrid\', function(e){
    $(this)
    .on(\'jqGridSerializeGridData\', function(e, postData) {
        postData._where = {sportsmen: clubSpCard.sp.id};
    })
    .jqGridInit({
        sortname: \'dateinvoice\', sortorder: \'desc\',
        footerrow: true, userDataOnFooter: true,
        colModel:[
            //{name: \'act\', template: \'actions\', width: 38},
            {name: \'id\', hidden: true, template: idFieldTemplate},
            {name:\'name_typeinvoice\', index: \'idInvoiceType.name\', label:\'Тип\', width:120,
                editable: \'readonly\',
                formatter: function(cv, options, row) {
                    if (row.isauto==\'1\') cv = makeIco(\'fa-toggle-on\', {big:0}) +\' \'+ cv;
                    return editRowLinkFmt(cv, options, row);
                },
                unformat: function(cellValue, options, cell) {
                    return $(\'a\', cell).html();
                }
            },
            {name:\'period_name\', index: \'dateinvoice\', label:\'Период\', width:70,
                formatter: function(cellValue, options, row) {
                    return (row.invtype_period && row.dateinvoice)?
                        $.jgrid.parseDate("ISO8601Long", row.dateinvoice, "M Y")
                        : \'\';
                }
            },
            {name:\'dateinvoice\', label:\'Дата\', editable: true, template: dateTemplate,
                editrules: {edithidden:true, required:true}
            },
            {name:\'sum\', label:\'Сумма\', editable: true,
                template: numberTemplate,
                formatter: function(cv, options, row) {
                    if (options.rowId == \'\') return row.sum; // if footer
                    if (row.edited && !row.status && row.isauto==1) row.status = \'na\';
                    var add = (row.status)? SCRM.statusFmt(\'idSportsmen\', row.status, \'name\', true)+\' \' : \'\';
                    return add + row.sum;
                },
                unformat: function(cellvalue, options, cell) {
                    return $.trim( $(cell).text() );
                },
                editrules: {edithidden:true, required:true}
            },
            [[-{name:\'addpay\', label:\'Оплатить\', template: "booleanCheckboxFa",
                hidden: true, editrules:{edithidden: true},
                editable: function (options) {
                    return (options.rowid == \'_empty\')? true: false;
                }
            },]]
            {name: \'status\', label: \'Статус\', editable: true,
                hidden: true, editrules: {edithidden: true},
                edittype: \'select\',
                editoptions: {
                    value: function(){
                        var inv_status = $.map(SCRM.clubStatus.idSportsmen, function(v, i){
                            if (v.extended && v.extended.idInvoice) return {
                                id: v.name,
                                name: v.name
                            };
                        });
                        inv_status.unshift({id: \'\', name: \'\'});
                        return makeGridOpts(inv_status);
                    }
                },
                formoptions: {
                    label: \'Статус \'+SCRM.hintLink(\'invoice_status\')
                }
            },
            
            {name: \'info\', template: infoTemplate, editable:true},
            {name: \'maxdatepay\', label: \'Оплата\', width: 120, template: dateTemplate, 
                formatter: function(cv, options, row) {
                    cv = (cv)? str2date(cv,\'d\') : \'\';
                    if (cv && row.sumpay) {
                        var sumpay = row.sumpay.split(\'.\');
                        row.sumpay = (sumpay[1]==\'00\')? sumpay[0] : row.sumpay;
                        cv = row.sumpay+\' - \'+cv;
                    }
                    return cv;
                }
            },
            //{name:\'sumpay\', label:\'Сумма оплачено\', template: numberTemplate},
            {name: \'duedate_format\', index: \'duedate\', label: SCRM._fieldName(\'duedate\'),
                width: 105, align: \'right\',
                formatter: function(cv, options, row){
                    var str = [],
                        diff = diffNow(row.duedate);
                    if (row.duedate) {
                        row.lesson_amount *= 1;
                        row.rest_lesson = row.lesson_amount - (row.cnt_lesson||0)*1;
                        var cls = (diff < 0 && (row.rest_lesson > 0 || row.lesson_amount == 0))? \'text-success\':\'text-muted\';
                        str.push(\'<a href="#" class="\'+ cls +\'" data-spkey="\'+ clubSpCard.key +\'" data-idinvoice="\'+row.id+\'" data-run="/chunk/invoice.lesson">\');
                        if (row.lesson_amount > 0 || row.rest_lesson != 0) {
                            str.push(row.rest_lesson);
                        }
                        // if (diff > -90 || row.name_typeinvoice || residue===0) 
                        str.push( \' ~ \'+str2date(row.duedate,\'d\') ); // Если < 3 мес или idInvoice
                        str.push(\'</a>\');
                    }
                    return str.join(\'\'); // если пустое, будет пустая строка
                },
                cellattr: function(rowId, cellValue, data, cm, row){
                    /*var cellCls = [], diff = diffNow(row.duedate);
                    if (diff < 0 && (data.debt_lesson > 0 || data.lesson_amount == 0)) {
                        cellCls.push(\'text-success\');
                    } else {
                        cellCls.push(\'text-muted\');
                    }
                    return arr2clstring(cellCls);*/
                }
            },
            {name: \'duedate\', label: \'Окончание\', template: dateTimeTemplate,
                editable: true, editrules: {edithidden: true},
                hidden: true
            },
            {name: \'lesson_amount\', label: \'К-во уроков\', editable:true,
                hidden: true, hidedlg: true
            },
            {name: \'created\', hidden: false, label: \'Создано\', template: createdTemplate}
        ],
        rowattr: function(row, data){
            if (data.sum==0) return {\'class\': \'rowArc\'};
            if (data.sumpay > 0){
                return {\'class\': ((data.sumpay*1 < data.sum*1)? \'rowWarn\' : \'rowYes\')};
            }
        },
        actionsNavOptions: {
            editbutton : false, 
            delbutton : false, 
            editformbutton: true
        },
        navOpts: {add:false, edit:true, del:true} //, search:false
    })
    .on(\'jqGridAddEditBeforeShowForm\', function(e, form) {
        $(\'#dateinvoice\', form).prop(\'disabled\', true);
        var name_typeinvoice = $(\'#name_typeinvoice\', form);
        name_typeinvoice.after(\'<b>\'+name_typeinvoice.val()+\'</b>\').remove();
        
        var add_row = $(\'#duedate\', form).closest(\'tr\').hide();
        $(\'<a href="#" class="dashed">Дополнительно</a>\').insertAfter( $(\'#info\', form) )
        .wrap(\'<p class="mt-2"></p>\')
        .click(function(e){
            e.preventDefault();
            add_row.show();
            $(this).closest(\'p\').remove();
        });
    })
    .on(\'jqGridAddEditAfterShowForm\', function (e, form) {
        $(\'#sum\', form).focus();
        $(\'#dateinvoice\', form).prop(\'disabled\', false);
        $(this).data(\'istatus\', $(\'#status\', form).val() );
    })
    .on(\'jqGridAddEditAfterSubmit\', function(e, jqXhrOrBool, postData, options) {
        if (postData.status &&
            postData.status != $(this).data(\'istatus\') &&
            postData.status != clubSpCard.sp.status)
        rocnfrm(\'Сменить статус спортсмена с "\'+ clubSpCard.sp.status +\'" на "\'+postData.status+\'"?\',
        function() {
            pEDIT(\'idSportsmen\', {
                status: postData.status,
                id: clubSpCard.sp.id,
                change_info: postData.info
            }, clubSpCard.refreshData);
        });
    })
    .on(\'jqGridAddEditAfterSubmit jqGridDeleteAfterComplete\', function(e, rowid, jqXhrOrBool, postData, options) {
        clubSpCard.refreshTabs(\'#t_spPays\', true);
        //updateSpSaldo(\'#tpays\');
    })
    .jqGridColumns()
    .jqGridExport();
});

$("#grpays")
.one(\'reloadGrid\', function(e){
    $(this)
    .on(\'jqGridSerializeGridData\', function(e, postData) {
        postData._where = {sportsmen: clubSpCard.sp.id};
    })
    .jqGridInit({
        postData: {
            filters: SCRM.obj2Filter({payd: 1})
        },
        sortname: \'datepay\', sortorder: \'desc\',
        search: true,
        footerrow: true, userDataOnFooter: true,
        colModel:[
            {name: \'id\', hidden: true, template: idFieldTemplate},
            {name: \'created\', label: \'Создано\', template: createdTemplate},
            {name: \'datepay\', label: \'Дата\', editable: true,
                formoptions: {rowpos:1, colpos:1},
                template: dateTemplate,
                formatter: function (cellvalue, options, rowObject) {
                    return editRowLinkFmt(\'<b>\'+ $.fn.fmatter.call(this, "date", cellvalue, options, rowObject)+\'</b>\', options, rowObject);
                },
                unformat: editRowLinkUnfmt,
                editoptions: {
                    defaultValue: str2date(\'now\',\'d\')
                },
                editrules: {edithidden: true, required: true}
            },
            {name :\'numpay\', label: \'Номер\', width:90, editable:true,
                formoptions:{rowpos:1, colpos:2}
            },
            {name: \'sum\', label: \'Сумма\', width:60, editable: true,
                template: numberTemplate,
                editrules: {edithidden:true, required: true,
                    custom: true, custom_func: function(val, col) {
                        return (val*1 == 0)? [false,\'sum == 0\'] : [true,\'\'];
                    }
                }
            },
            {name: \'payd\', hidden: true},
            {name: \'info\', template: infoTemplate, editable: true},
            {name: \'code1c\', hidden: true, editable: true},
            {name: \'receipt\', hidden: true}
        ],
        rowattr: function(data){
            if (data.payd == 0) return {\'class\': \'rowArc\'};
            if (data.code1c) return {\'class\': \'rowWarn\'};
        },
        navOpts: {add:true, edit:true, del:true}
    })
    .on(\'jqGridSelectRow\', function(e, rid, sel) {
        var grid = $(e.target);
        SCRM.link(clubSpCard, {
            selPay: rid
        });
    })
    .on(\'jqGridLoadComplete\', function(e, data) {
        SCRM.link(clubSpCard, {
            selPay: null
        });
    })
    .on(\'jqGridAddEditSerializeEditData\', function(e, data){
        if (data.oper==\'add\') data.sportsmen = clubSpCard.sp.id;
    })
    .on(\'jqGridAddEditBeforeShowForm\', function (e, form) {
        $(\'#datepay\', form).prop(\'disabled\', true);
    })
    .on(\'jqGridAddEditAfterShowForm\', function (e, form) {
        $(\'#sum\', form).focus();
        $(\'#datepay\', form).prop(\'disabled\', false);
    })
    .on(\'jqGridAddEditAfterSubmit jqGridDeleteAfterComplete\', function(e, rowid, jqXhrOrBool, postData, options) {
        clubSpCard.refreshTabs(\'#t_spInvoice\', true);
        //updateSpSaldo(\'#tinvoice\');
    })
    .jqGridColumns()
    .jqGridExport();
});

$(\'#spLessons\')
.one(\'reloadGrid\', function(e){
    var gridSpLessons = $(this)
    .on(\'jqGridSerializeGridData\', function(e, postData) {
        postData._where = {sportsmen: clubSpCard.sp.id};
    })
    .jqGridInit({
        postData: {
            tableadd: \'idSquad\'
        },
        sortname: \'datestart\', sortorder: \'desc\',
        search:true,
        colModel:[
            {name:\'id\', hidden: true, template: idFieldTemplate},
            {name:\'stype_ico\', index: \'stype_name\', label:\'Тип\',
                width:40, align: \'center\',
                formatter: function(cv, opt, data){
                    return (!cv)? \'\' : makeIco(cv+\' text-muted\', {
                        add: \'title="\'+ data.stype_name +\'" data-toggle="tooltip"\'
                    });
                }
            },
            {name:\'datestart\', label:\'Дата/время\', template: dateTimeTemplate},
            {name:\'created\', label:\'Создано\', template: createdTemplate},
            {name:\'status\', label:\'Статус\', hidden: false, editable:true,
                editrules: {edithidden:true},
                width:40, align: \'center\',
                editRowLinkData: true,
                formatter: function(cv, options, data){
                    return editRowLinkFmt(SCRM.statusFmt(\'idLesson\', data.status), options, data);
                },
                unformat: editRowLinkUnfmt,
                template: selTemplate,
                clubStatus: \'idLesson\', lookupKey: \'alias\'
            },
            {name:\'mark\', label:\'Оценка\', width: 45, editable: true,
                template: numberTemplate,
                unformat: null
            },
            {name:\'trainer_name\', index: \'idTrainer.name\', label:\'Тренер\', width: 90},
            
            {name:\'clubname\', index: \'idClub.name\', label:\'Зал\', width: 90},
            {name:\'sportname\', index: \'idSport.name\', label:\'Дисциплина\', width: 90},
            //{name:\'levelname\', index: \'idLevel.name\', label:\'Уровень\', width: 40},
            //{name:\'squadname\', index: \'idSquad.name\', label:\'Группа\', width: 70},
            
            {name:\'levelname\', index:\'idLevel.name\', label:\'Уровень\', width: 45,
                cellattr: function(rowId, value, rowObject, colModel, arrData) {
                    return \' colspan="2"\';
                },
                formatter: function(value, options, rData){
                    return joinStr([value, rData[\'squadname\'] ]);
                }
            },
            {name:\'squadname\', index: \'idSquad.name\', label:\'Группа\', width: 70,
                cellattr: function(rowId, value, rowObject, colModel, arrData) {
                    return \' style="display:none;"\';
                }
            },
            {name:\'dateinvoice\', label: \'Абонемент\', template: dateTimeTemplate,
                formatter: function(value, options, rData){
                    if (rData.idinvoice==\'0\') return \'\';
                    var str = [\'<a href="#" data-spkey="\'+ clubSpCard.key +\'" data-idinvoice="\'+rData.idinvoice+\'" data-run="/chunk/invoice.lesson">\'];
                    str.push( str2date(rData.dateinvoice, \'d\') );
                    str.push(\'</a>\');
                    return str.join(\'\');
                }
            },
            {name:\'info\', template: infoTemplate, editable:true}
        ],
        rowattr: function(tbl_row, row) {
            row.wo_invoice = ((row.cfg_value||\'\').indexOf(row.status) > -1) && !row.dateinvoice;
            if (row.wo_invoice) {
                return {\'class\': \'table-warning\'};
            }
        },
        navOpts: {add:false, edit:true, del:true}
    })
    .on(\'jqGridAddEditAfterSubmit jqGridDeleteAfterComplete\', function(e, rowid, jqXhrOrBool, postData, options) {
        clubSpCard.refreshTabs(\'#t_spInvoice\', true);
    })
    .on(\'jqGridAddEditAfterShowForm\', function (e, form, op, ddd) {
        var input = $(\'#status\', form).attr(\'data-link\', \'status\').hide();

        var se = {
            status: input.val(),
            statusEd: \'<a href="#" class="btn btn-sm btn-secondary prevent-default" tabIndex="-1" \\
                data-link="class{merge:(~st==alias) toggle=\\\'active\\\'} {on ~chStatus}"> \\
                {{fmtStatus:alias tbl="idLesson"}}</a>\',
            lsn: SCRM.clubStatus.idLesson
        };
        $(\'<div><div class="btn-group btn-group-toggle" data-link="{for lsn ~st=status tmpl=statusEd}"></div></div>\')
        .insertAfter(input).append(input)
        .link(true, se, {
            chStatus: function(e, data) {
                SCRM.link(se, {status: data.linkCtx.data.alias});
            }
        });
    })
    .jqGridColumns()
    .jqGridExport();
});

$(\'#spEventSportsmen\')
.one(\'reloadGrid\', function(e){
    $(this)
    .on(\'jqGridSerializeGridData\', function(e, postData) {
        postData._where = {sportsmen: clubSpCard.sp.id, idevent: clubSpCard.selSpEvent.id};
    })
    .jqGridInit({
        //datatype: \'local\', datatype: \'json\',
        rowList: false, pginput: false,
        sortname: \'name\', sortorder: \'asc\',
        colModel:[
            {name:\'id\', hidden: true, template: idFieldTemplate},
            {name:\'team\', label:\'Команда\', width: 150, editable: true},
            {name:\'name\', label:\'Наименование\', width: 150},
            {name:\'sportsmen\', editable: true, hidden: true},
            {name:\'place\', label:\'Место\', width: 70, editable: true},
            {name:\'result\', label:\'Результат\', width: 70, editable: true},
            {name:\'act\', template: \'actions\', width: 55}
        ],
        actionsNavOptions: {
            delbutton: false
        },
        navOpts: {add:false, edit:false, del:true, search:false}
    })
    .jqGridColumns();
});

$("#grchanges")
.one(\'reloadGrid\', function(e){
    $(this)
    .on(\'jqGridSerializeGridData\', function(e, postData) {
        postData._where = {sportsmen: clubSpCard.sp.id};
    })
    .jqGridInit({
        sortname: \'created\', sortorder: \'desc\',
        colModel:[
            {name:\'id\', hidden: true, template: idFieldTemplate},
            {name:\'created\', hidden: false, label:\'Создано\', template: createdTemplate},
            {name:\'username\', width:100, hidden:true},
            {name:\'chfield\', label: \'Поле\', width:80,
                formatter: function (cellValue, options, rowObject) {
                    return SCRM._fieldName(cellValue);
                }
            },
            {name: \'newvalue\', label: \'Значение\', width:150, editable: \'readonly\'},
            {name: \'oldvalue\', hidden:true},
            {name: \'info\', template: infoTemplate, editable:true}
        ],
        navOpts: {add:false, edit:false, search:false}
    })
    .jqGridColumns();
});

$("#grcars")
.one(\'reloadGrid\', function(e){
    $(this)
    .on(\'jqGridSerializeGridData\', function(e, postData) {
        postData._where = {idsportsmen: clubSpCard.sp.id};
    })
    .jqGridInit({
        sortname: \'created\', sortorder: \'desc\',
        colModel:[
            {name: \'id\', hidden: true, template: idFieldTemplate},
            {name: \'status\', label:\'Статус\', width:80,
            template: selTemplate,
            formatter: function(cv, options, rowObject) {
                return \'<a href="#" data-lead="\'+ rowObject.id +\'" class="prevent-default">\'+ SCRM.statusName(\'idLead\', cv, null, true) +\'</a>\';
            },
            unformat: function(cellValue, options, cell) {
                return $(cell).find(\'i\').data(\'status\');
            },
            clubStatus: \'idCar\', lookupKey: \'alias\'
            },
            {name: \'gosnum\', label: \'Гос номер\', width: 200,editable: true,  setROW: true},
            {name: \'vin\', label: \'VIN\', width: 200, editable: true,  setROW: true},
            {name: \'owner\', label: \'Владелец\', width: 200, editable: true,  setROW: true},
            {template: createdTemplate, hidden: false, label: \'Создано\'},
        ],
        navOpts: {add:false, edit:false, search:false}
    })
    .jqGridColumns();
});

$("#spEvent")
.one(\'reloadGrid\', function(e){
    $(this)
    .on(\'jqGridSerializeGridData\', function(e, postData) {
        postData._where = {\'idEventMember.sportsmen\': clubSpCard.sp.id};
    })
    .on(\'jqGridLoadComplete\', function(e, data) {
        // Если среди данных нет турнира, то обнулить и снять выделения чтобы спрятать Ивенты
        if (clubSpCard.selSpEvent) {
            var selId = clubSpCard.selSpEvent.id;
            var rowIds = $(this).jqGrid(\'getDataIDs\');
            if ($.inArray(selId, rowIds) != -1) {
                $(this).jqGrid(\'setSelection\', selId);
            } else {
                $(this).jqGrid(\'resetSelection\');
                SCRM.link(clubSpCard, {selSpEvent: null});
            }
        }
    })
    .on(\'jqGridSelectRow\', function(e, rid, sel) {
        var grid = $(this);
        SCRM.link(clubSpCard, {
            selSpEvent: grid.jqGrid(\'getRowData\', rid)
        });
        $("#spEventSportsmen").trigger(\'reloadGrid\');
    })
    .jqGridInit({
        sortname: \'datestart\', sortorder: \'desc\',
        colModel:[
            {name:\'id\', hidden: true, template: idFieldTemplate},
            {name:\'status\', label: \'Тип\', width: 80},
            {name:\'name\', label:\'Наименование\', width:250,
                //editable: true, editrules: {required: true},
                cellattr: function (rowId, tv, rawObject, cm, rdata) { 
                    return \'style="white-space: normal;"\';
                }
            },
            {name:\'place\', label:\'Место проведения\', width:200, hidden: true,
                cellattr: function (rowId, tv, rawObject, cm, rdata) { 
                    return \'style="white-space: normal;"\';
                }
            },
            {name:\'datestart\', label:\'Начало\', template:dateTemplate },
            {name:\'dateend\', label:\'Окончание\', template:dateTemplate }
        ],
        navOpts: {add:false, edit:false, del:false, search:false},
        fltrToolbar: true
    })
    .jqGridColumns();
});
//eee
</script>

[[!runHook?hook=`chunk/ecard`]]
<!--[[$tpl_spSaldo]]-->
<!--[[$tplInvoiceLesson]]-->

<style>
    .fa-rotate-45 {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
    }
    .card-title {
        line-height: 1.5;
    }
    [data-roinplace="spFieldEdit"] {
        display: block;
    }
    .spcard-title .roinplace-container {
        min-width: 50%;
    }
    @media (max-width: 991.98px) {
        .spcard-title .roinplace-container {
            min-width: 70%;
        }
    }
    @media (max-width: 767.98px) {
        .spcard-title .roinplace-container {
            flex: 1 1 auto !important;
        }
    }
</style>

<script id="tpl_sportsmenCardTitle" type="x-jsrender">
    <div data-link="text{:spCard^sp.name||\'\'}"></div>
</script>

<script id="tpl_sportsmenCard" type="x-jsrender">
<div data-link="visible{:sp^key} {on \'spFieldEdit\' ~spFieldEdit} {on \'setROW.idSportsmen\' ~eCardSpEdit}">
    <h3 class="section-title mb-0 d-flex align-items-center spcard-title">
        <span data-link="{:sp^name} data-id{:sp^id}" data-field="idSportsmen:name" data-roinplace="fieldEDIT"></span>
        <span class="dropdown ml-2">
            <button class="btn btn-sm btn-icon btn-light" data-toggle="dropdown">
                <i class="fa fa-fw fa-ellipsis-v" data-link="visible{:!loading}"></i>
                <span class="spinner-border spinner-border-sm" role="status" data-link="visible{:loading}"></span>
            </button>
            <div class="dropdown-menu">
                <div class="dropdown-arrow"></div>
                <a href="#" target="_blank" class="dropdown-item"
                    data-link="href{:\'/sportsmens/sportsmen.html?key=\'+key}">Личный кабинет</a>
                {^{for titleMenu ~sp=sp^ tmpl=\'#tplMenuItem\' /}}
                
                <div class="dropdown-divider"></div>
                <div class="d-flex small px-2">
                <a href=\'#\' class="d-block text-muted prevent-default" data-run="/chunk/sp.sysinfo">ID <u data-link="sp^id"></u></a>
                <a href="#" class="d-block text-muted ml-auto fmtCreated stop-propagation"
                    data-link="data-id{:sp^id} text{formatDate:sp^created}" data-tbl="idSportsmen"></a>
                </div>
            </div>
        </span>
    </h3>
    <div class="d-flex">
        <button class="btn btn-subtle-primary btn-xs" title="Сменить статус"
            data-link="html{:sp^status} {on \'click\' changeField \'status\'}
            class{merge:sp_arc toggle=\'btn-subtle-dark\'} title{:\'Сменить статус\'}"></button>

        <!-- <a href="#" class="mx-3 prevent-default" data-link="{on \'click\' ~addInvoice true} {include sp tmpl=\'#tpl_spSaldo\'}"></a> -->
        <!-- <span data-link="{include sp tmpl=\'#tpl_InvoiceLesson\'}"></span> -->
    </div>

    <nav class="nav-scroller border-bottom">
        <div class="nav nav-tabs sptabs" role="tablist" data-link="{for spTabs tmpl=\'navTab\'}">
            [[- data-link="{on \'calculate\' \'[data-toggle=tab]\' ~tabCalculate}"]]
        </div>
    </nav>
    <div class="tab-content mt-3">
        <div id="t_car" class="tab-pane">
            <table id="grcars" data-entity="idCar" class="calculateGrid"></table>
        </div>
        <div id="t_spChanges" class="tab-pane gridBlock">
            <table id="grchanges" data-entity="idChanges" class="calculateGrid"></table>
        </div>

        <div class="tab-pane active" id="t_spInfo">

<div class="row">
    <div class="col-md-6">
        <div class="row">
            <div class="col-lg-4" data-linkfile="" data-file1type="photo"
                data-link="{on sp^key ~S.linkFile \'#tpl_filePhoto1\'}">
            </div>
            <div class="col-lg-8">
                <div class="card card-body mb-2">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="#" target="_blank" data-link="href{:\'/sportsmens/sportsmen.html?key=\'+key}">
                            <i class="fa fa-arrow-up fa-rotate-45 mr-1"></i>
                            <span data-link="html{:sp^username || \'Кабинет\'}"></span>
                        </a>
                        <div class="card-title-control">
                            {^{if !sp^iduser}}
                            <button class="btn btn-icon btn-light" data-link="{on ~idUser}"><i class="fa fa-key"></i></button>
                            {{else}}
                            <div class="dropdown">
                                <button class="btn btn-icon btn-subtle-success" data-toggle="dropdown"><i class="fa fa-key"></i></button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <div class="dropdown-arrow"></div>
                                    <a href="#" class="dropdown-item"
                                        data-run="/chunk/forgotpassword" data-link="data-username{:sp^username}">Восстановление пароля</a>
                                    <div class="dropdown-divider"></div>
                                    <a href="#" class="dropdown-item"
                                        data-link="{on ~idUser}">Отключить</a>
                                </div>
                            </div>
                            {{/if}}
                            [[-<label class="switcher-control">
                                <input type="checkbox" class="switcher-input" data-link="checked{:sp^iduser} {on \'change\' ~idUser}">
                                <span class="switcher-indicator"></span>
                            </label>]]
                        </div>
                    </div>
                    [[-<div data-link="html{:sp^username} visible{:sp^username}" class="mt-2"></div>]]
                </div>
                
                <div class="eCardSpContact mt-3"></div>

            </div>
        </div>

        <div id="sportsmenFiles" data-link="{on sp^key ~S.linkFile \'#tpl_files\'}" data-linkfile=""></div>
    </div>
    <div class="col-md-6">
        <div class="card card-body pb-0">
            <div class="eCard_spManager mt-3"></div>
            [[-<div class="row">
                <div class="col-sm-6 mb-3">
                    <div class="small">{{:_fields.birth}}</div>
                    <a href="#" class="prevent-default" data-name="birth" data-roinplace="spFieldEdit" data-editor="dateedit"
                        data-link="{formatDate:sp^birth showempty=true}"></a>
                </div>
                <div class="col-sm-6 mb-3">
                    <div class="small">{{:_fields.gender}}</div>
                    <b data-link="{:~S.statusName(\'Gender\', sp^gender)}"></b>
                </div>
                <div class="col-12 mb-3">
                    <div class="small">{{:_fields.doc}}</div>
                    <a href="#" class="prevent-default" data-name="doc" data-roinplace="spFieldEdit"
                        data-link="{formatEmpty:sp^doc}"></a>
                </div>
                
                <div class="col-12 mb-3 border-bottom"></div>
                
                <div class="col-sm-6 mb-3">
                    <div class="small">{{:_fields.contract}}</div>
                    <a href="#" class="prevent-default" data-name="contract" data-roinplace="spFieldEdit"
                        data-link="{formatEmpty:sp^contract}"></a>
                </div>
                <div class="col-sm-6 mb-3">
                    <div class="small">{{:_fields.contractdate}}</div>
                    <a href="#" class="prevent-default" data-name="contractdate" data-roinplace="spFieldEdit" data-editor="dateedit"
                        data-link="{formatDate:sp^contractdate showempty=true}"></a>
                </div>
                <div class="col-sm-6 mb-3">
                    <div class="small">{{:_fields.price}}</div>
                    <a href="#" class="prevent-default" data-name="price" data-roinplace="spFieldEdit" data-editor="number"
                        data-link="{formatEmpty:sp^price}"></a>
                </div>
                <div class="col-sm-6 mb-3">
                    <div class="small">{{:_fields.discount}}</div>
                    <b data-link="{:sp^discount}"></b>
                </div>
                
                <div class="col-12 mb-3 border-bottom"></div>
                
                <div class="col-sm-6 mb-2">
                    <div class="small">{{:_fields.meddate}}</div>
                    <a href="#" class="prevent-default" data-name="meddate" data-roinplace="spFieldEdit" data-editor="dateedit"
                        data-link="{formatDate:sp^meddate showempty=true} class{:\'prevent-default \' + ~S.dateDiffClass(sp^meddate)}"></a>
                </div>
                <div class="col-sm-6 mb-3" data-link="">
                    <div class="small">{{:_fields.insdate}}</div>
                    <a href="#" data-name="insdate" data-roinplace="spFieldEdit" data-editor="dateedit"
                        data-link="{formatDate:sp^insdate showempty=true} class{:\'prevent-default \' + ~S.dateDiffClass(sp^insdate)}"></a>
                </div>
            </div>]]
        </div>
        
        [[-<table class="table table-sm table-striped1">
            <tbody id="infotable">
            {^{for infoTable}}
            <tr class="crd_{{:name}}"><th>{{:label||name}}</th><td class="{{:CLS}}">{{:HTML}}</td></tr>
            {{/for}}
            </tbody>
        </table>]]
    </div>
</div>


        </div>
        {^{for spTabs filter=~woTpl ~SP=#data}}
            <div class="tab-pane" id="{{:id}}" data-link="{include tmpl=tpl||\'\'}"></div>
        {{/for}}
    </div>
</div>
</script>


<script id="tpl_spCardMoneyMenu" type="text/x-jsrender">
<div class="d-flex justify-content-between mb-2">
    <button class="btn btn-success btn-sm btn-addinvoice" data-link="{on ~addInvoice ~paymode}"><i class="fa fa-plus"></i></button>
    {{include tmpl=#content /}}
    <button class="btn btn-secondary btn-sm ml-1" data-link="{on ~showGridFilter}"><i class="fa fa-filter"></i></button>
    <div class="dropdown align-self-start ml-auto">
        <button class="btn btn-icon btn-light text-muted mt-n1" data-toggle="dropdown"><i class="fa fa-fw fa-wrench"></i></button>
        <div class="dropdown-menu dropdown-menu-right">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item prevent-default" data-run="/chunk/printrevise">Акт сверки</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~recoverInvoice}">Пересчитать</a>
        </div>
    </div>
</div>
</script>

<script id="tpl_idSportsmenSquad" type="text/x-jsrender">
{^{for idSportsmenSquad}}
<div class="list-group-item">
    <div class="list-group-item-body">
        <h4 class="list-group-item-title">
            <i class="fa fa-check-circle mr-1" data-link="visible{:is_main}"></i>
            {{:level_name}} | {{:squad_name}}
        </h4>
        <p class="list-group-item-text text-truncate text-muted">
        {{:club_name}}, {{:sport_name}}
        </p>
    </div>
    {{roDMenu}}
        <a href="#" class="dropdown-item prevent-default"
            data-link="visible{:!is_main} {on ~mainSquad}">
            <i class="fa fa-check-circle dropdown-icon"></i> Сделать основной</a>
        <a href="#" class="dropdown-item prevent-default" 
            data-link="{on ~deleteSquad}">
            <i class="fa fa-archive dropdown-icon"></i> Отчислить</a>
        <div class="dropdown-divider"></div>
        <a href="#" class="d-block small text-muted px-2 text-right fmtCreated stop-propagation"
            data-id="{{:id}}" data-tbl="idSportsmenSquad">
            <i class="fa fa-clock-o"></i> {{formatDate:created}}</a>
    {{/roDMenu}}
</div>
{{/for}}
{^{if arcSportsmenSquad && arcSportsmenSquad^length ~sp=sp}}
    <div id="headArcSquad" class="list-group-item text-muted">
        <button class="btn btn-reset" data-toggle="collapse" data-target="#arcSportsmenSquad" aria-expanded="false" aria-controls="arcSportsmenSquad">
            <span class="collapse-indicator mr-2"><i class="fa fa-fw fa-caret-right"></i></span>
            Архив <span class="badge badge-subtle badge-dark" data-link="arcSportsmenSquad^length"></span>
        </button>
    </div>
    <div id="arcSportsmenSquad" class="collapse text-muted" aria-labelledby="headArcSquad">
        {^{for arcSportsmenSquad}}
            <div class="list-group-item">
                <div>
                    <b>{{:level_name}} | {{:squad_name}}</b><br>
                    {{:club_name}}, {{:sport_name}}<br>
                    <small>{{formatDate:created}} - {{formatDate:dateend}}</small>
                </div>
                {^{if !~root^sp_arc}}
                    {{roDMenu}}
                    <a href="#" class="dropdown-item prevent-default" data-link="{on ~unDeleteSquad}">
                    <i class="fa fa-archive dropdown-icon"></i> Восстановить</a>
                    {{/roDMenu}}
                {{/if}}
            </div>
        {{/for}}
    </div>
{{/if}}
</script>

<script id="tpl_sportsmenContact" type="text/x-jsrender">
<div class="list-group-item">
    <div class="list-group-item-body">
        <h4 class="list-group-item-title">{{:name}}</h4>
        [[-<p class="list-group-item-text text-truncate text-muted">
        {{:club_name}}, {{:sport_name}}
        </p>]]
    </div>
    
    {{roDMenu}}
        <a href="#" class="dropdown-item prevent-default"
            data-link="{on ~deleteContact}">
            <i class="fa fa-trash dropdown-icon"></i> Удалить</a>
        <div class="dropdown-divider"></div>
        <a href="#" class="d-block small text-muted px-2 text-right fmtCreated stop-propagation" data-id="{{:id}}" data-tbl="idContact">
            <i class="fa fa-clock-o"></i> {{formatDate:created}}</a>
    {{/roDMenu}}
</div>
</script>
',
    'richtext' => 0,
    'template' => 0,
    'menuindex' => 13,
    'searchable' => 0,
    'cacheable' => 1,
    'createdby' => 1,
    'createdon' => 1668777824,
    'editedby' => 1,
    'editedon' => 1668942663,
    'deleted' => 0,
    'deletedon' => 0,
    'deletedby' => 0,
    'publishedon' => 1612791360,
    'publishedby' => 0,
    'menutitle' => '',
    'donthit' => 0,
    'privateweb' => 0,
    'privatemgr' => 0,
    'content_dispo' => 0,
    'hidemenu' => 1,
    'class_key' => 'modDocument',
    'context_key' => 'web',
    'content_type' => 1,
    'uri' => 'handlers/spcard.html',
    'uri_override' => 0,
    'hide_children_in_tree' => 0,
    'show_in_tree' => 1,
    'properties' => NULL,
    'club_id' => 213,
    '_content' => '<style>
    .club-file-created {
        display:none;
    }
    .club-filerow:hover .club-file-created {
        display:inline;
    }
    .club-photo .user-avatar {
        width: 7rem;
        height: 7rem;
        font-size: 7rem;
    }
    .club-photo .user-avatar button {
        position: absolute;
        left: 2px;
        bottom: 2px;
    }
</style>

<script id="tpl_files" type="text/x-jsrender">
<div class="card spinner-parent" data-link="visible{:#data}">
    <div class="card-body">
        <div class="d-flex justify-content-between">
            <h3 class="card-title mb-0">Файлы</h3>
            <div class="card-title-control mr-n2">
                {^{if loading}}
                <span class="spinner-border spinner-border-sm" role="status"></span>
                {{else add && add^length && !showSelect}}
                <button class="btn btn-icon btn-light"
                    data-link="{on ~uploadFileList}"><i class="fa fa-upload"></i></button>
                {{/if}}
            </div>
        </div>
        <div class="mt-2 d-none" data-link="class{merge:showSelect toggle=\'d-flex\'} class{merge:!showSelect toggle=\'d-none\'}">
            <select class="form-control flex-grow-1" data-link="post^filetype">
                <option value="">-- Загрузить файл --</option>
                {^{for add}}
                    <option value="{{:alias}}">{{:name}}</option>
                {{/for}}
            </select>
            <button class="btn btn-primary ml-2"
                data-link="visible{:post^filetype} {on ~uploadFileList}">
                <i class="fa fa-upload"></i>
            </button>
        </div>
    </div>
    <div class="list-group list-group-bordered list-group-reflow"
        data-link="{for rows ~pd=#data tmpl=\'#tpl_fileRow\'}">
    </div>
</div>
</script>

<script id="tpl_fileRow" type="text/x-jsrender">
<div class="list-group-item club-filerow">
    <div class="list-group-item-body">
        {{if filetype_name}}
        <div class="text-muted small" data-link="visible{:filetype_name}">{{:filetype_name}}
            <a href="#" class="club-file-created fmtCreated" data-id="{{:id}}" data-tbl="idFiles">{{formatDateTime:created}}</a>
        </div>
        {{/if}}
        <a href="{{:filepath}}" target="_blank" download="{{:name}}.{{:fileext}}" data-permis="{{:permis}}"
            class="club-file">
            <i class="fa fa-file-o mr-2"></i>
            <span class="roinplacetext">{{:name}}</span>.{{:fileext}}</a>
    </div>
    {{roDMenu ~hidden=(permis.indexOf(\'edit\') < 0)}}
        <a href="#" class="dropdown-item prevent-default" data-link="{on ~editFile}">
            <i class="fa fa-pencil dropdown-icon"></i> Редактировать</a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item prevent-default" data-link="{on ~delFile}">
            <i class="fa fa-trash dropdown-icon"></i> Удалить</a>
    {{/roDMenu}}
</div>
</script>

<script id="tpl_filePhoto1" type="text/x-jsrender">
    <div class="text-center spinner-parent mb-2 club-photo">
        <figure class="user-avatar d-block m-auto" data-link="data-imgkey{:file1^key}">
            <a href="#" data-link="href{:file1^md||\'#\'} {on ~clickPhoto1}" accept="image/*">
                <img src="" alt="" data-link="src{:file1^sm||~S.emptyImg(gender)}">
            </a>
            <button class="lb-element btn btn-icon btn-secondary"
                data-link="{on ~S.uploadFile} visible{:file1^modify}" accept="image/*">
                <span class="spinner-border spinner-border-sm" role="status" data-link="visible{:loading}"></span>
                <i class="fa fa-camera" data-link="visible{:!loading}"></i>
            </button>
        </figure>
    </div>
</script>

<script>
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

SCRM._fieldName = function(field){
    return SCRM.lexicon.idSportsmen[field] || field || \'\';
}

window.clubSpCard = {
    sp: {},
    spTabs: [
        {id: \'t_spInfo\', name: \'Инфо\', active: true, tpl: \'-\'},
        {id: \'t_car\', name: \'Транспорт\', tpl: \'-\'},
        {id: \'t_spChanges\', name: \'История\', tpl: \'-\'}
    ],
    titleMenu: [ ],
    dbValues: {
        idTrainer: [ ]
    },
    clubStatus: {},
    _fields: SCRM.lexicon.idSportsmen,
    pnlSp: $(\'<div class="spinner-parent"></div>\').appendTo(\'body\'),
    loading: true,
    selSpEvent: null,
    changeField: function(chfield, e, data) {
        SCRM._run(\'/chunk/sp.changefield\', {
            e: e,
            chfield: chfield,
            postData: {
                id: clubSpCard.sp.id
            }
        });
    },
    changeSportsmenSquad: function(data) {
        pEDIT(\'idSportsmenSquad\', data, clubSpCard.refreshData);
    },
    refreshTabs: function(tabs, refreshData) {
        if (tabs) $.each(tabs.split(\',\'), function(i, v){
            $(\'[href="\'+ v +\'"]\', clubSpCard.sptabs).addClass(\'calculate\');
        });
        if (refreshData) clubSpCard.refreshData();
    },
    refreshData: function() {
        clubSpCard.reloadData(function(data) {
            clubSpCard.pnlSp.trigger(\'OnRefreshSpData\', data);
        });
    },
    reloadData: function(callback) {
        var tabInfo = $(\'#t_spInfo\', clubSpCard.pnlSp);
        spinnr(true, tabInfo);
        SCRM.link(clubSpCard, {loading: true});
        $(\'form.roinplace-container button[type="reset"]\', clubSpCard.pnlSp).click(); // Выйти из режима редактора в полях
        
        pJSON(\'/data/sportsmen\', {
            key: clubSpCard.key
        }, function(data) {
            var nd = {
                idSportsmen_arc: data.opts.idSportsmen_arc.split(\',\'),
                sp: data,
                loading: false,
                arcSportsmenSquad: []
            };
            nd.sp_arc = in_array(nd.sp.status, nd.idSportsmen_arc);
            
            nd.idSportsmenSquad = $.map(data.idSportsmenSquad, function(v, i) {
                if (!v.dateend) return v;
                nd.arcSportsmenSquad.push(v);
            });
            
            SCRM.link(clubSpCard, nd);
            
            $(\'[data-linkfile]\').trigger(data.key, $.extend(data.files, {
                gender: data.gender
            }));
            
            var tab = $(\'[data-toggle="tab"].calculate.active\', clubSpCard.sptabs).trigger(\'calculate\');
            console.log(\'LoaddCalculate\', tab);
            
            SCRM._run(\'/chunk/ecard\', {
                edata: clubSpCard.sp,
                block: clubSpCard.eCardSpContact,
                ecard: \'spContact\',
                ev: \'setROW.idSportsmen\'
            });
            
            SCRM._run(\'/chunk/ecard\', {
                edata: clubSpCard.sp,
                block: $(\'.eCard_spManager\', clubSpCard.pnlSp),
                ecard: \'spManager\',
                ev: \'setROW.idSportsmen\'
            });

            if (callback) callback(clubSpCard);
            clubSpCard.pnlSp.trigger(\'OnLoadSpData\', clubSpCard);
            spinnr(false, tabInfo);
        });
    }
};
clubSpCard.addMenu = clubSpCard.spTabs; // TODO: Убрать. Оставлено для совместимости

SCRM.setClubStatus([[!clubStatus?tbl=`idSportsmen,idSchedule,Gender`]]);
SCRM.setClubStatus([[!clubStatus?tbl=`ecard` &alias=`spContact,spManager,spSysinfo`]])

$.views.tags(\'spCardMoneyMenu\', {
    contentCtx: true,
    template: \'#tpl_spCardMoneyMenu\'
});

$.templates(\'#tpl_sportsmenCard\').link(clubSpCard.pnlSp, clubSpCard, {
    spFieldEdit: function(e, data, txt) {
        var d = data.linkCtx.data;
        if (d.sp) {
            var edata = {
                id: d.sp.id
            };
            edata[ $(e.target).data(\'name\') ] = txt;
            pEDIT(\'idSportsmen\', edata, d.refreshData);
        }
    },
    eCardSpEdit: function(e, data, postData, edata) {
        //console.log("eCardSpEdit", e, data, postData, edata)
        SCRM.link(clubSpCard.sp, edata);
    },
    addSquad: function(e, data) {
        SCRM._run(\'/chunk/squadlist\', {
            post: {
                ismain: \'0\',
                sportsmen: clubSpCard.sp.id
            },
            callback: clubSpCard.refreshData
        });
    },
    mainSquad: function(e, data) {
        pEDIT(\'idSportsmen\', {
            id: data.linkCtx.data.sportsmen,
            squad: data.linkCtx.data.squad,
            ignore_squad: 1
        }, clubSpCard.refreshData);
        /*clubSpCard.changeSportsmenSquad({
            id: data.linkCtx.data.id,
            //oper: \'add\', // Добавление архивирует старую главную группу
            //squad: data.linkCtx.data.squad,
            //sportsmen: clubSpCard.sp.id,
            ismain: 1
        });*/
    },
    deleteSquad: function(e, data){
        rocnfrm(\'Удалить из группы?\', function(){
            clubSpCard.changeSportsmenSquad({
                id: data.linkCtx.data.id,
                published: \'\'
            });
        });
    },
    unDeleteSquad: function(e, data){
        clubSpCard.changeSportsmenSquad({
            id: data.linkCtx.data.id,
            published: 1
        });
    },
    addInvoice: function(paymode, e){
        //e.preventDefault();
        var opts = {
            key: clubSpCard.key,
            paymode: paymode,
            payd: paymode,
            modal: {
                ok: \'Записать\'
            }
        };
        SCRM._run(\'/chunk/newinvoice\', opts);
    },
    recoverInvoice: function(e) {
        pEDIT(\'idInvoicePay\', {
            oper: \'fix\',
            id: clubSpCard.sp.id
        }, function(){
            clubSpCard.refreshTabs(\'#t_spInvoice\', true);
        });
    },
    addContact: function(e, data){
        SCRM.prompt(\'Добавить контакт\', function(txt){
            pEDIT(\'idContact\', {
                oper: \'add\',
                sportsmen: clubSpCard.sp.id,
                name: txt
            }, clubSpCard.refreshData);
        });
    },
    deleteContact: function(e, data){
        rocnfrm(\'Удалить контакт?\', function(){
            pEDIT(\'idContact\', {
                oper: \'del\',
                id: data.linkCtx.data.id
            }, clubSpCard.refreshData);
        });
    },
    idUser: function(e, data) {
        e.preventDefault();
        var d = data.linkCtx.data;
        //var checked = $(e.target).prop(\'checked\');
        //$(e.target).prop(\'checked\', !checked);
        if (!d.sp.iduser) {
            SCRM._run(\'/chunk/newcabinet\', {
                postData: {
                    user_group: \'idSportsmen\',
                    email: d.sp.email,
                    iduser_row: d.sp.id,
                    name: d.sp.name,
                    fullname: d.sp.contact || d.sp.name
                },
                success: d.refreshData
            });
        } else rocnfrm(\'Отключить Кабинет?\', function(){
            pEDIT(\'idSportsmen\', {
                id: d.sp.id,
                iduser: 0
            }, d.refreshData);
        });
    },
    cutPay: function(e, data) {
        SCRM.link(clubSpCard, {memPay: clubSpCard.selPay});
    },
    pastePay: function(e, data) {
        pEDIT(\'idPay\', {
            oper: \'move\',
            id: clubSpCard.memPay,
            sportsmen: clubSpCard.sp.id
        }, function(data){
            SCRM.link(clubSpCard, {memPay: data.id});
            clubSpCard.refreshTabs(\'#t_spPays,#t_spInvoice\', true);
        });
    },
    showGridFilter: function(e) {
        $(e.currentTarget).hide()
        .closest(\'.gridBlock\').find(\'[data-entity]\').eq(0).jqGridFilterToolbar(true);
    }
});
clubSpCard.eCardSpContact = $(\'.eCardSpContact\', clubSpCard.pnlSp);

$.observe(clubSpCard, \'sp\', function(e, data){
    SCRM.link(SCRM, {idSportsmen: data.value});
});
clubSpCard.sptabs = $(\'.sptabs\', clubSpCard.pnlSp);

SCRM._service.spCard = function(sp_data, callback) {
    if (sp_data) {
        if (!sp_data.key && sp_data.sp) sp_data.key = sp_data.sp.key;
        if (clubSpCard.key != sp_data.key) {
            $(\'[data-toggle="tab"]\', clubSpCard.sptabs).addClass(\'calculate\');
        }
    }
    SCRM.link(clubSpCard, sp_data);
    if (clubSpCard.key) {
        if (clubSpCard.cardHolder == \'modal\') {
            if (!clubSpCard._mdl) {
                var _mdlData = {
                    zindex: 1035,
                    cm_size: \'lg\',
                    spCard: clubSpCard,
                    hideRemove: false,
                    title: \'#tpl_sportsmenCardTitle\'
                };
                clubSpCard._mdl = club_Drawer(_mdlData)
                .on(\'shown.bs.modal\', function(e){
                    $(document).off(\'focusin.bs.modal\'); //TODO: зачем?
                });
                //console.log(clubSpCard._mdl, _mdlData);
                
            } else if (!clubSpCard._mdl.hasClass(\'show\')) {
                clubSpCard._mdl.modal(\'show\');
            }
            clubSpCard._mdl.find(\'.modal-body\').append(clubSpCard.pnlSp);
        } else {
            clubSpCard.pnlSp.appendTo(clubSpCard.cardHolder);
        }

        clubSpCard.reloadData(callback);
    } else {
        if (callback) callback(clubSpCard);
    }
}

$(document)
.on(\'clubUpdateSpData\', function(e, data){ // Если что-то где-то на странице обновляет спортсмена - эта штука срабатывает
    if (data.id == (clubSpCard.sp||{}).id) {
        clubSpCard.refreshTabs(data.tab||\'#t_spPays,#t_spInvoice\', true);
    }
})
.on(\'changeGridData.idSportsmen\', function(e, params) {
    if (params.id == (clubSpCard.sp||{}).id) {
        clubSpCard.reloadData();
    }
})
.on(\'setROW.idSportsmen\', function(e, params) {
    if ((params || {}).id == (clubSpCard.sp||{}).id) {
        SCRM.link(clubSpCard.sp, params);
    }
});


$("#grinvoice")
.one(\'reloadGrid\', function(e){
    $(this)
    .on(\'jqGridSerializeGridData\', function(e, postData) {
        postData._where = {sportsmen: clubSpCard.sp.id};
    })
    .jqGridInit({
        sortname: \'dateinvoice\', sortorder: \'desc\',
        footerrow: true, userDataOnFooter: true,
        colModel:[
            //{name: \'act\', template: \'actions\', width: 38},
            {name: \'id\', hidden: true, template: idFieldTemplate},
            {name:\'name_typeinvoice\', index: \'idInvoiceType.name\', label:\'Тип\', width:120,
                editable: \'readonly\',
                formatter: function(cv, options, row) {
                    if (row.isauto==\'1\') cv = makeIco(\'fa-toggle-on\', {big:0}) +\' \'+ cv;
                    return editRowLinkFmt(cv, options, row);
                },
                unformat: function(cellValue, options, cell) {
                    return $(\'a\', cell).html();
                }
            },
            {name:\'period_name\', index: \'dateinvoice\', label:\'Период\', width:70,
                formatter: function(cellValue, options, row) {
                    return (row.invtype_period && row.dateinvoice)?
                        $.jgrid.parseDate("ISO8601Long", row.dateinvoice, "M Y")
                        : \'\';
                }
            },
            {name:\'dateinvoice\', label:\'Дата\', editable: true, template: dateTemplate,
                editrules: {edithidden:true, required:true}
            },
            {name:\'sum\', label:\'Сумма\', editable: true,
                template: numberTemplate,
                formatter: function(cv, options, row) {
                    if (options.rowId == \'\') return row.sum; // if footer
                    if (row.edited && !row.status && row.isauto==1) row.status = \'na\';
                    var add = (row.status)? SCRM.statusFmt(\'idSportsmen\', row.status, \'name\', true)+\' \' : \'\';
                    return add + row.sum;
                },
                unformat: function(cellvalue, options, cell) {
                    return $.trim( $(cell).text() );
                },
                editrules: {edithidden:true, required:true}
            },
            
            {name: \'status\', label: \'Статус\', editable: true,
                hidden: true, editrules: {edithidden: true},
                edittype: \'select\',
                editoptions: {
                    value: function(){
                        var inv_status = $.map(SCRM.clubStatus.idSportsmen, function(v, i){
                            if (v.extended && v.extended.idInvoice) return {
                                id: v.name,
                                name: v.name
                            };
                        });
                        inv_status.unshift({id: \'\', name: \'\'});
                        return makeGridOpts(inv_status);
                    }
                },
                formoptions: {
                    label: \'Статус \'+SCRM.hintLink(\'invoice_status\')
                }
            },
            
            {name: \'info\', template: infoTemplate, editable:true},
            {name: \'maxdatepay\', label: \'Оплата\', width: 120, template: dateTemplate, 
                formatter: function(cv, options, row) {
                    cv = (cv)? str2date(cv,\'d\') : \'\';
                    if (cv && row.sumpay) {
                        var sumpay = row.sumpay.split(\'.\');
                        row.sumpay = (sumpay[1]==\'00\')? sumpay[0] : row.sumpay;
                        cv = row.sumpay+\' - \'+cv;
                    }
                    return cv;
                }
            },
            //{name:\'sumpay\', label:\'Сумма оплачено\', template: numberTemplate},
            {name: \'duedate_format\', index: \'duedate\', label: SCRM._fieldName(\'duedate\'),
                width: 105, align: \'right\',
                formatter: function(cv, options, row){
                    var str = [],
                        diff = diffNow(row.duedate);
                    if (row.duedate) {
                        row.lesson_amount *= 1;
                        row.rest_lesson = row.lesson_amount - (row.cnt_lesson||0)*1;
                        var cls = (diff < 0 && (row.rest_lesson > 0 || row.lesson_amount == 0))? \'text-success\':\'text-muted\';
                        str.push(\'<a href="#" class="\'+ cls +\'" data-spkey="\'+ clubSpCard.key +\'" data-idinvoice="\'+row.id+\'" data-run="/chunk/invoice.lesson">\');
                        if (row.lesson_amount > 0 || row.rest_lesson != 0) {
                            str.push(row.rest_lesson);
                        }
                        // if (diff > -90 || row.name_typeinvoice || residue===0) 
                        str.push( \' ~ \'+str2date(row.duedate,\'d\') ); // Если < 3 мес или idInvoice
                        str.push(\'</a>\');
                    }
                    return str.join(\'\'); // если пустое, будет пустая строка
                },
                cellattr: function(rowId, cellValue, data, cm, row){
                    /*var cellCls = [], diff = diffNow(row.duedate);
                    if (diff < 0 && (data.debt_lesson > 0 || data.lesson_amount == 0)) {
                        cellCls.push(\'text-success\');
                    } else {
                        cellCls.push(\'text-muted\');
                    }
                    return arr2clstring(cellCls);*/
                }
            },
            {name: \'duedate\', label: \'Окончание\', template: dateTimeTemplate,
                editable: true, editrules: {edithidden: true},
                hidden: true
            },
            {name: \'lesson_amount\', label: \'К-во уроков\', editable:true,
                hidden: true, hidedlg: true
            },
            {name: \'created\', hidden: false, label: \'Создано\', template: createdTemplate}
        ],
        rowattr: function(row, data){
            if (data.sum==0) return {\'class\': \'rowArc\'};
            if (data.sumpay > 0){
                return {\'class\': ((data.sumpay*1 < data.sum*1)? \'rowWarn\' : \'rowYes\')};
            }
        },
        actionsNavOptions: {
            editbutton : false, 
            delbutton : false, 
            editformbutton: true
        },
        navOpts: {add:false, edit:true, del:true} //, search:false
    })
    .on(\'jqGridAddEditBeforeShowForm\', function(e, form) {
        $(\'#dateinvoice\', form).prop(\'disabled\', true);
        var name_typeinvoice = $(\'#name_typeinvoice\', form);
        name_typeinvoice.after(\'<b>\'+name_typeinvoice.val()+\'</b>\').remove();
        
        var add_row = $(\'#duedate\', form).closest(\'tr\').hide();
        $(\'<a href="#" class="dashed">Дополнительно</a>\').insertAfter( $(\'#info\', form) )
        .wrap(\'<p class="mt-2"></p>\')
        .click(function(e){
            e.preventDefault();
            add_row.show();
            $(this).closest(\'p\').remove();
        });
    })
    .on(\'jqGridAddEditAfterShowForm\', function (e, form) {
        $(\'#sum\', form).focus();
        $(\'#dateinvoice\', form).prop(\'disabled\', false);
        $(this).data(\'istatus\', $(\'#status\', form).val() );
    })
    .on(\'jqGridAddEditAfterSubmit\', function(e, jqXhrOrBool, postData, options) {
        if (postData.status &&
            postData.status != $(this).data(\'istatus\') &&
            postData.status != clubSpCard.sp.status)
        rocnfrm(\'Сменить статус спортсмена с "\'+ clubSpCard.sp.status +\'" на "\'+postData.status+\'"?\',
        function() {
            pEDIT(\'idSportsmen\', {
                status: postData.status,
                id: clubSpCard.sp.id,
                change_info: postData.info
            }, clubSpCard.refreshData);
        });
    })
    .on(\'jqGridAddEditAfterSubmit jqGridDeleteAfterComplete\', function(e, rowid, jqXhrOrBool, postData, options) {
        clubSpCard.refreshTabs(\'#t_spPays\', true);
        //updateSpSaldo(\'#tpays\');
    })
    .jqGridColumns()
    .jqGridExport();
});

$("#grpays")
.one(\'reloadGrid\', function(e){
    $(this)
    .on(\'jqGridSerializeGridData\', function(e, postData) {
        postData._where = {sportsmen: clubSpCard.sp.id};
    })
    .jqGridInit({
        postData: {
            filters: SCRM.obj2Filter({payd: 1})
        },
        sortname: \'datepay\', sortorder: \'desc\',
        search: true,
        footerrow: true, userDataOnFooter: true,
        colModel:[
            {name: \'id\', hidden: true, template: idFieldTemplate},
            {name: \'created\', label: \'Создано\', template: createdTemplate},
            {name: \'datepay\', label: \'Дата\', editable: true,
                formoptions: {rowpos:1, colpos:1},
                template: dateTemplate,
                formatter: function (cellvalue, options, rowObject) {
                    return editRowLinkFmt(\'<b>\'+ $.fn.fmatter.call(this, "date", cellvalue, options, rowObject)+\'</b>\', options, rowObject);
                },
                unformat: editRowLinkUnfmt,
                editoptions: {
                    defaultValue: str2date(\'now\',\'d\')
                },
                editrules: {edithidden: true, required: true}
            },
            {name :\'numpay\', label: \'Номер\', width:90, editable:true,
                formoptions:{rowpos:1, colpos:2}
            },
            {name: \'sum\', label: \'Сумма\', width:60, editable: true,
                template: numberTemplate,
                editrules: {edithidden:true, required: true,
                    custom: true, custom_func: function(val, col) {
                        return (val*1 == 0)? [false,\'sum == 0\'] : [true,\'\'];
                    }
                }
            },
            {name: \'payd\', hidden: true},
            {name: \'info\', template: infoTemplate, editable: true},
            {name: \'code1c\', hidden: true, editable: true},
            {name: \'receipt\', hidden: true}
        ],
        rowattr: function(data){
            if (data.payd == 0) return {\'class\': \'rowArc\'};
            if (data.code1c) return {\'class\': \'rowWarn\'};
        },
        navOpts: {add:true, edit:true, del:true}
    })
    .on(\'jqGridSelectRow\', function(e, rid, sel) {
        var grid = $(e.target);
        SCRM.link(clubSpCard, {
            selPay: rid
        });
    })
    .on(\'jqGridLoadComplete\', function(e, data) {
        SCRM.link(clubSpCard, {
            selPay: null
        });
    })
    .on(\'jqGridAddEditSerializeEditData\', function(e, data){
        if (data.oper==\'add\') data.sportsmen = clubSpCard.sp.id;
    })
    .on(\'jqGridAddEditBeforeShowForm\', function (e, form) {
        $(\'#datepay\', form).prop(\'disabled\', true);
    })
    .on(\'jqGridAddEditAfterShowForm\', function (e, form) {
        $(\'#sum\', form).focus();
        $(\'#datepay\', form).prop(\'disabled\', false);
    })
    .on(\'jqGridAddEditAfterSubmit jqGridDeleteAfterComplete\', function(e, rowid, jqXhrOrBool, postData, options) {
        clubSpCard.refreshTabs(\'#t_spInvoice\', true);
        //updateSpSaldo(\'#tinvoice\');
    })
    .jqGridColumns()
    .jqGridExport();
});

$(\'#spLessons\')
.one(\'reloadGrid\', function(e){
    var gridSpLessons = $(this)
    .on(\'jqGridSerializeGridData\', function(e, postData) {
        postData._where = {sportsmen: clubSpCard.sp.id};
    })
    .jqGridInit({
        postData: {
            tableadd: \'idSquad\'
        },
        sortname: \'datestart\', sortorder: \'desc\',
        search:true,
        colModel:[
            {name:\'id\', hidden: true, template: idFieldTemplate},
            {name:\'stype_ico\', index: \'stype_name\', label:\'Тип\',
                width:40, align: \'center\',
                formatter: function(cv, opt, data){
                    return (!cv)? \'\' : makeIco(cv+\' text-muted\', {
                        add: \'title="\'+ data.stype_name +\'" data-toggle="tooltip"\'
                    });
                }
            },
            {name:\'datestart\', label:\'Дата/время\', template: dateTimeTemplate},
            {name:\'created\', label:\'Создано\', template: createdTemplate},
            {name:\'status\', label:\'Статус\', hidden: false, editable:true,
                editrules: {edithidden:true},
                width:40, align: \'center\',
                editRowLinkData: true,
                formatter: function(cv, options, data){
                    return editRowLinkFmt(SCRM.statusFmt(\'idLesson\', data.status), options, data);
                },
                unformat: editRowLinkUnfmt,
                template: selTemplate,
                clubStatus: \'idLesson\', lookupKey: \'alias\'
            },
            {name:\'mark\', label:\'Оценка\', width: 45, editable: true,
                template: numberTemplate,
                unformat: null
            },
            {name:\'trainer_name\', index: \'idTrainer.name\', label:\'Тренер\', width: 90},
            
            {name:\'clubname\', index: \'idClub.name\', label:\'Зал\', width: 90},
            {name:\'sportname\', index: \'idSport.name\', label:\'Дисциплина\', width: 90},
            //{name:\'levelname\', index: \'idLevel.name\', label:\'Уровень\', width: 40},
            //{name:\'squadname\', index: \'idSquad.name\', label:\'Группа\', width: 70},
            
            {name:\'levelname\', index:\'idLevel.name\', label:\'Уровень\', width: 45,
                cellattr: function(rowId, value, rowObject, colModel, arrData) {
                    return \' colspan="2"\';
                },
                formatter: function(value, options, rData){
                    return joinStr([value, rData[\'squadname\'] ]);
                }
            },
            {name:\'squadname\', index: \'idSquad.name\', label:\'Группа\', width: 70,
                cellattr: function(rowId, value, rowObject, colModel, arrData) {
                    return \' style="display:none;"\';
                }
            },
            {name:\'dateinvoice\', label: \'Абонемент\', template: dateTimeTemplate,
                formatter: function(value, options, rData){
                    if (rData.idinvoice==\'0\') return \'\';
                    var str = [\'<a href="#" data-spkey="\'+ clubSpCard.key +\'" data-idinvoice="\'+rData.idinvoice+\'" data-run="/chunk/invoice.lesson">\'];
                    str.push( str2date(rData.dateinvoice, \'d\') );
                    str.push(\'</a>\');
                    return str.join(\'\');
                }
            },
            {name:\'info\', template: infoTemplate, editable:true}
        ],
        rowattr: function(tbl_row, row) {
            row.wo_invoice = ((row.cfg_value||\'\').indexOf(row.status) > -1) && !row.dateinvoice;
            if (row.wo_invoice) {
                return {\'class\': \'table-warning\'};
            }
        },
        navOpts: {add:false, edit:true, del:true}
    })
    .on(\'jqGridAddEditAfterSubmit jqGridDeleteAfterComplete\', function(e, rowid, jqXhrOrBool, postData, options) {
        clubSpCard.refreshTabs(\'#t_spInvoice\', true);
    })
    .on(\'jqGridAddEditAfterShowForm\', function (e, form, op, ddd) {
        var input = $(\'#status\', form).attr(\'data-link\', \'status\').hide();

        var se = {
            status: input.val(),
            statusEd: \'<a href="#" class="btn btn-sm btn-secondary prevent-default" tabIndex="-1" \\
                data-link="class{merge:(~st==alias) toggle=\\\'active\\\'} {on ~chStatus}"> \\
                {{fmtStatus:alias tbl="idLesson"}}</a>\',
            lsn: SCRM.clubStatus.idLesson
        };
        $(\'<div><div class="btn-group btn-group-toggle" data-link="{for lsn ~st=status tmpl=statusEd}"></div></div>\')
        .insertAfter(input).append(input)
        .link(true, se, {
            chStatus: function(e, data) {
                SCRM.link(se, {status: data.linkCtx.data.alias});
            }
        });
    })
    .jqGridColumns()
    .jqGridExport();
});

$(\'#spEventSportsmen\')
.one(\'reloadGrid\', function(e){
    $(this)
    .on(\'jqGridSerializeGridData\', function(e, postData) {
        postData._where = {sportsmen: clubSpCard.sp.id, idevent: clubSpCard.selSpEvent.id};
    })
    .jqGridInit({
        //datatype: \'local\', datatype: \'json\',
        rowList: false, pginput: false,
        sortname: \'name\', sortorder: \'asc\',
        colModel:[
            {name:\'id\', hidden: true, template: idFieldTemplate},
            {name:\'team\', label:\'Команда\', width: 150, editable: true},
            {name:\'name\', label:\'Наименование\', width: 150},
            {name:\'sportsmen\', editable: true, hidden: true},
            {name:\'place\', label:\'Место\', width: 70, editable: true},
            {name:\'result\', label:\'Результат\', width: 70, editable: true},
            {name:\'act\', template: \'actions\', width: 55}
        ],
        actionsNavOptions: {
            delbutton: false
        },
        navOpts: {add:false, edit:false, del:true, search:false}
    })
    .jqGridColumns();
});

$("#grchanges")
.one(\'reloadGrid\', function(e){
    $(this)
    .on(\'jqGridSerializeGridData\', function(e, postData) {
        postData._where = {sportsmen: clubSpCard.sp.id};
    })
    .jqGridInit({
        sortname: \'created\', sortorder: \'desc\',
        colModel:[
            {name:\'id\', hidden: true, template: idFieldTemplate},
            {name:\'created\', hidden: false, label:\'Создано\', template: createdTemplate},
            {name:\'username\', width:100, hidden:true},
            {name:\'chfield\', label: \'Поле\', width:80,
                formatter: function (cellValue, options, rowObject) {
                    return SCRM._fieldName(cellValue);
                }
            },
            {name: \'newvalue\', label: \'Значение\', width:150, editable: \'readonly\'},
            {name: \'oldvalue\', hidden:true},
            {name: \'info\', template: infoTemplate, editable:true}
        ],
        navOpts: {add:false, edit:false, search:false}
    })
    .jqGridColumns();
});

$("#grcars")
.one(\'reloadGrid\', function(e){
    $(this)
    .on(\'jqGridSerializeGridData\', function(e, postData) {
        postData._where = {idsportsmen: clubSpCard.sp.id};
    })
    .jqGridInit({
        sortname: \'created\', sortorder: \'desc\',
        colModel:[
            {name: \'id\', hidden: true, template: idFieldTemplate},
            {name: \'status\', label:\'Статус\', width:80,
            template: selTemplate,
            formatter: function(cv, options, rowObject) {
                return \'<a href="#" data-lead="\'+ rowObject.id +\'" class="prevent-default">\'+ SCRM.statusName(\'idLead\', cv, null, true) +\'</a>\';
            },
            unformat: function(cellValue, options, cell) {
                return $(cell).find(\'i\').data(\'status\');
            },
            clubStatus: \'idCar\', lookupKey: \'alias\'
            },
            {name: \'gosnum\', label: \'Гос номер\', width: 200,editable: true,  setROW: true},
            {name: \'vin\', label: \'VIN\', width: 200, editable: true,  setROW: true},
            {name: \'owner\', label: \'Владелец\', width: 200, editable: true,  setROW: true},
            {template: createdTemplate, hidden: false, label: \'Создано\'},
        ],
        navOpts: {add:false, edit:false, search:false}
    })
    .jqGridColumns();
});

$("#spEvent")
.one(\'reloadGrid\', function(e){
    $(this)
    .on(\'jqGridSerializeGridData\', function(e, postData) {
        postData._where = {\'idEventMember.sportsmen\': clubSpCard.sp.id};
    })
    .on(\'jqGridLoadComplete\', function(e, data) {
        // Если среди данных нет турнира, то обнулить и снять выделения чтобы спрятать Ивенты
        if (clubSpCard.selSpEvent) {
            var selId = clubSpCard.selSpEvent.id;
            var rowIds = $(this).jqGrid(\'getDataIDs\');
            if ($.inArray(selId, rowIds) != -1) {
                $(this).jqGrid(\'setSelection\', selId);
            } else {
                $(this).jqGrid(\'resetSelection\');
                SCRM.link(clubSpCard, {selSpEvent: null});
            }
        }
    })
    .on(\'jqGridSelectRow\', function(e, rid, sel) {
        var grid = $(this);
        SCRM.link(clubSpCard, {
            selSpEvent: grid.jqGrid(\'getRowData\', rid)
        });
        $("#spEventSportsmen").trigger(\'reloadGrid\');
    })
    .jqGridInit({
        sortname: \'datestart\', sortorder: \'desc\',
        colModel:[
            {name:\'id\', hidden: true, template: idFieldTemplate},
            {name:\'status\', label: \'Тип\', width: 80},
            {name:\'name\', label:\'Наименование\', width:250,
                //editable: true, editrules: {required: true},
                cellattr: function (rowId, tv, rawObject, cm, rdata) { 
                    return \'style="white-space: normal;"\';
                }
            },
            {name:\'place\', label:\'Место проведения\', width:200, hidden: true,
                cellattr: function (rowId, tv, rawObject, cm, rdata) { 
                    return \'style="white-space: normal;"\';
                }
            },
            {name:\'datestart\', label:\'Начало\', template:dateTemplate },
            {name:\'dateend\', label:\'Окончание\', template:dateTemplate }
        ],
        navOpts: {add:false, edit:false, del:false, search:false},
        fltrToolbar: true
    })
    .jqGridColumns();
});
//eee
</script>

[[!runHook?hook=`chunk/ecard`]]
<!--<script id="tpl_spSaldo" type="text/x-jsrender">
    <span data-link="visible{:saldo!=0} class{:saldo > 0? \'text-success\':\'text-danger\'} html{formatMoney:saldo}"></span>
    <span class="text-muted" data-link="visible{:saldo==0}">Баланс: 0</span>
</script>-->
<!--<script id="tpl_InvoiceLesson" type="text/x-jsrender">
<a href="#" id="cntLesson{{:id}}" data-link="visible{:InvoiceLesson} data-spkey{:key}" data-run="/chunk/invoice.lesson">
    {^{if InvoiceLesson.length}}
        <i class="fa fa-battery-3 mr-1"></i>
        {^{:(rest_lesson > 0)? rest_lesson+\' ~ \' : \'\'}}
        {^{formatDate:duedate}}
    {{else}}
        <i class="fa fa-battery-0 text-warning animated flash infinite" data-toggle="tooltip" title="Без абонемента"></i>
    {{/if}}
</a>

</script>-->

<style>
    .fa-rotate-45 {
        -webkit-transform: rotate(45deg);
        -moz-transform: rotate(45deg);
        -ms-transform: rotate(45deg);
        -o-transform: rotate(45deg);
        transform: rotate(45deg);
    }
    .card-title {
        line-height: 1.5;
    }
    [data-roinplace="spFieldEdit"] {
        display: block;
    }
    .spcard-title .roinplace-container {
        min-width: 50%;
    }
    @media (max-width: 991.98px) {
        .spcard-title .roinplace-container {
            min-width: 70%;
        }
    }
    @media (max-width: 767.98px) {
        .spcard-title .roinplace-container {
            flex: 1 1 auto !important;
        }
    }
</style>

<script id="tpl_sportsmenCardTitle" type="x-jsrender">
    <div data-link="text{:spCard^sp.name||\'\'}"></div>
</script>

<script id="tpl_sportsmenCard" type="x-jsrender">
<div data-link="visible{:sp^key} {on \'spFieldEdit\' ~spFieldEdit} {on \'setROW.idSportsmen\' ~eCardSpEdit}">
    <h3 class="section-title mb-0 d-flex align-items-center spcard-title">
        <span data-link="{:sp^name} data-id{:sp^id}" data-field="idSportsmen:name" data-roinplace="fieldEDIT"></span>
        <span class="dropdown ml-2">
            <button class="btn btn-sm btn-icon btn-light" data-toggle="dropdown">
                <i class="fa fa-fw fa-ellipsis-v" data-link="visible{:!loading}"></i>
                <span class="spinner-border spinner-border-sm" role="status" data-link="visible{:loading}"></span>
            </button>
            <div class="dropdown-menu">
                <div class="dropdown-arrow"></div>
                <a href="#" target="_blank" class="dropdown-item"
                    data-link="href{:\'/sportsmens/sportsmen.html?key=\'+key}">Личный кабинет</a>
                {^{for titleMenu ~sp=sp^ tmpl=\'#tplMenuItem\' /}}
                
                <div class="dropdown-divider"></div>
                <div class="d-flex small px-2">
                <a href=\'#\' class="d-block text-muted prevent-default" data-run="/chunk/sp.sysinfo">ID <u data-link="sp^id"></u></a>
                <a href="#" class="d-block text-muted ml-auto fmtCreated stop-propagation"
                    data-link="data-id{:sp^id} text{formatDate:sp^created}" data-tbl="idSportsmen"></a>
                </div>
            </div>
        </span>
    </h3>
    <div class="d-flex">
        <button class="btn btn-subtle-primary btn-xs" title="Сменить статус"
            data-link="html{:sp^status} {on \'click\' changeField \'status\'}
            class{merge:sp_arc toggle=\'btn-subtle-dark\'} title{:\'Сменить статус\'}"></button>

        <!-- <a href="#" class="mx-3 prevent-default" data-link="{on \'click\' ~addInvoice true} {include sp tmpl=\'#tpl_spSaldo\'}"></a> -->
        <!-- <span data-link="{include sp tmpl=\'#tpl_InvoiceLesson\'}"></span> -->
    </div>

    <nav class="nav-scroller border-bottom">
        <div class="nav nav-tabs sptabs" role="tablist" data-link="{for spTabs tmpl=\'navTab\'}">
            
        </div>
    </nav>
    <div class="tab-content mt-3">
        <div id="t_car" class="tab-pane">
            <table id="grcars" data-entity="idCar" class="calculateGrid"></table>
        </div>
        <div id="t_spChanges" class="tab-pane gridBlock">
            <table id="grchanges" data-entity="idChanges" class="calculateGrid"></table>
        </div>

        <div class="tab-pane active" id="t_spInfo">

<div class="row">
    <div class="col-md-6">
        <div class="row">
            <div class="col-lg-4" data-linkfile="" data-file1type="photo"
                data-link="{on sp^key ~S.linkFile \'#tpl_filePhoto1\'}">
            </div>
            <div class="col-lg-8">
                <div class="card card-body mb-2">
                    <div class="d-flex justify-content-between align-items-center">
                        <a href="#" target="_blank" data-link="href{:\'/sportsmens/sportsmen.html?key=\'+key}">
                            <i class="fa fa-arrow-up fa-rotate-45 mr-1"></i>
                            <span data-link="html{:sp^username || \'Кабинет\'}"></span>
                        </a>
                        <div class="card-title-control">
                            {^{if !sp^iduser}}
                            <button class="btn btn-icon btn-light" data-link="{on ~idUser}"><i class="fa fa-key"></i></button>
                            {{else}}
                            <div class="dropdown">
                                <button class="btn btn-icon btn-subtle-success" data-toggle="dropdown"><i class="fa fa-key"></i></button>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <div class="dropdown-arrow"></div>
                                    <a href="#" class="dropdown-item"
                                        data-run="/chunk/forgotpassword" data-link="data-username{:sp^username}">Восстановление пароля</a>
                                    <div class="dropdown-divider"></div>
                                    <a href="#" class="dropdown-item"
                                        data-link="{on ~idUser}">Отключить</a>
                                </div>
                            </div>
                            {{/if}}
                            
                        </div>
                    </div>
                    
                </div>
                
                <div class="eCardSpContact mt-3"></div>

            </div>
        </div>

        <div id="sportsmenFiles" data-link="{on sp^key ~S.linkFile \'#tpl_files\'}" data-linkfile=""></div>
    </div>
    <div class="col-md-6">
        <div class="card card-body pb-0">
            <div class="eCard_spManager mt-3"></div>
            
        </div>
        
        
    </div>
</div>


        </div>
        {^{for spTabs filter=~woTpl ~SP=#data}}
            <div class="tab-pane" id="{{:id}}" data-link="{include tmpl=tpl||\'\'}"></div>
        {{/for}}
    </div>
</div>
</script>


<script id="tpl_spCardMoneyMenu" type="text/x-jsrender">
<div class="d-flex justify-content-between mb-2">
    <button class="btn btn-success btn-sm btn-addinvoice" data-link="{on ~addInvoice ~paymode}"><i class="fa fa-plus"></i></button>
    {{include tmpl=#content /}}
    <button class="btn btn-secondary btn-sm ml-1" data-link="{on ~showGridFilter}"><i class="fa fa-filter"></i></button>
    <div class="dropdown align-self-start ml-auto">
        <button class="btn btn-icon btn-light text-muted mt-n1" data-toggle="dropdown"><i class="fa fa-fw fa-wrench"></i></button>
        <div class="dropdown-menu dropdown-menu-right">
            <div class="dropdown-arrow"></div>
            <a href="#" class="dropdown-item prevent-default" data-run="/chunk/printrevise">Акт сверки</a>
            <div class="dropdown-divider"></div>
            <a href="#" class="dropdown-item prevent-default" data-link="{on ~recoverInvoice}">Пересчитать</a>
        </div>
    </div>
</div>
</script>

<script id="tpl_idSportsmenSquad" type="text/x-jsrender">
{^{for idSportsmenSquad}}
<div class="list-group-item">
    <div class="list-group-item-body">
        <h4 class="list-group-item-title">
            <i class="fa fa-check-circle mr-1" data-link="visible{:is_main}"></i>
            {{:level_name}} | {{:squad_name}}
        </h4>
        <p class="list-group-item-text text-truncate text-muted">
        {{:club_name}}, {{:sport_name}}
        </p>
    </div>
    {{roDMenu}}
        <a href="#" class="dropdown-item prevent-default"
            data-link="visible{:!is_main} {on ~mainSquad}">
            <i class="fa fa-check-circle dropdown-icon"></i> Сделать основной</a>
        <a href="#" class="dropdown-item prevent-default" 
            data-link="{on ~deleteSquad}">
            <i class="fa fa-archive dropdown-icon"></i> Отчислить</a>
        <div class="dropdown-divider"></div>
        <a href="#" class="d-block small text-muted px-2 text-right fmtCreated stop-propagation"
            data-id="{{:id}}" data-tbl="idSportsmenSquad">
            <i class="fa fa-clock-o"></i> {{formatDate:created}}</a>
    {{/roDMenu}}
</div>
{{/for}}
{^{if arcSportsmenSquad && arcSportsmenSquad^length ~sp=sp}}
    <div id="headArcSquad" class="list-group-item text-muted">
        <button class="btn btn-reset" data-toggle="collapse" data-target="#arcSportsmenSquad" aria-expanded="false" aria-controls="arcSportsmenSquad">
            <span class="collapse-indicator mr-2"><i class="fa fa-fw fa-caret-right"></i></span>
            Архив <span class="badge badge-subtle badge-dark" data-link="arcSportsmenSquad^length"></span>
        </button>
    </div>
    <div id="arcSportsmenSquad" class="collapse text-muted" aria-labelledby="headArcSquad">
        {^{for arcSportsmenSquad}}
            <div class="list-group-item">
                <div>
                    <b>{{:level_name}} | {{:squad_name}}</b><br>
                    {{:club_name}}, {{:sport_name}}<br>
                    <small>{{formatDate:created}} - {{formatDate:dateend}}</small>
                </div>
                {^{if !~root^sp_arc}}
                    {{roDMenu}}
                    <a href="#" class="dropdown-item prevent-default" data-link="{on ~unDeleteSquad}">
                    <i class="fa fa-archive dropdown-icon"></i> Восстановить</a>
                    {{/roDMenu}}
                {{/if}}
            </div>
        {{/for}}
    </div>
{{/if}}
</script>

<script id="tpl_sportsmenContact" type="text/x-jsrender">
<div class="list-group-item">
    <div class="list-group-item-body">
        <h4 class="list-group-item-title">{{:name}}</h4>
        
    </div>
    
    {{roDMenu}}
        <a href="#" class="dropdown-item prevent-default"
            data-link="{on ~deleteContact}">
            <i class="fa fa-trash dropdown-icon"></i> Удалить</a>
        <div class="dropdown-divider"></div>
        <a href="#" class="d-block small text-muted px-2 text-right fmtCreated stop-propagation" data-id="{{:id}}" data-tbl="idContact">
            <i class="fa fa-clock-o"></i> {{formatDate:created}}</a>
    {{/roDMenu}}
</div>
</script>
',
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
  'elementCache' => 
  array (
    '[[$tplFiles]]' => '<style>
    .club-file-created {
        display:none;
    }
    .club-filerow:hover .club-file-created {
        display:inline;
    }
    .club-photo .user-avatar {
        width: 7rem;
        height: 7rem;
        font-size: 7rem;
    }
    .club-photo .user-avatar button {
        position: absolute;
        left: 2px;
        bottom: 2px;
    }
</style>

<script id="tpl_files" type="text/x-jsrender">
<div class="card spinner-parent" data-link="visible{:#data}">
    <div class="card-body">
        <div class="d-flex justify-content-between">
            <h3 class="card-title mb-0">Файлы</h3>
            <div class="card-title-control mr-n2">
                {^{if loading}}
                <span class="spinner-border spinner-border-sm" role="status"></span>
                {{else add && add^length && !showSelect}}
                <button class="btn btn-icon btn-light"
                    data-link="{on ~uploadFileList}"><i class="fa fa-upload"></i></button>
                {{/if}}
            </div>
        </div>
        <div class="mt-2 d-none" data-link="class{merge:showSelect toggle=\'d-flex\'} class{merge:!showSelect toggle=\'d-none\'}">
            <select class="form-control flex-grow-1" data-link="post^filetype">
                <option value="">-- Загрузить файл --</option>
                {^{for add}}
                    <option value="{{:alias}}">{{:name}}</option>
                {{/for}}
            </select>
            <button class="btn btn-primary ml-2"
                data-link="visible{:post^filetype} {on ~uploadFileList}">
                <i class="fa fa-upload"></i>
            </button>
        </div>
    </div>
    <div class="list-group list-group-bordered list-group-reflow"
        data-link="{for rows ~pd=#data tmpl=\'#tpl_fileRow\'}">
    </div>
</div>
</script>

<script id="tpl_fileRow" type="text/x-jsrender">
<div class="list-group-item club-filerow">
    <div class="list-group-item-body">
        {{if filetype_name}}
        <div class="text-muted small" data-link="visible{:filetype_name}">{{:filetype_name}}
            <a href="#" class="club-file-created fmtCreated" data-id="{{:id}}" data-tbl="idFiles">{{formatDateTime:created}}</a>
        </div>
        {{/if}}
        <a href="{{:filepath}}" target="_blank" download="{{:name}}.{{:fileext}}" data-permis="{{:permis}}"
            class="club-file">
            <i class="fa fa-file-o mr-2"></i>
            <span class="roinplacetext">{{:name}}</span>.{{:fileext}}</a>
    </div>
    {{roDMenu ~hidden=(permis.indexOf(\'edit\') < 0)}}
        <a href="#" class="dropdown-item prevent-default" data-link="{on ~editFile}">
            <i class="fa fa-pencil dropdown-icon"></i> Редактировать</a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item prevent-default" data-link="{on ~delFile}">
            <i class="fa fa-trash dropdown-icon"></i> Удалить</a>
    {{/roDMenu}}
</div>
</script>

<script id="tpl_filePhoto1" type="text/x-jsrender">
    <div class="text-center spinner-parent mb-2 club-photo">
        <figure class="user-avatar d-block m-auto" data-link="data-imgkey{:file1^key}">
            <a href="#" data-link="href{:file1^md||\'#\'} {on ~clickPhoto1}" accept="image/*">
                <img src="" alt="" data-link="src{:file1^sm||~S.emptyImg(gender)}">
            </a>
            <button class="lb-element btn btn-icon btn-secondary"
                data-link="{on ~S.uploadFile} visible{:file1^modify}" accept="image/*">
                <span class="spinner-border spinner-border-sm" role="status" data-link="visible{:loading}"></span>
                <i class="fa fa-camera" data-link="visible{:!loading}"></i>
            </button>
        </figure>
    </div>
</script>',
    '[[$tpl_spSaldo]]' => '<script id="tpl_spSaldo" type="text/x-jsrender">
    <span data-link="visible{:saldo!=0} class{:saldo > 0? \'text-success\':\'text-danger\'} html{formatMoney:saldo}"></span>
    <span class="text-muted" data-link="visible{:saldo==0}">Баланс: 0</span>
</script>',
    '[[$tplInvoiceLesson]]' => '<script id="tpl_InvoiceLesson" type="text/x-jsrender">
<a href="#" id="cntLesson{{:id}}" data-link="visible{:InvoiceLesson} data-spkey{:key}" data-run="/chunk/invoice.lesson">
    {^{if InvoiceLesson.length}}
        <i class="fa fa-battery-3 mr-1"></i>
        {^{:(rest_lesson > 0)? rest_lesson+\' ~ \' : \'\'}}
        {^{formatDate:duedate}}
    {{else}}
        <i class="fa fa-battery-0 text-warning animated flash infinite" data-toggle="tooltip" title="Без абонемента"></i>
    {{/if}}
</a>

</script>',
  ),
  'sourceCache' => 
  array (
    'modChunk' => 
    array (
      'tplFiles' => 
      array (
        'fields' => 
        array (
          'id' => 26,
          'source' => 0,
          'property_preprocess' => false,
          'name' => 'tplFiles',
          'description' => 'Chunk',
          'editor_type' => 0,
          'category' => 1,
          'cache_type' => 0,
          'snippet' => '<style>
    .club-file-created {
        display:none;
    }
    .club-filerow:hover .club-file-created {
        display:inline;
    }
    .club-photo .user-avatar {
        width: 7rem;
        height: 7rem;
        font-size: 7rem;
    }
    .club-photo .user-avatar button {
        position: absolute;
        left: 2px;
        bottom: 2px;
    }
</style>

<script id="tpl_files" type="text/x-jsrender">
<div class="card spinner-parent" data-link="visible{:#data}">
    <div class="card-body">
        <div class="d-flex justify-content-between">
            <h3 class="card-title mb-0">Файлы</h3>
            <div class="card-title-control mr-n2">
                {^{if loading}}
                <span class="spinner-border spinner-border-sm" role="status"></span>
                {{else add && add^length && !showSelect}}
                <button class="btn btn-icon btn-light"
                    data-link="{on ~uploadFileList}"><i class="fa fa-upload"></i></button>
                {{/if}}
            </div>
        </div>
        <div class="mt-2 d-none" data-link="class{merge:showSelect toggle=\'d-flex\'} class{merge:!showSelect toggle=\'d-none\'}">
            <select class="form-control flex-grow-1" data-link="post^filetype">
                <option value="">-- Загрузить файл --</option>
                {^{for add}}
                    <option value="{{:alias}}">{{:name}}</option>
                {{/for}}
            </select>
            <button class="btn btn-primary ml-2"
                data-link="visible{:post^filetype} {on ~uploadFileList}">
                <i class="fa fa-upload"></i>
            </button>
        </div>
    </div>
    <div class="list-group list-group-bordered list-group-reflow"
        data-link="{for rows ~pd=#data tmpl=\'#tpl_fileRow\'}">
    </div>
</div>
</script>

<script id="tpl_fileRow" type="text/x-jsrender">
<div class="list-group-item club-filerow">
    <div class="list-group-item-body">
        {{if filetype_name}}
        <div class="text-muted small" data-link="visible{:filetype_name}">{{:filetype_name}}
            <a href="#" class="club-file-created fmtCreated" data-id="{{:id}}" data-tbl="idFiles">{{formatDateTime:created}}</a>
        </div>
        {{/if}}
        <a href="{{:filepath}}" target="_blank" download="{{:name}}.{{:fileext}}" data-permis="{{:permis}}"
            class="club-file">
            <i class="fa fa-file-o mr-2"></i>
            <span class="roinplacetext">{{:name}}</span>.{{:fileext}}</a>
    </div>
    {{roDMenu ~hidden=(permis.indexOf(\'edit\') < 0)}}
        <a href="#" class="dropdown-item prevent-default" data-link="{on ~editFile}">
            <i class="fa fa-pencil dropdown-icon"></i> Редактировать</a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item prevent-default" data-link="{on ~delFile}">
            <i class="fa fa-trash dropdown-icon"></i> Удалить</a>
    {{/roDMenu}}
</div>
</script>

<script id="tpl_filePhoto1" type="text/x-jsrender">
    <div class="text-center spinner-parent mb-2 club-photo">
        <figure class="user-avatar d-block m-auto" data-link="data-imgkey{:file1^key}">
            <a href="#" data-link="href{:file1^md||\'#\'} {on ~clickPhoto1}" accept="image/*">
                <img src="" alt="" data-link="src{:file1^sm||~S.emptyImg(gender)}">
            </a>
            <button class="lb-element btn btn-icon btn-secondary"
                data-link="{on ~S.uploadFile} visible{:file1^modify}" accept="image/*">
                <span class="spinner-border spinner-border-sm" role="status" data-link="visible{:loading}"></span>
                <i class="fa fa-camera" data-link="visible{:!loading}"></i>
            </button>
        </figure>
    </div>
</script>',
          'locked' => false,
          'properties' => NULL,
          'static' => false,
          'static_file' => '',
          'content' => '<style>
    .club-file-created {
        display:none;
    }
    .club-filerow:hover .club-file-created {
        display:inline;
    }
    .club-photo .user-avatar {
        width: 7rem;
        height: 7rem;
        font-size: 7rem;
    }
    .club-photo .user-avatar button {
        position: absolute;
        left: 2px;
        bottom: 2px;
    }
</style>

<script id="tpl_files" type="text/x-jsrender">
<div class="card spinner-parent" data-link="visible{:#data}">
    <div class="card-body">
        <div class="d-flex justify-content-between">
            <h3 class="card-title mb-0">Файлы</h3>
            <div class="card-title-control mr-n2">
                {^{if loading}}
                <span class="spinner-border spinner-border-sm" role="status"></span>
                {{else add && add^length && !showSelect}}
                <button class="btn btn-icon btn-light"
                    data-link="{on ~uploadFileList}"><i class="fa fa-upload"></i></button>
                {{/if}}
            </div>
        </div>
        <div class="mt-2 d-none" data-link="class{merge:showSelect toggle=\'d-flex\'} class{merge:!showSelect toggle=\'d-none\'}">
            <select class="form-control flex-grow-1" data-link="post^filetype">
                <option value="">-- Загрузить файл --</option>
                {^{for add}}
                    <option value="{{:alias}}">{{:name}}</option>
                {{/for}}
            </select>
            <button class="btn btn-primary ml-2"
                data-link="visible{:post^filetype} {on ~uploadFileList}">
                <i class="fa fa-upload"></i>
            </button>
        </div>
    </div>
    <div class="list-group list-group-bordered list-group-reflow"
        data-link="{for rows ~pd=#data tmpl=\'#tpl_fileRow\'}">
    </div>
</div>
</script>

<script id="tpl_fileRow" type="text/x-jsrender">
<div class="list-group-item club-filerow">
    <div class="list-group-item-body">
        {{if filetype_name}}
        <div class="text-muted small" data-link="visible{:filetype_name}">{{:filetype_name}}
            <a href="#" class="club-file-created fmtCreated" data-id="{{:id}}" data-tbl="idFiles">{{formatDateTime:created}}</a>
        </div>
        {{/if}}
        <a href="{{:filepath}}" target="_blank" download="{{:name}}.{{:fileext}}" data-permis="{{:permis}}"
            class="club-file">
            <i class="fa fa-file-o mr-2"></i>
            <span class="roinplacetext">{{:name}}</span>.{{:fileext}}</a>
    </div>
    {{roDMenu ~hidden=(permis.indexOf(\'edit\') < 0)}}
        <a href="#" class="dropdown-item prevent-default" data-link="{on ~editFile}">
            <i class="fa fa-pencil dropdown-icon"></i> Редактировать</a>
        <div class="dropdown-divider"></div>
        <a href="#" class="dropdown-item prevent-default" data-link="{on ~delFile}">
            <i class="fa fa-trash dropdown-icon"></i> Удалить</a>
    {{/roDMenu}}
</div>
</script>

<script id="tpl_filePhoto1" type="text/x-jsrender">
    <div class="text-center spinner-parent mb-2 club-photo">
        <figure class="user-avatar d-block m-auto" data-link="data-imgkey{:file1^key}">
            <a href="#" data-link="href{:file1^md||\'#\'} {on ~clickPhoto1}" accept="image/*">
                <img src="" alt="" data-link="src{:file1^sm||~S.emptyImg(gender)}">
            </a>
            <button class="lb-element btn btn-icon btn-secondary"
                data-link="{on ~S.uploadFile} visible{:file1^modify}" accept="image/*">
                <span class="spinner-border spinner-border-sm" role="status" data-link="visible{:loading}"></span>
                <i class="fa fa-camera" data-link="visible{:!loading}"></i>
            </button>
        </figure>
    </div>
</script>',
        ),
        'policies' => 
        array (
        ),
        'source' => 
        array (
        ),
      ),
      'tpl_spSaldo' => 
      array (
        'fields' => 
        array (
          'id' => 32,
          'source' => 0,
          'property_preprocess' => false,
          'name' => 'tpl_spSaldo',
          'description' => 'Chunk',
          'editor_type' => 0,
          'category' => 1,
          'cache_type' => 0,
          'snippet' => '<script id="tpl_spSaldo" type="text/x-jsrender">
    <span data-link="visible{:saldo!=0} class{:saldo > 0? \'text-success\':\'text-danger\'} html{formatMoney:saldo}"></span>
    <span class="text-muted" data-link="visible{:saldo==0}">Баланс: 0</span>
</script>',
          'locked' => false,
          'properties' => NULL,
          'static' => false,
          'static_file' => '',
          'content' => '<script id="tpl_spSaldo" type="text/x-jsrender">
    <span data-link="visible{:saldo!=0} class{:saldo > 0? \'text-success\':\'text-danger\'} html{formatMoney:saldo}"></span>
    <span class="text-muted" data-link="visible{:saldo==0}">Баланс: 0</span>
</script>',
        ),
        'policies' => 
        array (
        ),
        'source' => 
        array (
        ),
      ),
      'tplInvoiceLesson' => 
      array (
        'fields' => 
        array (
          'id' => 31,
          'source' => 0,
          'property_preprocess' => false,
          'name' => 'tplInvoiceLesson',
          'description' => 'Chunk',
          'editor_type' => 0,
          'category' => 1,
          'cache_type' => 0,
          'snippet' => '<script id="tpl_InvoiceLesson" type="text/x-jsrender">
<a href="#" id="cntLesson{{:id}}" data-link="visible{:InvoiceLesson} data-spkey{:key}" data-run="/chunk/invoice.lesson">
    {^{if InvoiceLesson.length}}
        <i class="fa fa-battery-3 mr-1"></i>
        {^{:(rest_lesson > 0)? rest_lesson+\' ~ \' : \'\'}}
        {^{formatDate:duedate}}
    {{else}}
        <i class="fa fa-battery-0 text-warning animated flash infinite" data-toggle="tooltip" title="Без абонемента"></i>
    {{/if}}
</a>
[[-
<div class="dropdown" data-link="visible{:InvoiceLesson}">
    <a href="#" id="dropdownCntLesson{{:id}}"
        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        {^{if InvoiceLesson.length}}
            <i class="fa fa-battery-3 mr-1"></i>
            {^{:(rest_lesson > 0)? rest_lesson+\' ~ \' : \'\'}}
            {^{formatDate:duedate}}
        {{else}}
            <i class="fa fa-battery-0 text-warning animated flash infinite" data-toggle="tooltip" title="Без абонемента"></i>
        {{/if}}
    </a>
    <div class="dropdown-menu" aria-labelledby="dropdownCntLesson{{:id}}" style="z-index:1001">
        {^{for InvoiceLesson}}
        <div data-link="class{merge:(#index>0) toggle=\'mt-1 pt-1 border-top\'}" class="mx-2">
        {{:invoice_name}}<br>
        <span class="text-muted">{{:(lesson_amount-cnt_lesson)}} ~ {{formatDate:duedate}}</span></div>
        {{/for}}
        {{if ~addMenu}}
            <div class="dropdown-divider" data-link="visible{:InvoiceLesson.length}"></div>
            {{include tmpl=~addMenu /}}
        {{/if}}
    </div>
</div>]]
</script>',
          'locked' => false,
          'properties' => NULL,
          'static' => false,
          'static_file' => '',
          'content' => '<script id="tpl_InvoiceLesson" type="text/x-jsrender">
<a href="#" id="cntLesson{{:id}}" data-link="visible{:InvoiceLesson} data-spkey{:key}" data-run="/chunk/invoice.lesson">
    {^{if InvoiceLesson.length}}
        <i class="fa fa-battery-3 mr-1"></i>
        {^{:(rest_lesson > 0)? rest_lesson+\' ~ \' : \'\'}}
        {^{formatDate:duedate}}
    {{else}}
        <i class="fa fa-battery-0 text-warning animated flash infinite" data-toggle="tooltip" title="Без абонемента"></i>
    {{/if}}
</a>
[[-
<div class="dropdown" data-link="visible{:InvoiceLesson}">
    <a href="#" id="dropdownCntLesson{{:id}}"
        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        {^{if InvoiceLesson.length}}
            <i class="fa fa-battery-3 mr-1"></i>
            {^{:(rest_lesson > 0)? rest_lesson+\' ~ \' : \'\'}}
            {^{formatDate:duedate}}
        {{else}}
            <i class="fa fa-battery-0 text-warning animated flash infinite" data-toggle="tooltip" title="Без абонемента"></i>
        {{/if}}
    </a>
    <div class="dropdown-menu" aria-labelledby="dropdownCntLesson{{:id}}" style="z-index:1001">
        {^{for InvoiceLesson}}
        <div data-link="class{merge:(#index>0) toggle=\'mt-1 pt-1 border-top\'}" class="mx-2">
        {{:invoice_name}}<br>
        <span class="text-muted">{{:(lesson_amount-cnt_lesson)}} ~ {{formatDate:duedate}}</span></div>
        {{/for}}
        {{if ~addMenu}}
            <div class="dropdown-divider" data-link="visible{:InvoiceLesson.length}"></div>
            {{include tmpl=~addMenu /}}
        {{/if}}
    </div>
</div>]]
</script>',
        ),
        'policies' => 
        array (
        ),
        'source' => 
        array (
        ),
      ),
    ),
    'modSnippet' => 
    array (
      'clubStatus' => 
      array (
        'fields' => 
        array (
          'id' => 22,
          'source' => 1,
          'property_preprocess' => false,
          'name' => 'clubStatus',
          'description' => '',
          'editor_type' => 0,
          'category' => 1,
          'cache_type' => 0,
          'snippet' => '$tbl = array(
    \'tbl\' => $modx->getOption(\'tbl\', $scriptProperties, \'idSportsmen\'),
);
if ($cls) $tbl[\'cls\'] = $cls;
if ($alias) $tbl[\'alias\'] = $alias;
$addfields = $modx->getOption(\'addfields\', $scriptProperties, \'\');
$json = getClubStatus($tbl, $addfields);

$placeholderName = $modx->getOption(\'placeholder\', $scriptProperties, 0);
$keyfield = $modx->getOption(\'keyfield\', $scriptProperties, \'\');
if (!empty($keyfield)) {
    $statuses = array();
    foreach ($json as $status) {
        $key = $status[$keyfield];
        if (!empty( $key )) $statuses[$key] = $status;
    }
    $placeholderName = ($placeholderName)? :\'clubStatus\';
    $json = $statuses;
}

if (!empty($placeholderName)) $modx->setPlaceholder($placeholderName, $json);

return json_encode($json, JSON_UNESCAPED_UNICODE);',
          'locked' => false,
          'properties' => 
          array (
          ),
          'moduleguid' => '',
          'static' => false,
          'static_file' => '',
          'content' => '$tbl = array(
    \'tbl\' => $modx->getOption(\'tbl\', $scriptProperties, \'idSportsmen\'),
);
if ($cls) $tbl[\'cls\'] = $cls;
if ($alias) $tbl[\'alias\'] = $alias;
$addfields = $modx->getOption(\'addfields\', $scriptProperties, \'\');
$json = getClubStatus($tbl, $addfields);

$placeholderName = $modx->getOption(\'placeholder\', $scriptProperties, 0);
$keyfield = $modx->getOption(\'keyfield\', $scriptProperties, \'\');
if (!empty($keyfield)) {
    $statuses = array();
    foreach ($json as $status) {
        $key = $status[$keyfield];
        if (!empty( $key )) $statuses[$key] = $status;
    }
    $placeholderName = ($placeholderName)? :\'clubStatus\';
    $json = $statuses;
}

if (!empty($placeholderName)) $modx->setPlaceholder($placeholderName, $json);

return json_encode($json, JSON_UNESCAPED_UNICODE);',
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
      'runHook' => 
      array (
        'fields' => 
        array (
          'id' => 42,
          'source' => 0,
          'property_preprocess' => false,
          'name' => 'runHook',
          'description' => '',
          'editor_type' => 0,
          'category' => 1,
          'cache_type' => 0,
          'snippet' => '# включение хуков во время исполнения, полная версия в плагине clubPackage

$runHook = $modx->getOption(\'hook\', $scriptProperties, null);
$rq = explode(\'/\', $runHook);
include(CRM_PATH.\'hook.php\');',
          'locked' => false,
          'properties' => NULL,
          'moduleguid' => '',
          'static' => false,
          'static_file' => '',
          'content' => '# включение хуков во время исполнения, полная версия в плагине clubPackage

$runHook = $modx->getOption(\'hook\', $scriptProperties, null);
$rq = explode(\'/\', $runHook);
include(CRM_PATH.\'hook.php\');',
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