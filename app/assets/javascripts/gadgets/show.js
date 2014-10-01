$(document).ready(function() { 

  $('#photo').fileupload({
    dataType: 'json',
    done: function(e, data){
      file = data.result
      console.log(
        data.textStatus,
        file.id,
        file.thumb,
        file.photo_file_size);
     },

    fail: function(e, data){
      alert('Upload failed')  
    }
  })
});

$(document).ajaxStop(function () {
  location.reload(); // reload page when all Ajax requests are over to update gadget images list
});

$('.editable').editable({mode: "inline"})
$('.pop').popover({
  trigger: 'hover',
  container: 'body',
  html: true
});
