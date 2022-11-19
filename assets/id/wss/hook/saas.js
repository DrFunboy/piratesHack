$(function(){
    var saas_lnk = $('<a class="nav-item nav-link" href="/options/sportcrm.html"><i class="fa fa-cloud"></i></a>')
    .prependTo('.header-nav');
    
    function setDebtIco(debt) {
        if (debt) saas_lnk.addClass('has-notified'); //closest('li')
    }
    var saasData = getObjectFromLocalStorage('saasData');
    var currTime = (new Date()).getTime();
    if (!saasData.dueDate || saasData.dueDate < currTime) {
        pJSON('https://w.sportcrm.club/hook/scrmh/lk', {key: '[[++club_key]]'}, function(data){
            data = (data || {}).lk || {};
            var debt = (data.saldo||0)*1 < 0;
            saveObjectInLocalStorage('saasData', {
                debt: debt,
                dueDate: currTime + 24*60*60*1000
            });
            setDebtIco(debt);
        });
    } else {
        setDebtIco(saasData.debt);
    }
});