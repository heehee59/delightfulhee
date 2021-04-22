<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delightfulhee</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/style.css">
<style>
.container {
	overflow:hidden;
	text-align:center;
	margin-top:100px;
	margin-bottom:150px;
}
.wraper {
	line-height:35px;
}
.cotainer-join {
	margin:auto;
	padding-bottom:30px;
	display:flex;
	text-align:center;
	justify-content:center;
}
.join-title {
	font-size:30px;
	margin-bottom:30px;
}
.join-form {
	justify-content:flex-start;
	text-align:left;
}
.join-table {
	border:2px solid black;
	width:400px;
}
.join-table tr {
	border:2px solid black;
}
.join-table td {
	border:2px solid black;
	padding:0 10px 0 10px;
}
.join-subtitle {
	font-size:13px;
}
.join-input {
	outline:none;
	border:none;
	background:transparent;
	font-size:14px;
}
.dupl-btn {
	outline:none;
	border:2px solid black;
	background:black;
	color:white;
	padding:5px;
	margin-right:-80px;
	cursor:pointer;
	font-family:'LotteMartDream';
}
.submit-btn {
	outline:none;
	border:2px solid black;
	background:black;
	color:white;
	padding:5px;
	width:400px;
	margin-top:20px;
	cursor:pointer;
	font-family:'LotteMartDream';
}
.startag {
	color:red;
	font-weight:bold;
}
.bottom-content1 {
	text-align:right;
}
</style>
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<section>
<div class="container">
	<div class="wraper" style="padding-top:100px;">
	<div class="container-login">
	<div class="join-title">JOIN</div>
	<form class="join-form">
	<table class="join-table">
		<tr>
			<td><span class="join-subtitle">아이디</span> <span class="startag">*</span></td>
			<td><input class="join-input" type="text" id="username" maxlength="30">
			<button class="dupl-btn">중복확인</button></td>
		</tr>
		<tr>
			<td><span class="join-subtitle">비밀번호</span> <span class="startag">*</span></td>
			<td><input class="join-input" type="password" id="password" maxlength="20"></td>
		</tr>
		<tr>
			<td><span class="join-subtitle">비밀번호확인</span> <span class="startag">*</span></td>
			<td><input class="join-input" type="password" id="passwordConfirm" maxlength="20"></td>
		</tr>
		<tr>
			<td><span class="join-subtitle">닉네임</span> <span class="startag">*</span></td>
			<td><input class="join-input" type="text" id="nickname" maxlength="30"></td>
		</tr>
		<tr>
			<td><span class="join-subtitle">이메일주소</span> <span class="startag">*</span></td>
			<td><input class="join-input" type="email" id="email" maxlength="50"></td>
		</tr>
	</table>
	<div class="bottom-content1"><span class="startag">*</span> 표시는 필수 항목입니다.</div>
	<div class="bottom-content2"><input type="checkbox" style="transform:scale(1.5); margin-right:10px;"><a href="#" style="color:#5C42D7; font-weight:bold;">이용약관</a> 및 개인정보수집 이용에 동의합니다.</div>
	<button class="submit-btn" id="btn-save">가입</button>
	<script src="/js/user.js"></script>
	</form>
	</div>
	</div>
</div>
	<hr class="line">
	<%@ include file="../layout/footer.jsp" %>
</section>
</body>
</html>