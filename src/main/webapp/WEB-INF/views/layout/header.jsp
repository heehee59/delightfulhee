<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delightfulhee</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- 썸머노트 시작 -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');
@import url('https://fonts.googleapis.com/css?family=Gugi:400');
</style>
</head>
<body>
<nav class="navbar">
	<div class="logo-holder">
		<a href="/" class="logo"><img alt="DELIGHTFULHEE" src="/images/logo.png" data-rjs="resources\images\logo.png"></a>
	</div>
		<ul class="nav">
	        <li class="dropdown" id="about">
				<a href="/auth/about" title="About">ABOUT<span style="float:right; font-weight:bold;">></span></a>
				<hr class="liline">
	        </li>
	        <li class="dropdown" id="project">
				<a href="/auth/project" title="Project">PROJECT<span style="float:right; font-weight:bold;">></span></a>
				<hr class="liline">
	        </li>
	        <li class="dropdown" id="story">
				<a href="/auth/develstory" title="Story">DEVELOP. STORY<span style="float:right; font-weight:bold;">></span></a>
				<hr class="liline">
	        </li>
	        <li class="dropdown" id="guest">
				<a href="/guestbook" title="Guest">GUEST BOOK<span style="float:right; font-weight:bold;">></span></a>
				<hr class="liline">
	        </li>
	        <c:choose>
	        	<c:when test="${empty principal }">
	        		<li class="dropdown" id="loginjoin" style="float:right;">
					<a href="/auth/loginForm" title="Login">로그인</a>
					<a href="/auth/joinForm" title="Join">회원가입</a>
	       			 </li>
	        	</c:when>
	        	<c:otherwise>
					<li class="dropdown" id="loginjoin" style="float:right;">
					<a href="/mypage" title="Mypage">마이페이지</a>
					<a href="/logout" title="Logout">로그아웃</a>
	        </li>
	        	</c:otherwise>
	        </c:choose>
		</ul>
		<div class="nav-footer">
			<hr style="background-color:#ededed; height:1px;">
			<span class="nav-footer-txt">@ 2021 Delightfulhee. All rights reserved</span>
		</div>
</nav>
</body>
</html>