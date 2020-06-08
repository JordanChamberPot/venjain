<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
	<h2>Scripting Tag</h2>
	<%! int count = 3;
		String makeItLower(String data){
			return data.toLowerCase();
		}
	%>
	
	<% for(int i=1;i<=count;i++){
		out.println("Java Server Pasge"+i+".<br>");
	}
	%>
	
	<%=makeItLower("Hello Java") %>
	
	<h2>주석연습하기</h2>
	<%-- 이곳은 JSP의 주석을 쓰는 곳입니다. --%>
	
	
	
</body>
</html>