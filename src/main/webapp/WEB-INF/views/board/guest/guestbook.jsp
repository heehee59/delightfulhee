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
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css);
.container {
	text-align:center;
	font-size:15px;
}
.guestbook-title {
	font-size:30px;
	margin-top:100px;
}
.userinfo {
	text-align:center;
	margin-right:30px;
}
.user-pic {
	border:1px solid #dddddd;
	border-radius:400px 400px 400px 400px;
	background:#dddddd;
	width:100px;
	height:100px;
	overflow:hidden;
	margin-top:15px;
}
.user-imgthum {
	width:100%;
	height:100%;
	object-fit:cover;
}
.user-nick {
	position:relative;
	margin-top:25px;
}
.inputarea {
	padding:10px;
	vertical-align:middle;
}
.inputarea .input-content {
	border:2px solid black;
	background:transparent;
	width:500px;
	height:150px;
	outline:none;
	resize:none;	
	font-size:15px;
	font-family: 'Spoqa Han Sans Neo', 'sans-serif';
}
.outputarea {
	padding:10px;
	vertical-align:middle;
}
.outputarea #output-content {
	border:none;
	background:#ededed;
	border-radius:5px;
	padding:5px;
	width:500px;
	height:150px;
	outline:none;
	resize:none;	
	font-size:15px;
	font-family: 'Spoqa Han Sans Neo', 'sans-serif';
}
.regdate {
	margin-left:-40px;
	margin-top:150px;
}
#btn-save {
	font-family:'LotteMartDream';
	font-size:15px;
	border:none;
	outline:none;
	color:white;
	background:black;
	cursor:pointer;
	width:100px;
	height:50px;
	margin-top:118px;
}
#btn-delete {
	font-family:'LotteMartDream';
	font-size:15px;
	border:none;
	outline:none;
	background:transparent;
	cursor:pointer;
	width:40px;
	height:20px;
	margin-top:120px;
}
.pagination {
	margin-top:100px;
	margin-bottom:80px;
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
	<div class="guestbook-title">GUEST BOOK</div>
	<!-- 방명록 입력 영역 시작 -->
	<div class="wraper" style="padding-top:100px;">
		<div class="userinfo">
			<div class="user-pic"><img src="${principal.user.profileImg }" class="user-imgthum"></div>
			<div class="user-nick">${principal.user.nickname }</div>
		</div>
		<div class="inputarea"><textarea class="input-content" id="content"></textarea></div>
		<button id="btn-save">등록</button>
	</div>
	<!-- 방명록 입력 영역 끝 -->
	<!-- 방명록 출력 영역 시작 -->
	<c:forEach var="board" items="${boards.content }">
	<div style="padding-top:100px; margin-left:-25px; display:flex; justify-content:center;">
		<div class="userinfo">
			<div class="user-pic"><img src="${board.user.profileImg }" class="user-imgthum"></div>
			<div class="user-nick">${board.user.nickname }</div>
		</div>
		<div class="outputarea"><textarea id="output-content" readonly>${board.content }</textarea></div>
		<input type="hidden" id="id" value="${board.id }">
		<c:if test="${board.user.id == principal.user.id }">
			<button id="btn-delete">삭제</button>
		</c:if>
		<div class="regdate">
		<fmt:parseDate var="regdate" value="${board.date }" pattern="yyyy-MM-dd" />
		<fmt:formatDate pattern="yyyy-MM-dd" value="${regdate}" />
		</div>
	</div>
	</c:forEach>
	<!-- 방명록 출력 영역 끝 -->
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
<script src="/js/guest.js"></script>
</section>
</body>
</html>