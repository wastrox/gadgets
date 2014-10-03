$(document).ready(function() { 
	$('#gadget_gadget_id').select2({
		placeholder: "please select...",
		width: 200
	}).on("change", function(e) {
		show_loading();
		$('form#search').submit();
	});
	$('.clear_search').click(function(){
		show_loading();
	});
	$('.editable').editable({mode: "inline"})
});
$( document ).ajaxStart(function() { show_loading() }).ajaxStop(function () { hide_loading() });