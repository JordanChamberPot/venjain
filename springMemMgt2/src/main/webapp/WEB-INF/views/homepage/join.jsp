<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.SoolDdok.DTO.*,java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<title>JOIN</title>
<script src="/resources/js/bootstrap.js"></script>
<script type="text/javascript" src="/resources/js/jquery_board.js"></script>
</head>
<body>
	
	<nav class="navbar navbar-default">
	  <div class="navbar-header">
	  	  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
	  	  	data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	  	  	<span class="icon-bar"></span>
	  	  	<span class="icon-bar"></span>
	  	  	<span class="icon-bar"></span>
	  	  	</button>
	  	  	<a class="navbar-brand" href="Login.jsp">DoDoChat</a>
	  </div>
	  <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	  	<ul class="nav navbar-nav">
	  		<li><a href="main.jsp">회원가입</a></li>
	  		<li><a href="bbs.jsp">채팅방</a></li>
	  	</ul>
	  </div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
			<form method="post" action="joinPro.sd" name="join">
				  <h2 style="text-align:center;">회원가입</h2>
				  <div class="form-group">
					<input type="text" class="form-control" title="아이디" placeholder="아이디(20자 제한)" name="memid" maxlength="20"/>
				  </div>
				  <div class="form-group">
					<input id="passwd" type="password" class="form-control" title="비밀번호" placeholder="비밀번호(20자 제한)" name="passwd" maxlength="20"/>
					<font name="check" size="2" color="red"></font>
				  </div>
				  <div class="form-group">
					<input id="passwd2" type="password" class="form-control" placeholder="비밀번호 확인" name="passwd2" maxlength="20"/>
					<font name="check" size="2" color="red"></font>
				  </div>
				  <div class="form-group">
					<input type="text" class="form-control"  title="전화번호" placeholder="전화번호" name="memtel" maxlength="20"/>
				  </div>
				  <div class="form-group">
					<input type="text" class="form-control"  title="이름" placeholder="이름" name="memname" maxlength="20"/>
				  </div>
				  <div class="form-group">
					<input type="text" class="form-control"  title="생년월일" placeholder="생년월일(YYYY/MM/DD)" name="membirth" maxlength="20"/>
				  </div>
				  <div class="form-group" style="text-align:center;">
				  	<div class="btn-group" data-toggle="buttons" >
				  	  <label class="btn btn-primary active">
						 <input type="radio" name="memgender" autocomplete="off" value="F" checked>F
					  </label>
				  	  <label class="btn btn-primary">
						 <input type="radio" name="memgender" autocomplete="off" value="M" >M
					  </label>
					</div>
				  </div>
				  <div class="form-group">
					<input type="email" class="form-control" title="email" placeholder="이메일 (test@example.com)" name="mememail" maxlength="20"/>
				  </div>
				  <input id="submit1" type="submit" class="btn btn-primary form-control" value="회원가입">
			</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
</body>
</html>