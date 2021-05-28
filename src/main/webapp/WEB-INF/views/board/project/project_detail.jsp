<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delightfulhee</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/style.css">
<style>
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css);
.detail {
	width:1200px;
	font-size:15px;
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
.likes-img {
	cursor:pointer;
}
.unlikes-img {
	cursor:pointer;
}
.like {
	float:left;
	text-align:left;
	margin-left:15px;
	margin-top:70px;
}
.list-modi-del {
	float:right;
	text-align:right;
	margin-right:70px;
	margin-top:70px;
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
.replybox {
	text-align:center;
	margin:0 70px 60px 70px;
}
.reply-title {
	text-align:left;
}
.replyarea {
	margin-bottom:30px;
}
.reply-nick {
	margin-top:30px;
	text-align:left;
}
.reply-content {
	margin:20px 0 0px 0;
	padding:10px 10px 10px 10px;
	display:block;
	background:#ededed;
	border-radius:5px;
	display:inline-block;
	width:100%;
}
.reply-main {
	display:inline-block;
	float:left;
	font-family:'Spoqa Han Sans Neo', 'sans-serif';
	padding-left:5px;
	text-align:left;
}
.reply-date {
	display:inline-block;
	float:right;
	margin-right:10px;
}
.reply-del {
	display:inline-block;
	margin-left:5px;
	outline:none;
	background:black;
	color:white;
	border:none;
	cursor:pointer;
	font-family:'LotteMartDream';
	font-size:13px;
	width:40px;
	height:20px;
}
.insertarea {
	margin-top:70px;
	text-align:left;
	width:1000px;
	padding-bottom:30px;
}
.reply-insert {
	resize:none;
	width:900px;
	height:100px;
	background:transparent;
	outline:none;
	border:2px solid black;
	display:inline-block;
	font-family:'Spoqa Han Sans Neo', 'sans-serif';
	font-size:15px;
	margin-bottom:-49px;
}
#btn-reply-save {
	outline:none;
	background:black;
	color:white;
	border:none;
	cursor:pointer;
	font-family:'LotteMartDream';
	font-size:15px;
	width:80px;
	height:109px;
	display:inline-block;
	float:right;
}
.projectlist {
	width:1100px;
	text-align:center;
	margin-top:150px;
}
.listline {
	display:block;
	margin-bottom:80px;
	display:inline-block;
}
.listline .img {
	width:300px;
	hegiht:200px;
	margin-left:30px;
	margin-right:30px;
}
.listline .title {
	text-align:left;
	margin-top:15px;
	margin-left:40px;
	margin-right:40px;
	font-size:15px;
}
.btn {
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
.page-item {
	display:inline;
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
<!-- 글 내용 영역 시작 -->
<div class="container">
	<div class="wraper">
	<div class="detail">
	<div class="title">${board.title }</div>
	<fmt:parseDate var="regdate" value="${board.date }" pattern="yyyy-MM-dd" />
	<fmt:formatDate pattern="yyyy-MM-dd" value="${regdate}" />
	<div class="writer">${board.user.nickname }</div>
	<hr class="line">
	<div class="content">${board.content }</div>
	<!-- 좋아요 영역 시작 -->
	<c:choose>
		<c:when test="${like_chk eq true }">
			<div class="likes">
				<div class="c__1 c__1${board.id}">
					<input type="hidden" id="boardid" value="${board.id}" />
					<input type="hidden" id="count" value="${fn:length(board.likes)}" />
					<input type="hidden" id="check" value="-1" />
					<img class="likes-img" src="/images/like.png">
					<script src="/js/likes.js"></script>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="likes">
				<div class="c__1 c__1${board.id}">
					<input type="hidden" id="boardid" value="${board.id}" />
					<input type="hidden" id="count" value="${fn:length(board.likes)}" />
					<input type="hidden" id="check" value="1" />
					<img class="unlikes-img" src="/images/unlike.png">
					<script src="/js/likes.js"></script>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<div class="like${project.id }">
		좋아요 <b>${fn:length(board.likes)}개</b>
	</div>
	<!-- 좋아요 영역 끝 -->
	<c:if test="${board.user.id == principal.user.id }">
	<div class="list-modi-del">
		<a href="/auth/project/${board.id}/modify"><button class="btn">수정</button></a>
		<button id="btn-delete" class="btn">삭제</button></div>
	</c:if>
	<input type="hidden" value="${board.id }" id="id">
<!-- 글 내용 영역 끝 -->
	<hr class="line">
	<!-- 댓글 영역 시작 -->
	<form>
	<input type="hidden" id="userid" value="${principal.user.id }" />
	<input type="hidden" id="boardid" value="${board.id}"/>
	<div class="replybox">
		<div class="reply-title">댓글 (<span style="color:red;">0</span>)</div>
		<c:forEach var="reply" items="${board.reply }">
		<ul class="replyarea">
			<li id="reply-${reply.id }">
				<div class="reply-nick">${reply.user.nickname }</div>
				<div class="reply-content">
					<div class="reply-main">${reply.content }</div>
					<div class="reply-date">
						<fmt:parseDate var="replyregdate" value="${reply.date }" pattern="yyyy-MM-dd" />
						<fmt:formatDate pattern="yyyy-MM-dd" value="${replyregdate}" />
						<c:if test="${reply.user.id == principal.user.id }">
						<button onClick="index.replyDelete(${board.id}, ${reply.id })" class="reply-del">삭제</button></div>
						</c:if>
				</div>
			</li>
		</ul>
		</c:forEach>
		<!-- 댓글 등록 시작 -->
		<div class="insertarea">
		<textarea id="reply-content" class="reply-insert" placeholder="댓글을 입력해주세요."></textarea>
		<button id="btn-reply-save">등록</button>
		</div>
		<!-- 댓글 등록 끝 -->
	</div>
	</form>
	<!-- 댓글 영역 끝 -->
	<hr class="line">
	<div style="text-align:right; margin-right:70px; margin-top:-30px; margin-bottom:50px;"><a href="/auth/project"><button class="btn">목록</button></a></div>
	<!-- 목록 부분 출력 시작 -->
	<div class="projectlist">
		<c:forEach var="board" items="${boards.content }">
		<div class="listline">
				<div class="img"><a href="/auth/project/${board.id }"><img src="/images/tmp.jpg"></a></div>
				<div class="title"><a href="/auth/project/${board.id }">${board.title }</a></div>
		</div>
		</c:forEach>
		<div style="text-align:right; margin:20px 20px 50px 0px;"><a href="/auth/project/write"><button class="btn-write">글쓰기</button></a></div>
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
	<!-- 목록 부분 출력 끝 -->
	</div>
	</div>
</div>
</div>
<script src="/js/project.js"></script>
<!-- footer 영역 시작 -->
	<hr class="line">
	<%@ include file="../../layout/footer.jsp" %>
<!-- footer 영역 끝 -->
</section>
</body>
</html>