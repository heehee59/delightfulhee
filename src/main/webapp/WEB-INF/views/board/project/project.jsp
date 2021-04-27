<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delightfulhee</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/style.css">
<style>
.container {
	text-align:center;
}
.project-title {
	font-size:30px;
	margin:auto;
	margin-bottom:50px;
}
.list {
	width:1200px;
	margin:auto;
}
.listline {
	display:block;
	margin-bottom:80px;
	display:inline-block;
}
.listline .img {
	width:300px;
	hegiht:200px;
	margin-left:40px;
	margin-right:40px;
}
.listline .title {
	text-align:left;
	margin-top:15px;
	margin-left:40px;
	margin-right:40px;
}
.btn {
	text-align:right;
	margin-right:60px;
}
.btn-write {
	font-family:'LotteMartDream';
	font-size:15px;
	border:none;
	outline:none;
	background:transparent;
	cursor:pointer;
}
.pagination {
	margin-top:50px;
}
.page-item {
	display:inline;
}
</style>
</head>
<body>
<!-- header 영역 시작 -->
<%@ include file="../../layout/header.jsp" %>
<!-- header 영역 끝 -->
<section>
<!-- 글 목록 부분 -->
<div class="container">
	<div style="padding-top:150px; text-align:center; font-size:15px;">
	<div class="list">
	<c:forEach var="board" items="${boards.content }">
		<div class="listline">
			<div class="img"><a href="/auth/project/${board.id }"><img src="/images/tmp.jpg"></a></div>
			<div class="title"><a href="/auth/project/${board.id }">${board.title }</a></div>
		</div>
	</c:forEach>
	<div class="btn"><a href="/auth/project/write"><button class="btn-write">글쓰기</button></a></div>
	</div>
<!-- 페이징 영역 시작 -->
	<ul class="pagination">
		<!-- 이전 버튼 활성화 -->
		<c:choose>
			<c:when test="${boards.first }"></c:when>
			<c:otherwise>
				<li class="page-item"><a href="?page=${boards.number-1 }">Prev</a></li>
			</c:otherwise>
		</c:choose>
		<!-- 페이징 버튼 -->
		<c:forEach var="pageNum" begin="${firstPage }" end="${lastPage }">
			<li class="page-item"><a href="?page=${pageNum-1}">${pageNum }</a></li>
		</c:forEach>
		<!-- 다음 버튼 활성화 -->
		<c:choose>
		<c:when test="${boards.last }"></c:when>
			<c:otherwise>
				<li class="page-item"><a href="?page=${boards.number+1 }">Next</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
<!-- 페이징 영역 끝 -->
	</div>
</div>
<!-- footer 영역 시작 -->
<hr class="line">
<%@ include file="../../layout/footer.jsp" %>
<!-- footer 영역 끝 -->
</section>
</body>
</html>