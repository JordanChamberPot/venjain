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
	  javascript:location.href='boardList.sp';
	  });
  
  $('#list3').click(function(){
	  document.updateForm.action='boardList.sp';
	  document.updateForm.submit();	
	  });
  
	var wformObj = $("form[name='join']");
	
   $('#submit1').click(function(){
		if(fn_valiChk()){
			return false;
		}
		 wformObj.attr("action", "joinPro.sd");
		 wformObj.attr("method", "post");
		 wformObj.submit();
	});

  
  
      $('#passwd').keyup(function(){
	     $('font[name=check]').text('');
	     if($('#passwd').val()!=$('#passwd2').val()){
	         $('font[name=check]').text('');
	         $('font[name=check]').text("비밀번호 다름");
	        }else{
	         $('font[name=check]').text('');
	         $('font[name=check]').text("비밀번호 같음");
	        }
	    });
	    $('#passwd2').keyup(function(){
	     if($('#passwd').val()!=$('#passwd2').val()){
	      $('font[name=check]').text('');
	      $('font[name=check]').text("비밀번호 다름");
	     }else{
	      $('font[name=check]').text('');
	      $('font[name=check]').attr('color','blue');
	      $('font[name=check]').text("비밀번호 같음");
	     }
	    }); 
})
  
  
  function fn_valiChk(){
		var regForm = $("form[name='join'] .form-group .form-control").length;
		for(var i = 0; i<regForm; i++){
			if($(".form-group .form-control").eq(i).val() == "" || $(".form-group .form-control").eq(i).val() == null){
				alert($(".form-group .form-control").eq(i).attr("title")+"은/는 필수입력입니다.");
				$(".form-group .form-control").eq(i).focus();
				return true;
			}
		}
	}
