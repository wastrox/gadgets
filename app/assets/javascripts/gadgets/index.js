$(document).ready(function() { 
	$('#gadget_gadget_id').select2({
		placeholder: "please select...",
		width: 200
	}).on("change", function(e) {
		$('form#search').submit();
	});
	$('#search_button').click(function(){
		$('form#search').submit();
	});
	$('.editable').editable({mode: "inline"})
});
