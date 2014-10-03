$(document).ready(function() { 
  $('li.working input').knob();

  var $uploadList, formatFileSize;
  $uploadList = $('#upload .upload-list');
  $('#dropzone .browse').click(function() {
    return $('#photo').click();
  });
  $('#photo').fileupload({
 //   sequentialUploads: true,
    dataType: 'json',
    dropZone: $('#dropzone'),
    add: function(e, data) {
      var jqXHR, tpl;
      tpl = $('<li class="working effect8"><table><tr><td width="80"><input type="text" value="0" data-width="48" data-height="48"' + ' data-fgColor="#0788a5" data-displayInput="true" data-thickness=".35" data-readOnly="1" data-bgColor="#3e4043" /></td><td><p></p></td><td width="50"><span></span></td</li>');
      tpl.find("p").text(data.files[0].name).append("<i>" + formatFileSize(data.files[0].size) + "</i>");
      data.context = tpl.appendTo($uploadList);
      tpl.find("input").knob();
      tpl.find("span").click(function() {
        if (tpl.hasClass("working")) {
          jqXHR.abort();
        }
        return tpl.fadeOut(function() {
          return tpl.remove();
        });
      });
      return jqXHR = data.submit();

    },
    progress: function(e, data) {
      var progress;
      progress = parseInt(data.loaded / data.total * 100, 10);
      data.context.find("input").val(progress).change();
      if (progress === 100) {
         data.context.find("span").addClass("complete glyphicon glyphicon-ok icon-success");
         data.context.fadeOut(1200);
         return data.context.removeClass("working");
      }
    },
    done: function(e, data){
      // file = data.result;

      // var photos = $('#gadgets_collection');
      // var photo = $('<a title="" href="'+file.full+'" data-trigger="focus" data-toggle="popover" class="btn btn-default pop" data-original-title="'+file.title+'"  data-content="<img alt=\'Iphone 4s 4\' src=\''+file.medium+'\' >" ><img src="'+file.thumb_path+'" alt="Iphone 4s 4"></a>');

      // photo.appendTo(photos);
      // init_popover();
    },
    fail: function(e, data) {
      return data.context.addClass("error");
    }
  });
  formatFileSize = function(bytes) {
    if (typeof bytes !== "number") {
      return "";
    }
    if (bytes >= 1000000000) {
      return (bytes / 1000000000).toFixed(2) + " GB";
    }
    if (bytes >= 1000000) {
      return (bytes / 1000000).toFixed(2) + " MB";
    }
    return (bytes / 1000).toFixed(2) + " KB";
  };
  return $(document).on("drop dragover", function(e) {
    return e.preventDefault();
  });

});

function init_popover(){
  $('.pop').popover("destroy");
  $('.pop').popover({
    placement: 'auto',
    trigger: 'hover',
    container: 'body',
    html: true
  });
}

$(document).ajaxStop(function () {
  location.reload(); // reload page when all Ajax requests are over to update gadget images list
});

$('.editable').editable({mode: "inline"});
init_popover();

