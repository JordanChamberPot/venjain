<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.*,java.util.*"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="/jspEx/board2/js/jquery_board.js"></script>
<script type="text/javascript" src="/jspEx/board2/js/boardScript.js"></script>
<link href="/jspEx/board2/css/board.css" rel="stylesheet" />
</head>
<body>
	<table border=1	>
		<thead class="class01">
			<tr>
				<th>제목: </th>
				<td><c:out value="${dto.subject}" /></td>
			</tr>
			</thead>
		<tbody class="class02">
			
			<tr>
				<th>내용: </th>
				<td><textarea cols="50" rows="20" readonly="readonly">
					<c:out value="${dto.content}" />
				</textarea></td>

			</tr>
			<tr>
				<th>첨부파일: </th>
				<td><c:out value="${dto.attachNm}" />
				</td>
			</tr>
			<tr>
				<th>작성자: </th>
				<td><a href='mailto:<c:out value="${dto.email}"/>'>
					<c:out value="${dto.writer}" /></a></td>
			</tr>
			<tr align="center">
				<td colspan=2>
				<input type="button" value="글수정" onclick="pwCheck('u');" />
				<input type="button" value="글삭제" onclick="pwCheck('d');" />
				<input type="button" value="답글" id="reply" />
				<input type="button" value="목록으로" id="list1" /></td>
			</tr>
		</tbody>
		</table>//변경!
	<form action="" name="parentForm" method="post">
		<input type= "hidden" name="cpass" value="" />
		<input type= "hidden" name="passwd" value="${dto.passwd}" />
		<input type= "hidden" name="num" value="${dto.num}" />
		<input type= "hidden" name="ref" value="${dto.ref}" />
		<input type= "hidden" name="re_step" value="${dto.re_step}" />
		<input type= "hidden" name="re_level" value="${dto.re_level}" />
		<input type="hidden" name="currentPage" value='<c:out value="${pdto.currentPage}"/>'/>
		<input type="hidden" name="currentPageBlock" value='<c:out value="${pdto.currentPageBlock}"/>' />
	</form>
</body>
</html>