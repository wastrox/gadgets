$(document).ready ->
  $("#gadget_gadget_id").select2(
    placeholder: "please select..."
    width: 200
  ).on "change", (e) ->
    show_loading()
    $("form#search").submit()

  $(".clear_search").click ->
    show_loading()

  $(".editable").editable mode: "inline"


  $(document).ajaxStart(->
    show_loading()
  ).ajaxStop ->
    hide_loading()

