<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core예제-if,choose,when,otherwise</title>
</head>
<body>
	<c:set var="country" value="${'Korea' }" />
	<c:if test="${country != null}">
		국가명: <c:out value="${country}" />
	</c:if>
	<p>
	<c:choose>
		<c:when test="${country='Korea'}">
			<c:out value="${country}"/>의 겨울은 춥습니다..
		</c:when>
		<c:when test="${country='Canada'}">
			<c:out value="${country}"/>의 겨울은 넘넘 춥당..
		</c:when>
		<c:otherwise>
			그 외는 다 죽었음.
		</c:otherwise>
	</c:choose>
	
	
	
	
</body>
</html>