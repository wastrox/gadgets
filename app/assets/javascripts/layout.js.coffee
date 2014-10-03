window.show_loading = ->
  $("#loading").center_me()
  $("#overlay").css(opacity: "0.8").fadeIn()
window.hide_loading = ->
  $("#overlay").fadeOut()

$.fn.extend center_me: ->
  obj = $(this)
  obj.css
    left: $(window).width() / 2 - (obj.width() / 2)
    top: $(window).height() / 2 - (obj.height() / 2)

window.setTimeout (->
  $(".alert-dismissible").fadeOut 1200
), 2000
