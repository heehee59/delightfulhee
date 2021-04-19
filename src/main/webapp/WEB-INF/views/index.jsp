<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Delightfulhee</title>
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/mainStyle.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');
@import url('https://fonts.googleapis.com/css?family=Gugi:400');
</style>
</head>
<body>
<nav class="navbar">
	<div class="logo-holder">
		<a href="#" class="logo"><img alt="DELIGHTFULHEE" src="resources\images\logo.png" data-rjs="resources\images\logo.png"></a>
	</div>
		<ul class="nav">
	        <li class="dropdown" id="about">
				<a href="#" title="About">About<span style="float:right; font-weight:bold;">></span></a>
				<hr class="liline">
	        </li>
	        <li class="dropdown" id="project">
				<a href="#" title="Project">Project<span style="float:right; font-weight:bold;">></span></a>
				<hr class="liline">
	        </li>
	        <li class="dropdown" id="story">
				<a href="#" title="Story">DEVELOP. STORY<span style="float:right; font-weight:bold;">></span></a>
				<hr class="liline">
	        </li>
	        <li class="dropdown" id="loginjoin" style="float:right;">
				<a href="#" title="Login">로그인</a>
				<a href="#" title="Join"">회원가입</a>
	        </li>
		</ul>
		<div class="nav-footer">
			<hr style="background-color:#ededed; height:1px;">
			<span class="nav-footer-txt">@ 2021 Delightfulhee. All rights reserved</span>
		</div>
</nav>

<section>
<div class="container">
	<div style="padding-top:100px;">
	<span class="container-title">Delightfulhee,</span><br>
	<span class="container-title">행복한 개발자 엄희경입니다.</span>
	</div>
	<div class="img"><img src="resources\images\main.png" style="width:300px; height:300px;"></div>
	<%@ include file="footer.jsp" %>
</div>
</section>
</body>
</html>
