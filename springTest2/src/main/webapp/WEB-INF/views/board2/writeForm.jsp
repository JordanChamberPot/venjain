<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.or.sol.board.dto.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="/resources/board/css/board.css" rel="stylesheet" />
<script type="text/javascript" src="/resources/board/js/jquery_board.js"></script>
<script type="text/javascript" src="/resources/board/js/boardScript.js"></script>
</head>
<body>
	<form action="writePro.sp" method="post" name="writeForm" onsubmit="return sendData();"> 
		<!-- onsubmit="return sendData()" enctype="multipart/form-data"> -->
		<input type= "hidden" name="num" value="${bdto.num}" />
		<input type= "hidden" name="ref" value="${bdto.ref}" />
		<input type= "hidden" name="re_step" value="${bdto.re_step}" />
		<input type= "hidden" name="re_level" value="${bdto.re_level}" />
		<input type="hidden" name="currentPage" value='<c:out value="${pdto.currentPage}"/>'/>
		<input type="hidden" name="currentPageBlock" value='<c:out value="${pdto.currentPageBlock}"/>' />
		<table border=1	>
			<thead class="class01">
				<tr>
					<th colspan=2 > <h3>글쓰기</h3> 
					</th>
				</tr>
			</thead>
		<tbody class="class02">
			<tr>
				<th>제목: </th>
				<c:if test="${bdto.num==0}">
				<td><input type="text" size="90%" placeholder="제목을 입력하세요" name="subject"/></td>
				</c:if>
			
				<c:if test="${bdto.num!=0}">
				<td><input type="text" size="90%" placeholder="제목을 입력하세요" value="[답글]" name="subject"/></td>
				</c:if>
			</tr>
			<tr>
				<th>내용: </th>
				<td><textarea cols="100" rows="20" placeholder="내용을 입력하세요" 
				name="content"/></textarea></td>

			</tr>
			<tr>
				<th>첨부파일: </th>
				<td><input type="file" name="attachNm" value='<c:out value="${bdto.attachNm}" />'  />
				</td>
			</tr>
			<tr>
				<th>작성자: </th>
				<td><input type="text" placeholder="작성자를 입력하세요" name="writer"/></td>
			</tr>
			<tr>
				<th>Email: </th>
				<td><input type="text" placeholder="메일주소를 입력하세요" name="email"/></td>
			</tr>
			<tr>
				<th>비밀번호: </th>
				<td><input type="password" placeholder="비밀번호를 입력하세요" name="passwd"/></td>
			</tr>
			<tr align="center">
				<td colspan=2><input type="submit" name="submit" value="등록" />
				<input type="button" value="목록으로" name="listbtn" id="list2" />
			</tr>
		</tbody>
		</table>
	</form>
</body>
</html>