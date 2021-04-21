<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delightfulhee</title>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/style.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');
@import url('https://fonts.googleapis.com/css?family=Gugi:400');
</style>
</head>
<body>
<div class="pane"></div>
<nav class="navbar">
	<div class="logo-holder">
		<a href="/delightfulhee" class="logo"><img alt="DELIGHTFULHEE" src="resources\images\logo.png" data-rjs="resources\images\logo.png"></a>
	</div>
		<ul class="nav">
	        <li class="dropdown" id="about">
				<a href="#" title="About">ABOUT<span style="float:right; font-weight:bold;">></span></a>
				<hr class="liline">
	        </li>
	        <li class="dropdown" id="project">
				<a href="#" title="Project">PROJECT<span style="float:right; font-weight:bold;">></span></a>
				<hr class="liline">
	        </li>
	        <li class="dropdown" id="story">
				<a href="#" title="Story">DEVELOP. STORY<span style="float:right; font-weight:bold;">></span></a>
				<hr class="liline">
	        </li>
	        <li class="dropdown" id="guest">
				<a href="#" title="Guest">GUEST BOOK<span style="float:right; font-weight:bold;">></span></a>
				<hr class="liline">
	        </li>
	        <li class="dropdown" id="loginjoin" style="float:right;">
				<a href="user/login" title="Login">로그인</a>
				<a href="user/joinForm" title="Join"">회원가입</a>
	        </li>
		</ul>
		<div class="nav-footer">
			<hr style="background-color:#ededed; border:1px; height:2px;">
			<span class="nav-footer-txt">@ 2021 Delightfulhee. All rights reserved</span>
		</div>
</nav>

<section>
<div class="container">
	<div class="wraper" style="padding-top:100px; padding-right:80px;">
	<div class="container-title">Delightfulhee,<br>
	행복한 개발자 엄희경입니다.</div>
	
	<div class="img" style="margin-top:50px;"><img src="resources\images\main.png" style="width:300px; height:300px;"></div>
	<div class="container-content">
	본 사이트는 스프링 부트 기반으로 구축되었으며,<br>
	Eclipse, JAVA/JSP, MySQL, HTML5, CSS3, JavaScript, jQuery, Ajax 등의 개발도구 및 기술이 사용되었습니다.
	</div>
	<hr class="line">
	<div class="container-content2">
	ddd
	</div>
	</div>
</div>
	<hr class="line">
	<%@ include file="layout/footer.jsp" %>
</section>
</div>
</body>
</html>
