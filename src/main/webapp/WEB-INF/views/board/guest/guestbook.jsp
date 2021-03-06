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
	margin-top:5px;
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
	padding:10px;
	width:500px;
	height:150px;
	outline:none;
	resize:none;	
	font-size:15px;
	font-family: 'Spoqa Han Sans Neo', 'sans-serif';
}
.regdate {
	display:block;
	position:relative;
	text-align:right;
	margin-top:-30px;
	margin-right:15px;
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
	margin-left:10px;
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
}
#btn-reply {
	font-family:'LotteMartDream';
	font-size:15px;
	border:none;
	outline:none;
	background:transparent;
	cursor:pointer;
	width:40px;
	height:20px;
}
.replyinsertarea {
	margin-top:30px;
	text-align:center;
	display:none;
	margin-left:280px;
}
#reply-content {
	resize:none;
	background:transparent;
	border:2px solid black;
	background:transparent;
	width:300px;
	height:100px;
	outline:none;
	resize:none;	
	font-size:15px;
	font-family: 'Spoqa Han Sans Neo', 'sans-serif';
}
#btn-reply-save {
	font-family:'LotteMartDream';
	font-size:15px;
	border:none;
	outline:none;
	background:transparent;
	cursor:pointer;
	width:40px;
	height:20px;
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
<!-- header ?????? ?????? -->
<%@ include file="../../layout/header.jsp" %>
<!-- header ?????? ??? -->
<section>
<div class="container">
	<div class="guestbook-title">GUEST BOOK</div>
	<!-- ????????? ?????? ?????? ?????? -->
	<div class="wraper" style="padding-top:100px;">
		<div class="userinfo">
			<div class="user-pic"><img src="${principal.user.picture }" class="user-imgthum"></div>
			<div class="user-nick">${principal.user.nickname }</div>
		</div>
		<div class="inputarea"><textarea class="input-content" id="content"></textarea></div>
		<button id="btn-save">??????</button>
	</div>
	<!-- ????????? ?????? ?????? ??? -->
	<!-- ????????? ?????? ?????? ?????? -->
	<c:forEach var="board" items="${boards.content }">
	<div style="padding-top:100px; margin-left:-25px; display:flex; justify-content:center;">
		<div class="userinfo">
			<div class="user-pic"><img src="${board.user.picture }" class="user-imgthum"></div>
			<div class="user-nick">${board.user.nickname }</div>
		</div>
		<div class="outputarea">
			<textarea id="output-content" readonly>${board.content }</textarea>
			<div class="regdate">
				<fmt:parseDate var="regdate" value="${board.date }" pattern="yyyy-MM-dd" />
				<fmt:formatDate pattern="yyyy-MM-dd" value="${regdate}" />
			</div>
		</div>
		<input type="hidden" id="id" value="${board.id }">
		<div style="display:block; margin-top:150px;">
			<c:if test="${board.user.id == principal.user.id || principal.user.id == '3'}">
				<button id="btn-delete">??????</button></c:if>
			<c:if test="${principal.user.id == '3' }">
				<button id="btn-reply" onclick="reply(document.getElementById('replyinsertarea'))">??????</button>
					<script>
						function reply(insertmenu) {
							var replyinsertarea = document.getElementById('replyinsertarea');
							replyinsertarea.style.display = "none";
							
							insertmenu.style.display="block";
						}
					</script>
				</c:if>
		</div>
	</div>	
	<!-- ????????? ?????? ?????? ?????? -->
	<!-- ????????? ?????? ?????? ??? -->
	<!-- ????????? ?????? ?????? ?????? -->
	<div id="replyinsertarea" class="replyinsertarea">
		<textarea id="reply-content"></textarea>
		<input type="hidden" id="userid" value="${principal.user.id }" />
		<button id="btn-reply-save">??????</button>
	</div>
	<!-- ????????? ?????? ?????? ??? -->
	</c:forEach>
	<!-- ????????? ?????? ?????? ??? -->
<!-- ????????? ?????? ?????? -->
	<ul class="pagination">
		<!-- ?????? ?????? ????????? -->
		<c:choose>
			<c:when test="${boards.first }"></c:when>
			<c:otherwise>
				<li class="page-item"><a href="?page=${boards.number-1 }">Prev</a></li>
			</c:otherwise>
		</c:choose>
		<!-- ????????? ?????? -->
		<c:forEach var="pageNum" begin="${firstPage }" end="${lastPage }">
			<li class="page-item"><a href="?page=${pageNum-1}">${pageNum }</a></li>
		</c:forEach>
		<!-- ?????? ?????? ????????? -->
		<c:choose>
		<c:when test="${boards.last }"></c:when>
			<c:otherwise>
				<li class="page-item"><a href="?page=${boards.number+1 }">Next</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
<!-- ????????? ?????? ??? -->
</div>
<!-- footer ?????? ?????? -->
<hr class="line">
<%@ include file="../../layout/footer.jsp" %>
<!-- footer ?????? ??? -->
<script src="/js/guest.js"></script>
</section>
</body>
</html>