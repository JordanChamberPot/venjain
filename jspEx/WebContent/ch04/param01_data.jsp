<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag Practice</title>
</head>
<body>
	<p>아이디: <%=request.getParameter("id") %></p>
	<% String n = request.getParameter("name");
	System.out.println(n);%>
	<p>이름: <%=URLDecoder.decode(n) %></p>
	
</body>
</html>