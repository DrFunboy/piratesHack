window.SCRM = {
    app: {
        topNavTabs: [],
        bottomNavLinks: []
    },
    _wss: {}, vers: '', editUrl: '/data/empty', dataUrl: '/data/empty',
    dateFormat: 'd.m.Y', datetimeFormat: 'd.m.Y H:i',
    dbValues: {}, clubStatus: {},
    lexicon: {}, emptyStr: '...', //'…',
    dateDiffDanger: 1, dateDiffWarn: -30,
    _service: { },
    _runLoader: function(name) {
        return SCRM._service[name] || function(p1, p2, p3, p4) {
            loadHTML('/handlers/'+ name.toLowerCase() +'.html', function(){
                SCRM._service[name](p1, p2, p3, p4);
            });
        };
    },
    _run: function(path, data, cb){
        var name = path,
            _this = this;

        if (name.indexOf('/') >=0 ) {
            var _path = document.createElement('a');
            _path.href = path;
            name = _path.pathname;
        }
        
        function _r(loaded) {
            if ((_this instanceof Event) || (_this instanceof jQuery)) {
                SCRM._service[name].call(_this, data);
            } else {
                SCRM._service[name](data);
            }
        }
        if (name in SCRM._service) {
            _r();
        } else {
            var pd = $.extend({}, data).postData || {};
            $('<div></div>')
            .appendTo('body')
            .attr('data-urload', name)
            .load(path, pd, _r);
        }
    },
    jqXHRarray: function(rows) { // rows = array of jqXHR func
        rows[0]().always(function() {
            rows.splice(0, 1);
            if (rows.length>0) SCRM.jqXHRarray(rows);
        });
    },
    loadSeriesArray: [],
    loadSeries: function(series){
        var lsa = SCRM.loadSeriesArray.length;
        $.merge(SCRM.loadSeriesArray, series);
        function loadSA(){
            loadHTML(SCRM.loadSeriesArray[0], function(){
                SCRM.loadSeriesArray.splice(0, 1);
                if (SCRM.loadSeriesArray.length>0) loadSA();
            });
        }
        if (lsa === 0) loadSA();
    },
    uniqid: function(lowercase){
        return (lowercase)? Math.random().toString(36).substring(2)+Math.random().toString(36).substring(2) : btoa(Math.random()).slice(0, 14);
    },
    randInt: function(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
    },
    round2: function(num) {
            return +(Math.round(num + "e+2") + "e-2");
        },
    countProps: function (data) {
        var i = 0;
        for (var key in data) i++;
        return i;
    },
    dateDiffClass: function(date, dateDiffWarn, dateDiffDanger) {
        if (!date) return 'text-danger rowNo';
        var diff = diffNow(date);
        if (diff > (dateDiffDanger||SCRM.dateDiffDanger)) return 'text-danger';
        if (diff > (dateDiffWarn||SCRM.dateDiffWarn)) return 'text-warning';
        return '';
    },
    findRow: function(rows, id, callback) {
        $.each(rows, function(i, v) {
            if (v.id == id) {
                callback(v);
                return false;
            }
        });
    },
    setClubStatus: function(rows, id_field) {
        var ncs = {};
        $.each(rows||[], function(i, v) {
            if (id_field) v.id = v[id_field];
            key2obj(ncs, v.tbl).push(v);
        });
        $.each(ncs, function(i, v){
            if (!SCRM.clubStatus[i]) SCRM.link(SCRM.clubStatus, i, v);
            else SCRM.link(SCRM.clubStatus[i]).refresh(v);
        });
        
        //SCRM.link(SCRM.clubStatus, ncs);
        //$.extend(SCRM.clubStatus, ncs);
        return ncs;
    },
    getClubStatus: function(tbl, id, field) {
        field = field || 'alias';
        var key = tbl+'_'+field+'_'+id;
        if (!(key in SCRM.clubStatus)) {
            $.each(SCRM.clubStatus[tbl]||[], function(i, v) {
                //if (!v.extended) v.extended = {};
                SCRM.clubStatus[ tbl+'_'+field+'_'+ v[field] ] = v;
            });
        }
        return $.extend({extended:{}}, SCRM.clubStatus[key]);
    },
    statusName: function(tbl, id, field, ico) {
        if (typeof tbl === 'string') {
            tbl = SCRM.getClubStatus(tbl, id, field);
        } else {
            // передан массив, поэтому параметры лишние
            ico = id;
        }
        return (ico? makeIco(tbl.ico, {big: 1})+' ': '') + (tbl.name||'');
    },
    statusFmt: function(tbl, id, field, tooltip) {
        var statusRow = SCRM.getClubStatus(tbl, id, field);
        return makeIco(statusRow.ico, {
            big: 1,
            add: tooltip? 'data-status="'+ id +'" title="'+ (statusRow.name||'n/a') +'" data-toggle="tooltip"' : ''
        });
    },
    hintLink: function(hint) {
        return '<a href="#" data-hint="'+ hint +'"><i class="fa fa-question-circle-o ml-1"></i></a>';
    },
    filterObj: function(filter) {
        filter = filter || {};
        return $.extend(true, {
            groupOp: 'AND',
            rules: []
        }, (typeof filter === 'string')? JSON.parse(filter) : filter);
    },
    obj2Filter: function(obj, filterData) {
        filterData = SCRM.filterObj(filterData);
        var rulesObj = array2obj(filterData.rules, {}, 'field');
        filterData.rules = $.map($.extend(rulesObj, obj), function(v, key){
            var filterRow = $.extend({
                field: key,
                op: 'eq'
            }, (typeof v === 'object')? v: {
                data: v
            });
            return (filterRow.data)? filterRow : null;
        });
        //console.log(filterData);
        return JSON.stringify(filterData);
    },
    link: function(target, data, value) {
        if (!data) return $.observable(target);
        if (typeof data === 'string') {
            return $.observable(target).setProperty(data, value);
        }
        return $.observable(target).setProperty(data);
    },
    linkFile: function(tpl, e, data, nd) {
        SCRM.loadWSS('files', function(){
            SCRM.linkFile(tpl, e, data, nd);
        });
    },
    emptyImg: function(gender) {
        if (gender===0) gender='0';
        return SCRM.url + 'images/no-image'+ (gender||'') +'.png';
    },
    msg: function(txt, title, opts) {
        opts = $.extend({msgType: 'info'}, opts);
        SCRM.loadWSS('toastr', function(){
            toastr[opts.msgType](txt, title, opts);
        });
    },
    success: function(txt, title, opts) {
        SCRM.msg(txt, title, $.extend({msgType: 'success'}, opts));
    },
    alert: function(txt, title, opts) {
        SCRM.msg(txt, title, $.extend({msgType: 'warning'}, opts));
    },
    prompt: function(title, callback, opts) {
        return club_Modal($.extend({
            //cm_size: 'sm',
            title: title,
            prompt: '',
            body: '<input type="text" class="form-control clubmodal-focus" data-link="{:prompt:} placeholder{:placeholder}" />',
            onOK: function(e, md) {
                if (md.prompt) {
                    callback(md.prompt);
                    md.mdl_hide();
                }
            }
        }, opts));
    },

    execArray: function(fncs) {
        $.each(fncs, function(i, v){
            v();
        });
    },
    loadJSCSS: function(src, callback) {
        var ext = src.split('?')[0].split('.').pop();
        src = src.replace('{crm}', SCRM.url).replace('{vers}', SCRM.vers);
        //console.log('loadJSCSS', src);
        switch ( ext.toLowerCase() ) {
            case 'js':
                $.ajax(src, {dataType: "script", cache: true, async: true})
                .done(callback);
            break;
            case 'css':
                $('<link type="text/css" rel="stylesheet" />').attr({href: src}).appendTo("head");
                if (callback) callback();
            break;
            case 'ready':
                $(callback);
            break;
            case 'html':
                loadHTML(src, callback);
            break;
            default:
                var wssObj = SCRM.wssRes[src];
                if (!wssObj) {
                    callback();
                } else {
                    //if (Array.isArray(wssObj)) wssObj = {src: wssObj};
                    SCRM.loadWSS(wssObj, callback);
                }
        }
    },
    loadWSS: function(src, callback) {
        //console.log('loadWSS', src);
        if (!Array.isArray(src)) src = [src];
        function checkLoaded(){
            src.shift();
            //console.log('checkLoaded', src.length);
            if (src.length === 0) {
                callback();
            } else {
                loadWSS();
            }
        }
        function loadWSS(){
            var s = src[0];
            if (typeof s === 'function') {
                s();
                checkLoaded();
            } else {
                var _wss = key2obj(SCRM._wss, s, {
                    loaded: false,
                    cb: []
                });
                if (_wss.loaded) {
                    checkLoaded();
                } else {
                    // Если вдруг в момент загрузки добавится что-то
                    _wss.cb.push(checkLoaded);
                    //console.log('_wss.cb.length', s, _wss.cb.length);
                    if (_wss.cb.length === 1) SCRM.loadJSCSS(s, function(){
                        _wss.loaded = true;
                        SCRM.execArray(_wss.cb);
                    });
                }
            }
        }
        loadWSS();
    },
    wssRes: {
        flatpickr: [
            '{crm}wss/plugins/flatpickr.4.6.9.min.css',
            '{crm}wss/plugins/flatpickr.4.6.9.min.js',
            function(){
                flatpickr.setDefaults({
                    //altInput: true,
                    //altFormat: "d.m.Y", //altFormat: "l", // день недели
                    //defaultDate: 'today',
                    //dateFormat: "Y-m-d", 
                    dateFormat: SCRM.dateFormat,
                    allowInput: true,
                    time_24hr: true
                });
                flatpickr.localize(flatpickr.l10ns.ru);
            }
        ],
        mask: ['{crm}wss/plugins/jquery.mask.min.js?v=1.14.16'],
        files: ['{crm}wss/files.js?v={vers}'],
        grid: [
            '{crm}wss/jqgrid/css/club.jqgrid.min.css?v=4.15.6-pre1',
            '{crm}wss/jqgrid/jquery.jqgrid.min.js?v=4.15.6-pre',
            '{crm}wss/grid.js?v={vers}'
        ],
        jqueryui: [
            '{crm}wss/css/club.jquery-ui.multiselect.min.css?v=1.12.1',
            '{crm}wss/ui/jquery-ui.min.js?v=1.12.1'
        ],
        toastr: [
            '{crm}wss/toastr/toastr.min.css',
            '{crm}wss/toastr/toastr.min.js',
            function(){
                toastr.options = {
                    closeButton: false,
                    debug: false,
                    progressBar: true,
                    preventDuplicates: false,
                    positionClass: "toast-top-right",
                    onclick: null,
                    showDuration: "400",
                    hideDuration: "1000",
                    timeOut: "9000",
                    extendedTimeOut: "1000",
                    showEasing: "swing",
                    hideEasing: "linear",
                    showMethod: "fadeIn",
                    hideMethod: "fadeOut"
                };
            }
        ],
        ace: ['https://cdnjs.cloudflare.com/ajax/libs/ace/1.12.5/ace.js'],
        summernoteBS4: [
            'https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.css',
            'https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-bs4.min.js'
        ],
        Sortable: ['https://cdn.jsdelivr.net/npm/sortablejs@latest/Sortable.min.js'],
        printThis: ['{crm}wss/plugins/printThis.js'],
		blueimp: [
            '{crm}wss/plugins/blueimp/css/blueimp-gallery.min.css?v=3.1.1',
            '{crm}wss/plugins/blueimp/js/jquery.blueimp-gallery.min.js?v=3.1.1',
            function() {
                $('body').append('<div id="blueimp-gallery" class="blueimp-gallery" aria-label="image gallery" aria-modal="true" role="dialog" data-start-slideshow="true"><div class="slides" aria-live="off"></div><h3 class="title"></h3><a class="prev" aria-controls="blueimp-gallery" aria-label="previous slide" aria-keyshortcuts="ArrowLeft"></a><a class="next" aria-controls="blueimp-gallery" aria-label="next slide" aria-keyshortcuts="ArrowRight"></a><a class="close" aria-controls="blueimp-gallery" aria-label="close" aria-keyshortcuts="Escape"></a><a class="play-pause" aria-controls="blueimp-gallery" aria-label="play slideshow" aria-keyshortcuts="Space" aria-pressed="true" role="button"></a><ol class="indicator"></ol></div>');
            }
        ],
        colorpick: ['https://cdnjs.cloudflare.com/ajax/libs/tinyColorPicker/1.1.1/jqColorPicker.min.js'],
        select2: ['{crm}wss/plugins/select2.min.css', '{crm}wss/plugins/select2.min.js'],
        c3: [
            '{crm}wss/c3/c3.min.css?v=0.7.11',
            '{crm}wss/c3/d3.min.js?v=5.12.0',
            '{crm}wss/c3/c3.min.js?v=0.7.11'
        ],
        pivottable: [
            'jqueryui',
            '{crm}wss/pivottable-master/pivot.min.css',
		    '{crm}wss/pivottable-master/pivot.min.js',
		    '{crm}wss/pivottable-master/pivot.ru.min.js',
            //optional: mobile support with jqueryui-touch-punch
            'https://cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.3/jquery.ui.touch-punch.min.js'
        ],
        multiselect: [
            'jqueryui',
            '{crm}wss/jqgrid/plugins/css/ui.multiselect.min.css?v=4.15.6-pre',
            '{crm}wss/jqgrid/plugins/min/ui.multiselect.js?v=4.15.6-pre'
        ],
        tagsinput: [
            '{crm}wss/tagsinput/bootstrap-tagsinput.css',
            //'/assets/id/wss/tagsinput/typeahead.bundle.min.js',
            '{crm}wss/tagsinput/bootstrap3-typeahead.min.js',
            '{crm}wss/tagsinput/bootstrap-tagsinput.min.js'
        ],
        mobilejs: ['{crm}wss/mobile.js?v={vers}.0.1'],
        popmenu: ['{crm}wss/popmenu.js?v={vers}.0.3'],
        roinplace: ['{crm}wss/roinplace.js?v={vers}.0.2']
    }
};
window.alert = SCRM.alert;

var dbvaluesUrl = '/data/dbvalues',
joinstring = ', ',
localStorageSupport = function() { // check if browser support HTML5 local storage
    return (('localStorage' in window) && window.localStorage !== null);
},
saveObjectInLocalStorage = function (storageItemName, object) {
    if ( localStorageSupport() ) {
        window.localStorage.setItem(storageItemName, JSON.stringify(object));
    }
},
removeObjectFromLocalStorage = function (storageItemName) {
    if ( localStorageSupport() ) {
        window.localStorage.removeItem(storageItemName);
    }
},
getObjectFromLocalStorage = function (storageItemName) {
    if ( localStorageSupport() ) {
        return JSON.parse(window.localStorage.getItem(storageItemName)) || {};
    }
},
clubPostForm = function(url, data, opts){
    data = $.extend({crm_vers: SCRM.vers}, data);
    $('#club_postForm').remove();
    var form = $('<form></form>', $.extend({
        id: 'club_postForm',
        method: 'POST',
        target: '_blank',
        action: url
    }, opts))
    .appendTo('body');

    $.each(data, function(i, v){
        $('<input type="hidden" />').attr('name', i).val(v).appendTo(form);
    });
    form.submit();
},
makeIco = function(ico, opts) {
    opts = $.extend({add:''}, opts);
    if (!ico) ico = 'fa-question';
    if (opts.big) ico = ico + ' fa-lg';
    return '<i class="fa '+ ico +'" '+opts.add+'></i>';
},
statusFmt = function(status, tbl) {
    //console.log(cv, options, rowObject)
    var cs = (status == 'na')? {
        ico : 'fa-question-circle' //fa-question-circle-o
    } : (SCRM.clubStatus[tbl]||{})[status];
    return makeIco((cs)? cs.ico : false, {
        big: 1,
        add: 'data-status="'+ status +'" title="'+ status +'" data-toggle="tooltip"'
    });
},
joinStr = function(str, sep) {
    return (str||[]).filter(function(el) {
        return el !== '' && el !== null;
    }).join(sep||joinstring);
},

