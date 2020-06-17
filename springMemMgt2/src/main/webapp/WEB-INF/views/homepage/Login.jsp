<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<title>LOGIN</title>
<script src="/resources/js/bootstrap.js"></script>
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
	  		<li><a href="join.jsp">회원가입</a></li>
	  		<li><a href="bbs.jsp">채팅방</a></li>
	  	</ul>
	  </div>
	</nav>
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="login.do">
				  <h2 style="text-align:center;">로그인</h2>
				  <div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="id" maxlength="20"/>
				  </div>
				  <div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="passwd" maxlength="20"/>
				  </div>
				  <input type="submit" class="btn btn-primary form-control" value="Login">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>
</body>
</html>