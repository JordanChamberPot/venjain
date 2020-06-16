<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="kr.or.sol.board.dto.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="/resources/board/css/board.css" rel="stylesheet" />
<script type="text/javascript" src="/resources/board/js/jquery_board.js"></script>
<script type="text/javascript" src="/resources/board/js/boardScript.js"></script>
</head>
<body>
<form action="updatePro.sp" method="post" name="updateForm" onsubmit="return sendData();">
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
				<td><input type="text" size="95%" placeholder="제목을 입력하세요" name="subject" value='<c:out value="${bdto.subject}" />'/></td>
			</tr>
			<tr>
				<th>내용: </th>
				<td><textarea cols="100" rows="20" placeholder="내용을 입력하세요" name="content"><c:out value="${bdto.content}" />
				</textarea></td>

			</tr>
			<tr>
				<th>첨부파일: </th>
				<td><input type="file" name="attachNm" value='<c:out value="${bdto.attachNm}" />'/>
				</td>
			</tr>
			<tr>
				<th>작성자: </th>
				<td><input type="text" name="writer" value='<c:out value="${bdto.writer}" />'/></td>
			</tr>
			<tr>
				<th>Email: </th>
				<td><input type="text" name="email" value='<c:out value="${bdto.email}"/>'/></td>
			</tr>
			<tr>
				<th>비밀번호: </th>
				<td><input type="password" placeholder="비밀번호를 입력하세요" name="passwd" value='<c:out value="${bdto.passwd}"/>'/>
					<input type="hidden" name="num" value='<c:out value="${bdto.num}"/>'/>
					</td>
			</tr>
			<tr align="center">
				<td colspan=2>
				<input type="submit" name="submit" value="글수정" />
				<input type="button" name="listbtn" value="글목록으로" id="list2" /></td>
			</tr>
		</tbody>
		</table>
</form>
</body>
</html>