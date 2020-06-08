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
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="./js/boardScript.js"></script>
<script type="text/javascript" src="./js/jquery_board.js"></script>
<link href="css/board.css" rel="stylesheet" />
</head>
<body>
<%  //이전 페이지에서 보내준 데이터받기
	int num =Integer.parseInt(request.getParameter("num"));
	//실제 데이터 가져오기
	//DAO사용..인스턴스 얻어오기
	BoardDAO dao = BoardDAO.getInstance();
	BoardDTO dto = dao.getArticle(num);
	request.setAttribute("dto",dto);
	//해당 인스턴스에서 해당되는 메소드 실행
	//setAttribute를 해준다.

%>
	<table border=1	>
			<thead>
			<tr>
				<th colspan=2 > <h3 >글쓰기</h3> 
				</th>
			</tr>
			</thead>
		<tbody>
			<tr>
				<th>제목: </th>
				<td><c:out value="${dto.subject}" /></td>
			</tr>
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
				<input type="button" value="글삭제" onclick="pwCheck('d');" 
					onclick="javascript:location.href=
						'deletePro.jsp?num=<c:out value="${dto.num}"/>'"/>
				<input type="button" value="답글" id="reply" />
				<input type="button" value="목록으로" id="list1" /></td>
			</tr>
		</tbody>
		</table>
	<form action="" name="parentForm" method="post">
		<input type= "hidden" name="passwd" value="${dto.passwd}" />
		<input type= "hidden" name="num" value="${dto.num}" />
		<input type= "hidden" name="cpass" value="" />
		<input type= "hidden" name="ref" value="${dto.ref}" />
		<input type= "hidden" name="re_step" value="${dto.re_step}" />
		<input type= "hidden" name="re_level" value="${dto.re_level}" />
	</form>
</body>
</html>