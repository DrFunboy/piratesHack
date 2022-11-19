
window.onload = function() {
    var frame_h = 0;
    function resizeIframe(){
        //var height = document.getElementsByTagName("body")[0].scrollHeight;
        var d = document.getElementById('scrmIresize');
        //var d = $('#checkResize');
        if (d === null) {
            //d = $('<div id="checkResize"></div>').appendTo('body');
            d = document.createElement('div');
            d.id = 'scrmIresize';
            document.body.appendChild(d);
        }
        //var height = d.offset().top + 2;
        var height = d.offsetTop + 2;
        if (d.nextElementSibling !== null) {
            //console.log('NotLast');
            d.remove(); // if !last
        }
        if (frame_h!=height) {
            frame_h=height;
            var out = window.parent.postMessage({
                i_h: frame_h,
                scrm_iname: window.name
            }, "*");
        }
        setTimeout(resizeIframe, 490);
    }
    resizeIframe();
};
