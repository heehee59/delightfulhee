<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delightfulhee</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/style.css">
<style>
.detail {
	width:1200px;
	margin:auto;
}
.title {
	font-size:30px;
	margin-top:50px;
	margin-bottom:20px;
}
.writer {
	margin-top:20px;
	margin-bottom:-20px;
	color:#393CE1;
	font-weight:bold;
}
.likes {
	float:left;
	text-align:left;
	margin-left:70px;
	margin-top:50px;
	margin-bottom:30px;
}
.list-modi-del {
	float:right;
	text-align:right;
	margin-right:70px;
	margin-top:50px;
	margin-bottom:30px;
}
.btn {
	font-family:'LotteMartDream';
	font-size:15px;
	border:none;
	outline:none;
	background:transparent;
	cursor:pointer;
}
</style>
</head>
<body>
<!-- header 영역 시작 -->
<header>
	<%@ include file="../../layout/header.jsp" %>
</header>
<!-- header 영역 끝 -->
<section>
<!-- 글 내용 부분 -->
<div class="container">
	<div style="padding-top:100px; text-align:center; font-size:15px;">
	<div class="detail">
	<div class="title">${board.title }</div>
	<fmt:parseDate var="regdate" value="${board.date }" pattern="yyyy-MM-dd" />
	<fmt:formatDate pattern="yyyy-MM-dd" value="${regdate}" />
	<div class="writer">${board.user.nickname }</div>
	<hr class="line">
	<div class="content">${board.content }</div>
	<div class="likes">좋아요</div>
	<c:if test="${board.user.id == principal.user.id }">
	<div class="list-modi-del">
		<a href="/auth/project"><button class="btn">목록</button></a>
		<a href="/project/${board.id}/modify"><button class="btn">수정</button></a>
		<button id="btn-delete" class="btn">삭제</button></div>
	</c:if>
	<input type="hidden" value="${board.id }" id="id">
	<script src="/js/project.js"></script>
	<hr class="line">
	댓글영역
	<hr class="line">
	<br>
	글 앞뒤 목록
	<br><br><br>
	<br><br><br>
	</div>
	</div>
</div>
<!-- footer 영역 시작 -->
	<hr class="line">
	<%@ include file="../../layout/footer.jsp" %>
<!-- footer 영역 끝 -->
</section>
</body>
</html>