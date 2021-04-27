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
.container {
	text-align:center;
	font-size:15px;
}
.story-title {
	font-size:30px;
	margin-top:100px;
}
.boardline {
	border:2px;
	height:2px;
	background:black;
}
.story-table {
	width:900px;
}
.btn {
	width:900px;
	text-align:right;
	margin:auto;
	padding-top:15px;
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
	padding-bottom:50px;
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
<div class="container">
	<div class="story-title">DEVELOP. STORY</div>
	<div class="wraper" style="padding-top:100px; line-height:35px;">
	<table class="story-table">
		<tr>
			<td colspan="5"><hr class="boardline" /></td>
		</tr>
		<tr>
			<td>글 번호</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>조회수</td>
		</tr>
		<tr>
			<td colspan="5"><hr class="boardline" /></td>
		</tr>
		<tr>
		<c:forEach var="board" items="${boards.content }">
			<td>${board.id }</td>
			<td style="width:500px;"><a href="/auth/develstory/${board.id}">${board.title }</a></td>
			<td>${board.user.nickname }</td>
			<td>
			<fmt:parseDate var="regdate" value="${board.date }" pattern="yyyy-MM-dd" />
			<fmt:formatDate pattern="yyyy-MM-dd" value="${regdate}" />
			</td>
			<td>${board.viewcnt }</td>
		</c:forEach>
		</tr>
		<tr>
			<td colspan="5"><hr class="boardline" /></td>		
		</tr>
	</table>
	</div>
	<div class="btn"><a href="/auth/develstory/write"><button class="btn-write">글쓰기</button></a></div>
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
<!-- footer 영역 시작 -->
<hr class="line">
<%@ include file="../../layout/footer.jsp" %>	
<!-- footer 영역 끝 -->
</section>
</body>
</html>