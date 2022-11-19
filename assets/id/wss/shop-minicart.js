var shop_url = '/data/shop';
$(function(){
    $(document).on('shop.counts', function(){
        $('#shopInfo').remove();
        pJSON(shop_url, function(data){
            var statuses = {
                cart: {url: '/shop/cart.html', cls: 'label-danger'},
                ready: {url: '/shop/myorders.html', cls: 'label-warning'}
            };
            if (data && data.rows) $.each(data.rows, function(i, r){
                var status = statuses[r.status];
                if (status) {
                    $('<a class="count-info nav-link nav-item has-notified" id="shopInfo" href="'+
                        status.url +'"><i class="fa fa-shopping-basket"></i></a>')
                    .prependTo('.header-nav');
                    return false;
                }
            });
        });
    });
    setTimeout(function(){
        $(document).trigger('shop.counts');
    }, 800);
});