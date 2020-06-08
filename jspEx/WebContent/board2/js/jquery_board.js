$(function(){
	$('#reply').click(function(){
		document.parentForm.action='write.do';
		document.parentForm.submit();
	});
	
	$('#list1').click(function(){
		document.parentForm.action='list.do';
		document.parentForm.submit();
	});
})