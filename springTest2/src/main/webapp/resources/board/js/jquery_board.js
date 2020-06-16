$(function(){
	$('#reply').click(function(){
		document.parentForm.action='writeForm.sp';
		document.parentForm.submit();
	});
	
	$('#list1').click(function(){
		document.parentForm.action='boardList.sp';
		document.parentForm.submit();
	});
	
	$('#list2').click(function(){
//		document.writeForm.action='list.do';
//		document.writeForm.submit();
		javascript:location.href='boardList.sp';
	});
	
	$('#list3').click(function(){
		document.updateForm.action='boardList.sp';
		document.updateForm.submit();
	});
})