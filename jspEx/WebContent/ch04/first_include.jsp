<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<h3>이 파일은 first_include.jsp 입니다.</h3>
	<jsp:include page="second._include.jsp">
	<jsp:param name = "date"
		value ="<%=new java.util.Date() %>" />
	</jsp:include>
	<p>============first_include.jsp의 페이지</p>
</body>
</html>