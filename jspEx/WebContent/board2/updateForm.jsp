<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="board.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="/jspEx/board2/css/board.css" rel="stylesheet" />
<script type="text/javascript" src="/jspEx/board2/js/jquery_board.js"></script>
<script type="text/javascript" src="/jspEx/board2/js/boardScript.js"></script>
</head>
<body>
<form action="updatePro.do" method="post" name="updateForm" onsubmit="return sendData()">
	<input type="hidden" name="currentPage" value='<c:out value="${pdto.currentPage}"/>'/>
	<input type="hidden" name="currentPageBlock" value='<c:out value="${pdto.currentPageBlock}"/>' />
	<table border=1	>
			<thead class="class01">
				<tr>
					<th colspan=2 > <h3>글수정</h3> 
					</th>
				</tr>
			</thead>
		<tbody class="class02">
			<tr>
				<th>제목: </th>
				<td><input type="text" size="95%" 
					placeholder="제목을 입력하세요" name="subject"
						 value='<c:out value="${dto.subject}" />'/></td>
			</tr>
			<tr>
				<th>내용: </th>
				<td><textarea cols="100" rows="20" placeholder="내용을 입력하세요" 
				name="content"><c:out value="${dto.content}" />
				</textarea></td>

			</tr>
			<tr>
				<th>첨부파일: </th>
				<td><input type="file" name="filename"
					value='<c:out value="${dto.attachNm}" />'/>
				</td>
			</tr>
			<tr>
				<th>작성자: </th>
				<td><c:out value="${dto.writer}" /></td>
			</tr>
			<tr>
				<th>Email: </th>
				<td><c:out value="${dto.email}"/></td>
			</tr>
			<tr>
				<th>비밀번호: </th>
				<td><input type="password" placeholder="비밀번호를 입력하세요" 
					name="passwd" value='<c:out value="${dto.passwd}"/>'/>
					<input type="hidden" name="num" value='<c:out value="${dto.num}"/>'/>
					</td>
			</tr>
			<tr align="center">
				<td colspan=2>
				<input type="submit" value="글수정" />
				<input type="button" value="글목록으로" id="list3" /></td>
			</tr>
		</tbody>
		</table>
</form>
</body>
</html>