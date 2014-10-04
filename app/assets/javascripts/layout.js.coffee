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

window.init_popover = ->
  $(".pop").popover
    trigger: "hover"
    container: "div.container"
    placement: "auto"
    html: true

window.init_editable = ->
  $(".editable").editable
    mode: "inline"
    success: (response, newValue) ->
      if response.status is 'error' 
        response.msg

window.init_magnific = ->
  $('.flow').magnificPopup
    delegate: 'div.active canvas'
    type: 'image'
    closeOnContentClick: true
    fixedContentPos: false
    preload: true
    tLoading: ''

  $('.magnific').magnificPopup
    type: 'image'
    fixedContentPos: false
    closeOnContentClick: true
    preload: true
    tLoading: ''