failXHR = function(jqXHR, exception, d) {
    var msg = '';
    if (jqXHR.status === 0) {
        msg = 'Not connect.\n Verify Network.';
    } else if (jqXHR.status == 404) {
        msg = 'Requested page not found. [404]';
    } else if (jqXHR.status == 500) {
        msg = 'Internal Server Error [500].';
    } else if (exception === 'parsererror') {
        msg = 'Requested JSON parse failed.';
    } else if (exception === 'timeout') {
        msg = 'Time out error.';
    } else if (exception === 'abort') {
        msg = 'Ajax request aborted.';
    } else {
        if (jqXHR.responseJSON && jqXHR.responseJSON.error) {
            msg = jqXHR.responseJSON.error;
        } else {
            msg = 'Uncaught Error.\n' + jqXHR.responseText;
        }
    }
    alert(msg);
},
pJSON = function(url, data, success) {
    return (url)? $.post(url, data, success, 'json').done(function(data){
        if (data.error) alert(data.error);
    }).fail(failXHR) : null;
},
pEDIT = function(table, data, success) {
    return pJSON(SCRM.editUrl, $.extend({
        table: table,
        oper: 'edit'
    }, data), success);
},
pDATA = function(table, data, success) {
    data = $.extend({table: table}, data);
    $(document).trigger('scrmDATA', data);
    return pJSON(SCRM.dataUrl, data, success);
},
getUrlVars = function(url) {
    var vars = {};
    $.each( (url? (url.split('?')[1] || '') : window.location.search.substr(1)).split('&'), function(i, param){
        var p = param.split('=');
        if (p[1]) vars[ p[0] ] = p[1];
    });
    /*var parts = ((url)? url : window.location.search).replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });*/
    return vars;
},
array_keys = function(arr) {
    return $.map(arr, function(v, k){
        return k;
    });
},
in_array = function(val, arr) {
    return $.inArray(val, arr) !== -1;
},
array_intersect = function(array1, array2) {
    return array1.filter(function(n) {
        return in_array(n, array2);
    });
},
array2obj = function(arr, obj, key, cb) {
    if (!obj) obj = {};
    $.each(arr, function(i, v) {
        var k = v[ key||'id' ];
        obj[k] = v;
        if (cb) cb(i, v);
    });
    return obj;
},
key2obj = function(obj, key, val) {
    if (key in obj === false) obj[key] = val || [];
    return obj[key];
},
unique_ar = function(array) {
    return $.grep(array, function(el, index) {
        return index === $.inArray(el, array);
    });
},
buildFilter = function(field, data, op, filterData) {
    filterData = SCRM.filterObj(filterData);
    filterData.rules = $.map(filterData.rules, function(v, i){
        if (v.field != field) return v;
    });
    filterData.rules.push({
        field: field,
        op: op || 'eq',
        data: data
    });
    //console.log('buildFilter', filterData);
    return JSON.stringify(filterData);
},
oneDay = 86400000, //24*60*60*1000
diffNow = function(date){
    var d = {now: new Date()};
    if (date) {
        var t = date.split(/[- :]/);
        for (var i = 0; i < 6; i++) if (!t[i]) t[i]=0;
        d.dt = new Date(t[0], t[1]-1, t[2], t[3], t[4], t[5]);
    } else d.dt = new Date(0);
    return (d.now - d.dt) / oneDay;
},
club_Modal = function(linkData, handlers) {
    $.extend(linkData, {
        mdl_hide: function() {
            linkData.mdl.modal('hide');
        }
    });
    linkData.preventDestroy = linkData.preventDestroy || ('hideRemove' in linkData);
    if (!linkData.mdl_id) linkData.mdl_id = SCRM.uniqid();
    //if (!('hideRemove' in linkData)) linkData.hideRemove = true;
    
    //linkData.mdl = $(linkData.mdl_tpl||'#tpl_clubModal').clone()
    linkData.mdl = $( SCRM[linkData.mdl_tpl||'tpl_clubModal'] )
    .appendTo('body')
    .attr('id', 'cm'+linkData.mdl_id)
    .on('hidden.bs.modal', function(e) {
        if (!linkData.preventDestroy) {
            var mdl = $(this);
            $('.onDestroyParent', mdl).trigger('onDestroyParent');
            mdl.remove();
        }
    })
    .on('show.bs.modal', function(e) {
        setTimeout(function(){
            var bdrop = $('.modal-backdrop:not(.clubBackdrop):last')
                .addClass('clubBackdrop').css('z-index', linkData.zindex-1);
            if (bdrop.length && !bdrop.attr('id')) bdrop.attr('id', 'bdrop'+linkData.mdl_id);
        }, 5); // Чтобы объект создался, но анимация норм отработала
    })
    .on('shown.bs.modal', function(e) {
        $('.clubmodal-focus:first', this).focus();
    });

    $.link(true, linkData.mdl, linkData, $.extend({
        on_OK: function(e, data) {
            e.preventDefault();
            console.log('on_OK', e, data, linkData);
            if ((('onOK' in linkData) && linkData.onOK(e, linkData)) || linkData.okClose) linkData.mdl_hide();
        }
    }, handlers));

    if (linkData.zindex) {
        linkData.mdl.css('z-index', linkData.zindex);
    } else {
        linkData.zindex = linkData.mdl.css('z-index');
    }
    
    //SCRM.mdl_z += 10;
    //if ($.jgrid) {
    //    $.extend($.jgrid.edit, {zIndex:SCRM.mdl_z});
    //    $.extend($.jgrid.del, {zIndex:SCRM.mdl_z});
    //    SCRM.mdl_z += 10;
    //}
    return linkData.mdl.modal('show');
},
club_Drawer = function(linkData, handlers) {
    linkData.mdl_tpl = 'tpl_clubDrawer'; // '#tpl_clubDrawer';
    return club_Modal(linkData, handlers);
},
club_Tab = function(tabData, handlers) {
    if (!tabData.tab_id) tabData.tab_id = 'tab'+SCRM.uniqid();
    if (!SCRM.pageTabsContent) {
        if (!SCRM.app.topNavTabs.length) {
            // Если страница без вкладок создать из страницы вкладку
            var tab1 = 'tab' + SCRM.uniqid();
            SCRM.pageTabsContent = $('#pageSection1')
            .addClass('tab-content')
            .wrapInner('<div class="tab-pane" id="'+tab1+'"></div>');
            SCRM.link(SCRM.app.topNavTabs).insert({
                href: '#'+tab1,
                html: SCRM.app.title
            });
        } else {
            // Если страница с вкладками, то ищет первый контейнер
            SCRM.pageTabsContent = $('#pageSection1 .tab-content').eq(0);
        }
    }
    
    SCRM.link(SCRM.app.topNavTabs).insert({
        href: '#'+tabData.tab_id,
        html: tabData.title
    });
    
    //Пустая панель для второй вкладки
    var panel = $('<div class="tab-pane" data-link="{if body tmpl=body}"></div>')
    .attr('id', tabData.tab_id)
    .appendTo(SCRM.pageTabsContent)
    .link(true, tabData, handlers);
    tabData.tab = $('a[href="#'+tabData.tab_id+'"]');
    if (tabData.body) tabData.tab.tab('show');
    return tabData;
},
rocnfrm = function(prompt, callback) {
    return club_Modal({cm_size: 'sm', body: prompt, okClose: true, onOK: callback});
},
spinnr = function(show, elem) {
    if (typeof show !== 'boolean') {elem = show; show = true;}
    if (typeof elem === 'string') elem = $(elem);
    var spelem = (elem)? elem.closest('.spinner-parent') : $('.spinner-parent').eq(0);
    if ( $('>.sk-spinner', spelem).length === 0 ) {
        spelem.prepend( '<div class="sk-spinner sk-spinner-wave"><div class="sk-rect1"></div> <div class="sk-rect2"></div> <div class="sk-rect3"></div> <div class="sk-rect4"></div> <div class="sk-rect5"></div></div>' );
    }
    spelem.toggleClass('sk-loading', show);
    return elem;
},
str2date = function(str, format){
    if (!str && format) return '';
    if (str=='now'){
        var d = new Date();
        str = d.toISOString();
    }
    var t = str.split(/[- :T]/);
    switch (format) {
        case 'd':
            return t[2]+'.'+t[1]+'.'+t[0];
        case 'dt':
            return t[2]+'.'+t[1]+'.'+t[0]+' '+t[3]+':'+t[4];
        case 'sql':
            return str.slice(0, 10);
        case 'sqlt':
            return str.slice(0, 10)+' '+t[3]+':'+t[4]+':'+t[5];
        default:
            return new Date(Date.UTC(t[0], t[1]-1, t[2], t[3], t[4], t[5]));
    }
},
formatDigits = function(str, add){
    if (!str) return '';
    var fl = parseFloat(str)%1;
    if (fl>0&&!add) add = 2;
    return parseInt(str).toLocaleString() + ((add)? fl.toFixed(add).substr(-1-add) : '');
},
formatMoney = function(str){
    return formatDigits(str, 2);
},
leadZero = function(val) {
	return (val.toString().length==1)? '0'+val : val;
},
makeExtLnk = function(text, href = '#') {
    return '<a href="'+ href +'" target="_blank">'+ text +'</a>';
},
loadHTML = function(url, params) {
    switch (typeof params) {
        case 'string': // Если строка, то загружаем в определенный блок и каждый раз
            params = {
                id: params,
                loadonce: false
            };
        break;
        case 'function':
            params = {
                callback: params
            };
        break;
    }
    params = $.extend({
        loadonce: true,
        target: 'body'
    }, params);
    var el = $(params.id || '[data-urload="'+ url +'"]');
    if (el.length > 0 && params.loadonce) return;
    if (!el.length) el = $('<div></div>').appendTo(params.target);
    el.attr('data-urload', url).load(url, params.postData||{}, params.callback);
},
clubOnPopover = function(elm, html, opts) {
    opts = $.extend({
        html: true,
        sanitize: false,
        container: 'body',
        trigger: 'manual', // 'click'
        //placement: 'top',
        content: html
    }, opts);
    var tip = $( elm.popover(opts).popover('show').data('bs.popover').tip );
    tip.on('click', '.closePopover', function() {
        tip.popover('dispose');
    });
    
    $(document).off('mouseup.clubPopover').on('mouseup.clubPopover', function(e){
        if (!tip.is(e.target) && tip.has(e.target).length === 0) {
            $(document).off('mouseup.clubPopover');
            tip.popover('dispose');
        }
    });
    return tip;
},
detectSmartphone = function() {
    return (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) || window.matchMedia("(max-width: 767px)").matches);
},
showPhotos = function(imgs) {
    SCRM.loadWSS('blueimp', function(){
        if (!Array.isArray(imgs)) imgs = [imgs];
        if (window.blueimp) blueimp.Gallery(imgs);
    });
    // {title: , thumbnail: small, href: big}
},
clubScroll = function(elm) {
    var header = $('.app-header'),
        offset = (header.length)? header.eq(0).height()+2 : 70;
    $('html, body').animate({
        scrollTop: $(elm).offset().top - offset
    }, 1000);
};

//$.holdReady( true );

$(function(){
    $('body')
    .on('keydown', 'textarea', function(e) {
        if ((e.metaKey || e.ctrlKey) && e.keyCode == 13) {
            $(e.target).closest('form').submit();
        }
    })
    .on('click', '[data-roinplace]', function(e){
        e.preventDefault();
        var lnk = $(this);
        SCRM.loadWSS('roinplace', function() {
            lnk.roinplace();
        });
    })
    .on('click', '.telPopover,[data-popmenu]', function(e) {
        e.preventDefault();
        var lnk = $(this);
        SCRM.loadWSS('popmenu', function() {
            lnk.sPopMenu();
        });
    })
    .on('click', '[data-extaction]', function(e){
        e.preventDefault();
        var btn = $(this),
            url = btn.data('extaction');
        if (btn.data('grid')) {
            var grid = grids[ btn.data('grid') ];
            getGridSelRows(grid, function(selIDs){
                clubPostForm(url, {ids: selIDs});
                clearGridSelect(grid);
            });
        } else {
            clubPostForm(url, {});
        }
    })
    .on('click', '.club-file,.club-img', function (e) {
        var href = $(this).attr('href'),
            ext = href.split('.').pop();
        if (in_array(ext, ['jpg','jpeg','png','gif','heic'])) {
            e.preventDefault();
            showPhotos(href);
        }
    })
    .on('focus blur keyup change', '.form-label-group > input', function () {
        this.classList[this.value ? 'remove' : 'add']('placeholder-shown');
    }) // fire .placeholder-shown for IE
    .on('click', '.stop-propagation', function (e) {
        e.stopPropagation();
    })
    .on('click', '.prevent-default', function (e) {
        e.preventDefault();
    })
    .on('click', '[data-scrollto]', function(e){
        clubScroll( $(this).data('scrollto') );
    })
    .on('click', '[data-hint]', function(e){
        e.preventDefault();
        var lnk = $(this), hint_key = lnk.data('hint');
        if (lnk.hasClass('scrmHint')) {
            lnk.tooltip('show');
        } else {
            pJSON('/data/hint/' + (hint_key||'x'), function(data){
                if (data && data.name) {
                    var opts = $.extend({
                        //html: true,
                        trigger: 'manual',
                        //placement: 'auto',
                        title: data.info || data.name
                    }, data.extended);
                    
                    lnk
                    .addClass('scrmHint')
                    .on('inserted.bs.tooltip', function(e) {
                        var tipId = lnk.attr('aria-describedby');
                        var tip = $( '#'+tipId );
                        var ttinner = $('.tooltip-inner', tip).addClass('text-left');
                        
                        if (opts.bigSize) {
                            ttinner.css({
                                'min-width':'350px'
                            });
                        }
                        $(document)
                        .off('mouseup.tooltip.scrm').on('mouseup.tooltip.scrm', function(e) {
                            if (!tip.is(e.target) && tip.has(e.target).length === 0) {
                                $(document).off('mouseup.tooltip.scrm');
                                lnk.tooltip('hide');
                            }
                        });
                    })
                    .tooltip(opts)
                    .tooltip('show');
                }
            });
        }
    })
    .on('click', '.fmtCreated', function(e){
        e.preventDefault();
        var lnk = $(this);
        pDATA(lnk.data('tbl'), {
            _report: 'created',
            _where: 'id=' + lnk.data('id')
        }, function(data){
            if (!data.rows) return;
            var row = data.rows[0];
            var text = '<b>'+ str2date(row.created,'dt') +'</b>';
            if (row.author) text += '<br>'+row.author_fullname + ' | ' + row.author_username;
            if (row.edited) text += '<hr class="my-1"><i class="fa fa-pencil pull-right"></i><b>'+str2date(row.edited,'dt')+'</b>';
            if (row.editor_fullname) text += '<br>'+row.editor_fullname + ' | ' + row.editor_username;

            clubOnPopover(lnk, '<div class="small">'+ text +'</div>');
        });
    })
    .on('click', '.showSpCard,[data-sportsmen]', function(e){
        e.preventDefault();
        SCRM._runLoader('spCard')({
            cardHolder: 'modal',
            key: $(this).data('sportsmen')||$(this).data('key')
        });
    })
    .on('click', '[data-run]', function(e){
        e.preventDefault();
        var elm = $(this), linkData = elm.data();
        SCRM._run.call(elm, linkData['run'], linkData);
        /*
        SCRM._run(elm.data('run'), {
            data: linkData,
            elm: elm
        }, {
            postData: linkData
        });
        */
    })
    .on('shown.bs.tab', '[data-toggle="tab"].calculate', function(e) {
        $(this).trigger('calculate');
    })
    .on('shown.bs.tab.scrm', function(e) {
        var tab = $(e.target);
        var vdata = ( tab.view()||{} ).data;
        console.log('shown.bs.tab.scrm', vdata)
        if (vdata) {
            var nd = {hidden: false};
            /*if (vdata.url) {
                
                SCRM._run(vdata.url, {
                    container: vdata.target || tab.attr('href')
                });
                nd.url = null;
            }*/
            SCRM.link(vdata, nd);
            if (vdata.onShow) vdata.onShow(vdata);
        }
    })
    .on('calculate', '[data-toggle="tab"]', function(e) {
        var link = $(this).removeClass('calculate'),
            href = link.attr('href');
        if (href /*&& link.data('toggle')=='tab'*/) {
            var grids = $(href).find('.calculateGrid');
            if (grids.length) {
                SCRM.loadWSS('grid', function(){
                    grids.trigger('reloadGrid');
                });
            }
        }
    })
    .on('fieldEDIT', function(e, val) {
        var el = $(e.target),
            field = (el.data('field')||'').split(':'),
            pd = {
                id: el.data('id')
            };
        if (!field[1] || !pd.id) return false;
        pd[ field[1] ] = val;
        pEDIT(field[0], pd, function(){
            $(document).trigger('setROW.'+field[0], pd);
            SCRM.success('Saved');
        });
    });
});

(function ( $ ) {
    $.fn.reCalculate = function () {
        console.log('reCalculate', this);
        this.addClass('calculate').filter('.active').trigger('calculate');
        return this;
    };
    $.fn.initDateEdit = function (options) {
        var el = this;
        
        function _initDateEdit(){
            el.each(function() {
                var elDE = $(this),
                    _setDateEdit = function (selectedDates, dateStr, instance) {
                        var d1d2 = {};
                        var sqlDates = $.map(selectedDates, function(v, i){
                            var d = instance.formatDate(v, (options.enableTime)? 'Y-m-d H:i:S' : 'Y-m-d');
                            d1d2['d'+(i+1)] = d;
                            return d;
                        });
                        elDE.data('dateStr', dateStr)
                        .trigger('onChangeDateEdit', {
                            selectedDates: selectedDates,
                            dateStr: dateStr,
                            sqlDates: sqlDates,
                            instance: instance,
                            d1d2: d1d2
                        });
                    };
                options = $.extend({
                    disableMobile: true,
                    onReady: _setDateEdit,
                    onChange: function (selectedDates, dateStr, instance) {
                        if (dateStr != elDE.data('dateStr')) {
                            _setDateEdit(selectedDates, dateStr, instance);
                        }
                    }
                }, options);
                if (options.clearButton) {
                    elDE.wrap('<div class="input-group has-clearable flatpickr"></div>');
                    $('<button class="close show"><i class="fa fa-times-circle"></i></button>')
                    .insertAfter(elDE)
                    .click(function(){
                        elDE[0]._flatpickr.clear();
                    });
                }
                elDE.flatpickr(options);
                elDE.trigger('onInitDateEdit', {
                    instance: elDE[0]._flatpickr
                });
            })
            .addClass('onDestroyParent')
            .on('onDestroyParent', function(e){
                $(this)[0]._flatpickr.destroy();
            })
        }

        if (!window.flatpickr) SCRM.loadWSS('flatpickr', _initDateEdit); else _initDateEdit();
        return el;
    };
    $.fn.initMaskEdit = function (mask, callback) {
        var maskElems = this;
        SCRM.loadWSS('mask', function(){
            maskElems.each(function() {
                var elm = $(this), opts = {selectOnFocus: true};
                mask = elm.data('masked') || mask;
                if (mask=='money') {
                    mask = '#.##0,00';
                    $.extend(opts, {reverse: true});
                }
                elm.mask(mask, opts);
            });
            if (callback) callback(maskElems);
        });
        return maskElems;
    };
    $.fn.pauseFocus = function (select) {
        var el = this;
        setTimeout(function () {
            el.focus();
            if (select) el.select();
        }, 50);
        return el;
    };
    $.fn.getParentData = function (row) { // Передать пустой объект, который будет заполнен
        var el = this, data;
        var tr = el.closest('tr.jqgrow'), gr = el.closest('table[data-entity]');
        console.log(tr, gr)
        if (tr.length && gr.length) {
            var grData = gr.jqGrid('getRowData', tr.attr('id'));
            $.extend(row, grData); return el;
        }
        var ecard = el.closest('fieldset.ecardrows');
        if (ecard.length) {
            var v = ecard.view();
            if (v && v.data) $.extend(row, v.data.edata); return el;
        }
        return el;
    };
}( jQuery ));

