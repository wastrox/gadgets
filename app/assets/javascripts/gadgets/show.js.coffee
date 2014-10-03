init_popover = ->
  $(".pop").popover "destroy"
  $(".pop").popover
    placement: "auto"
    trigger: "hover"
    container: "body"
    html: true

$(document).ready ->
  $("li.working input").knob()
  $uploadList = undefined
  formatFileSize = undefined
  $uploadList = $("#upload .upload-list")
  $("#dropzone .browse").click ->
    $("#photo").click()

  $("#photo").fileupload
    dataType: "json"
    dropZone: $("#dropzone")
    add: (e, data) ->
      jqXHR = undefined
      tpl = undefined
      tpl = $("<li class=\"working effect8\"><table><tr><td width=\"80\"><input type=\"text\" value=\"0\" data-width=\"48\" data-height=\"48\"" + " data-fgColor=\"#0788a5\" data-displayInput=\"true\" data-thickness=\".35\" data-readOnly=\"1\" data-bgColor=\"#3e4043\" /></td><td><p></p></td><td width=\"50\"><span></span></td</li>")
      tpl.find("p").text(data.files[0].name).append "<i>" + formatFileSize(data.files[0].size) + "</i>"
      data.context = tpl.appendTo($uploadList)
      tpl.find("input").knob()
      tpl.find("span").click ->
        jqXHR.abort()  if tpl.hasClass("working")
        tpl.fadeOut ->
          tpl.remove()


      jqXHR = data.submit()

    progress: (e, data) ->
      progress = undefined
      progress = parseInt(data.loaded / data.total * 100, 10)
      data.context.find("input").val(progress).change()
      if progress is 100
        data.context.find("span").addClass "complete glyphicon glyphicon-ok icon-success"
        data.context.fadeOut 1200
        data.context.removeClass "working"

    done: (e, data) ->

    fail: (e, data) ->
      data.context.addClass "error"

  formatFileSize = (bytes) ->
    return ""  if typeof bytes isnt "number"
    return (bytes / 1000000000).toFixed(2) + " GB"  if bytes >= 1000000000
    return (bytes / 1000000).toFixed(2) + " MB"  if bytes >= 1000000
    (bytes / 1000).toFixed(2) + " KB"

  $(document).on "drop dragover", (e) ->
    e.preventDefault()


$(document).ajaxStop ->
  location.reload() # reload page when all Ajax requests are over to update gadget images list

$(".editable").editable mode: "inline"
init_popover()
