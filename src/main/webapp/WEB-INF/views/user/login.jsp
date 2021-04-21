<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delightfulhee</title>
<link rel="stylesheet" href="/delightfulhee/resources/css/reset.css">
<link rel="stylesheet" href="/delightfulhee/resources/css/style.css">
<style>
.container {
	overflow:hidden;
	text-align:center;
	margin-top:100px;
	margin-bottom:200px;
}
.wraper {
	line-height:35px;
}
.cotainer-login {
	margin:auto;
	padding-bottom:30px;
	display:flex;
	text-align:center;
	justify-content:center;
}
.login-title {
	font-size:30px;
	margin-bottom:30px;
}
.lgoin-form {
	justify-content:flex-start;
	text-align:left;
}
.login-table {
	border:2px solid black;
	width:280px;
}
.login-table tr {
	border:2px solid black;
}
.login-table td {
	border:2px solid black;
	padding:0 10px 0 10px;
}
.login-subtitle {
	font-size:13px;
}
.login-input {
	outline:none;
	border:none;
	background:transparent;
	font-size:14px;
}
.submit-btn {
	outline:none;
	border:2px solid black;
	background:transparent;
	padding:5px;
	width:280px;
	cursor:pointer;
	font-family:'LotteMartDream';
}
.google-btn {
	outline:none;
	border:2px solid black;
	background:#CB5240;
	padding:5px;
	width:280px;
	cursor:pointer;
	font-family:'LotteMartDream';
	color:white;
}
.kakao-btn {
	outline:none;
	border:2px solid black;
	background:#FFEC27;
	padding:5px;
	width:280px;
	cursor:pointer;
	font-family:'LotteMartDream';
}
.naver-btn {
	outline:none;
	border:2px solid black;
	background:#2FD200;
	padding:5px;
	width:280px;
	cursor:pointer;
	font-family:'LotteMartDream';
}
</style>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<section>
<div class="container">
	<div class="wraper" style="padding-top:100px;">
		<div class="container-login">
		<div class="login-title">WELCOME</div>
		<form class="login-form" action="#">
		<table class="login-table">
			<tr>
				<td><span class="login-subtitle">아이디</span></td>
				<td><input class="login-input" type="text" id="username" maxlength="40" required></td>
			</tr>
			<tr>
				<td><span class="login-subtitle">비밀번호</span></td>
				<td><input class="login-input" type="password" id="password" maxlength="20" required></td>
			</tr>
		</table>
		<div style="text-align:right;"><a href="#">아이디 찾기</a> ㅣ <a href="#">비밀번호 찾기</a></div>
		<input class="submit-btn" type="submit" value="로그인"><br>
		<button class="google-btn">구글 로그인</button><br>
		<button class="kakao-btn">카카오 로그인</button><br>
		<button class="naver-btn">네이버 로그인</button>
		</form>
		</div>
	</div>
</div>
	<hr class="line">
	<%@ include file="../layout/footer.jsp" %>
</section>
</body>
</html>