/*! jsviews.js v1.0.12 single-file version: http://jsviews.com/ */
/*! includes JsRender, JsObservable and JsViews - see: http://jsviews.com/#download */
!function(e,t){var n=t.jQuery;"object"==typeof exports?module.exports=n?e(t,n):function(n){return e(t,n)}:"function"==typeof define&&define.amd?define(["jquery"],function(n){return e(t,n)}):e(t,!1)}(function(e,t){"use strict";function n(e,t){return function(){var n,r=this,i=r.base;return r.base=e,n=t.apply(r,arguments),r.base=i,n}}function r(e,t){return Ye(t)&&(t=n(e?e._d?e:n(o,e):o,t),t._d=(e&&e._d||0)+1),t}function i(e,t){var n,i=t.props;for(n in i)!jt.test(n)||e[n]&&e[n].fix||(e[n]="convert"!==n?r(e.constructor.prototype[n],i[n]):i[n])}function a(e){return e}function o(){return""}function s(e){try{throw console.log("JsRender dbg breakpoint: "+e),"dbg breakpoint"}catch(t){}return this.base?this.baseApply(arguments):e}function l(e){this.name=(t.link?"JsViews":"JsRender")+" Error",this.message=e||this.name}function d(e,t){if(e){for(var n in t)e[n]=t[n];return e}}function p(e,t,n){return e?et(e)?p.apply(We,e):(ut=n?n[0]:ut,/^(\W|_){5}$/.test(e+t+ut)||O("Invalid delimiters"),dt=e[0],pt=e[1],ct=t[0],ft=t[1],ot.delimiters=[dt+pt,ct+ft,ut],e="\\"+dt+"(\\"+ut+")?\\"+pt,t="\\"+ct+"\\"+ft,ze="(?:(\\w+(?=[\\/\\s\\"+ct+"]))|(\\w+)?(:)|(>)|(\\*))\\s*((?:[^\\"+ct+"]|\\"+ct+"(?!\\"+ft+"))*?)",at.rTag="(?:"+ze+")",ze=new RegExp("(?:"+e+ze+"(\\/)?|\\"+dt+"(\\"+ut+")?\\"+pt+"(?:(?:\\/(\\w+))\\s*|!--[\\s\\S]*?--))"+t,"g"),at.rTmpl=new RegExp("^\\s|\\s$|<.*>|([^\\\\]|^)[{}]|"+e+".*"+t),lt):ot.delimiters}function c(e,t){t||e===!0||(t=e,e=void 0);var n,r,i,a,o=this,s="root"===t;if(e){if(a=t&&o.type===t&&o,!a)if(n=o.views,o._.useKey){for(r in n)if(a=t?n[r].get(e,t):n[r])break}else for(r=0,i=n.length;!a&&r<i;r++)a=t?n[r].get(e,t):n[r]}else if(s)a=o.root;else if(t)for(;o&&!a;)a=o.type===t?o:void 0,o=o.parent;else a=o.parent;return a||void 0}function f(){var e=this.get("item");return e?e.index:void 0}function u(){return this.index}function g(e,t,n,r){var i,a,s,l=0;if(1===n&&(r=1,n=void 0),t)for(a=t.split("."),s=a.length;e&&l<s;l++)i=e,e=a[l]?e[a[l]]:e;return n&&(n.lt=n.lt||l<s),void 0===e?r?o:"":r?function(){return e.apply(i,arguments)}:e}function v(n,r,i){var a,o,s,l,p,c,f,u=this,g=!vt&&arguments.length>1,v=u.ctx;if(n){if(u._||(p=u.index,u=u.tag),c=u,v&&v.hasOwnProperty(n)||(v=rt).hasOwnProperty(n)){if(s=v[n],"tag"===n||"tagCtx"===n||"root"===n||"parentTags"===n)return s}else v=void 0;if((!vt&&u.tagCtx||u.linked)&&(s&&s._cxp||(u=u.tagCtx||Ye(s)?u:(u=u.scope||u,!u.isTop&&u.ctx.tag||u),void 0!==s&&u.tagCtx&&(u=u.tagCtx.view.scope),v=u._ocps,s=v&&v.hasOwnProperty(n)&&v[n]||s,s&&s._cxp||!i&&!g||((v||(u._ocps=u._ocps||{}))[n]=s=[{_ocp:s,_vw:c,_key:n}],s._cxp={path:_t,ind:0,updateValue:function(e,n){return t.observable(s[0]).setProperty(_t,e),this}})),l=s&&s._cxp)){if(arguments.length>2)return o=s[1]?at._ceo(s[1].deps):[_t],o.unshift(s[0]),o._cxp=l,o;if(p=l.tagElse,f=s[1]?l.tag&&l.tag.cvtArgs?l.tag.cvtArgs(p,1)[l.ind]:s[1](s[0].data,s[0],at):s[0]._ocp,g)return at._ucp(n,r,u,l),u;s=f}return s&&Ye(s)&&(a=function(){return s.apply(this&&this!==e?this:c,arguments)},d(a,s)),a||s}}function h(e){return e&&(e.fn?e:this.getRsc("templates",e)||tt(e))}function _(e,t,n,r){var a,o,s,l,p,c="number"==typeof n&&t.tmpl.bnds[n-1];if(void 0===r&&c&&c._lr&&(r=""),void 0!==r?n=r={props:{},args:[r]}:c&&(n=c(t.data,t,at)),c=c._bd&&c,e||c){if(o=t._lc,a=o&&o.tag,n.view=t,!a){if(a=d(new at._tg,{_:{bnd:c,unlinked:!0,lt:n.lt},inline:!o,tagName:":",convert:e,onArrayChange:!0,flow:!0,tagCtx:n,tagCtxs:[n],_is:"tag"}),l=n.args.length,l>1)for(p=a.bindTo=[];l--;)p.unshift(l);o&&(o.tag=a,a.linkCtx=o),n.ctx=J(n.ctx,(o?o.view:t).ctx),i(a,n)}a._er=r&&s,a.ctx=n.ctx||a.ctx||{},n.ctx=void 0,s=a.cvtArgs()[0],a._er=r&&s}else s=n.args[0];return s=c&&t._.onRender?t._.onRender(s,t,a):s,void 0!=s?s:""}function m(e,t){var n,r,i,a,o,s,l,d=this;if(d.tagName){if(s=d,d=(s.tagCtxs||[d])[e||0],!d)return}else s=d.tag;if(o=s.bindFrom,a=d.args,(l=s.convert)&&typeof l===Bt&&(l="true"===l?void 0:d.view.getRsc("converters",l)||O("Unknown converter: '"+l+"'")),l&&!t&&(a=a.slice()),o){for(i=[],n=o.length;n--;)r=o[n],i.unshift(b(d,r));t&&(a=i)}if(l){if(l=l.apply(s,i||a),void 0===l)return a;if(o=o||[0],n=o.length,et(l)&&(l.arg0===!1||1!==n&&l.length===n&&!l.arg0)||(l=[l],o=[0],n=1),t)a=l;else for(;n--;)r=o[n],+r===r&&(a[r]=l[n])}return a}function b(e,t){return e=e[+t===t?"args":"props"],e&&e[t]}function x(e){return this.cvtArgs(e,1)}function y(e,t){var n,r,i=this;if(typeof t===Bt){for(;void 0===n&&i;)r=i.tmpl&&i.tmpl[e],n=r&&r[t],i=i.parent;return n||We[e][t]}}function w(e,t,n,r,a,o){function s(e){var t=l[e];if(void 0!==t)for(t=et(t)?t:[t],h=t.length;h--;)U=t[h],isNaN(parseInt(U))||(t[h]=parseInt(U));return t||[0]}t=t||Qe;var l,d,p,c,f,u,g,h,_,y,w,C,k,E,j,A,I,T,V,S,P,N,F,L,$,U,R,D,q,K,H=0,z="",Q=t._lc||!1,W=t.ctx,X=n||t.tmpl,Z="number"==typeof r&&t.tmpl.bnds[r-1];for("tag"===e._is?(l=e,e=l.tagName,r=l.tagCtxs,p=l.template):(d=t.getRsc("tags",e)||O("Unknown tag: {{"+e+"}} "),p=d.template),void 0===o&&Z&&(Z._lr=d.lateRender&&Z._lr!==!1||Z._lr)&&(o=""),void 0!==o?(z+=o,r=o=[{props:{},args:[],params:{props:{}}}]):Z&&(r=Z(t.data,t,at)),g=r.length;H<g;H++)w=r[H],I=w.tmpl,(!Q||!Q.tag||H&&!Q.tag.inline||l._er||I&&+I===I)&&(I&&X.tmpls&&(w.tmpl=w.content=X.tmpls[I-1]),w.index=H,w.ctxPrm=v,w.render=M,w.cvtArgs=m,w.bndArgs=x,w.view=t,w.ctx=J(J(w.ctx,d&&d.ctx),W)),(n=w.props.tmpl)&&(w.tmpl=t._getTmpl(n),w.content=w.content||w.tmpl),l?Q&&Q.fn._lr&&(T=!!l.init):(l=new d._ctr,T=!!l.init,l.parent=u=W&&W.tag,l.tagCtxs=r,Q&&(l.inline=!1,Q.tag=l),l.linkCtx=Q,(l._.bnd=Z||Q.fn)?(l._.ths=w.params.props["this"],l._.lt=r.lt,l._.arrVws={}):l.dataBoundOnly&&O(e+" must be data-bound:\n{^{"+e+"}}")),L=l.dataMap,w.tag=l,L&&r&&(w.map=r[H].map),l.flow||(C=w.ctx=w.ctx||{},c=l.parents=C.parentTags=W&&J(C.parentTags,W.parentTags)||{},u&&(c[u.tagName]=u),c[l.tagName]=C.tag=l,C.tagCtx=w);if(!(l._er=o)){for(i(l,r[0]),l.rendering={rndr:l.rendering},H=0;H<g;H++){if(w=l.tagCtx=r[H],F=w.props,l.ctx=w.ctx,!H){if(T&&(l.init(w,Q,l.ctx),T=void 0),w.args.length||w.argDefault===!1||l.argDefault===!1||(w.args=P=[w.view.data],w.params.args=["#data"]),E=s("bindTo"),void 0!==l.bindTo&&(l.bindTo=E),void 0!==l.bindFrom?l.bindFrom=s("bindFrom"):l.bindTo&&(l.bindFrom=l.bindTo=E),j=l.bindFrom||E,D=E.length,R=j.length,l._.bnd&&(q=l.linkedElement)&&(l.linkedElement=q=et(q)?q:[q],D!==q.length&&O("linkedElement not same length as bindTo")),(q=l.linkedCtxParam)&&(l.linkedCtxParam=q=et(q)?q:[q],R!==q.length&&O("linkedCtxParam not same length as bindFrom/bindTo")),j)for(l._.fromIndex={},l._.toIndex={},_=R;_--;)for(U=j[_],h=D;h--;)U===E[h]&&(l._.fromIndex[h]=_,l._.toIndex[_]=h);Q&&(Q.attr=l.attr=Q.attr||l.attr||Q._dfAt),f=l.attr,l._.noVws=f&&f!==Mt}if(P=l.cvtArgs(H),l.linkedCtxParam)for(N=l.cvtArgs(H,1),h=R,K=l.constructor.prototype.ctx;h--;)(k=l.linkedCtxParam[h])&&(U=j[h],A=N[h],w.ctx[k]=at._cp(K&&void 0===A?K[k]:A,void 0!==A&&b(w.params,U),w.view,l._.bnd&&{tag:l,cvt:l.convert,ind:h,tagElse:H}));(V=F.dataMap||L)&&(P.length||F.dataMap)&&(S=w.map,S&&S.src===P[0]&&!a||(S&&S.src&&S.unmap(),V.map(P[0],w,S,!l._.bnd),S=w.map),P=[S.tgt]),y=void 0,l.render&&(y=l.render.apply(l,P),t.linked&&y&&!At.test(y)&&(n={links:[]},n.render=n.fn=function(){return y},y=B(n,t.data,void 0,!0,t,void 0,void 0,l))),P.length||(P=[t]),void 0===y&&($=P[0],l.contentCtx&&($=l.contentCtx===!0?t:l.contentCtx($)),y=w.render($,!0)||(a?void 0:"")),z=z?z+(y||""):void 0!==y?""+y:void 0}l.rendering=l.rendering.rndr}return l.tagCtx=r[0],l.ctx=l.tagCtx.ctx,l._.noVws&&l.inline&&(z="text"===f?nt.html(z):""),Z&&t._.onRender?t._.onRender(z,t,l):z}function C(e,t,n,r,i,a,o,s){var l,d,p,c=this,u="array"===t;c.content=s,c.views=u?[]:{},c.data=r,c.tmpl=i,p=c._={key:0,useKey:u?0:1,id:""+Pt++,onRender:o,bnds:{}},c.linked=!!o,c.type=t||"top",t&&(c.cache={_ct:ot._cchCt}),n&&"top"!==n.type||((c.ctx=e||{}).root=c.data),(c.parent=n)?(c.root=n.root||c,l=n.views,d=n._,c.isTop=d.scp,c.scope=(!e.tag||e.tag===n.ctx.tag)&&!c.isTop&&n.scope||c,d.useKey?(l[p.key="_"+d.useKey++]=c,c.index=Ut,c.getIndex=f):l.length===(p.key=c.index=a)?l.push(c):l.splice(a,0,c),c.ctx=e||n.ctx):t&&(c.root=c)}function k(e){var t,n,r;for(t in Ht)n=t+"s",e[n]&&(r=e[n],e[n]={},We[n](r,e))}function E(e,t,n){function i(){var t=this;t._={unlinked:!0},t.inline=!0,t.tagName=e}var a,o,s,l=new at._tg;if(Ye(t)?t={depends:t.depends,render:t}:typeof t===Bt&&(t={template:t}),o=t.baseTag){t.flow=!!t.flow,o=typeof o===Bt?n&&n.tags[o]||it[o]:o,o||O('baseTag: "'+t.baseTag+'" not found'),l=d(l,o);for(s in t)l[s]=r(o[s],t[s])}else l=d(l,t);return void 0!==(a=l.template)&&(l.template=typeof a===Bt?tt[a]||tt(a):a),(i.prototype=l).constructor=l._ctr=i,n&&(l._parentTmpl=n),l}function j(e){return this.base.apply(this,e)}function A(e,n,r,i){function a(n){var a,s;if(typeof n===Bt||n.nodeType>0&&(o=n)){if(!o)if(/^\.?\/[^\\:*?"<>]*$/.test(n))(s=tt[e=e||n])?n=s:o=document.getElementById(n);else if("#"===n.charAt(0))o=document.getElementById(n.slice(1));else if(t.fn&&!at.rTmpl.test(n))try{o=t(n,document)[0]}catch(l){}o&&("SCRIPT"!==o.tagName&&O(n+": Use script block, not "+o.tagName),i?n=o.innerHTML:(a=o.getAttribute(Ot),a&&(a!==$t?(n=tt[a],delete tt[a]):t.fn&&(n=t.data(o)[$t])),a&&n||(e=e||(t.fn?$t:n),n=A(e,o.innerHTML,r,i)),n.tmplName=e=e||a,e!==$t&&(tt[e]=n),o.setAttribute(Ot,e),t.fn&&t.data(o,$t,n))),o=void 0}else n.fn||(n=void 0);return n}var o,s,l=n=n||"";if(at._html=nt.html,0===i&&(i=void 0,l=a(l)),i=i||(n.markup?n.bnds?d({},n):n:{}),i.tmplName=i.tmplName||e||"unnamed",r&&(i._parentTmpl=r),!l&&n.markup&&(l=a(n.markup))&&l.fn&&(l=l.markup),void 0!==l)return l.render||n.render?l.tmpls&&(s=l):(n=S(l,i),U(l.replace(xt,"\\$&"),n)),s||(s=d(function(){return s.render.apply(s,arguments)},n),k(s)),s}function I(e,t){return Ye(e)?e.call(t):e}function T(e,t,n){Object.defineProperty(e,t,{value:n,configurable:!0})}function V(e,n){function r(e){p.apply(this,e)}function i(){return new r(arguments)}function a(e,t){for(var n,r,i,a,o,s=0;s<b;s++)i=u[s],n=void 0,typeof i!==Bt&&(n=i,i=n.getter,o=n.parentRef),void 0===(a=e[i])&&n&&void 0!==(r=n.defaultVal)&&(a=I(r,e)),t(a,n&&f[n.type],i,o)}function o(t){t=typeof t===Bt?JSON.parse(t):t;var n,r,i,o,d=0,p=t,c=[];if(et(t)){for(t=t||[],n=t.length;d<n;d++)c.push(this.map(t[d]));return c._is=e,c.unmap=l,c.merge=s,c}if(t){for(a(t,function(e,t){t&&(e=t.map(e)),c.push(e)}),p=this.apply(this,c),d=b;d--;)if(i=c[d],o=u[d].parentRef,o&&i&&i.unmap)if(et(i))for(n=i.length;n--;)T(i[n],o,p);else T(i,o,p);for(r in t)r===Ge||y[r]||(p[r]=t[r])}return p}function s(e,t,n){e=typeof e===Bt?JSON.parse(e):e;var r,o,s,l,d,p,c,f,u,g,h=0,_=this;if(et(_)){for(c={},u=[],o=e.length,s=_.length;h<o;h++){for(f=e[h],p=!1,r=0;r<s&&!p;r++)c[r]||(d=_[r],v&&(c[r]=p=typeof v===Bt?f[v]&&(y[v]?d[v]():d[v])===f[v]:v(d,f)));p?(d.merge(f),u.push(d)):(u.push(g=i.map(f)),n&&T(g,n,t))}return void(x?x(_).refresh(u,!0):_.splice.apply(_,[0,_.length].concat(u)))}a(e,function(e,t,n,r){t?_[n]().merge(e,_,r):_[n]()!==e&&_[n](e)});for(l in e)l===Ge||y[l]||(_[l]=e[l])}function l(){function e(e){for(var t=[],n=0,r=e.length;n<r;n++)t.push(e[n].unmap());return t}var t,n,r,i,a=0,o=this;if(et(o))return e(o);for(t={};a<b;a++)n=u[a],r=void 0,typeof n!==Bt&&(r=n,n=r.getter),i=o[n](),t[n]=r&&i&&f[r.type]?et(i)?e(i):i.unmap():i;for(n in o)!o.hasOwnProperty(n)||"_"===n.charAt(0)&&y[n.slice(1)]||n===Ge||Ye(o[n])||(t[n]=o[n]);return t}var d,p,c,f=this,u=n.getters,g=n.extend,v=n.id,h=t.extend({_is:e||"unnamed",unmap:l,merge:s},g),_="",m="",b=u?u.length:0,x=t.observable,y={};for(r.prototype=h,d=0;d<b;d++)!function(e){e=e.getter||e,y[e]=d+1;var t="_"+e;_+=(_?",":"")+e,m+="this."+t+" = "+e+";\n",h[e]=h[e]||function(n){return arguments.length?void(x?x(this).setProperty(e,n):this[t]=n):this[t]},x&&(h[e].set=h[e].set||function(e){this[t]=e})}(u[d]);return m=new Function(_,m),p=function(){m.apply(this,arguments),(c=arguments[b+1])&&T(this,arguments[b],c)},p.prototype=h,h.constructor=p,i.map=o,i.getters=u,i.extend=g,i.id=v,i}function S(e,n){var r,i=st._wm||{},a={tmpls:[],links:{},bnds:[],_is:"template",render:M};return n&&(a=d(a,n)),a.markup=e,a.htmlTag||(r=Ct.exec(e),a.htmlTag=r?r[1].toLowerCase():""),r=i[a.htmlTag],r&&r!==i.div&&(a.markup=t.trim(a.markup)),a}function P(e,t){function n(i,a,o){var s,l,d,p=at.onStore[e];if(i&&typeof i===Lt&&!i.nodeType&&!i.markup&&!i.getTgt&&!("viewModel"===e&&i.getters||i.extend)){for(l in i)n(l,i[l],a);return a||We}return i&&typeof i!==Bt&&(o=a,a=i,i=void 0),d=o?"viewModel"===e?o:o[r]=o[r]||{}:n,s=t.compile,void 0===a&&(a=s?i:d[i],i=void 0),null===a?i&&delete d[i]:(s&&(a=s.call(d,i,a,o,0)||{},a._is=e),i&&(d[i]=a)),p&&p(i,a,o,s),a}var r=e+"s";We[r]=n}function N(e){lt[e]=lt[e]||function(t){return arguments.length?(ot[e]=t,lt):ot[e]}}function F(e){function t(t,n){this.tgt=e.getTgt(t,n),n.map=this}return Ye(e)&&(e={getTgt:e}),e.baseMap&&(e=d(d({},e.baseMap),e)),e.map=function(e,n){return new t(e,n)},e}function M(e,t,n,r,i,a){var o,s,l,d,p,c,f,u,g=r,v="";if(t===!0?(n=t,t=void 0):typeof t!==Lt&&(t=void 0),(l=this.tag)?(p=this,g=g||p.view,d=g._getTmpl(l.template||p.tmpl),arguments.length||(e=l.contentCtx&&Ye(l.contentCtx)?e=l.contentCtx(e):g)):d=this,d){if(!r&&e&&"view"===e._is&&(g=e),g&&e===g&&(e=g.data),c=!g,vt=vt||c,c&&((t=t||{}).root=e),!vt||st.useViews||d.useViews||g&&g!==Qe)v=B(d,e,t,n,g,i,a,l);else{if(g?(f=g.data,u=g.index,g.index=Ut):(g=Qe,f=g.data,g.data=e,g.ctx=t),et(e)&&!n)for(o=0,s=e.length;o<s;o++)g.index=o,g.data=e[o],v+=d.fn(e[o],g,at);else g.data=e,v+=d.fn(e,g,at);g.data=f,g.index=u}c&&(vt=void 0)}return v}function B(e,t,n,r,i,a,o,s){var l,p,c,f,u,g,v,h,_,m,b,x,y,w="";if(s&&(_=s.tagName,x=s.tagCtx,n=n?J(n,s.ctx):s.ctx,e===i.content?v=e!==i.ctx._wrp?i.ctx._wrp:void 0:e!==x.content?e===s.template?(v=x.tmpl,n._wrp=x.content):v=x.content||i.content:v=i.content,x.props.link===!1&&(n=n||{},n.link=!1)),i&&(o=o||i._.onRender,y=n&&n.link===!1,y&&i._.nl&&(o=void 0),n=J(n,i.ctx),x=!s&&i.tag?i.tag.tagCtxs[i.tagElse]:x),(m=x&&x.props.itemVar)&&("~"!==m[0]&&$("Use itemVar='~myItem'"),m=m.slice(1)),a===!0&&(g=!0,a=0),o&&s&&s._.noVws&&(o=void 0),h=o,o===!0&&(h=void 0,o=i._.onRender),n=e.helpers?J(e.helpers,n):n,b=n,et(t)&&!r)for(c=g?i:void 0!==a&&i||new C(n,"array",i,t,e,a,o,v),c._.nl=y,i&&i._.useKey&&(c._.bnd=!s||s._.bnd&&s,c.tag=s),l=0,p=t.length;l<p;l++)f=new C(b,"item",c,t[l],e,(a||0)+l,o,c.content),m&&((f.ctx=d({},b))[m]=at._cp(t[l],"#data",f)),u=e.fn(t[l],f,at),w+=c._.onRender?c._.onRender(u,f):u;else c=g?i:new C(b,_||"data",i,t,e,a,o,v),m&&((c.ctx=d({},b))[m]=at._cp(t,"#data",c)),c.tag=s,c._.nl=y,w+=e.fn(t,c,at);return s&&(c.tagElse=x.index,x.contentView=c),h?h(w,c):w}function L(e,t,n){var r=void 0!==n?Ye(n)?n.call(t.data,e,t):n||"":"{Error: "+(e.message||e)+"}";return ot.onError&&void 0!==(n=ot.onError.call(t.data,e,n&&r,t))&&(r=n),t&&!t._lc?nt.html(r):r}function O(e){throw new at.Err(e)}function $(e){O("Syntax error\n"+e)}function U(e,t,n,r,i){function a(t){t-=v,t&&_.push(e.substr(v,t).replace(mt,"\\n"))}function o(t,n){t&&(t+="}}",$((n?"{{"+n+"}} block has {{/"+t+" without {{"+t:"Unmatched or missing {{/"+t)+", in template:\n"+e))}function s(s,l,d,f,g,b,x,y,w,C,k,E){(x&&l||w&&!d||y&&":"===y.slice(-1)||C)&&$(s),b&&(g=":",f=Mt),w=w||n&&!i;var j,A,I,T=(l||n)&&[[]],V="",S="",P="",N="",F="",M="",B="",L="",O=!w&&!g;d=d||(y=y||"#data",g),a(E),v=E+s.length,x?u&&_.push(["*","\n"+y.replace(/^:/,"ret+= ").replace(bt,"$1")+";\n"]):d?("else"===d&&(wt.test(y)&&$('For "{{else if expr}}" use "{{else expr}}"'),T=m[9]&&[[]],m[10]=e.substring(m[10],E),A=m[11]||m[0]||$("Mismatched: "+s),m=h.pop(),_=m[2],O=!0),y&&K(y.replace(mt," "),T,t,n).replace(yt,function(e,t,n,r,i,a,o,s){return"this:"===r&&(a="undefined"),s&&(I=I||"@"===s[0]),r="'"+i+"':",o?(S+=n+a+",",N+="'"+s+"',"):n?(P+=r+"j._cp("+a+',"'+s+'",view),',M+=r+"'"+s+"',"):t?B+=a:("trigger"===i&&(L+=a),"lateRender"===i&&(j="false"!==s),V+=r+a+",",F+=r+"'"+s+"',",c=c||jt.test(i)),""}).slice(0,-1),T&&T[0]&&T.pop(),p=[d,f||!!r||c||"",O&&[],D(N||(":"===d?"'#data',":""),F,M),D(S||(":"===d?"data,":""),V,P),B,L,j,I,T||0],_.push(p),O&&(h.push(m),m=p,m[10]=v,m[11]=A)):k&&(o(k!==m[0]&&k!==m[11]&&k,m[0]),m[10]=e.substring(m[10],E),m=h.pop()),o(!m&&k),_=m[2]}var l,d,p,c,f,u=ot.allowCode||t&&t.allowCode||lt.allowCode===!0,g=[],v=0,h=[],_=g,m=[,,g];if(u&&t._is&&(t.allowCode=u),n&&(void 0!==r&&(e=e.slice(0,-r.length-2)+ct),e=dt+e+ft),o(h[0]&&h[0][2].pop()[0]),e.replace(ze,s),a(e.length),(v=g[g.length-1])&&o(typeof v!==Bt&&+v[10]===v[10]&&v[0]),n){for(d=H(g,e,n),f=[],l=g.length;l--;)f.unshift(g[l][9]);R(d,f)}else d=H(g,t);return d}function R(e,t){var n,r,i=0,a=t.length;for(e.deps=[],e.paths=[];i<a;i++){e.paths.push(r=t[i]);for(n in r)"_jsvto"!==n&&r.hasOwnProperty(n)&&r[n].length&&!r[n].skp&&(e.deps=e.deps.concat(r[n]))}}function D(e,t,n){return[e.slice(0,-1),t.slice(0,-1),n.slice(0,-1)]}function q(e,t){return"\n\tparams:{args:["+e[0]+"],\n\tprops:{"+e[1]+"}"+(e[2]?",\n\tctx:{"+e[2]+"}":"")+"},\n\targs:["+t[0]+"],\n\tprops:{"+t[1]+"}"+(t[2]?",\n\tctx:{"+t[2]+"}":"")}function K(e,n,r,i){function a(r,a,d,j,A,I,T,V,S,P,N,F,M,B,L,O,U,R,D,q,K){function H(e,t,r,a,l,d,p,c){if(X="."===r,r&&(A=A.slice(t.length),/^\.?constructor$/.test(c||A)&&$(e),X||(e=(P?(i?"":"(ltOb.lt=ltOb.lt||")+"(ob=":"")+(a?'view.ctxPrm("'+a+'")':l?"view":"data")+(P?")===undefined"+(i?"":")")+'?"":view._getOb(ob,"':"")+(c?(d?"."+d:a?"":l?"":"."+r)+(p||""):(c=a?"":l?d||"":r,"")),e+=c?"."+c:"",e=t+("view.data"===e.slice(0,9)?e.slice(5):e)+(P?(i?'"':'",ltOb')+(N?",1)":")"):"")),f)){if(z="_linkTo"===o?s=n._jsvto=n._jsvto||[]:u.bd,Q=X&&z[z.length-1]){if(Q._cpfn){for(;Q.sb;)Q=Q.sb;Q.prm&&(Q.bnd&&(A="^"+A.slice(1)),Q.sb=A,Q.bnd=Q.bnd||"^"===A[0])}}else z.push(A);N&&!X&&(w[_]=Y,C[_]=k[_].length)}return e}j&&!V&&(A=j+A),I=I||"",M=M||"",d=d||a||M,A=A||S,P&&(P=!/\)|]/.test(K[q-1]))&&(A=A.slice(1).split(".").join("^")),N=N||R||"";var J,z,Q,W,X,Z,G,Y=q;if(!c&&!p){if(T&&$(e),U&&f){if(J=w[_-1],K.length-1>Y-(J||0)){if(J=t.trim(K.slice(J,Y+r.length)),z=s||g[_-1].bd,Q=z[z.length-1],Q&&Q.prm){for(;Q.sb&&Q.sb.prm;)Q=Q.sb;W=Q.sb={path:Q.sb,bnd:Q.bnd}}else z.push(W={path:z.pop()});Q&&Q.sb===W&&(k[_]=k[_-1].slice(Q._cpPthSt)+k[_],k[_-1]=k[_-1].slice(0,Q._cpPthSt)),W._cpPthSt=C[_-1],W._cpKey=J,k[_]+=K.slice(E,q),E=q,W._cpfn=Rt[J]=Rt[J]||new Function("data,view,j","//"+J+"\nvar v;\nreturn ((v="+k[_]+("]"===O?")]":O)+")!=null?v:null);"),k[_-1]+=y[h]&&st.cache?'view.getCache("'+J.replace(xt,"\\$&")+'"':k[_],W.prm=u.bd,W.bnd=W.bnd||W.path&&W.path.indexOf("^")>=0}k[_]=""}"["===N&&(N="[j._sq("),"["===d&&(d="[j._sq(")}return G=c?(c=!B,c?r:M+'"'):p?(p=!L,p?r:M+'"'):(d?(x[++h]=!0,m[h]=0,f&&(w[_++]=Y++,u=g[_]={bd:[]},k[_]="",C[_]=1),d):"")+(D?h?"":(v=K.slice(v,Y),(o?(o=l=s=!1,"\b"):"\b,")+v+(v=Y+r.length,f&&n.push(u.bd=[]),"\b")):V?(_&&$(e),f&&n.pop(),o="_"+A,l=j,v=Y+r.length,f&&(f=u.bd=n[o]=[],f.skp=!j),A+":"):A?A.split("^").join(".").replace(at.rPath,H)+(N||I):I?I:O?"]"===O?")]":")":F?(y[h]||$(e),","):a?"":(c=B,p=L,'"')),c||p||O&&(y[h]=!1,h--),f&&(c||p||(O&&(x[h+1]&&(u=g[--_],x[h+1]=!1),b=m[h+1]),N&&(m[h+1]=k[_].length+(d?1:0),(A||O)&&(u=g[++_]={bd:[]},x[h+1]=!0))),k[_]=(k[_]||"")+K.slice(E,q),E=q+r.length,c||p||((Z=d&&x[h+1])&&(k[_-1]+=d,C[_-1]++),"("===N&&X&&!W&&(k[_]=k[_-1].slice(b)+k[_],k[_-1]=k[_-1].slice(0,b))),k[_]+=Z?G.slice(1):G),c||p||!N||(h++,A&&"("===N&&(y[h]=!0)),c||p||!R||(f&&(k[_]+=N),G+=N),G}var o,s,l,d,p,c,f=n&&n[0],u={bd:f},g={0:u},v=0,h=0,_=0,m={},b=0,x={},y={},w={},C={0:0},k={0:""},E=0;return"@"===e[0]&&(e=e.replace(St,".")),d=(e+(r?" ":"")).replace(at.rPrm,a),f&&(d=k[0]),!h&&d||$(e)}function H(e,t,n){var r,i,a,o,s,l,d,p,c,f,u,g,v,h,_,m,b,x,y,w,C,k,E,j,A,I,T,V,P,N,F,M,B,L=0,O=st.useViews||t.useViews||t.tags||t.templates||t.helpers||t.converters,U="",D={},K=e.length;for(typeof t===Bt?(x=n?'data-link="'+t.replace(mt," ").slice(1,-1)+'"':t,t=0):(x=t.tmplName||"unnamed",t.allowCode&&(D.allowCode=!0),t.debug&&(D.debug=!0),u=t.bnds,b=t.tmpls),r=0;r<K;r++)if(i=e[r],typeof i===Bt)U+='+"'+i+'"';else if(a=i[0],"*"===a)U+=";\n"+i[1]+"\nret=ret";else{if(o=i[1],C=!n&&i[2],s=q(i[3],v=i[4]),N=i[6],F=i[7],i[8]?(M="\nvar ob,ltOb={},ctxs=",B=";\nctxs.lt=ltOb.lt;\nreturn ctxs;"):(M="\nreturn ",B=""),k=i[10]&&i[10].replace(bt,"$1"),(A="else"===a)?g&&g.push(i[9]):(V=i[5]||ot.debugMode!==!1&&"undefined",u&&(g=i[9])&&(g=[g],L=u.push(1))),O=O||v[1]||v[2]||g||/view.(?!index)/.test(v[0]),(I=":"===a)?o&&(a=o===Mt?">":o+a):(C&&(y=S(k,D),y.tmplName=x+"/"+a,y.useViews=y.useViews||O,H(C,y),O=y.useViews,b.push(y)),A||(w=a,O=O||a&&(!it[a]||!it[a].flow),j=U,U=""),E=e[r+1],E=E&&"else"===E[0]),P=V?";\ntry{\nret+=":"\n+",h="",_="",I&&(g||N||o&&o!==Mt||F)){if(T=new Function("data,view,j","// "+x+" "+ ++L+" "+a+M+"{"+s+"};"+B),T._er=V,T._tag=a,T._bd=!!g,T._lr=F,n)return T;R(T,g),m='c("'+o+'",view,',f=!0,h=m+L+",",_=")"}if(U+=I?(n?(V?"try{\n":"")+"return ":P)+(f?(f=void 0,O=c=!0,m+(T?(u[L-1]=T,L):"{"+s+"}")+")"):">"===a?(d=!0,"h("+v[0]+")"):(p=!0,"((v="+v[0]+")!=null?v:"+(n?"null)":'"")'))):(l=!0,"\n{view:view,content:false,tmpl:"+(C?b.length:"false")+","+s+"},"),w&&!E){if(U="["+U.slice(0,-1)+"]",m='t("'+w+'",view,this,',n||g){if(U=new Function("data,view,j"," // "+x+" "+L+" "+w+M+U+B),U._er=V,U._tag=w,g&&R(u[L-1]=U,g),U._lr=F,n)return U;h=m+L+",undefined,",_=")"}U=j+P+m+(g&&L||U)+")",g=0,w=0}V&&!E&&(O=!0,U+=";\n}catch(e){ret"+(n?"urn ":"+=")+h+"j._err(e,view,"+V+")"+_+";}"+(n?"":"\nret=ret"))}U="// "+x+(D.debug?"\ndebugger;":"")+"\nvar v"+(l?",t=j._tag":"")+(c?",c=j._cnvt":"")+(d?",h=j._html":"")+(n?(i[8]?", ob":"")+";\n":',ret=""')+U+(n?"\n":";\nreturn ret;");try{U=new Function("data,view,j",U)}catch(J){$("Compiled template code:\n\n"+U+'\n: "'+(J.message||J)+'"')}return t&&(t.fn=U,t.useViews=!!O),U}function J(e,t){return e&&e!==t?t?d(d({},t),e):e:t&&d({},t)}function z(e,n){var r,i,a=n.map,o=a&&a.propsArr;if(!o){if(o=[],typeof e===Lt||Ye(e))for(r in e)i=e[r],r===Ge||!e.hasOwnProperty(r)||n.props.noFunctions&&t.isFunction(i)||o.push({key:r,prop:i});a&&(a.propsArr=a.options&&o)}return Q(o,n)}function Q(e,n){var r,i,a,o=n.tag,s=n.props,l=n.params.props,d=s.filter,p=s.sort,c=p===!0,f=parseInt(s.step),u=s.reverse?-1:1;if(!et(e))return e;if(c||p&&typeof p===Bt?(r=e.map(function(e,t){return e=c?e:g(e,p),{i:t,v:typeof e===Bt?e.toLowerCase():e}}),r.sort(function(e,t){return e.v>t.v?u:e.v<t.v?-u:0}),e=r.map(function(t){return e[t.i]})):(p||u<0)&&!o.dataMap&&(e=e.slice()),Ye(p)&&(e=e.sort(function(){return p.apply(n,arguments)})),u<0&&(!p||Ye(p))&&(e=e.reverse()),e.filter&&d&&(e=e.filter(d,n),n.tag.onFilter&&n.tag.onFilter(n)),l.sorted&&(r=p||u<0?e:e.slice(),o.sorted?t.observable(o.sorted).refresh(r):n.map.sorted=r),i=s.start,a=s.end,(l.start&&void 0===i||l.end&&void 0===a)&&(i=a=0),isNaN(i)&&isNaN(a)||(i=+i||0,a=void 0===a||a>e.length?e.length:+a,e=e.slice(i,a)),f>1){for(i=0,a=e.length,r=[];i<a;i+=f)r.push(e[i]);e=r}return l.paged&&o.paged&&Ze(o.paged).refresh(e),e}function W(e,n,r){var i=this.jquery&&(this[0]||O("Unknown template")),a=i.getAttribute(Ot);return M.call(a&&t.data(i)[$t]||tt(i),e,n,r)}function X(e){return Nt[e]||(Nt[e]="&#"+e.charCodeAt(0)+";")}function Z(e,t){return Ft[t]||""}function G(e){return void 0!=e?Et.test(e)&&(""+e).replace(It,X)||e:""}function Y(e){return typeof e===Bt?e.replace(Tt,X):e}function ee(e){return typeof e===Bt?e.replace(Vt,Z):e}function te(e,t,n,r,i){var a,o,s,l,d,p,c,f,u,g,v,h,_,m,b,x,y,w,C,k;if(r&&r._tgId&&(w=r,r=w._tgId,w.bindTo||(Ie(pr[r],w),w.bindTo=[0])),(p=pr[r])&&(v=p.to))for(v=v[t||0],a=p.linkCtx,u=a.elem,d=a.view,w=a.tag,!w&&v._cxp&&(w=v._cxp.path!==_t&&v._cxp.tag,c=e[0],e=[],e[v._cxp.ind]=c),w&&(w._.chg=1,(s=w.convertBack)&&(o=Ye(s)?s:d.getRsc("converters",s))),"SELECT"===u.nodeName?(u.multiple&&null===e[0]&&(e=[[]]),u._jsvSel=e):u._jsvSel&&(C=u._jsvSel,k=Cr(u.value,C),k>-1&&!u.checked?C.splice(k,1):k<0&&u.checked&&C.push(u.value),e=[C.slice()]),f=e,x=v.length,o&&(e=o.apply(w,e),void 0===e&&(v=[]),et(e)&&(e.arg0===!1||1!==x&&e.length===x&&!e.arg0)||(e=[e]));x--;)if((h=v[x])&&(h=typeof h===Bt?[a.data,h]:h,l=h[0],_=h.tag,c=(l&&l._ocp&&!l._vw?f:e)[x],!(void 0===c||w&&w.onBeforeUpdateVal&&w.onBeforeUpdateVal(i,{change:"change",data:l,path:h[1],index:x,tagElse:t,value:c})===!1)))if(_)void 0!==(y=_._.toIndex[h.ind])&&_.updateValue(c,y,h.tagElse,void 0,void 0,i),_.setValue(c,h.ind,h.tagElse);else if(void 0!==c&&l){if((_=i&&(g=i.target)._jsvInd===x&&g._jsvLkEl)&&void 0!==(y=_._.fromIndex[x])&&_.setValue(f[x],y,g._jsvElse),l._cpfn)for(b=a._ctxCb,m=l,l=a.data,m._cpCtx&&(l=m.data,b=m._cpCtx);m&&m.sb;)l=b(m),m=m.sb;Ze(l,n).setProperty(h[1],c,void 0,h.isCpfn)}if(w)return w._.chg=void 0,w}function ne(e){var n,r,i=e.target,a=le(i),o=Gn[a];if(!i._jsvTr||e.delegateTarget!==Cn&&"number"!==i.type||"input"===e.type){for(r=Ye(a)?a(i):o?t(i)[o]():t(i).attr(a),i._jsvChg=1,xr.lastIndex=0;n=xr.exec(i._jsvBnd);)Oe(r,i._jsvInd,i._jsvElse,void 0,n[1],e);i._jsvChg=void 0}}function re(e,t){var n,r,i,a,o,s,l,d,p,c=this,f=c.fn,u=c.tag,g=c.data,v=c.elem,h=c.convert,_=v.parentNode,m=c.view,b=m._lc,x=t&&Me(m,Bn,u);if(_&&(!x||x.call(u||c,e,t)!==!1)&&(!t||"*"===e.data.prop||e.data.prop===t.path)){if(m._lc=c,t||c._toLk){if(c._toLk=0,f._er)try{r=f(g,m,at)}catch(y){o=f._er,s=L(y,m,new Function("data,view","return "+o+";")(g,m)),r=[{props:{},args:[s],tag:u}]}else r=f(g,m,at);if(n=u&&u.attr||c.attr||(c._dfAt=le(v,!0,void 0!==h)),c._dfAt===Hn&&(u&&u.parentElem||c.elem).type===Un&&(n=$n),u){if(a=o||u._er,r=r[0]?r:[r],i=!a&&(u.onUpdate===!1||t&&Ye(u.onUpdate)&&u.onUpdate(e,t,r)===!1),Ve(u,r,a),u._.chg&&(n===Mt||n===Hn)||i||n===Kn)return ke(u,e,t),u._.chg||ce(c,g,v),m._lc=b,t&&(x=Me(m,Ln,u))&&x.call(u||c,e,t),void(u.tagCtx.props.dataMap&&u.tagCtx.props.dataMap.map(u.tagCtx.args[0],u.tagCtx,u.tagCtx.map,vt||!u._.bnd));for(u.onUnbind&&u.onUnbind(u.tagCtx,c,u.ctx,e,t),u.linkedElems=u.linkedElem=u.mainElem=u.displayElem=void 0,p=u.tagCtxs.length;p--;)d=u.tagCtxs[p],d.linkedElems=d.mainElem=d.displayElem=void 0;r=":"===u.tagName?at._cnvt(u.convert,m,r[0]):at._tag(u,m,m.tmpl,r,!0,s)}else f._tag&&(h=""===h?zn:h,r=h?at._cnvt(h,m,r[0]||r):at._tag(f._tag,m,m.tmpl,r,!0,s),Ue(u=c.tag),n=c.attr||n);(l=u&&(!u.inline||c.fn._lr)&&u.template)&&ce(c,g,v),ae(r,c,n,u),c._noUpd=0,u&&(u._er=o,ke(u,e,t))}l||ce(c,g,v),u&&u._.ths&&u.updateValue(u,u.bindTo?u.bindTo.length:1),t&&(x=Me(m,Ln,u))&&x.call(u||c,e,t),m._lc=b}}function ie(e,t){e._df=t,e[(t?"set":"remove")+"Attribute"](Xn,"")}function ae(n,r,i,a){var o,s,l,d,p,c,f,u,g,v,h,_,m,b,x=!(i===Kn||void 0===n||r._noUpd||(i===Hn||i===Mt)&&!a&&r.elem._jsvChg),y=r.data,w=a&&a.parentElem||r.elem,C=w.parentNode,k=t(w),E=r.view,j=r._val,A=a;return a&&(a._.unlinked=!0,a.parentElem=a.parentElem||r.expr||a._elCnt?w:C,s=a._prv,l=a._nxt),x?("visible"===i&&(i="css-display"),/^css-/.test(i)?("visible"===r.attr&&(m=(w.currentStyle||wr.call(e,w,"")).display,n?(n=w._jsvd||m,n!==Kn||(n=dr[_=w.nodeName])||(h=document.createElement(_),document.body.appendChild(h),n=dr[_]=(h.currentStyle||wr.call(e,h,"")).display,document.body.removeChild(h))):(w._jsvd=m,n=Kn)),(A=A||j!==n)&&t.style(w,i.slice(4),n)):"link"!==i&&(/^data-/.test(i)?t.data(w,i.slice(5),n):/^prop-/.test(i)?(c=!0,i=i.slice(5)):i===$n?(c=!0,w.name&&et(n)?(w._jsvSel=n,n=Cr(w.value,n)>-1):n=n&&"false"!==n):i===Rn?(c=!0,i=$n,n=w.value===n):"selected"===i||"disabled"===i||"multiple"===i||"readonly"===i?n=n&&"false"!==n?i:null:i===Hn&&"SELECT"===w.nodeName&&(w._jsvSel=et(n)?n:""+n),(o=Gn[i])?i===Mt?a&&a.inline?(p=a.nodes(!0),a._elCnt&&(s&&s!==l?Be(s,l,w,a._tgId,"^",!0):(f=s?s.getAttribute(Fn):w._df,u=a._tgId+"^",g=f.indexOf("#"+u)+1,v=f.indexOf("/"+u),g&&v>0&&(g+=u.length,v>g&&(Le(f.slice(g,v)),f=f.slice(0,g)+f.slice(v),s?s.setAttribute(Fn,f):w._df&&ie(w,f)))),s=s?s.previousSibling:l?l.previousSibling:w.lastChild),t(p).remove(),d=E.link(E.data,w,s,l,n,a&&{tag:a._tgId})):(x=x&&j!==n,x&&(k.empty(),d=E.link(y,w,s,l,n,a&&{tag:a._tgId}))):w._jsvSel?k[o](n):((A=A||j!==n)&&("text"===i&&w.children&&!w.children[0]?w[Nn]=null===n?"":n:k[o](n)),void 0===(b=C._jsvSel)||i!==Hn&&void 0!==k.attr(Hn)||(w.selected=Cr(""+n,et(b)?b:[b])>-1)):(A=A||j!==n)&&k[c?"prop":"attr"](i,void 0!==n||c?n:null)),r._val=n,fe(d),A):void(r._val=n)}function oe(e,t){var n=this,r=Me(n,Bn,n.tag),i=Me(n,Ln,n.tag);if(!r||r.call(n,e,t)!==!1){if(t){var a=t.change,o=t.index,s=t.items;switch(n._.srt=t.refresh,a){case"insert":n.addViews(o,s,t._dly);break;case"remove":n.removeViews(o,s.length,void 0,t._dly);break;case"move":n.moveViews(t.oldIndex,o,s.length);break;case"refresh":n._.srt=void 0,n.fixIndex(0)}}i&&i.call(n,e,t)}}function se(e){var n,r,i=e.type,a=e.data,o=e._.bnd;!e._.useKey&&o&&((r=e._.bndArr)&&(t([r[1]]).off(en,r[0]),e._.bndArr=void 0),o!==!!o?i?o._.arrVws[e._.id]=e:delete o._.arrVws[e._.id]:i&&a&&(n=function(t){t.data&&t.data.off||oe.apply(e,arguments)},t([a]).on(en,n),e._.bndArr=[n,a]))}function le(e,t,n){var r=e.nodeName.toLowerCase(),i=st._fe[r]||e.contentEditable===zn&&{to:Mt,from:Mt};return i?t?"input"===r&&e.type===Rn?Rn:i.to:i.from:t?n?"text":Mt:""}function de(e,n,r,i,a,o,s){var l,d,p,c,f,u=e.parentElem,g=e._prv,v=e._nxt,h=e._elCnt;if(g&&g.parentNode!==u&&O("Missing parentNode"),s){c=e.nodes(),h&&g&&g!==v&&Be(g,v,u,e._.id,"_",!0),e.removeViews(void 0,void 0,!0),d=v,h&&(g=g?g.previousSibling:v?v.previousSibling:u.lastChild),t(c).remove();for(f in e._.bnds)Pe(f)}else{if(n){if(p=i[n-1],!p)return!1;g=p._nxt}h?(d=g,g=d?d.previousSibling:u.lastChild):d=g.nextSibling}l=r.render(a,o,e._.useKey&&s,e,s||n,!0),fe(e.link(a,u,g,d,l,p))}function pe(e,t,n){var r,i;return n?(i="^`",Ue(n),r=n._tgId,r||(pr[r=cr++]=n,n._tgId=""+r)):(i="_`",Tn[r=t._.id]=t),"#"+r+i+(void 0!=e?e:"")+"/"+r+i}function ce(e,t,n){var r,i,a,o,s,l,p,c,f,u,g,v,h=e.tag,_=!h,m=e.convertBack,b=e._hdl;if(t="object"==typeof t&&t,h&&((f=h.convert)&&(f=f===zn?h.tagCtx.props.convert:f,f=e.view.getRsc("converters",f)||f,f=f&&f.depends,f=f&&at._dp(f,t,b)),(u=h.tagCtx.props.depends||h.depends)&&(u=at._dp(u,h,b),f=f?f.concat(u):u),v=h.linkedElems),f=f||[],!e._depends||""+e._depends!=""+f){if(s=e.fn.deps.slice(),e._depends&&(g=e._depends.bdId,Ze._apply(1,[t],s,e._depends,b,e._ctxCb,!0)),h){for(i=h.boundProps.length;i--;)for(p=h.boundProps[i],a=h._.bnd.paths.length;a--;)c=h._.bnd.paths[a]["_"+p],c&&c.length&&c.skp&&(s=s.concat(c));_=void 0===h.onArrayChange||h.onArrayChange===!0}for(i=s.length;i--;)l=s[i],l._cpfn&&(s[i]=d({},l));if(r=Ze._apply(_?0:1,[t],s,f,b,e._ctxCb),g||(g=e._bndId||""+cr++,e._bndId=void 0,n._jsvBnd=(n._jsvBnd||"")+"&"+g,e.view._.bnds[g]=g),r.elem=n,r.linkCtx=e,r._tgId=g,f.bdId=g,e._depends=f,pr[g]=r,(v||void 0!==m||h&&h.bindTo)&&Ie(r,h,m),v)for(i=v.length;i--;)for(o=v[i],a=o&&o.length;a--;)o[a]._jsvLkEl?o[a]._jsvBnd||(o[a]._jsvBnd="&"+g+"+"):(o[a]._jsvLkEl=h,Ae(h,o[a]),o[a]._jsvBnd="&"+g+"+");else void 0!==m&&Ae(h,n);h&&!h.inline&&(h.flow||n.setAttribute(Fn,(n.getAttribute(Fn)||"")+"#"+g+"^/"+g+"^"),h._tgId=""+g)}}function fe(e){var t;if(e)for(;t=e.pop();)t._hdl()}function ue(e,t,n,r,i,a,o){return ge(this,e,t,n,r,i,a,o)}function ge(e,n,r,i,a,o,s,l){if(i===!0?(a=i,i=void 0):i="object"!=typeof i?void 0:d({},i),e&&n){n=n.jquery?n:t(n),Cn||(Cn=document.body,Sn="oninput"in Cn,t(Cn).on(Mn,ne).on("blur.jsv","[contenteditable]",ne));for(var p,c,f,u,g,v,h,_,m,b,x=pe,y=i&&"replace"===i.target,w=n.length;w--;){if(h=n[w],b=o||En(h),typeof e===Bt)he(m=[],e,h,b,void 0,"expr",r,i);else{if(void 0!==e.markup)y&&(v=h.parentNode),b._.scp=!0,f=e.render(r,i,a,b,void 0,x,!0),b._.scp=void 0,v?(s=h.previousSibling,l=h.nextSibling,t.cleanData([h],!0),v.removeChild(h),h=v):(s=l=void 0,t(h).empty());else{if(e!==!0||b!==Qe)break;_={lnk:"top"}}if(h._df&&!l){for(u=xe(h._df,!0,gr),p=0,c=u.length;p<c;p++)g=u[p],(g=Tn[g.id])&&void 0!==g.data&&g.parent.removeViews(g._.key,void 0,!0);ie(h)}m=b.link(r,h,s,l,f,_,i)}fe(m)}}return n}function ve(e,n,r,i,a,o,s,l){function d(e,t,n,r,i,o,s,l,d,p,c,f,g,h){var _,m,b="";return h?(u=0,e):(v=(d||p||"").toLowerCase(),r=r||c,n=n||g,q&&!n&&(!e||r||v||o&&!u)&&(q=void 0,D=de.shift()),r=r||n,r&&(r=r.toLowerCase(),u=0,q=void 0,F&&(n||g?lr[D]||/;svg;|;math;/.test(";"+de.join(";")+";")||(_="'<"+D+".../"):lr[r]?_="'</"+r:de.length&&r===D||(_="Mismatch: '</"+r),_&&$(_+">' in:\n"+a)),Q=z,D=de.shift(),z=or[D],c=c?"</"+c+">":"",Q&&(ae+=X,X="",z?ae+="-":(b=c+Wn+"@"+ae+Qn+(f||""),ae=ce.shift()))),z&&!u?(o?X+=o:t=c||g||"",v&&(t+=v,X&&(t+=" "+Fn+'="'+X+'"',
X=""))):t=o?t+b+i+(u?"":Wn+o+Qn)+l+v:b||e,F&&s&&(u&&$("{^{ within elem markup ("+u+' ). Use data-link="..."'),"#"===o.charAt(0)?de.unshift(o.slice(1)):o.slice(1)!==(m=de.shift())&&$("Closing tag for {^{...}} under different elem: <"+m+">")),v&&(u=v,de.unshift(D),D=v.slice(1),F&&de[0]&&de[0]===sr[D]&&O("Parent of <tr> must be <tbody>"),q=lr[D],(z=or[D])&&!Q&&(ce.unshift(ae),ae=""),Q=z,ae&&z&&(ae+="+")),t)}function p(e,t){var r,i,a,o,s,l,d,p=[];if(e){for("@"===e._tkns.charAt(0)&&(t=y.previousSibling,y.parentNode.removeChild(y),y=void 0),b=e.length;b--;){if(C=e[b],a=C.ch,r=C.path)for(m=r.length-1;i=r.charAt(m--);)"+"===i?"-"===r.charAt(m)?(m--,t=t.previousElementSibling):t=t.parentNode:t=t.lastElementChild;"^"===a?(v=pr[s=C.id])&&(d=t&&(!y||y.parentNode!==t),y&&!d||(v.parentElem=t),C.elCnt&&d&&ie(t,(C.open?"#":"/")+s+a+(t._df||"")),p.push([d?null:y,C])):(w=Tn[s=C.id])&&(w.parentElem||(w.parentElem=t||y&&y.parentNode||n,w._.onRender=pe,w._.onArrayChange=oe,se(w)),o=w.parentElem,C.open?(w._elCnt=C.elCnt,t&&!y?ie(t,"#"+s+a+(t._df||"")):(w._prv||ie(o,me(o._df,"#"+s+a)),w._prv=y)):(!t||y&&y.parentNode===t?y&&(w._nxt||ie(o,me(o._df,"/"+s+a)),w._nxt=y):(ie(t,"/"+s+a+(t._df||"")),w._nxt=void 0),(l=Me(w,On)||ue)&&l.call(w.ctx.tag,w)))}for(b=p.length;b--;)le.push(p[b])}return!e||e.elCnt}function c(e){var t,n,r;if(e)for(b=e.length,m=0;m<b;m++)if(C=e[m],v=pr[C.id],!v._is&&v.linkCtx&&(n=v=v.linkCtx.tag,r=v.tagName===P,!v.flow||r)){if(!S){for(t=1;n=n.parent;)t++;M=M||t}!S&&t!==M||P&&!r||V.push(v)}}function f(){var o,l,d="",f={},u=An+(te?",["+Xn+"]":"");for(x=ar?n.querySelectorAll(u):t(u,n).get(),_=x.length,r&&r.innerHTML&&(E=ar?r.querySelectorAll(u):t(u,r).get(),r=E.length?E[E.length-1]:r),M=0,h=0;h<_;h++)if(y=x[h],r&&!G)G=y===r;else{if(i&&y===i){te&&(d+=be(y));break}if(y.parentNode)if(te){if(d+=be(y),y._df){for(o=h+1;o<_&&y.contains(x[o]);)o++;f[o-1]=y._df}f[h]&&(d+=f[h]||"")}else ee&&(C=xe(y,void 0,hr))&&(C=C[0])&&(Y=Y?C.id!==Y&&Y:C.open&&C.id),!Y&&ge(xe(y))&&y.getAttribute(jn)&&le.push([y])}if(te&&(d+=n._df||"",(l=d.indexOf("#"+te.id)+1)&&(d=d.slice(l+te.id.length)),l=d.indexOf("/"+te.id),l+1&&(d=d.slice(0,l)),c(xe(d,void 0,mr))),void 0===a&&n.getAttribute(jn)&&le.push([n]),ye(r,z),ye(i,z),!te)for(z&&ae+X&&(y=i,ae&&(i?p(xe(ae+"+",!0),i):p(xe(ae,!0),n)),p(xe(X,!0),n),i&&(d=i.getAttribute(Fn),(_=d.indexOf(Z)+1)&&(d=d.slice(_+Z.length-1)),i.setAttribute(Fn,X+d))),_=le.length,h=0;h<_;h++)y=le[h],k=y[1],y=y[0],k?(v=pr[k.id])&&((g=v.linkCtx)&&(v=g.tag,v.linkCtx=g),k.open?(y&&(v.parentElem=y.parentNode,v._prv=y),v._elCnt=k.elCnt,w=v.tagCtx.view,he(fe,void 0,v._prv,w,k.id)):(v._nxt=y,v._.unlinked&&!v._toLk&&(N=v.tagCtx,w=N.view,ke(v)))):he(fe,y.getAttribute(jn),y,En(y),void 0,ee,e,s)}var u,g,v,h,_,m,b,x,y,w,C,k,E,j,A,I,T,V,S,P,N,F,M,B,L,U,R,D,q,K,H,J,z,Q,W,X,Z,G,Y,ee,te,ne=this,re=ne._.id+"_",ae="",le=[],de=[],ce=[],fe=[],ue=Me(ne,On),ge=p;if(o&&(o.tmpl?A="/"+o._.id+"_":(ee=o.lnk,o.tag&&(re=o.tag+"^",o=!0),(te=o.get)&&(ge=c,V=te.tags,S=te.deep,P=te.name)),o=o===!0),n=n?typeof n===Bt?t(n)[0]:n.jquery?n[0]:n:ne.parentElem||document.body,F=!st.noValidate&&n.contentEditable!==zn,D=n.tagName.toLowerCase(),z=!!or[D],r=r&&we(r,z),i=i&&we(i,z)||null,void 0!=a){if(H=document.createElement("div"),K=H,Z=X="",W="http://www.w3.org/2000/svg"===n.namespaceURI?"svg_ns":(R=Ct.exec(a))&&R[1]||"",z){for(T=i;T&&!(I=xe(T));)T=T.nextSibling;(J=I?I._tkns:n._df)&&(j=A||"",!o&&A||(j+="#"+re),m=J.indexOf(j),m+1&&(m+=j.length,Z=X=J.slice(0,m),J=J.slice(m),I?T.setAttribute(Fn,J):ie(n,J)))}if(q=void 0,a=(""+a).replace(ur,d),F&&de.length&&$("Mismatched '<"+D+"...>' in:\n"+a),l)return;for(ir.appendChild(H),W=In[W]||In.div,B=W[0],K.innerHTML=W[1]+a+W[2];B--;)K=K.lastChild;for(ir.removeChild(H),L=document.createDocumentFragment();U=K.firstChild;)L.appendChild(U);n.insertBefore(L,i)}return f(),fe}function he(e,t,n,r,i,a,o,s){var l,d,p,c,f,u,g,v,h,_,m,b=[];if(i)v=pr[i],v=v.linkCtx?v.linkCtx.tag:v,g=v.linkCtx||{type:"inline",data:r.data,elem:v._elCnt?v.parentElem:n,view:r,ctx:r.ctx,attr:Mt,fn:v._.bnd,tag:v,_bndId:i},v.linkCtx=g,_e(g,e),v._toLk=g._bndId;else if(t&&n){for(o=a?o:r.data,l=r.tmpl,t=Ce(t,le(n)),m=kn.lastIndex=0;d=kn.exec(t);)b.push(d),m=kn.lastIndex;for(m<t.length&&$(t);d=b.shift();){for(h=kn.lastIndex,p=d[1],f=d[3];b[0]&&"else"===b[0][4];)f+=ft+dt+b.shift()[3],_=!0;_&&(f+=ft+dt+pt+"/"+d[4]+ct),g={type:a||"link",data:o,elem:n,view:r,ctx:s,attr:p,_toLk:1,_noUpd:d[2]},c=void 0,d[6]&&(c=d[10]||void 0,g.convert=d[5]||"",void 0!==c&&le(n)&&(p&&$(f+"- Remove target: "+p),g.convertBack=c=c.slice(1))),g.expr=p+f,u=rr[f],u||(rr[f]=u=at.tmplFn(f.replace(xt,"\\$&"),l,!0,c,_)),g.fn=u,_e(g,e),kn.lastIndex=h}}}function _e(e,n){function r(t,n){n&&n.refresh||re.call(e,t,n)}var i,a=e.type;if("top"!==a&&"expr"!==a||(e.view=new at.View(at.extendCtx(e.ctx,e.view.ctx),"link",e.view,e.data,e.expr,(void 0),pe)),e._ctxCb=at._gccb(i=e.view),e._hdl=r,"SELECT"===e.elem.nodeName&&(e.elem._jsvLkEl||"link"===a&&!e.attr&&void 0!==e.convert)){var o,s=e.elem,l=t(s);l.on("jsv-domchange",function(){arguments[3].refresh||(s._jsvLkEl?l.val(s._jsvLkEl.cvtArgs(s._jsvElse,1)[s._jsvInd]):e.tag?l.val(e.tag.cvtArgs(0,1)):(o=e.fn(i.data,i,at),l.val(e.convert||e.convertBack?at._cnvt(e.convert,i,o):o)))})}e.fn._lr?(e._toLk=1,n.push(e)):r(!0)}function me(e,t){var n;return e?(n=e.indexOf(t),n+1?e.slice(0,n)+e.slice(n+t.length):e):""}function be(e){return e&&(typeof e===Bt?e:e.tagName===Jn?e.type.slice(3):1===e.nodeType&&e.getAttribute(Fn)||"")}function xe(e,t,n){function r(e,t,n,r,a,s){o.push({elCnt:i,id:r,ch:a,open:t,close:n,path:s,token:e})}var i,a,o=[];if(a=t?e:be(e))return i=o.elCnt=e.tagName!==Jn,i="@"===a.charAt(0)||i,o._tkns=a,a.replace(n||br,r),o}function ye(e,t){e&&("jsv"===e.type?e.parentNode.removeChild(e):t&&""===e.getAttribute(jn)&&e.removeAttribute(jn))}function we(e,t){for(var n=e;t&&n&&1!==n.nodeType;)n=n.previousSibling;return n&&(1!==n.nodeType?(n=document.createElement(Jn),n.type="jsv",e.parentNode.insertBefore(n,e)):be(n)||n.getAttribute(jn)||n.setAttribute(jn,"")),n}function Ce(e,n){return e=t.trim(e),e.slice(-1)!==ct?e=pt+":"+e+(n?":":"")+ct:e}function ke(e,n,r){function i(){a=w.linkedElems||e.linkedElems||e.linkedElem&&[e.linkedElem],a&&(e.linkedElems=w.linkedElems=a,e.linkedElem=a[0]=e.linkedElem||a[0]),(s=w.mainElem||e.mainElem)&&(w.mainElem=e.mainElem=s),(s=w.displayElem||e.displayElem)&&(w.displayElem=e.displayElem=s)}var a,o,s,l,d,p,c,f,u,g,v,h,_,m,b,x,y,w=e.tagCtx,C=e.tagCtxs,k=C&&C.length,E=e.linkCtx,j=e.bindTo||{};if(e._.unlinked){if(p=t(E.elem),e.linkedElement||e.mainElement||e.displayElement){if(o=e.linkedElement)for(e.linkedElem=void 0,l=o.length;l--;)if(o[l])for(c=!e.inline&&p.filter(o[l]),d=k;d--;)g=C[d],a=g.linkedElems=g.linkedElems||new Array(l),s=c[0]?c:g.contents(!0,o[l]),s[0]&&s[0].type!==Rn&&(a[l]=s.eq(0));if(o=e.mainElement)for(c=!e.inline&&p.filter(o),d=k;d--;)g=C[d],s=c[0]?c:g.contents(!0,o).eq(0),s[0]&&(g.mainElem=s);if(o=e.displayElement)for(c=!e.inline&&p.filter(o),d=k;d--;)g=C[d],s=c[0]?c:g.contents(!0,o).eq(0),s[0]&&(g.displayElem=s);i()}e.onBind&&(e.onBind(w,E,e.ctx,n,r),i())}for(d=k;d--;){if(g=C[d],v=g.props,e._.unlinked&&g.map&&e.mapProps){for(b=e.mapProps.length,x=v.mapDepends||e.mapDepends||[],x=et(x)?x:[x];b--;){var A=e.mapProps[b];y=e._.bnd.paths[d]["_"+A],y&&y.length&&y.skp&&(x=x.concat(y))}x.length&&g.map.observe(x,E)}(s=g.mainElem||!e.mainElement&&g.linkedElems&&g.linkedElems[0])&&(s[0]&&v.id&&!s[0].id&&(s[0].id=v.id),e.setSize&&((h=!j.height&&v.height||e.height)&&s.height(h),(h=!j.width&&v.width||e.width)&&s.width(h))),(h=(s=g.displayElem||s)&&(!j["class"]&&v["class"]||e.className))&&(_=s[0]._jsvCl,h!==_&&(s.hasClass(_)&&s.removeClass(_),s.addClass(h),s[0]._jsvCl=h))}if(e.onAfterLink&&(e.onAfterLink(w,E,e.ctx,n,r),i()),!e.flow&&!e._.chg)for(e._tgId&&e._.unlinked&&(e.linkedElems||e.bindTo)&&Ie(pr[e._tgId],e),d=C.length;d--;){for(v=e.cvtArgs(d,1),l=v.length;l--;)e.setValue(v[l],l,d,n,r);if(e._.unlinked)for(w=C[d],a=w.linkedElems||!d&&e.linkedElem&&[e.linkedElem],m=(e.bindTo||[0]).length;m--;)if((s=a&&a[m])&&(l=s.length))for(;l--;)f=s[l],u=f._jsvLkEl,u&&u===e||(f._jsvLkEl=e,f._jsvInd=m,f._jsvElse=d,Ae(e,f),e._tgId&&(f._jsvBnd="&"+e._tgId+"+"))}e._.unlinked=void 0,e._.lt&&e.refresh()}function Ee(e){var t=e.which;t>15&&t<21||t>32&&t<41||t>111&&t<131||27===t||144===t||setTimeout(function(){ne(e)})}function je(e,t,n){t!==!0||!Sn||Pn&&e[0].contentEditable===zn?(t=typeof t===Bt?t:"keydown.jsv",e[n](t,t.indexOf("keydown")>=0?Ee:ne)):e[n]("input.jsv",ne)}function Ae(e,n){var r,i,a=n._jsvTr||!1;e&&(i=e.tagCtx.props.trigger,void 0===i&&(i=e.trigger)),void 0===i&&(i=ot.trigger),i=i&&("INPUT"===n.tagName&&n.type!==Un&&n.type!==Rn||"textarea"===n.type||n.contentEditable===zn)&&i||!1,a!==i&&(r=t(n),je(r,a,"off"),je(r,n._jsvTr=i,"on"))}function Ie(e,t,n){var r,i,a,o,s,l,d,p,c,f,u,g,v,h,_,m=1,b=[],x=e.linkCtx,y=x.data,w=x.fn.paths;if(e&&!e.to){for(t&&(t.convertBack||(t.convertBack=n),l=t.bindTo,m=t.tagCtxs?t.tagCtxs.length:1);m--;){if(v=[],g=w[m])for(l=g._jsvto?["jsvto"]:l||[0],!m&&t&&t._.ths&&(l=l.concat("this")),p=l.length;p--;){if(i="",u=x._ctxCb,d=l[p],d=g[+d===d?d:"_"+d],r=d&&d.length){if(a=d[r-1],a._cpfn){for(o=a;a.sb&&a.sb._cpfn;)i=a=a.sb;i=a.sb||i&&i.path,_=a._cpfn&&!a.sb,a=i?i.slice(1):o.path}s=i?[o,a]:Te(a,y,u)}else f=t.linkedCtxParam,s=[],h=t._.fromIndex,h&&f&&f[h[p]]&&(s=[t.tagCtxs[m].ctx[f[h[p]]][0],_t]);(c=s._cxp)&&c.tag&&a.indexOf(".")<0&&(s=c),s.isCpfn=_,v.unshift(s)}b.unshift(v)}e.to=b}}function Te(e,t,n){for(var r,i,a,o,s,l,d,p;e&&e!==_t&&(a=n(r=e.split("^").join(".")))&&(o=a.length);){if(s=a[0]._cxp)if(d=d||s,l=a[0][0],_t in l?(p=l,l=l._vw):p=l.data,d.path=e=a[0][1],a=[d.data=p,e],n=at._gccb(l),e._cpfn){for(i=e,i.data=a[0],i._cpCtx=n;e.sb&&e.sb._cpfn;)r=e=e.sb;r=e.sb||r&&r.path,e=r?r.slice(1):i.path,a=[i,e]}else s.tag&&s.path===_t&&(a=s);else a=o>1?[a[o-2],a[o-1]]:[a[o-1]];t=a[0],e=a[1]}return a=a||[t,r],a._cxp=d,a}function Ve(e,t,n){var r,i,a=e.tagCtx.view,o=e.tagCtxs||[e.tagCtx],s=o.length,l=!t;if(l){if(t=e._.bnd.call(a.tmpl,(e.linkCtx||a).data,a,at),t.lt)return;e._.lt=void 0,t=et(t)?t:[t]}if(n)o=e.tagCtxs=t,e.tagCtx=o[0],Ue(e);else for(;s--;)r=o[s],i=t[s],d(r.ctx,i.ctx),r.args=i.args,l&&(r.tmpl=i.tmpl),Ze(r.props).setProperty(i.props);return at._thp(e,o[0]),o}function Se(e){for(var t,n,r,i=[],a=e.length,o=a;o--;)i.push(e[o]);for(o=a;o--;)if(n=i[o],n.parentNode){if(r=n._jsvBnd)for(r=r.slice(1).split("&"),n._jsvBnd="",t=r.length;t--;)Pe(r[t],n._jsvLkEl,n);Le(be(n)+(n._df||""),n)}}function Pe(e,n,r){var i,a,o,s,l,d,p,c,f,u,g,v,h,_,m=pr[e];if(n)r._jsvLkEl=void 0;else if(m&&(!r||r===m.elem)){delete pr[e];for(i in m.bnd)(s=m.bnd[i])&&(l=m.cbId,et(s)?t([s]).off(en+l).off(Yt+l):t(s).off(Yt+l),delete m.bnd[i]);if(a=m.linkCtx){if(o=a.tag){if(d=o.tagCtxs)for(p=d.length;p--;)v=d[p],(c=v.map)&&c.unmap(),(h=v.linkedElems)&&(_=(_||[]).concat(h));o.onUnbind&&o.onUnbind(o.tagCtx,a,o.ctx),o.onDispose&&o.onDispose(),o._elCnt||(o._prv&&o._prv.parentNode.removeChild(o._prv),o._nxt&&o._nxt.parentNode.removeChild(o._nxt))}for(h=_||[t(a.elem)],p=h.length;p--;)f=h[p],(u=f&&f[0]&&f[0]._jsvTr)&&(je(f,u,"off"),f[0]._jsvTr=void 0);g=a.view,"link"===g.type?g.parent.removeViews(g._.key,void 0,!0):delete g._.bnds[e]}delete tn[m.cbId]}}function Ne(e){e?(e=e.jquery?e:t(e),e.each(function(){for(var e;(e=En(this,!0))&&e.parent;)e.parent.removeViews(e._.key,void 0,!0);Se(this.getElementsByTagName("*"))}),Se(e)):(Cn&&(t(Cn).off(Mn,ne).off("blur.jsv","[contenteditable]",ne),Cn=void 0),Qe.removeViews(),Se(document.body.getElementsByTagName("*")))}function Fe(e){return e.type===Un?e[$n]:e.value}function Me(e,t,n){return n&&n[t]||e.ctx[t]&&e.ctxPrm(t)||We.helpers[t]}function Be(e,t,n,r,i,a){var o,s,l,d,p,c,f,u=0,g=e===t;if(e){for(l=xe(e)||[],o=0,s=l.length;o<s;o++){if(d=l[o],c=d.id,c===r&&d.ch===i){if(!a)break;s=0}g||(p="_"===d.ch?Tn[c]:pr[c].linkCtx.tag,p&&(d.open?p._prv=t:d.close&&(p._nxt=t))),u+=c.length+2}u&&e.setAttribute(Fn,e.getAttribute(Fn).slice(u)),f=t?t.getAttribute(Fn):n._df,(s=f.indexOf("/"+r+i)+1)&&(f=l._tkns.slice(0,u)+f.slice(s+(a?-1:r.length+1))),f&&(t?t.setAttribute(Fn,f):ie(n,f))}else ie(n,me(n._df,"#"+r+i)),a||t||ie(n,me(n._df,"/"+r+i))}function Le(e,t){var n,r,i,a;if(a=xe(e,!0,vr))for(n=0,r=a.length;n<r;n++)i=a[n],"_"===i.ch?!(i=Tn[i.id])||!i.type||t&&i._prv!==t&&i.parentElem!==t||i.parent.removeViews(i._.key,void 0,!0):Pe(i.id,void 0,t)}function Oe(e,t,n,r,i,a){var o=this,s=[];return o&&o._tgId&&(i=o),arguments.length<4&&(+t!==t?(r=t,n=t=0):+n!==n&&(r=n,n=0)),s[t||0]=e,te(s,n,r,i,a),o}function $e(){for(var e=this.tag.bindTo.length,t=arguments[e],n=arguments[e+1];e--;)this.tag.setValue(arguments[e],e,this.index,t,n)}function Ue(e){var n,r,i,a,o,s,l,d;if(e.contents=function(e,n){e!==!!e&&(n=e,e=void 0);var r,i=t(this.nodes());return i[0]&&(n=e?n||"*":n,r=n?i.filter(n):i,i=e?r.add(i.find(n)):r),i},e.nodes=function(e,t,n){var r,i=this.contentView||this,a=i._elCnt,o=!t&&a,s=[];if(!i.args)for(t=t||i._prv,n=n||i._nxt,r=o?t===i._nxt?i.parentElem.lastSibling:t:i.inline===!1?t||i.linkCtx.elem.firstChild:t&&t.nextSibling;r&&(!n||r!==n);)(e||a||r.tagName!==Jn)&&s.push(r),r=r.nextSibling;return s},e.childTags=function(e,t){e!==!!e&&(t=e,e=void 0);var n=this.contentView||this,r=n.link?n:n.tagCtx.view,i=n._prv,a=n._elCnt,o=[];return n.args||r.link(void 0,n.parentElem,a?i&&i.previousSibling:i,n._nxt,void 0,{get:{tags:o,deep:e,name:t,id:n.link?n._.id+"_":n._tgId+"^"}}),o},"tag"===e._is){for(l=e,r=l.tagCtxs.length;r--;)i=l.tagCtxs[r],i.setValues=$e,i.contents=e.contents,i.childTags=e.childTags,i.nodes=e.nodes;if(a=l.boundProps=l.boundProps||[],o=l.bindFrom)for(n=o.length;n--;)s=o[n],typeof s===Bt&&(o[s]=1,Cr(s,a)<0&&a.push(s));l.setValue=at._gm(l.constructor.prototype.setValue||function(e){return e},function(e,r,i,a,o){r=r||0,i=i||0;var s,d,p,c,f,u,g=l.tagCtxs[i];if(!g._bdArgs||!o&&void 0===e||g._bdArgs[r]!==e||o&&"set"===o.change&&(a.target===e||o.value===e)?(g._bdArgs=g._bdArgs||[],g._bdArgs[r]=e,u=l.base.call(l,e,r,i,a,o),void 0!==u&&(g._bdVals=g._bdVals||[],g._bdVals[r]=u,e=u)):g._bdVals&&(e=g._bdVals[r]),void 0!==e&&(p=l.linkedCtxParam)&&p[r]&&g.ctxPrm(p[r],e),c=l._.toIndex[r],void 0!==c&&(f=g.linkedElems||l.linkedElem&&[l.linkedElem])&&(s=f[c])&&(n=s.length))for(;n--;)d=s[n],void 0===e||d._jsvChg||l.linkCtx._val===e||(void 0!==d.value?d.type===Un?d[$n]=t.isArray(e)?t.inArray(d.value,e)>-1:e&&"false"!==e:d.type===Rn?d[$n]=d.value===e:t(d).val(e):d[d.contentEditable===zn?"innerHTML":Nn]=e),g.props.name&&(d.name=d.name||g.props.name);return l}),l.updateValue=Oe,l.updateValues=function(){var e,t,n=this,r=n.bindTo?n.bindTo.length:1,i=arguments.length-r;return i&&(e=arguments[r],i>1?t=i>1?arguments[r+1]:void 0:+e!==e&&(t=e,e=0)),te(arguments,e,t,this)},l.setValues=function(){return $e.apply(l.tagCtx,arguments),l},l.refresh=function(){var e,t,n=l.linkCtx,r=l.tagCtx.view;if(t=Ve(l))return l.onUnbind&&(l.onUnbind(l.tagCtx,n,l.ctx),l._.unlinked=!0),e=l.inline?Mt:n.attr||le(l.parentElem,!0),t=":"===l.tagName?at._cnvt(l.convert,r,l.tagCtx):at._tag(l,r,r.tmpl,t,!0),ce(n,n.data,n.elem),ae(t,n,e,l),ke(l),l},l.domChange=function(){var e=this.parentElem,n=t._data(e).events,r="jsv-domchange";n&&n[r]&&t(e).triggerHandler(r,arguments)}}else d=e,d.addViews=function(e,t,n){var r,i=this,a=t.length,o=i.views;!i._.useKey&&a&&(r=o.length+a,!n&&r!==i.data.length||de(i,e,i.tmpl,o,t,i.ctx)===!1||i._.srt||i.fixIndex(e+a))},d.removeViews=function(e,n,r,i){function a(e){var n,i,a,o,s,l,d=c[e];if(d&&d.link){n=d._.id,r||(l=d.nodes()),d.removeViews(void 0,void 0,!0),d.type=void 0,o=d._prv,s=d._nxt,a=d.parentElem,r||(d._elCnt&&Be(o,s,a,n,"_"),t(l).remove()),!d._elCnt&&o&&(o.parentNode.removeChild(o),s.parentNode.removeChild(s)),se(d);for(i in d._.bnds)Pe(i);delete Tn[n]}}var o,s,l,d=this,p=!d._.useKey,c=d.views;if(p&&(l=c.length),void 0===e)if(p){for(o=l;o--;)a(o);d.views=[]}else{for(s in c)a(s);d.views={}}else if(void 0===n&&(p?n=1:(a(e),delete c[e])),p&&n&&(i||l-n===d.data.length)){for(o=e+n;o-- >e;)a(o);c.splice(e,n),d._.srt||d.fixIndex(e)}},d.moveViews=function(e,n,r){function i(e,t){return RegExp("^(.*)("+(t?"\\/":"#")+e._.id+"_.*)$").exec(t||e._prv.getAttribute(Fn))}function a(e,t){var n,r=e._prv;r.setAttribute(Fn,t),t.replace(_r,function(e,t,i,a){n=pr[a].linkCtx.tag,n.inline&&(n[t?"_prv":"_nxt"]=r)}),t.replace(hr,function(e,t,n,i){Tn[i][t?"_prv":"_nxt"]=r})}var o,s,l,d=this,p=d._nxt,c=d.views,f=n<e,u=f?n:e,g=f?e:n,v=n,h=[],_=c.splice(e,r);for(n>c.length&&(n=c.length),c.splice.apply(c,[n,0].concat(_)),r=_.length,l=n+r,g+=r,v;v<l;v++)s=c[v],o=s.nodes(!0),h=d._elCnt?h.concat(o):h.concat(s._prv,o,s._nxt);if(h=t(h),l<c.length?h.insertBefore(c[l]._prv):p?h.insertBefore(p):h.appendTo(d.parentElem),d._elCnt){var m,b=f?u+r:g-r,x=(c[u-1],c[u]),y=c[b],w=c[g],C=i(x),k=i(y);a(x,k[1]+C[2]),w?(m=i(w),a(w,C[1]+m[2])):(c[g-1]._nxt=p,p?(m=i(d,p.getAttribute(Fn)),p.setAttribute(Fn,C[1]+m[2])):(m=i(d,d.parentElem._df),ie(d.parentElem,C[1]+m[2]))),a(y,m[1]+k[2])}d.fixIndex(u)},d.refresh=function(){var e=this,t=e.parent;return t&&(de(e,e.index,e.tmpl,t.views,e.data,void 0,!0),se(e)),e},d.fixIndex=function(e){for(var t=this.views,n=t.length;e<n--;)t[n].index!==n&&Ze(t[n]).setProperty("index",n)},d.link=ve}function Re(e,t,n){var r,i,a=e.options.props;if(qe(e.propsArr,n.path,n.value,n.remove),void 0!==a.sort||void 0!==a.start||void 0!==a.end||void 0!==a.step||a.filter||a.reverse)e.update();else if("set"===n.change){for(r=e.tgt,i=r.length;i--&&r[i].key!==n.path;);i===-1?n.path&&!n.remove&&Ze(r).insert({key:n.path,prop:n.value}):n.remove?Ze(r).remove(i):Ze(r[i]).setProperty("prop",n.value)}}function De(e,t,n){var r,i,a,o,s=e.src,l=n.change;if("set"===l)"prop"===n.path?Ze(s).setProperty(t.target.key,n.value):(Ze(s).removeProperty(n.oldValue),Ze(s).setProperty(n.value,t.target.prop));else if("insert"===l||(o="remove"===l))for(r=n.items,i=r.length;i--;)(a=r[i].key)&&(qe(e.propsArr,a,r[i].prop,o),o?(Ze(s).removeProperty(a),delete s[a]):Ze(s).setProperty(a,r[i].prop))}function qe(e,t,n,r){for(var i=e.length;i--&&e[i].key!==t;);i===-1?t&&!r&&e.push({key:t,prop:n}):r&&e.splice(i,1)}function Ke(e){return yr.test(e)}var He=t===!1;if(t=t||e.jQuery,!t||!t.fn)throw"JsViews requires jQuery";var Je,ze,Qe,We,Xe,Ze,Ge,Ye,et,tt,nt,rt,it,at,ot,st,lt,dt,pt,ct,ft,ut,gt,vt,ht="v1.0.12",_t="_ocp",mt=/[ \t]*(\r\n|\n|\r)/g,bt=/\\(['"\\])/g,xt=/['"\\]/g,yt=/(?:\x08|^)(onerror:)?(?:(~?)(([\w$.]+):)?([^\x08]+))\x08(,)?([^\x08]+)/gi,wt=/^if\s/,Ct=/<(\w+)[>\s]/,kt=/[\x00`><"'&=]/g,Et=/[\x00`><\"'&=]/,jt=/^on[A-Z]|^convert(Back)?$/,At=/^\#\d+_`[\s\S]*\/\d+_`$/,It=kt,Tt=/[&<>]/g,Vt=/&(amp|gt|lt);/g,St=/\[['"]?|['"]?\]/g,Pt=0,Nt={"&":"&amp;","<":"&lt;",">":"&gt;","\0":"&#0;","'":"&#39;",'"':"&#34;","`":"&#96;","=":"&#61;"},Ft={amp:"&",gt:">",lt:"<"},Mt="html",Bt="string",Lt="object",Ot="data-jsv-tmpl",$t="jsvTmpl",Ut="For #index in nested block use #getIndex().",Rt={},Dt={},qt=e.jsrender,Kt=qt&&t&&!t.render,Ht={template:{compile:A},tag:{compile:E},viewModel:{compile:V},helper:{},converter:{}};if(We={jsviews:ht,sub:{rPath:/^(!*?)(?:null|true|false|\d[\d.]*|([\w$]+|\.|~([\w$]+)|#(view|([\w$]+))?)([\w$.^]*?)(?:[.[^]([\w$]+)\]?)?)$/g,rPrm:/(\()(?=\s*\()|(?:([([])\s*)?(?:(\^?)(~?[\w$.^]+)?\s*((\+\+|--)|\+|-|~(?![\w$])|&&|\|\||===|!==|==|!=|<=|>=|[<>%*:?\/]|(=))\s*|(!*?(@)?[#~]?[\w$.^]+)([([])?)|(,\s*)|(?:(\()\s*)?\\?(?:(')|("))|(?:\s*(([)\]])(?=[.^]|\s*$|[^([])|[)\]])([([]?))|(\s+)/g,View:C,Err:l,tmplFn:U,parse:K,extend:d,extendCtx:J,syntaxErr:$,onStore:{template:function(e,t){null===t?delete Dt[e]:e&&(Dt[e]=t)}},addSetting:N,settings:{allowCode:!1},advSet:o,_thp:i,_gm:r,_tg:function(){},_cnvt:_,_tag:w,_er:O,_err:L,_cp:a,_sq:function(e){return"constructor"===e&&$(""),e}},settings:{delimiters:p,advanced:function(e){return e?(d(st,e),at.advSet(),lt):st}},map:F},(l.prototype=new Error).constructor=l,f.depends=function(){return[this.get("item"),"index"]},u.depends="index",C.prototype={get:c,getIndex:u,ctxPrm:v,getRsc:y,_getTmpl:h,_getOb:g,getCache:function(e){return ot._cchCt>this.cache._ct&&(this.cache={_ct:ot._cchCt}),void 0!==this.cache[e]?this.cache[e]:this.cache[e]=Rt[e](this.data,this,at)},_is:"view"},at=We.sub,lt=We.settings,!t.link){for(Je in Ht)P(Je,Ht[Je]);if(nt=We.converters,rt=We.helpers,it=We.tags,at._tg.prototype={baseApply:j,cvtArgs:m,bndArgs:x,ctxPrm:v},Qe=at.topView=new C,t){if(t.fn.render=W,Ge=t.expando,t.observable){if(ht!==(ht=t.views.jsviews))throw"jquery.observable.js requires jsrender.js "+ht;d(at,t.views.sub),We.map=t.views.map}}else t={},He&&(e.jsrender=t),t.renderFile=t.__express=t.compile=function(){throw"Node.js: use npm jsrender, or jsrender-node.js"},t.isFunction=function(e){return"function"==typeof e},t.isArray=Array.isArray||function(e){return"[object Array]"==={}.toString.call(e)},at._jq=function(e){e!==t&&(d(e,t),t=e,t.fn.render=W,delete t.jsrender,Ge=t.expando)},t.jsrender=ht;ot=at.settings,ot.allowCode=!1,Ye=t.isFunction,t.render=Dt,t.views=We,t.templates=tt=We.templates;for(gt in ot)N(gt);(lt.debugMode=function(e){return void 0===e?ot.debugMode:(ot._clFns&&ot._clFns(),ot.debugMode=e,ot.onError=typeof e===Bt?function(){return e}:Ye(e)?e:void 0,lt)})(!1),st=ot.advanced={cache:!0,useViews:!1,_jsv:!1},it({"if":{render:function(e){var t=this,n=t.tagCtx,r=t.rendering.done||!e&&(n.args.length||!n.index)?"":(t.rendering.done=!0,void(t.selected=n.index));return r},contentCtx:!0,flow:!0},"for":{sortDataMap:F(Q),init:function(e,t){this.setDataMap(this.tagCtxs)},render:function(e){var t,n,r,i,a,o=this,s=o.tagCtx,l=s.argDefault===!1,d=s.props,p=l||s.args.length,c="",f=0;if(!o.rendering.done){if(t=p?e:s.view.data,l)for(l=d.reverse?"unshift":"push",i=+d.end,a=+d.step||1,t=[],r=+d.start||0;(i-r)*a>0;r+=a)t[l](r);void 0!==t&&(n=et(t),c+=s.render(t,!p||d.noIteration),f+=n?t.length:1),(o.rendering.done=f)&&(o.selected=s.index)}return c},setDataMap:function(e){for(var t,n,r,i=this,a=e.length;a--;)t=e[a],n=t.props,r=t.params.props,t.argDefault=void 0===n.end||t.args.length>0,n.dataMap=t.argDefault!==!1&&et(t.args[0])&&(r.sort||r.start||r.end||r.step||r.filter||r.reverse||n.sort||n.start||n.end||n.step||n.filter||n.reverse)&&i.sortDataMap},flow:!0},props:{baseTag:"for",dataMap:F(z),init:o,flow:!0},include:{flow:!0},"*":{render:a,flow:!0},":*":{render:a,flow:!0},dbg:rt.dbg=nt.dbg=s}),nt({html:G,attr:G,encode:Y,unencode:ee,url:function(e){return void 0!=e?encodeURI(""+e):null===e?e:""}})}if(ot=at.settings,et=(t||qt).isArray,lt.delimiters("{{","}}","^"),Kt&&qt.views.sub._jq(t),We=t.views,at=We.sub,Ye=t.isFunction,et=t.isArray,Ge=t.expando,!t.observe){var Jt=t.event.special,zt=[].slice,Qt=[].splice,Wt=[].concat,Xt=parseInt,Zt=/\S+/g,Gt=/^[^.[]*$/,Yt=at.propChng=at.propChng||"propertyChange",en=at.arrChng=at.arrChng||"arrayChange",tn={},nn=Yt+".observe",rn=1,an=1,on=1,sn=t.data,ln={},dn=[],pn=function(e){return e?e._cId=e._cId||".obs"+an++:""},cn=function(e,t){return this._data=t,this._ns=e,this},fn=function(e,t){return this._data=t,this._ns=e,this},un=function(e){return et(e)?[e]:e},gn=function(e,t,n){e=e?et(e)?e:[e]:[];var r,i,a,o,s=a=t,l=e&&e.length,d=[];for(r=0;r<l;r++)i=e[r],Ye(i)?(o=t.tagName?t.linkCtx.data:t,d=d.concat(gn(i.call(t,o,n),o,n))):typeof i===Bt?(s!==a&&d.push(a=s),d.push(i)):(t=s=i=void 0===i?null:i,s!==a&&d.push(a=s));return d.length&&(d.unshift({_ar:1}),d.push({_ar:-1})),d},vn=function(e,t){function n(e){return typeof e===Lt&&(f[0]||!c&&et(e))}if(!e.data||!e.data.off){var r,i,a,o=t.oldValue,s=t.value,l=e.data,d=l.observeAll,p=l.cb,c=l._arOk?0:1,f=l.paths,u=l.ns;e.type===en?(p.array||p).call(l,e,t):l.prop!==t.path&&"*"!==l.prop||(d?(r=d._path+"."+t.path,i=d.filter,a=[e.target].concat(d.parents()),n(o)&&hn(void 0,u,[o],f,p,!0,i,[a],r),n(s)&&hn(void 0,u,[s],f,p,void 0,i,[a],r)):(n(o)&&hn(c,u,[o],f,p,!0),n(s)&&hn(c,u,[s],f,p)),l.cb(e,t))}},hn=function(){var e=Wt.apply([],arguments);return Xe.apply(e.shift(),e)},_n=function(e,t,n){bn(this._ns,this._data,e,t,[],"root",n)},mn=function(e,t){_n.call(this,e,t,!0)},bn=function(e,n,r,i,a,o,s,l){function d(e,t){for(f=e.length,g=o+"[]";f--;)p(e,f,t,1)}function p(t,n,a,o){var s,d;+n!==n&&n===Ge||!(s=Ze._fltr(g,t[n],v,i))||(d=v.slice(),o&&h&&d[0]!==h&&d.unshift(h),bn(e,s,r,i||(o?void 0:0),d,g,a,l))}function c(e,t){switch(o=e.data.observeAll._path,h=e.target,t.change){case"insert":d(t.items);break;case"remove":d(t.items,!0);break;case"set":g=o+"."+t.path,p(t,"oldValue",!0),p(t,"value")}h=void 0,r.apply(this,arguments)}c._wrp=1;var f,u,g,v,h,_,m=!l||l.un||!s;if(n&&typeof n===Lt){if(v=[n].concat(a),u=et(n)?"":"*",l&&m&&t.hasData(n)&&l[_=sn(n).obId])return void l[_]++;if(l||(l={un:s}),r){if(u||0!==i)if(c._cId=pn(r),m)Xe(e,n,u,c,s,i,v,o),_=sn(n).obId,l[_]=(l[_]||0)+1;else{if(--l[sn(n).obId])return;Xe(e,n,u,c,s,i,v,o)}}else l&&(l[sn(n).obId]=1),Xe(e,n,u,void 0,s,i,v,o);if(u)for(f in n)g=o+"."+f,p(n,f,s);else d(n,s)}},xn=function(e){return Gt.test(e)},yn=function(){return[].push.call(arguments,!0),Xe.apply(void 0,arguments)},wn=function(e){var t,n=this.slice();for(this.length=0,this._go=0;t=n.shift();)t.skip||t[0]._trigger(t[1],t[2],!0);this.paths={}};Xe=function(){function e(){function i(e,t){var n;for(g in t)n=t[g],et(n)?o(e,n,p,p):a(e,n,void 0,I,"")}function a(e,i,a,o,s,l,d){var c,f,u,v=un(i),h=b,m=x;if(o=n?o+"."+n:o,!p&&(d||l))for(j=t._data(i).events,j=j&&j[l?en:Yt],A=j&&j.length;A--;)if(g=j[A]&&j[A].data,g&&(d&&g.ns!==n||!d&&g.ns===n&&g.cb&&g.cb._cId===e._cId&&(!e._wrp||g.cb._wrp)))return;p||d?t(v).off(o,vn):(f=l?{}:{fullPath:a,paths:s?[s]:[],prop:E,_arOk:r},f.ns=n,f.cb=e,x&&(f.observeAll={_path:m,path:function(){return c=h.length,m.replace(/[[.]/g,function(e){return c--,"["===e?"["+t.inArray(h[c-1],h[c]):"."})},parents:function(){return h},filter:y}),t(v).on(o,null,f,vn),_&&(u=sn(i),u=u.obId||(u.obId=rn++),_[u]=_[u]||(_.len++,i)))}function o(e,t,n,i,o){if(r){var s,l=x;s=t,o&&(s=t[o],x=x?x+"."+o:x),y&&s&&(s=Ze._fltr(x,s,o?[t].concat(b):b,y)),s&&(i||et(s))&&a(e,s,void 0,en+".observe"+pn(e),void 0,!0,n),x=l}}function s(i){function l(i,c,f,u){function v(t){return t.ob=u(t),t.cb=function(n,i){var a=t.ob,s=t.sb,l=u(t);l!==a&&(typeof a===Lt&&(o(f,a,!0),(s||r&&et(a))&&e([a],s,f,u,!0)),t.ob=l,typeof l===Lt&&(o(f,l),(s||r&&et(l))&&e([l],s,f,u))),f(n,i)}}function _(e,i){function d(e,t){var n;if("insert"===t.change||(p="remove"===t.change)){for(n=t.items.length;n--;)_(t.items[n],i.slice());p=!1}}f&&(d._cId=pn(f));var c,v,h,m,b,C,k,T=e;if(e&&e._cxp)return l(e[0],[e[1]],f,u);for(;void 0!==(E=i.shift());){if(T&&typeof T===Lt&&typeof E===Bt){if(""===E)continue;if("()"===E.slice(-2)&&(E=E.slice(0,-2),k=!0),i.length<w+1&&!T.nodeType){if(!p&&(j=t._data(T).events)){for(j=j&&j[Yt],A=j&&j.length,v=0;A--;)g=j[A].data,!g||g.ns!==n||g.cb._cId!==f._cId||g.cb._inId!==f._inId||!g._arOk!=!r||g.prop!==E&&"*"!==g.prop&&"**"!==g.prop||((b=i.join("."))&&g.paths.push(b),v++);if(v){T=T[E];continue}}if("*"===E||"**"===E){if(!p&&j&&j.length&&a(f,T,y,I,"",!1,!0),"*"===E){a(f,T,y,I,"");for(b in T)b!==Ge&&o(f,T,p,void 0,b)}else t.observable(n,T)[(p?"un":"")+"observeAll"](f);break}"[]"==E?et(T)&&(p?a(f,T,y,en+pn(f),void 0,p,p):Xe(n,T,d,p)):E&&a(f,T,y,I+".p_"+E,i.join("^"))}if(x&&(x+="."+E),"[]"===E){for(et(T)&&(m=T,c=T.length);c--;)T=m[c],_(T,i.slice());return}E=T[E],i[0]||o(f,E,p)}if(Ye(E)&&(C=E,(h=C.depends)&&(T._vw&&T._ocp&&(T=T._vw,T._tgId&&(T=T.tagCtx.view),T=T.data),s(Wt.apply([],[[T],gn(h,T,f)]))),k)){if(!i[0]){o(f,C.call(T),p);break}if(E=C.call(T),!E)break}T=E}}var b,y,w=0,C=c.length;for(!i||u||!(k="view"===i._is)&&"tag"!==i._is||(u=at._gccb(k?i:i.tagCtx.contentView),f&&!p&&!function(){var e=i,t=f;f=function(n,r){t.call(e,n,r)},f._cId=t._cId,f._inId=t._inId}(),i=k?i.data:i),c[0]||(et(i)?o(f,i,p,!0):p&&a(f,i,void 0,I,"")),b=0;b<C;b++)if(y=c[b],""!==y)if(y&&y._ar)r+=y._ar;else if(typeof y===Bt)if(d=y.split("^"),d[1]&&(w=d[0].split(".").length,y=d.join("."),w=y.split(".").length-w),u&&(h=u(y,w))){if(h.length){var T=h[0],V=h[1];if(T&&T._cxp&&(V=T[1],T=T[0],"view"===T._is)){l(T,[V],f);continue}typeof V===Bt?_(T,V.split(".")):l(h.shift(),h,f,u)}}else _(i,y.split("."));else!Ye(y)&&y&&y._cpfn&&(m=p?y.cb:v(y),m._cId=f._cId,m._inId=m._inId||".obIn"+on++,(y.bnd||y.prm&&y.prm.length||!y.sb)&&e([i],y.path,y.prm.length?[y.root||i]:[],y.prm,m,u,p),y.sb&&(y.sb.prm&&(y.sb.root=i),l(y.ob,[y.sb],f,u)))}for(var f,u=[],_=i.length;_--;)f=i[_],typeof f===Bt||f&&(f._ar||f._cpfn)?u.unshift(f):(l(f,u,c,v),u=[])}var l,d,p,c,f,u,g,v,h,_,m,b,x,y,w,C,k,E,j,A,I=nn,T=1!=this?Wt.apply([],arguments):zt.call(arguments),V=T.pop()||!1,S=T.length;if(typeof V===Bt&&(x=V,b=T.pop(),y=T.pop(),V=!!T.pop(),S-=3),V===!!V&&(p=V,V=T[S-1],V=!S||typeof V===Bt||V&&!Ye(V)?void 0:(S--,T.pop()),p&&!S&&Ye(T[0])&&(V=T.shift())),c=V,S&&Ye(T[S-1])&&(v=c,V=c=T.pop(),S--),!p||!c||c._cId){for(I+=c?(u=c._inId||"",p?c._cId+u:(f=pn(c))+u):"",f&&!p&&(_=tn[f]=tn[f]||{len:0}),w=n&&n.match(Zt)||[""],C=w.length;C--;){if(n=w[C],p&&arguments.length<3)if(c)i(c,tn[c._cId]);else if(!T[0])for(l in tn)i(c,tn[l]);s(T)}return f&&!_.len&&delete tn[f],{cbId:f,bnd:_}}}var n,r=1==this?0:1,i=zt.call(arguments),a=i[0];return typeof a===Bt&&(n=a,i.shift()),e.apply(1,i)},dn.wait=function(){var e=this;e._go=1,setTimeout(function(){e.trigger(!0),e._go=0,e.paths={}})},Ze=function(e,t,n){typeof e!==Bt&&(n=t,t=e,e=""),n=void 0===n?st.asyncObserve:n;var r=et(t)?new fn(e,t):new cn(e,t);return n&&(n===!0&&(r.async=!0,n=dn),n.trigger||(et(n)?(n.trigger=wn,n.paths={}):n=void 0),r._batch=n),r},t.observable=Ze,Ze._fltr=function(e,t,n,r){if(!r||!Ye(r)||r(e,t,n))return t=Ye(t)?t.set&&t.call(n[0]):t,typeof t===Lt&&t},Ze.Object=cn,Ze.Array=fn,t.observe=Ze.observe=Xe,t.unobserve=Ze.unobserve=yn,Ze._apply=hn,cn.prototype={_data:null,observeAll:_n,unobserveAll:mn,data:function(){return this._data},setProperty:function(e,t,n,r){e=e||"";var i,a,o,s,l=typeof e!==Bt,d=this,p=d._data,c=d._batch;if(p)if(l)if(n=t,et(e))for(i=e.length;i--;)a=e[i],d.setProperty(a.name,a.value,void 0===n||n);else{c||(d._batch=s=[],s.trigger=wn,s.paths={});for(i in e)d.setProperty(i,e[i],n);s&&(d._batch.trigger(),d._batch=void 0)}else if(e!==Ge){for(o=e.split(/[.^]/);p&&o.length>1;)p=p[o.shift()];p&&d._setProperty(p,o[0],t,n,r)}return d},removeProperty:function(e){return this.setProperty(e,ln),this},_setProperty:function(e,t,n,r,i){var a,o,s,l,d,p=t?e[t]:e;if(Ye(p)&&!Ye(n)){if(i&&!p.set)return;p.set&&(d=e._vw||e,o=p,a=o.set===!0?o:o.set,p=o.call(d))}(p!==n||r&&p!=n)&&(!(p instanceof Date&&n instanceof Date)||p>n||p<n)&&(a?(a.call(d,n),n=o.call(d)):(s=n===ln)?void 0!==p?(delete e[t],n=void 0):t=void 0:t&&(e[t]=n),t&&(l={change:"set",path:t,value:n,oldValue:p,remove:s},e._ocp&&(l.ctxPrm=e._key),this._trigger(e,l)))},_trigger:function(e,n,r){ot._cchCt++;var i,a,o,s=this;t.hasData(e)&&(!r&&(a=s._batch)?(s.async&&!a._go&&a.wait(),a.push([s,e,n]),i=sn(e).obId+n.path,(o=a.paths[i])&&(a[o-1].skip=1),a.paths[i]=a.length):(t(e).triggerHandler(Yt+(this._ns?"."+/^\S+/.exec(this._ns)[0]:""),n),n.oldValue=null))}},fn.prototype={_data:null,observeAll:_n,unobserveAll:mn,data:function(){return this._data},insert:function(e,t){var n=this._data;return 1===arguments.length&&(t=e,e=n.length),e=Xt(e),e>-1&&(t=et(t)?t:[t],t.length&&this._insert(e,t)),this},_insert:function(e,t){var n=this._data,r=n.length;e>r&&(e=r),Qt.apply(n,[e,0].concat(t)),this._trigger({change:"insert",index:e,items:t},r)},remove:function(e,t){var n,r=this._data;return void 0===e&&(e=r.length-1),e=Xt(e),t=t?Xt(t):0===t?0:1,t>0&&e>-1&&(n=r.slice(e,e+t),(t=n.length)&&this._remove(e,t,n)),this},_remove:function(e,t,n){var r=this._data,i=r.length;r.splice(e,t),this._trigger({change:"remove",index:e,items:n},i)},move:function(e,t,n){return n=n?Xt(n):0===n?0:1,e=Xt(e),t=Xt(t),n>0&&e>-1&&t>-1&&e!==t&&this._move(e,t,n),this},_move:function(e,t,n){var r,i=this._data,a=i.length,o=e+n-a;o>0&&(n-=o),n&&(r=i.splice(e,n),t>i.length&&(t=i.length),Qt.apply(i,[t,0].concat(r)),t!==e&&this._trigger({change:"move",oldIndex:e,index:t,items:r},a))},refresh:function(e){function t(){i&&(s.insert(r-i,l),f+=i,n+=i,i=0,l=[])}var n,r,i,a,o,s=this,l=[],d=s._data,p=d.slice(),c=d.length,f=c,u=e.length;for(s._srt=!0,r=i=0;r<u;r++)if((a=e[r])===d[r-i])t();else{for(n=r-i;n<f&&a!==d[n];n++);if(n<f){for(t(),o=0;o++<u-n&&e[r+o]===d[n+o];);
s.move(n,r,o),r+=o-1}else i++,l.push(a)}return t(),f>r&&s.remove(r,f-r),s._srt=void 0,(c||u)&&s._trigger({change:"refresh",oldItems:p},c),s},_trigger:function(e,n,r){ot._cchCt++;var i,a,o,s=this;t.hasData(a=s._data)&&(!r&&(o=s._batch)?(e._dly=!0,o.push([s,e,n]),s.async&&!o._go&&o.wait()):(i=a.length,a=t([a]),s._srt?e.refresh=!0:i!==n&&a.triggerHandler(Yt,{change:"set",path:"length",value:i,oldValue:n}),a.triggerHandler(en+(s._ns?"."+/^\S+/.exec(s._ns)[0]:""),e)))}},Jt[Yt]=Jt[en]={remove:function(e){var n,r,i,a,o,s=e.data;if(s&&(s.off=!0,s=s.cb)&&(n=tn[s._cId])){for(i=t._data(this).events[e.type],a=i.length;a--&&!r;)r=(o=i[a].data)&&o.cb&&o.cb._cId===s._cId;r||(--n.len?delete n[sn(this).obId]:delete tn[s._cId])}}},We.map=function(e){function n(t,n,r,i){var a,o,s=this;s.src&&s.unmap(),n&&(n.map=s),(typeof t===Lt||Ye(t))&&(s.src=t,i?s.tgt=e.getTgt(t,n):(r&&(s.tgt=r.tgt||et(r)&&r),s.tgt=s.tgt||[],s.options=n||s.options,(o=s.update())?s=o:(e.obsSrc&&Ze(s.src).observeAll(s.obs=function(t,n){a||n.refresh||(a=!0,e.obsSrc(s,t,n),a=void 0)},s.srcFlt),e.obsTgt&&Ze(s.tgt).observeAll(s.obt=function(t,n){a||s.tgt._updt||(a=!0,e.obsTgt(s,t,n),a=void 0)},s.tgtFlt))))}return Ye(e)&&(e={getTgt:e}),e.baseMap&&(e=t.extend({},e.baseMap,e)),e.map=function(e,t,r,i){return new n(e,t,r,i)},(n.prototype={srcFlt:e.srcFlt||xn,tgtFlt:e.tgtFlt||xn,update:function(t){var n,r,i=this,a=i.tgt;if(!a._updt&&(a._updt=!0,n=i.options&&i.options.map,Ze(a).refresh(e.getTgt(i.src,i.options=t||i.options)),a._updt=!1,r=i.options&&i.options.map,r&&n!==r))return r},observe:function(e,n){var r=this,i=r.options;r.obmp&&yn(r.obmp),r.obmp=function(){var e=n.fn(n.data,n.view,at)[i.index];t.extend(i.props,e.props),i.args=e.args,r.update()},Ze._apply(1,n.data,gn(e,n.tag,r.obmp),r.obmp,n._ctxCb)},unmap:function(){var e=this;e.src&&e.obs&&Ze(e.src).unobserveAll(e.obs,e.srcFlt),e.tgt&&e.obt&&Ze(e.tgt).unobserveAll(e.obt,e.tgtFlt),e.obmp&&yn(e.obmp),e.src=void 0},map:n,_def:e}).constructor=n,e},at.advSet=function(){at=this,st=ot.advanced,e._jsv=st._jsv?{cbBindings:tn}:void 0},at._dp=gn,at._gck=pn,at._obs=Xe,ot._cchCt=0,st=ot.advanced=st||{useViews:!1,_jsv:!1}}if(lt=We.settings,ot=at.settings,st=ot.advanced,nt=We.converters,t.templates=tt=We.templates,it=We.tags,Ct=/<(?!script)(\w+)[>\s]/,Bt="string",t.link)return t;ot.trigger=!0;var Cn,kn,En,jn,An,In,Tn,Vn,Sn,Pn=window.navigator.userAgent,Nn=void 0!==document.textContent?"textContent":"innerText",Fn="data-jsv",Mn="change.jsv",Bn="onBeforeChange",Ln="onAfterChange",On="onAfterCreate",$n="checked",Un="checkbox",Rn="radio",Dn="input[type=",qn=Dn+Un+"]",Kn="none",Hn="value",Jn="SCRIPT",zn="true",Qn='"></script>',Wn='<script type="jsv',Xn=Fn+"-df",Zn="script,["+Fn+"]",Gn={value:"val",input:"val",html:Mt,text:"text"},Yn={from:Hn,to:Hn},er=0,tr=t.cleanData,nr=lt.delimiters,rr={},ir=document.createDocumentFragment(),ar=document.querySelector,or={ol:1,ul:1,table:1,tbody:1,thead:1,tfoot:1,tr:1,colgroup:1,dl:1,select:1,optgroup:1,svg:1,svg_ns:1},sr={tr:"table"},lr={br:1,img:1,input:1,hr:1,area:1,base:1,col:1,link:1,meta:1,command:1,embed:1,keygen:1,param:1,source:1,track:1,wbr:1},dr={},pr={},cr=1,fr=/^#(view\.?)?/,ur=/((\/>)|<\/(\w+)>|)(\s*)([#\/]\d+(?:_|(\^)))`(\s*)(<\w+(?=[\s\/>]))?|\s*(?:(<\w+(?=[\s\/>]))|<\/(\w+)>(\s*)|(\/>)\s*|(>)|$)/g,gr=/(#)()(\d+)(_)/g,vr=/(#)()(\d+)([_^])/g,hr=/(?:(#)|(\/))(\d+)(_)/g,_r=/(?:(#)|(\/))(\d+)(\^)/g,mr=/(#)()(\d+)(\^)/g,br=/(?:(#)|(\/))(\d+)([_^])([-+@\d]+)?/g,xr=/&(\d+)\+?/g,yr=/^[^.]*$/,wr=e.getComputedStyle,Cr=t.inArray;if(Dn+=Rn+"]",Pn=Pn.indexOf("MSIE ")>0||Pn.indexOf("Trident/")>0,Ze=t.observable,!Ze)throw requiresStr+"jquery.observable.js";return Xe=Ze.observe,ot._clFns=function(){rr={}},Ue(at.View.prototype),at.onStore.template=function(e,n,r){null===n?(delete t.link[e],delete t.render[e]):(n.link=ue,e&&!r&&"jsvTmpl"!==e&&(t.render[e]=n,t.link[e]=function(){return ue.apply(n,arguments)}))},at.viewInfos=xe,(lt.delimiters=function(){var e=nr.apply(0,arguments);return nr!==p&&(e=p.apply(0,arguments)),kn=new RegExp("(?:^|\\s*)([\\w-]*)(\\"+ut+")?(\\"+pt+at.rTag+"(:\\w*)?\\"+ct+")","g"),e})(),at.addSetting("trigger"),nt.merge=function(e){var t,n=this.linkCtx.elem.className,r=this.tagCtx.props.toggle;return r&&(t=r.replace(/[\\^$.|?*+()[{]/g,"\\$&"),t="(\\s(?="+t+"$)|(\\s)|^)("+t+"(\\s|$))",n=n.replace(new RegExp(t),"$2"),e=n+(e?(n&&" ")+r:"")),e},it({on:{attr:Kn,bindTo:[],init:function(e){for(var n,r=this,i=0,a=e.args,o=a.length;i<o&&!Ye(a[i]);i++);r._hi=o>i&&i+1,r.inline&&(at.rTmpl.exec(n=t.trim(e.tmpl.markup))||(r.template="<button>"+(n||e.params.args[i]||"noop")+"</button>"),r.attr=Mt)},onBind:function(){this.template&&(this.mainElem=this.contents("button"))},onAfterLink:function(e,n){var r,i,a,o=this,s=o._hi,l=e.args,d=l.length,p=e.props,c=p.data,f=e.view,u=p.context;s&&(r=l[s-1],i=l.slice(s),l=l.slice(0,s-1),o._sel=l[1],a=o.activeElem=o.activeElem||t(o.inline?(o._sel=l[1]||"*",o.parentElem):n.elem),u||(u=/^(.*)[.^][\w$]+$/.exec(e.params.args.slice(-i.length-1)[0]),u=u&&at.tmplFn(pt+":"+u[1]+ct,f.tmpl,!0)(n.data,f,at)),o._evs&&o.onUnbind(e,n,o.ctx),a.on(o._evs=l[0]||"click",o._sel,void 0==c?null:c,o._hlr=function(e){var t,a=!o.inline;if(!a)for(t=o.contents("*"),d=t.length;!a&&d--;)t[d].contains(e.target)&&(a=!0);if(a)return r.apply(u||n.data,[].concat(i,e,{change:e.type,view:f,linkCtx:n},i.slice.call(arguments,1)))}))},onUpdate:!1,onArrayChange:!1,onUnbind:function(){var e=this,t=er;e.activeElem&&(er=0,e.activeElem.off(e._evs,e._sel,e._hlr),er=t)},contentCtx:!0,setSize:!0,dataBoundOnly:!0},radiogroup:{boundProps:["disabled"],init:function(e){this.name=e.props.name||(Math.random()+"jsv").slice(9)},onBind:function(e,n){var r,i,a,o=this,s=e.params.props;for(s=s&&s.disabled,o.inline?(r=o.contents("*")[0],r=r&&En(r).ctx.tag===o.parent?r:o.parentElem,i=o.contents(!0,Dn)):(r=n.elem,i=t(Dn,n.elem)),o.linkedElem=i,a=i.length;a--;)i[a].name=i[a].name||o.name;t(r).on("jsv-domchange",o._dmChg=function(t,n,l,d){var p,c,f=n.ctx.parentTags;if(!d.refresh&&(!o.inline||r!==o.parentElem||f&&f[o.tagName]===o)){for(c=o.cvtArgs()[0],i=o.linkedElem=o.contents(!0,Dn),a=i.length;a--;)p=i[a],p._jsvLkEl=o,p.name=p.name||o.name,p._jsvBnd="&"+o._tgId+"+",p.checked=c===p.value,s&&(p.disabled=!!e.props.disabled);o.linkedElems=e.linkedElems=[i]}}),o._dmChg.tgt=r},onAfterLink:function(e,t,n,r,i){var a=e.params.props;a&&a.disabled&&this.linkedElem.prop("disabled",!!e.props.disabled)},onUnbind:function(){var e=this;e._dmChg&&(t(e._dmChg.tgt).off("jsv-domchange",e._dmChg),e._dmChg=void 0)},onUpdate:!1,contentCtx:!0,dataBoundOnly:!0},checkboxgroup:{boundProps:["disabled"],init:function(e){this.name=e.props.name||(Math.random()+"jsv").slice(9)},onBind:function(e,n){for(var r,i=this,a=e.params.props,o=a&&a.disabled,s=e.params.args[0],l=i.contents(!0,qn),d=l.length;d--;)l[d].name=l[d].name||i.name,l[d]._jsvLkEl=i;for(d in a)s+=" "+d+"="+a[d];l.link(s,n.data,void 0,void 0,n.view),i.linkedElem=l,i.inline?(r=i.contents("*")[0],r=r&&t.view(r).ctx.tag===i.parent?r:i.parentElem):r=n.elem,t(r).on("jsv-domchange",i._dmChg=function(n,a,p,c){var f,u=a.ctx.parentTags;if(!c.refresh&&(!i.inline||r!==i.parentElem||u&&u[i.tagName]===i))for(l=i.contents(!0,qn),d=l.length;d--;)f=l[d],f._jsvSel||(f.name=f.name||i.name,t.link(s,f,p.data),o&&(f.disabled=!!e.props.disabled))}),i._dmChg.tgt=r},onAfterLink:function(e,t,n,r,i){var a=e.params.props;a&&a.disabled&&this.contents(!0,qn).prop("disabled",!!e.props.disabled)},onUnbind:function(){var e=this;e._dmChg&&(t(e._dmChg.tgt).off("jsv-domchange",e._dmChg),e._dmChg=void 0)},onUpdate:!1,contentCtx:!0,dataBoundOnly:!0}}),d(it["for"],{sortDataMap:We.map({getTgt:it["for"].sortDataMap.getTgt,obsSrc:function(e,t,n){e.update()},obsTgt:function(e,t,n){var r,i=n.items,a=e.src;if("remove"===n.change)for(r=i.length;r--;)Ze(a).remove(Cr(i[r],a));else"insert"===n.change&&Ze(a).insert(i)}}),mapProps:["filter","sort","reverse","start","end","step"],bindTo:["paged","sorted"],bindFrom:[0],onArrayChange:function(e,t,n,r){var i,a,o=e.target.length,s=this;if(!s.rendering)if(s._.noVws||s.tagCtxs[1]&&("insert"===t.change&&o===t.items.length||"remove"===t.change&&!o))a=n.map&&n.map.propsArr,s.refresh(),a&&(n.map.propsArr=a);else for(i in s._.arrVws)i=s._.arrVws[i],i.data===e.target&&oe.apply(i,arguments);s.domChange(n,r,t),e.done=!0},onUpdate:function(e,t,n){this.setDataMap(n)},onBind:function(e,t,n,r,i){for(var a,o=this,s=0,l=o._ars=o._ars||{},d=o.tagCtxs,p=d.length,c=o.selected||0;s<=c;s++)e=d[s],a=e.map?e.map.tgt:e.args.length?e.args[0]:e.view.data,l[s]&&(Xe(l[s],!0),delete l[s]),!l[s]&&et(a)&&!function(){var n=e;Xe(a,l[s]=function(e,r){o.onArrayChange(e,r,n,t)})}();for(s=c+1;s<p;s++)l[s]&&(Xe(l[s],!0),delete l[s]);i&&o.domChange(e,t,i)},onAfterLink:function(e){for(var n,r,i,a=this,o=0,s=a.tagCtxs,l=(s.length,a.selected||0);o<=l;o++)e=s[o],r=e.map,n=e.map?r.tgt:e.args.length?e.args[0]:e.view.data,et(n)&&(i=e.params.props)&&(i.paged&&!a.paged&&(t.observable(a).setProperty("paged",n.slice()),a.updateValue(a.paged,0,o,!0)),i.sorted&&!a.sorted&&(t.observable(a).setProperty("sorted",r&&r.sorted||n.slice()),a.updateValue(a.sorted,1,o,!0)))},onDispose:function(){var e,t=this;for(e in t._ars)Xe(t._ars[e],!0)}}),d(it["if"],{onUpdate:function(e,t,n){for(var r,i,a=0;r=this.tagCtxs[a];a++)if(i=r.props.tmpl!==n[a].props.tmpl||r.args.length&&!(r=r.args[0])!=!n[a].args[0],!this.convert&&r||i)return i;return!1},onAfterLink:function(e,t,n,r,i){i&&this.domChange(e,t,i)}}),it("props",{baseTag:"for",dataMap:We.map({getTgt:it.props.dataMap.getTgt,obsSrc:Re,obsTgt:De,tgtFlt:Ke}),flow:!0}),d(t,{view:En=function(e,n,r){function i(e,t){if(e)for(o=xe(e,t,gr),l=0,d=o.length;l<d&&(!(a=Tn[o[l].id])||!(a=a&&r?a.get(!0,r):a));l++);}n!==!!n&&(r=n,n=void 0);var a,o,s,l,d,p,c,f=0,u=document.body;if(e&&e!==u&&Qe._.useKey>1&&(e=typeof e===Bt?t(e)[0]:e.jquery?e[0]:e)){if(n){if(i(e._df,!0),!a&&e.tagName)for(c=ar?e.querySelectorAll(Zn):t(Zn,e).get(),p=c.length,s=0;!a&&s<p;s++)i(c[s]);return a}for(;e;){if(o=xe(e,void 0,hr))for(p=o.length;p--;)if(a=o[p],a.open){if(f<1)return a=Tn[a.id],a&&r?a.get(r):a||Qe;f--}else f++;e=e.previousSibling||e.parentNode}}return Qe},link:ge,unlink:Ne,cleanData:function(e){e.length&&er&&Se(e),tr.apply(t,arguments)}}),d(t.fn,{link:function(e,t,n,r,i,a,o){return ge(e,this,t,n,r,i,a,o)},unlink:function(){return Ne(this)},view:function(e,t){return En(this[0],e,t)}}),t.each([Mt,"replaceWith","empty","remove"],function(e,n){var r=t.fn[n];t.fn[n]=function(){var e;er++;try{e=r.apply(this,arguments)}finally{er--}return e}}),d(Qe=at.topView,{tmpl:{links:{}}}),Tn={0:Qe},at._glt=function(e){for(var t,n=/#(\d*)\^\/\1\^/g,r=[],i=be(e);t=n.exec(i);)(t=pr[t[1]])&&r.push(t.linkCtx.tag);return r},at._gccb=function(e){return function(t,n){var r,i,a,o,s,l,d,p,c,f,u;if(e&&t){if(t._cpfn)try{return st.cache?e.getCache(t._cpKey):t._cpfn.call(e.tmpl,e.data,e,at)}catch(g){return}if("~"===t.charAt(0)){if("~tag"===t.slice(0,4)&&(i=e.ctx,"."===t.charAt(4)?(r=t.slice(5),i=i.tag):"~tagCtx."===t.slice(0,8)&&(r=t.slice(8),i=i.tagCtx),r))return i?[i,r]:[];if(t=t.slice(1).split("."),o=e.ctxPrm(s=t.shift(),void 0,!0))if(p=o._cxp){if(t.length&&(l="."+t.join("."),s=o[d=o.length-1],s._cpfn?(s.sb=l,s.bnd=!!n):(o[d]=(s+l).replace("#data.",""),"#view"===s.slice(0,5)&&(o[d]=o[d].slice(6),o.splice(d,0,e)))),a=[o],(i=p.tag)&&i.convert)for(u=i.bindTo||[0],d=u.length;d--;)void 0!==n&&d!==p.ind&&(f=u[d],c=[o[0],i.tagCtx.params[+f===f?"args":"props"]],c._cxp=p,a.push(c))}else(t.length||Ye(o))&&(a=[o,t.join(".")]);return a||[]}if("#"===t.charAt(0))return"#data"===t?[]:[e,t.replace(fr,"")]}}},at._cp=function(e,n,r,i){if(r.linked){if(i&&(i.cvt||void 0===i.tag._.toIndex[i.ind]))e=[{_ocp:e}],i.updateValue=function(n){return t.observable(e._cxp.data).setProperty(_t,n),this};else if(n){var a=pt+":"+n+ct,o=rr[a];o||(rr[a]=o=at.tmplFn(a.replace(xt,"\\$&"),r.tmpl,!0)),e=o.deps[0]?[r,o]:[{_ocp:i?e:o()}]}else e=[{_ocp:e}];e._cxp=i||{updateValue:function(t){return Ze(e._cxp.data).setProperty(e._cxp.path,t),this}}}return e},at._ucp=function(e,t,n,r){var i=r.tag,a=i?Cr(e,i.linkedCtxParam):0;return r.path||Te("~"+e,n.data,at._gccb(n)),(r.updateValue||i.updateValue)(t,a,r.tagElse,void 0,i)},at._ceo=function kr(e){for(var t,n=[],r=e.length;r--;)t=e[r],t._cpfn&&(t=d({},t),t.prm=kr(t.prm)),n.unshift(t);return n},Vn=at.advSet,at.advSet=function(){Vn.call(at),e._jsv=st._jsv?d(e._jsv||{},{views:Tn,bindings:pr}):void 0,jn=st.linkAttr,An=Zn+",["+jn+"]",In=st._wm,In.optgroup=In.option,In.tbody=In.tfoot=In.colgroup=In.caption=In.thead,In.th=In.td},lt.advanced({linkAttr:"data-link",useViews:!1,noValidate:!1,_wm:{option:[1,"<select multiple='multiple'>","</select>"],legend:[1,"<fieldset>","</fieldset>"],area:[1,"<map>","</map>"],param:[1,"<object>","</object>"],thead:[1,"<table>","</table>"],tr:[2,"<table><tbody>","</tbody></table>"],td:[3,"<table><tbody><tr>","</tr></tbody></table>"],col:[2,"<table><tbody></tbody><colgroup>","</colgroup></table>"],svg_ns:[1,"<svg>","</svg>"],div:t.support.htmlSerialize?[0,"",""]:[1,"X<div>","</div>"]},_fe:{input:{from:Fe,to:Hn},textarea:Yn,select:Yn,optgroup:{to:"label"}}}),t},window);

