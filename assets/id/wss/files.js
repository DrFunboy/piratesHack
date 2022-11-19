SCRM.files_url = '/hook/files';
SCRM._imgloader = {};
SCRM.triggerFile = function(data) {
    $('[data-linkfile]').trigger(data.postData.fid, data);
};
SCRM.linkFile = function(tpl, e, data, nd) {
    //console.log('linkFile', tpl, e, data, nd, $.view(this));
    // data.linkCtx.tag.ctxPrm("abbra")
    var fParent = $(e.target);
    var file1type = fParent.data('file1type');
        
    nd = $.extend({
        postData: {},
        filetypes: {},
        post: {} // Особый обработчик для link, чтобы не заменил, а объединил
    }, nd);
    nd.add = $.map(nd.filetypes, function(v, i){
        if ($.inArray('add', v.permis) > -1) return v;
    });
    if (file1type) {
        nd.post.filetype = file1type;
        var ftype = nd.filetypes[file1type] || {};
        nd.file1 = {
            // если файла нет и нет разрешений на модификацию, поискать разрешение на добавление
            modify: $.inArray('add', ftype.permis||[]) >= 0
        };
        $.each(nd.rows || [], function(i, v){
            if (v.filetype==file1type) {
                nd.file1 = v;
                return false;
            }
        });
        if ($.inArray('modify', ftype.permis||[]) >= 0) {
            nd.file1.modify = true;
            nd.post.oper = 'modify';
        }
    }

    $.each(nd.rows || [], function(i, v){
        if (v.newCloud && !(v.key in SCRM._imgloader)) { //DEBUG
            var fn = key2obj(SCRM._imgloader, v.key, function(n, imgsrc){
                n++;
                setTimeout(function(){
                    var img = new Image();
                    var checkImgKey = function(){
                        if (img) {
                            img.onerror = null;
                            img.src='';
                            img=null;
                        }
                        return $('[data-imgkey="'+ v.key +'"');
                    },
                    setImgSm = function(i, v){
                        var d = $.view(this).data;
                            if (d.file1) d = d.file1;
                            SCRM.link(d, {sm: imgsrc});
                    };
                    img.onload = function() {
                        checkImgKey().each(setImgSm);
                    };
                    img.onerror = function() {
                        var imgs = checkImgKey();
                        if (n < 8 && imgs.length) {
                            fn(n, imgsrc);
                        } else {
                            imgsrc = null;
                            imgs.each(setImgSm);
                        }
                    };
                    img.src = imgsrc;
                }, SCRM.randInt(1234, 3457));
            });
            //if (i>2) v.sm = v.sm+'5443'; //DEBUG
            fn(0, v.sm);
            v.sm = SCRM.url+'images/loader.gif';
        }
    });

    var fData = fParent.data('linkfile');
    if (!fData) {
        fData = $.extend({
            parentData: data.linkCtx.data
        }, nd);
        
        fParent.data('linkfile', fData);
        $.templates(tpl).link(fParent, fData,{
            uploadFileList: function(e, data){
                //console.log('~uploadFileList', e, data);
                var d = data.linkCtx.data;
                if (!d.post.filetype) {
                    if (d.add.length == 1) {
                        d.post.filetype = d.add[0].alias;
                    } else {
                        SCRM.link(d, {showSelect: true});
                    }
                }
                if (d.post.filetype) {
                    SCRM.uploadFile(e, data);
                }
            },
            editFile: function(e, data) {
                e.preventDefault();
                var d = data.linkCtx.data;
                var el = $(e.target)
                .closest('.club-filerow')
                .find('a.club-file')
                .roinplace(function(txt){
                    pEDIT('idFiles', {
                        id: d.id,
                        name: txt
                    });
                });
            },
            delFile: function(e, data) {
                e.preventDefault();
                var d = data.linkCtx.data,
                    pd = data.linkCtx.tag.ctxPrm("pd");
                //data.linkCtx.tag.ctxPrm("abbra")
                //console.log('~delFile', e, data, pd);
                
                rocnfrm('Удалить файл '+ d.name +'.'+ d.fileext +'?', function(){
                    SCRM.link(pd, {loading: 1});
                    pJSON(SCRM.files_url, $.extend({
                        //uid: d.uid,
                        fkey: d.key
                    }, pd.postData, {
                        oper: 'del'
                    }), function(ndata){
                        SCRM.triggerFile(ndata);
                    })
                    .always(function(){
                        SCRM.link(pd, {loading: 0});
                    });
                });
            },
            clickPhoto1: function(e, data){
                //console.log('~clickPhoto1', e, data);
                e.preventDefault();
                var d = data.linkCtx.data;
                if (!d.file1) return false;
                
                if (d.file1.md) {
                    showPhotos({
                        title: d.file1.name,
                        thumbnail: d.file1.sm,
                        href: d.file1.md
                    });
                } else {
                    if (d.file1.modify) SCRM.uploadFile(e, data);
                }
            }
        });
        //console.log('fData', fData);
    } else {
        $.each(nd.post, function(key, v){
            nd['post.'+key] = v;
        });
        delete nd.post;
        SCRM.link(fData, nd);
        //console.log('fData_yes', fData);
    }
};
SCRM.uploadFile = function(e, data, pd) {
    //console.log('~uploadFile', e, data);
    var d = data.linkCtx.data; //TODO: Проверять?
    var btn = $(e.currentTarget);
    pd = $.extend({
        oper: 'add',
        //filetype: 'file',
        filename: '',
        filter: ''
    }, d.postData, d.post, pd);
    if (!pd.uid) return false; //нет контейнера файлов
    var inputAttr = {
        //multiple: 'multiple',
        accept: '*'
    };
    $.each(['accept','multiple'], function(i, v){
        var attr = btn.attr(v);
        if (attr) inputAttr[v] = attr;
    });

    $('#club_fupload').remove();
    $('<input type="file" name="club_fupload" id="club_fupload" style="display:none">')
    .attr(inputAttr)
    .appendTo('body')
    .on('change', function(ev){
        SCRM.link(d, {loading: 1});
        var updata = new FormData();
        $.each(ev.target.files, function(key, value){
            updata.append(key, value);
        });
        $.each(pd, function(key, value) {
            if ($.type(value) !== 'function' && value !== null ) updata.append(key, value);
        });
        
        $.ajax({
            url: SCRM.files_url,
            type: 'POST',
            dataType: 'json',
            data: updata,
            cache: false,
            processData: false, // Dont process the files
            contentType: false, // Set to false as jQuery will tell the server its a query string request
            success: function(data, textStatus, jqXHR){
                SCRM.triggerFile(data); // TODO: Проверить uid или другой параметр будет
            }
        })
        .always(function(){
            SCRM.link(d, {loading: 0});
        })
        .fail(failXHR);
    })
    .click();
};
