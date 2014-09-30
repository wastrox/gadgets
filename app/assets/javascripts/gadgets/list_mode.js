$('.pop').popover({
  trigger: 'hover',
  container: 'body',
  html: true,
});


$(document).ready(function(){
  $('.editable').editable({mode: "inline"})
})