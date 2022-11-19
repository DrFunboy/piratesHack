$(document)
.on('jqGridBeforeInit', function(e, grOpts) {
    // было one - срабатывал только на первом гриде..
    switch (grOpts.gridEntity) {
        case 'idSportsmen':
        case 'idLead':
        case 'idPay':
        case 'idInvoice':
        case 'idChanges':
        case 'idOrderItems':
        case 'idShopItem':
        case 'idSchedule':
        case 'idFiles':
            $.extend(grOpts.navOpts, {del:true});
    }
    
})
.on('jqGridAfterInit', function(e, grOpts) {
    if (grOpts.gridEntity=='idInvoice')
        $(e.target).jqGrid('setColProp', 'lesson_amount', {hidedlg: false});
        
    switch (grOpts.gridEntity) {
        case 'idSportsmen':
        case 'idLead':
            $(e.target).jqGrid('setColProp', 'key', {editable: true});
    }
});

$(function(){
    $('#chCity').attr('data-run', '/chunk/user.city');
});
