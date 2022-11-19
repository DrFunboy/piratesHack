var bg = $('button.hamburger');
var spin = $('<span class="spinner-border" style="display:none"></span>').insertBefore(bg);
var pStart = { x: 0, y: 0 };
var pStop = { x: 0, y: 0 };

function swipeCheck() {
  var dY = pStart.y - pStop.y;
  var dX = pStart.x - pStop.x;
  if (isPullDown(dY, dX)) window.location=window.location;
}

function isPullDown(dY, dX) {
  // methods of checking slope, length, direction of line created by swipe action
  return (
    dY < 0 &&
    ((Math.abs(dX) <= 100 && Math.abs(dY) >= 170) ||
      (Math.abs(dX) / Math.abs(dY) <= 0.3 && dY >= 60))
  );
}

document.addEventListener(
  "touchstart",
  function (e) {
    if (typeof e["targetTouches"] !== "undefined") {
        var touch = e.targetTouches[0];
        pStart.x = touch.screenX;
        pStart.y = touch.screenY;
    } else {
        pStart.x = e.screenX;
        pStart.y = e.screenY;
    }
  },
  false
);
document.addEventListener(
  "touchmove",
  function (e) {
    const screenY = e.targetTouches ? e.targetTouches[0].screenY : e.screenY;
    const screenX = e.targetTouches ? e.targetTouches[0].screenX : e.screenX;
    var dY = pStart.y - screenY;
    var dX = pStart.x - screenX;
    var ipd = isPullDown(dY, dX);
    spin.toggle(ipd);
    bg.toggle(!ipd);
  },
  false
);
document.addEventListener(
  "touchend",
  function (e) {
    if (typeof e["changedTouches"] !== "undefined") {
        var touch = e.changedTouches[0];
        pStop.x = touch.screenX;
        pStop.y = touch.screenY;
    } else {
        pStop.x = e.screenX;
        pStop.y = e.screenY;
    }
    swipeCheck();
  },
  false
);