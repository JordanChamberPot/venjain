<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.*,java.util.*"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="css/board.css" rel="stylesheet" />
</head>
<body>
<!-- 글목록 출력 -->
<% 
	//게시글 리스트 갖고와서 저장 DAO
	BoardDAO dao = BoardDAO.getInstance();
	int sRow= 1;
	int pageSize = 20;
 	List<BoardDTO> list = dao.getArticles(sRow, pageSize);
 	request.setAttribute("list", list);
%>
<!-- 해당 리스트를 출력 jstl 사용 -->
<h3 id="head">게시글 목록</h3>
<c:choose>
  <c:when test="${list.size() == 0}">
	<table border="1">
		<tbody>
			<tr>
				<th><h4>게시글이 없습니다.</h4></th>
			</tr>
		</tbody>
	</table>
  </c:when>
  <c:when test="${list.size() != 0}">
	<table border="1">
		<thead class="class01">
			<tr>
				<th>글번호</th>
				<th>글제목</th>
				<th>작성자</th>
				<th>작성일자</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody class="class02">
 			<!-- 해당리스트를 출력 jstl 사용 -->
			<c:forEach var="dto" items="${list}">
			<tr>
				<td><c:out value="${dto.rr}" />
					<input type="hidden" value='<c:out value="${dto.num}" />' />
				</td>
				<c:if test="${dto.re_level == 1}">
				<td align="left">
					<a href='content.jsp?num=<c:out value="${dto.num}"/>'>
					<c:out value="${dto.subject}" /></a>
					</td>
				</c:if>
				<c:if test="${dto.re_level > 1}">
				<td align="left">
					<img src="./images/level.gif" width="${dto.re_level*5}"/>
					<img src="./images/re.gif" />
					<a href='content.jsp?num=<c:out value="${dto.num}"/>'>
					<c:out value="${dto.subject}" /></a>
					</td>
				</c:if>
				<td>
					<a href='mailto:<c:out value="${dto.email}"/>'>
					<c:out value="${dto.writer}" /></a>
				</td>		
				<td><c:out value="${dto.reg_date}" /></td>
				<td><c:out value="${dto.readcnt}" /></td>
			</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="right"><a href="writeForm.jsp">
				<input type="button" value="글쓰기">
				</a></td>
			</tr>
		</tbody>
	</table>
			
  </c:when>
</c:choose>

	
<%-- <c:forEach var="dto" items="${list}"> --%>
<%-- 	<c:out value="${dto.writer}" /> --%>
<%-- </c:forEach> --%>
</body>
</html>