$.views.converters({
    formatDigits: formatDigits,
    formatMoney: formatMoney,
    formatDate: function(str) {
        if (!str) return (this.tagCtx.props.showempty)? SCRM.emptyStr : '';
        return str2date(str, 'd');
    },
    formatDateTime: function(str){
        if (!str) return (this.tagCtx.props.showempty)? SCRM.emptyStr : '';
        return str2date(str, 'dt');
    },
    formatEmpty: function(str) {
        return str? str : SCRM.emptyStr;
    },
    fmtStatus: function(status) {
        return SCRM.statusFmt(this.tagCtx.props.tbl, status, this.tagCtx.props.field);
    },
    i2s: function(val) {
        return ''+val;
    }
});
$.views.helpers({
    woTpl: function(item, index, items) {
        return item.tpl != '-'; //this.props.odd === (index%2 === 1);
    },
    joinStr: function(str1, str2) {
        return joinStr([str1,str2]);
    },
    Util: SCRM._service,
    Run: function(path, e, data) {
        SCRM._run.call(e, path, data);
    },
    S: SCRM
});
$.templates({
    '#tpl_selectOption' : '<option value="{{:id}}">{{:name}}</option>',
    '#tpl_Select' : '<select class="custom-select" data-link="{:~link:}"> \
        {^{for ~rows itemVar="~row"}}<option data-link="value{:~row[~opt_id||\'id\']} {:name}"></option>{{/for}}</select>',
    navTab: '<a class="nav-link" data-toggle="tab" \
        data-link="html{:name||html} href{:href||\'#\'+id} class{merge:active toggle=\'active\'} visible{:!hidden}"></a>',
    roDMenu: '<div class="ml-auto mr-n2 mt-n1 dropdown" data-link="visible{:!~hidden}"> \
        <button class="btn btn-sm1 btn-icon btn-light" data-toggle="dropdown"><i class="fa fa-fw fa-ellipsis-v"></i></button> \
        <div class="dropdown-menu dropdown-menu-right"><div class="dropdown-arrow"></div> \
        {{include tmpl=#content /}} </div></div>',
    Loading: '<div style="width: 3rem; height: 3rem;" role="status" data-link="class{:\'spinner-border text-primary \'+~loadingStyle}"><span class="sr-only">Loading...</span></div>'
});

