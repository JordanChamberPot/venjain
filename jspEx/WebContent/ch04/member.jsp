<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member 저장</title>
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
	<form action="memberPro.jsp" method="post" name="memFrom">
		<h3>회원가입</h3>
		<table>
			<tbody>
				<tr>
					<th align="center">이름:</th>
					<td align="left">
					<input type="text" name="name" size="20">
					</td>
				</tr>
				<tr>
					<th align="center">아이디:</th>
					<td align="left">
					<input type="text" name="id" size="20">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="가입">
			</tbody>
		</table>
	</form>
</body>
</html>