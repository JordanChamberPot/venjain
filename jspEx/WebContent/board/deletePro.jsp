<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 처리</title>
</head>
<body>
	<%
	//DAO에 대한 인스턴스 받아오기
	int num =Integer.parseInt(request.getParameter("num"));
	BoardDAO dao = BoardDAO.getInstance();
	int r = dao.deleteArticle(num);
	//다음 페이지로 이동시킴
	if(r>0)
		response.sendRedirect("boardList.jsp");
	else
		out.println("삭제 못함!");
	%>

</body>
</html>