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
	font-size:15px;
}
.wraper {
	line-height:35px;
	padding-top:100px;
}
.cotainer-mypage {
	margin:auto;
	padding-bottom:30px;
	display:flex;
	text-align:center;
	justify-content:center;
}
.mypage-title {
	font-size:30px;
	margin-bottom:30px;
}
.mypage-form {
	justify-content:flex-start;
	text-align:left;
}
.mypage-table {
	border:2px solid black;
	width:400px;
}
.mypage-table tr {
	border:2px solid black;
}
.mypage-table td {
	border:2px solid black;
	padding:0 10px 0 10px;
}
.mypage-subtitle {
	font-size:13px;
}
.mypage-input {
	outline:none;
	border:none;
	background:transparent;
	font-size:14px;
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
	display:block;
}
.withdrawl-btn {
	outline:none;
	border:2px solid black;
	background:transparent;
	color:black;
	padding:5px;
	width:400px;
	margin-top:10px;
	cursor:pointer;
	font-family:'LotteMartDream';	
}
.startag {
	color:red;
	font-weight:bold;
}
</style>
</head>
<body>
<!-- header 영역 시작 -->
<%@ include file="../layout/header.jsp" %>
<!-- header 영역 끝 -->
<section>
<div class="container">
	<div class="wraper" style="padding-top:100px;">
	<div class="container-mypage">
	<div class="mypage-title">MYPAGE</div>
	<form class="mypage-form">
	<input type="hidden" id="id" value="${principal.user.id }" />
	<table class="mypage-table">
		<tr>
			<td><span class="mypage-subtitle">아이디</span></td>
			<td><input class="mypage-input" type="text" id="username" value="${principal.user.username }" readonly>
		</tr>
		<c:if test="${empty principal.user.oauth }">
		<tr>
			<td><span class="mypage-subtitle">새 비밀번호</span> <span class="startag">*</span></td>
			<td><input class="mypage-input" type="password" id="password" maxlength="20"></td>
		</tr>
		</c:if>
		<tr>
			<td><span class="mypage-subtitle">닉네임</span> <span class="startag">*</span></td>
			<td><input class="mypage-input" type="text" id="nickname" value="${principal.user.nickname }" maxlength="30"></td>
		</tr>
		<tr>
			<td><span class="mypage-subtitle">이메일주소</span> <span class="startag">*</span></td>
			<td><input class="mypage-input" type="email" id="email" value="${principal.user.email }" maxlength="50"></td>
		</tr>
	</table>
	<button class="submit-btn" id="btn-update">정보 수정</button>
	<button class="withdrawl-btn" id="btn-delete">회원 탈퇴</button>
	<script src="/js/user.js"></script>
	</form>
	</div>
	</div>
</div>
<!-- footer 영역 시작 -->
	<hr class="line">
	<%@ include file="../layout/footer.jsp" %>
<!-- footer 영역 끝 -->
</section>
</body>
</html>