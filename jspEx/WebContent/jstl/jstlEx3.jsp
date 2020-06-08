<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"
	uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"
	uri="http://java.sun.com/jstl/fmt" %>
<!DOCTYPE html>
<%-- <fmt:requestEncoding value="utf-8" /> --%>
<% request.setCharacterEncoding("UTF-8"); %>
<fmt:bundle basename="bundle.testBundle_ko"/>
<html>
<head>
<meta charset="UTF-8">
<title>jstl로 메시지 출력</title>
</head>
<body>
	<fmt:message key="name" />
	<p>
	<fmt:message key="message" var="msg" />
	<c:out value="${msg}" />
</body>
</html>