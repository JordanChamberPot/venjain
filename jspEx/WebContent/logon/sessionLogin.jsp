<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션을 이용한 로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#submit').click(function(){
		if($('#id').val()== null || $('#id').val()==''){
			alert("아이디를 입력하시오.");
			$('#id').focus();
			return;
		};
		if($('#passwd').val()== null || $('#passwd').val()==''){
			alert("패스워드를 입력하시오.");
			$('#passwd').focus();
			return;
		};
		$('#logonForm').submit();
	});
})
</script>
<style type="text/css">
  table {
  margin: auto;
  text-align: center;
  }
</style>
</head>
<body>
	<form id="logonForm" method="post" action="sessionLoginOk.jsp">
	<table>
	  <tbody>
	  	<tr>
	  	  <th>아이디</th>
	  	  <td><input type="text" name="id" id="id" size=20 placeholder="아이디 입력" /></td>
	  	</tr>
	  	<tr>
	  	  <th>패스워드</th>
	  	  <td><input type="password" name="passwd" id="passwd" size=20 placeholder="패스워드 입력" /></td>
	  	</tr>
	  	<tr>
	  	  <th colspan=2>
	  	  	<div id="submit">로그인</div>
	  	    <!-- <input type="button" id="submit" value="로그인"/> -->
	  	  </th>
	  		
	  	</tr>
	  </tbody>
	</table>
	</form>
	

</body>
</html>