SCRM.tpl_clubModal1 = '<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-link="aria-labelledby{:mdl_id+\'label\'}"> \
    <div class="modal-dialog" data-link="class{merge:cm_size toggle=\'modal-\'+cm_size}"> \
        <div class="modal-content spinner-parent"> \
            <div class="color-line"></div> \
            <div class="modal-header pb-0" data-link="visible{:title||!onOK}"> \
                <h5 class="modal-title" data-link="html{:title} id{:mdl_id+\'label\'}"></h5> \
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> \
            </div> \
            <div class="modal-body py-3" data-link="{include tmpl=body}"></div> \
            <div class="modal-footer pt-0" data-link="visible{:onOK||cancel||mdl_footer}"> \
                <div class="modal-footer-add flex-grow-1" data-link="{if mdl_footer tmpl=mdl_footer}"></div> \
                <button type="button" class="btn btn-light btn-modal-cancel" data-dismiss="modal" \
                    data-link="html{:cancel||\'Отмена\'} visible{:onOK||cancel} disabled{:loading}"></button> \
                <button type="button" class="btn btn-primary btn-modal-ok" \
                    data-link="visible{:onOK} {on ~on_OK} disabled{:loading||disabledOK}"> \
                    <span data-link="html{:ok||\'OK\'}"></span> \
                    <span class="spinner-border spinner-border-sm" role="status" data-link="visible{:loading}"></span> \
                </button> \
            </div> \
        </div> \
    </div> \
</div>';

