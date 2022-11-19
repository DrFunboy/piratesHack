(function ( $ ) {

$.fn.sPopMenu = function () {
    var lnk = $(this),
        lnkData = lnk.data(),
        d = {
            ptype: lnkData.popmenu||'tel',
            rows: [ ],
            txt: lnk.text()
        };
    if ('value' in lnkData) d.txt = lnkData.value;
    if (d.ptype in lnkData) d.txt = lnkData[d.ptype];
        
    if (!d.txt) {
        d.rows.push({text: SCRM.emptyStr, href: 'javascript:void(0);'});
    } else {
        switch (d.ptype) {
            case 'tel':
            d.tels = $.map(String(d.txt).split(/[,;/]/), function(trow, i) {
                var t = trow.match(/\d+/g).join('');
                if (t.length == 11 && t[0] == '8') t = '7' + t.slice(1);
                d.rows.push({ico: 'fa-phone', text: '+'+t, href: 'tel:'+t});
                return t;
            });
    
            // https://faq.whatsapp.com/452366545421244/?locale=ru_RU
            // https://vc.ru/services/390607-kak-sozdat-ssylku-na-svoy-nomer-telegram-i-opublikovat-na-sayte
            
            if ( detectSmartphone() ) d.rows.push({ico: 'fa-comments-o', text: 'SMS', href: 'sms://+' + d.tels[0]});
            d.rows.push({ico: 'fa-telegram', text: 'Telegram', href: 'https://t.me/+' + d.tels[0] + '" target="_blank'});
            d.rows.push({ico: 'fa-whatsapp', text: 'WhatsApp', href: 'https://wa.me/' + d.tels[0] + '" target="_blank'});
            break;

            case 'email':
            d.rows.push({ico: 'fa-envelope', text: 'E-mail', href: 'mailto:'+d.txt});
            break;

            case 'href':
            d.rows.push({ico: 'fa-share-square-o', text: 'Перейти', href: d.txt + '" target="_blank'});
            break;
        }
        d.rows.push({ico: 'fa-files-o', text: 'Копировать', href: '#copytxt'});
    }
    lnk.trigger('onInitPopMenu', d);
    if (d.rows.length) {
        var html = $.map(d.rows, function(v, i) {
            var ico = v.ico? '<div class="list-group-item-figure"><i class="fa '+v.ico+'"></i></div>' : '';
            return '<a href="'+v.href+'" class="list-group-item list-group-item-action '+ (v.cls||'') +'">'+
                ico +'<div class="list-group-item-body">'+ v.text +'</div></a>';
        }).join('');
        var p = clubOnPopover(lnk, '<div class="list-group list-group-divider">'+html+'</div>');
        $('[href="#copytxt"]', p).on('click', function(e) {
            e.preventDefault();
            navigator.clipboard.writeText(d.txt)
            .then(() => {
                SCRM.success('Скопировал в буфер');
            });
        });
        p.find('.popover-body').addClass('p-0');
    }

    return this;
};

}( jQuery ));