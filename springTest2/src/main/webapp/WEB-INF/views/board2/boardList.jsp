<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kr.or.sol.board.dto.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="/resources/board/css/board.css" rel="stylesheet" />
<script type="text/javascript" src="/resources/board/js/jquery_board.js"></script>
<script type="text/javascript" src="/resources/board/js/boardScript.js"></script>
<script type="text/javascript"> 
function callContent(num){
	//alert(num)
	document.content.num.value=num;
	document.content.submit();
}
</script>
</head>
<body>
<!-- 해당 리스트를 출력 jstl 사용 -->
<h3 style="text-align: center;">게시글 목록</h3>
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
				<th style="text-align: right;">
					전체 글 개수:&nbsp;<c:out value="${pdto.allCount}"/>&nbsp;건</th>
			</tr>
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
					<a href="#" onclick="javascript:callContent('<c:out value="${dto.num}"/>')">
					<c:out value="${dto.subject}" /></a>
					</td>
				</c:if>
				<c:if test="${dto.re_level > 1}">
				<td align="left">
					<img src="/resources/board/images/level.gif" width="${dto.re_level*5}"/>
					<img src="/resources/board/images/re.gif" />
					<a href="#" onclick="javascript:callContent('<c:out value="${dto.num}"/>')">
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
				<td colspan="5" align="right"><a href="writeForm.sp">
				<input type="button" value="글쓰기">
				</a></td>
			</tr>
		</tbody>
	</table>
	<h4 style="text-align: center">
		<c:if test="${pdto.startPage>pdto.pageBlock}">
			<a href="/jspEx/list.do?currentPage=${pdto.startPage-pdto.pageBlock}
						&currentPageBlock=${pdto.currentPageBlock-1}"
							 style="text-decoration:none;">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${pdto.startPage}" end="${pdto.endPage}">
			<a href="/jspEx/list.do?currentPage=${i}&currentPageBlock=${pdto.currentPageBlock}" 
				style="text-decoration:none;">
				<c:out value="[${i}]"/>&nbsp;
			</a>
		</c:forEach>
		<c:if test="${pdto.allPage>pdto.endPage}">
			<a href="/jspEx/list.do?currentPage=${pdto.endPage+1}
						&currentPageBlock=${pdto.currentPageBlock+1}"
							 style="text-decoration:none;">[다음]</a>
		</c:if>
	</h4>
  </c:when>
</c:choose>
   <!-- <form action="board">
      <input type="hidden" name="currentPage" />
      <input type="hidden" name="currentBlock" />
   </form> -->

<form action="content.sp" name="content" method="post">
	<input type="hidden" name="currentPage" value='<c:out value="${pdto.currentPage}"/>'/>
	<input type="hidden" name="currentPageBlock" value='<c:out value="${pdto.currentPageBlock}"/>' />
	<input type="hidden" name="num" value=''/> 
</form>

</body>
</html>