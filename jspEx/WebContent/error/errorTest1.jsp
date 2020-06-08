<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러발생 시 에러 페이지 연습</title>
</head>
<body>
<!-- 그런데 한글이 전송되는 중 한글 깨짐을 방지하는 setting
	get방식: URIEncoding="utf-8", post방식
 -->
 <% request.getAttribute("test").toString(); %>
</body>
</html>