// version test;

(function ( $ ) {
    $.fn.roInplaced = function( options ) {
        options = $.extend({
            empty : '<span style="color:papayawhip;background-color:papayawhip">____________</span>'
        }, options);
    
        function roInplacedEmpty(elem){
            var txt = $.trim( elem.text() );
            if (!txt) elem.html(options.empty);
        }
    
        this.each(function(i, el){
            var elem = $(el);
            elem.addClass('roinplaced')
            .off('click.roInplaced')
            .on('click.roInplaced', function(e){
                e.preventDefault();
                var txt = elem.text() || '';
                if (elem.html() == options.empty) txt = '';
                var block = $('<div>'+
                    '<input class="form-control mb-1">'+
                    '<button class="btn btn-primary btn-sm" data-save="1"><i class="fa fa-check"></i></button> '+
                    '<button class="btn btn-secondary btn-sm"><i class="fa fa-close"></i></button>'+
                    '</div>').insertAfter( elem.hide() );
                var input = $('input', block).val(txt).focus();
                $('button', block).on('click', function(){
                    if ( $(this).data('save') ){
                        txt = input.val();
                        roInplacedEmpty( elem.text(txt) );
                        if (options.callback) options.callback.call(elem, txt);
                    }
                    block.remove();
                    elem.show();
                });
            });
            roInplacedEmpty(elem);
        });
    };
}( jQuery ));