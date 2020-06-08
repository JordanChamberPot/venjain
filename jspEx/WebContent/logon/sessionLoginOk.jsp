<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="logon.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로긴 성공여부</title>
</head>
<body>
<jsp:useBean id ="dto" class="logon.LogonDTO" />
<jsp:setProperty property="*" name="dto"/>
<%
	LogonDAO dao = LogonDAO.getInstance();
	System.out.println(dto.getId());
	System.out.println(dto.getPasswd());
int c = dao.userCheck(dto.getId(), dto.getPasswd());
	//회원이면 회원페이지로
	System.out.println(c);
	
	if(c==1){
		//세션처리
		session.setAttribute("memId", dto.getId());
		response.sendRedirect("sessionLogonConfirm.jsp");
	}else{
		out.println("아이디가 또는 패스워드가 틀립니다.");
	}
	//아니면 오류메세지 출력

%>
</body>
</html>