SCRM.loadWSS('ready', function(){
    function startTechat(status) {
        if (!status) return false;
        if (!window.TalkMeSetup) {
            window.TalkMeSetup = {
                domain: 'start123.ru',
                clientId: window.location.host+SCRM.app.user.id
            };
            (function(d, w, m) {
        		window.supportAPIMethod = m;
        		var s = d.createElement('script');
        		s.type ='text/javascript'; s.id = 'supportScript'; s.charset = 'utf-8';
        		s.async = true;
        		var id = '9cea91cbffe8294278bcf65decbf00b6';
        		s.src = 'https://lcab.talk-me.ru/support/support.js?h='+id;
        		var sc = d.getElementsByTagName('script')[0];
        		w[m] = w[m] || function() { (w[m].q = w[m].q || []).push(arguments); };
        		if (sc) sc.parentNode.insertBefore(s, sc); 
        		else d.documentElement.firstChild.appendChild(s);
        	})(document, window, 'TalkMe');
        	TalkMe("setClientInfo", {
                name: SCRM.app.user.fullname,
                email: SCRM.app.user.email,
                phone: SCRM.app.user.mobilephone,
                custom: {
                    url: window.location.href
                }
            });
            
        	TalkMe("setCallback", "closeSupport", function(data){
                saveObjectInLocalStorage('Techat', {status: 'hidden'});
            });
            TalkMe("setCallback", "openSupport", function(data){
                saveObjectInLocalStorage('Techat', {status: 'shown'});
            });
        	SCRM.closeTechat = function(){
        	    $('.online-chat-root-TalkMe').remove();
        	    removeObjectFromLocalStorage('Techat');
        	    SCRM._service.Techat = function() {
        	        saveObjectInLocalStorage('Techat', {status: 'shown'});
                    SCRM.alert('Перезарузите страницу для отображения чата', null, {
                        onclick: function() {
                            window.location = window.location;
                        }
                    });
                };
        	};
        }
    	if (status=='shown') TalkMe('openSupport');
    }
    var Techat = getObjectFromLocalStorage('Techat');
    startTechat(Techat.status);
    SCRM._service.Techat = function() {
        startTechat('shown');
    };
});
