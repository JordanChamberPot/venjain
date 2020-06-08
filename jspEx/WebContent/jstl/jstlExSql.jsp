<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql"
	uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sql:query var="rs" dataSource="jdbc/soldesk">
		select * from person
	</sql:query>
	<h3>person 출력</h3>
	<table border=1>
		<thead>
		<tr>
			<c:forEach var="colname" items="${rs.columnNames}">
			<th><c:out value="${colname}" /> </th>
			</c:forEach>
		</tr>
		</thead>
		<tbody>
			<c:forEach var="row" items="${rs.rowsByIndex}"><!-- 레코드 출력 -->
			<tr>
				<c:forEach var="col" items="${row}" varStatus="i"><!-- 필드 출력 -->
					<td>
						<c:if test="${col != null}">
							<c:out value="${col}"/>
						</c:if>
						<c:if test="${col == null}">
							<c:out value=""/>
						</c:if>
					</td>
				</c:forEach>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>