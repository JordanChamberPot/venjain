<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, common.dbutil.*, javax.naming.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, td {
	border: 1px solid
}

table {
	width: 50%;
	height: 100px;
	margin: auto;
	text-align: center;
}

h3 {
	text-align: center;
}
</style>
</head>
<body>
<jsp:useBean id="person" class="jspEx.ch04.person" scope="request" />
<jsp:setProperty property="*" name="person" />
<h3>회원가입</h3>
		<table>
			<tbody>
				<tr>
					<th align="center">이름:</th>
					<td align="left"><jsp:getProperty property="id" name="person"/>
					</td>
				</tr>
				<tr>
					<th align="center">아이디:</th>
					<td align="left">
					<td align="left"><jsp:getProperty property="name" name="person"/>
					</td>
				</tr>
			</tbody>
		</table>
</body>
</html>
<%
	Connection conn = null;
	try	{
		conn = DBConnection.getConnection();
		if(conn != null) out.println("DB연결성공");
// 		System.out.println(person.getId());
		String sql = "insert into person(id, name) values(?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, person.getId());
		pstmt.setString(2, person.getName());
		int r = pstmt.executeUpdate();
		out.println(r);
	}catch(SQLException e) {
		out.println("DB연결실패<br>");
		out.println(e.getMessage());
	}
%>