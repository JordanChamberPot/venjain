<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, common.dbutil.*, javax.naming.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn = null;
	try {
		conn = DBConnection.getConnection();
		PreparedStatement pstmt = conn.prepareStatement("select sysdate from dual");
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			out.println(rs.getString(1));
		}
	} catch (NamingException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
%>
</body>
</html>