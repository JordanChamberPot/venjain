<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean 사용</title>
</head>
<body>
	<jsp:useBean id="date" class="java.util.Date" />
	<p>오늘 날짜와 시각</p>
	<p><%=date %></p>
</body>
</html>