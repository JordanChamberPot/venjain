<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 페이지 연습</title>
</head>
<body>
	<h3>[경고]오류 발생!</h3>
	<h3>오류유형: <%=exception.getClass().getName() %></h3>
	<h3>오류메세지: <%=exception.getMessage() %></h3>
</body>
</html>