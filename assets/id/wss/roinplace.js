(function ( $ ) {
    
$.fn.roinplace = function (callback) {
    return this.each(function() {
        var elm = $(this);
        if (!elm.data('editMode')) {
            var etext = $('.roinplacetext', elm),
                txt = ((etext.length > 0)? etext : elm).text(),
                editor = (elm.data('editor')||'').split(':');
            if (txt == SCRM.emptyStr) txt = '';

            var roInplaceInner = ['<fieldset class="input-group roinplace" data-link="disabled{:loading}">',
            
            '<input class="form-control" data-link="value">',
            
            '<div class="input-group-append" data-link="visible{:(value != old_value)}"> \
            <button class="btn btn-subtle-primary" type="submit"><i class="fa fa-check"></i></button></div> \
            <div class="input-group-append"><button class="btn btn-subtle-danger" type="reset"><i class="fa fa-times"></i></button></div> \
            </fieldset>'];
            if (editor[0]=='select') roInplaceInner[1] = '<select class="form-control" data-link="{i2s:value:}">{^{for options tmpl=\'#tpl_selectOption\'}}{{else tmpl=html}}{{/for}}</select>';

            var inData = {
                value: txt,
                options: [{id: txt, name: txt}]
            };
            
            inData.roInplace = $('<form action="" class="roinplace-container"></form>')
            .insertAfter( elm.hide().data('editMode', 1) )
            .on('submit.roInplace reset.roInplace', function(e){
                e.preventDefault(); // submit reset
                SCRM.link(inData, 'loading', true);
                if (e.type == 'submit') {
                    if (callback) callback(inData.value); // TODO: Для совместимости?
                    elm.trigger(elm.data('roinplace') || 'roinplace', [inData.value, inData]);
                    if (!inData.skipText) ((etext.length > 0)? etext : elm).text(inData.value);
                }
                $('.onDestroyParent', inData.roInplace).trigger('onDestroyParent');
                inData.roInplace.remove();

                elm.data('editMode', null).show().focus();
            });
            
            elm.trigger('onInplaceBeforeInit', inData);
            inData.old_value = inData.value;

            $.templates( roInplaceInner.join('') ).link(inData.roInplace, inData);
            var input = $('input', inData.roInplace)
            .on('keydown', function(event, i) {
                if (event.key == 'Escape') {
                    event.stopPropagation();
                    $(this).closest('form')[0].reset();
                }
            });
            
            switch (editor[0]) {
                case 'number':
                case 'money':
                    var attr = {
                        type: 'number',
                        step: editor[1] || '1',
                        placeholder: (editor[1])? '1.0' : '1'
                    };
                    input.attr(attr).pauseFocus(true);
                break;
                case 'mask':
                    input.initMaskEdit(editor[1], function(){
                        input.pauseFocus(true);
                    });
                break;
                case 'dateedit':
                case 'datetime':
                case 'date':
                    var params = {};
                    if (editor[0]=='datetime') $.extend(params, {enableTime: true, dateFormat: SCRM.datetimeFormat});
                    if (inData.value && txt != inData.value) {
                        params.defaultDate = new Date(inData.value);
                    }
                    
                    input
                    .on('onInitDateEdit', function(e, cal){
                        input.pauseFocus();
                    })
                    .on('onChangeDateEdit', function(e, data){
                        SCRM.link(inData, 'sql_value', data.sqlDates[0]||'');
                    })
                    .initDateEdit(params);
                break;
                default: input.pauseFocus(true);
            }
            
        }
    });
};

}( jQuery ));