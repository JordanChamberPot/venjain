<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="./js/boardScript.js"></script>
</head>
<body>
<form action="idCheck.jsp" method="post">
	<table>
		<tr>
			<td>비밀번호 입력: </td>
			<td><input type="password" id="pwCheck" /></td>
		</tr>
		<tr>
			<td colspan=>
				<input type="button" value="확인" onclick="setParentText()"/>
			</td>
			<td colspan=>
				<input type="button" value="닫기" onclick="window.close()"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>