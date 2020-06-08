<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/jspEx/board2/js/boardScript.js"></script>
</head>
<body>
<form action="delCheck.jsp" method="post">
	<table>
		<tr>
			<td>정말로 삭제하시겠습니까?</td>
		</tr>
		<tr>
			<td colspan=>
				<input type="button" value="확인" onclick="deleteTable()"/>
			</td>
			<td colspan=>
				<input type="button" value="취소" onclick="window.close()"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>