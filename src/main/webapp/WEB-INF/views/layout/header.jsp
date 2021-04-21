<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delightfulhee</title>
<link rel="stylesheet" href="/delightfulhee/resources/css/reset.css">
<link rel="stylesheet" href="/delightfulhee/resources/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');
@import url('https://fonts.googleapis.com/css?family=Gugi:400');
</style>
</head>
<body>
<nav class="navbar">
	<div class="logo-holder">
		<a href="/delightfulhee" class="logo"><img alt="DELIGHTFULHEE" src="..\resources\images\logo.png" data-rjs="resources\images\logo.png"></a>
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
				<a href="/delightfulhee/user/login" title="Login">로그인</a>
				<a href="/delightfulhee/user/joinForm" title="Join">회원가입</a>
	        </li>
		</ul>
		<div class="nav-footer">
			<hr style="background-color:#ededed; height:1px;">
			<span class="nav-footer-txt">@ 2021 Delightfulhee. All rights reserved</span>
		</div>
</nav>
</body>
</html>