SCRM.tpl_clubModal = '<div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" data-link="aria-labelledby{:mdl_id+\'label\'}"> \
    <div class="modal-dialog" data-link="class{merge:cm_size toggle=\'modal-\'+cm_size}"> \
        <form class="modal-content spinner-parent" data-link="{on \'submit\' ~on_OK}"> \
            <div class="color-line"></div> \
            <fieldset class="modal-header pb-0" data-link="visible{:title||!onOK} disabled{:loading}"> \
                <h5 class="modal-title" data-link="html{:title} id{:mdl_id+\'label\'}"></h5> \
                <button class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> \
            </fieldset> \
            <fieldset class="modal-body py-3" data-link="{include tmpl=body} disabled{:loading}"></fieldset> \
            <fieldset class="modal-footer pt-0" data-link="visible{:onOK||cancel||mdl_footer} disabled{:loading}"> \
                <div class="modal-footer-add flex-grow-1" data-link="{if mdl_footer tmpl=mdl_footer}"></div> \
                <button class="btn btn-light btn-modal-cancel" data-dismiss="modal" \
                    data-link="html{:cancel||\'Отмена\'} visible{:onOK||cancel}"></button> \
                <button type="submit" class="btn btn-primary btn-modal-ok" \
                    data-link="visible{:onOK} disabled{:disabledOK}"> \
                    <span data-link="html{:ok||\'OK\'}"></span> \
                    <span class="spinner-border spinner-border-sm" role="status" data-link="visible{:loading}"></span> \
                </button> \
            </fieldset> \
        </form> \
    </div> \
</div>';

SCRM.tpl_clubDrawer = '<div class="modal modal-drawer fade" tabindex="-1" role="dialog" aria-hidden="true" data-link="aria-labelledby{:mdl_id+\'label\'}"> \
    <div class="modal-dialog modal-drawer-right" role="document" data-link="class{merge:cm_size toggle=\'modal-\'+cm_size}"> \
        <div class="modal-content" data-link="disabled{:loading}"> \
            <div class="modal-header d-flex"> \
                <div class="modal-title h6 flex-grow-1" data-link="{include ^tmpl=title} id{:mdl_id+\'label\'}"></div> \
                <button class="close d-print-none" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> \
            </div> \
            <div class="modal-body my-2" data-link="{include tmpl=body}"></div> \
        </div> \
    </div> \
</div>';

$.views.tags('roDMenu', {contentCtx: true, template:'roDMenu'});
$.views.settings.allowCode(true);
$.views.settings.debugMode(true);
