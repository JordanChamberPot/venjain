$(function(){
	$('#reply').click(function(){
		document.parentForm.action='writeForm.jsp';
		document.parentForm.submit();
	});
	
	$('#list1').click(function(){
		javascript:location.href='boardList.jsp';
	});
})