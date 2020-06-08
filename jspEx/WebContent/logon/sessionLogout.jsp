<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원인증</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#logout').click(function(){
		
		$('#form1').submit();
	});
})
</script>
</head>
<body>
	<%
	session.invalidate();
	%>
	<script type="text/javascript">
	alert("로그아웃")
	location.href="sessionLogonConfirm.jsp";
	</script>
</body>
<!-- 회원이 맞으므로 세션(연결) 부여 -->
	<form action="sessionLogout.jsp" id="form1">
		<table>
			<tbody>
				<tr>
					<th colspan="2">
						<div id="logout" id ="logout">로그아웃</div>
					</th>
				</tr>
			</tbody>
		</table>
	</form>
</html>