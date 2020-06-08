<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag3-date</title>
</head>
<body>
	<p>오늘 날씨 및 시각</p>
	<p><%=new java.util.Date().toLocaleString() %></p>
</body>
</html>