$.fn.extend({
    center_me: function() {
      var obj = $(this)
      obj.css({
        'left' :  $(window).width() / 2 - (obj.width() / 2),
        'top' : $(window).height() / 2 - (obj.height() / 2)// + $(window).scrollTop()
      });
    }
 });

function show_loading() {
  $("#loading").center_me();
  $("#overlay").css({"opacity": "0.8"}).fadeIn();
}

function hide_loading() {
  $("#overlay").fadeOut()
}

$( document ).ajaxStart(function() { show_loading() }).ajaxStop(function () { hide_loading() });