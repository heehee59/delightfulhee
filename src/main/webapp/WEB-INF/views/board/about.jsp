<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delightfulhee</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/style.css">
<style>
@import url(//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css);
* { font-family: 'Spoqa Han Sans Neo', 'sans-serif'; }
.container {
	font-size:15px;
	text-align:center;
}
.about-title {
	font-size:30px;
	margin-top:100px;
	margin-bottom:20px;
}
.about-content {
	width:1100px;
	text-align:left;
	display:inline-block;
	margin-top:30px;
	margin-bottom:60px;
}
.pic {
	display:inline-block;
}
.pic img {
	width:350px;
	position:relative;
	float:left;
}
.profile {
	display:inline-block;
	position:relative;
	float:right;
	margin:50px 300px 0 0;
	font-size:18px;
	line-height:30px;
}
.subcontent {
	display:inline-block;
	margin-bottom:80px;
}
.corevalue li {
	width:150px;
	height:150px;
	background:#ededed;
	border:none;
	border-radius:400px;
	display:inline-block;
	justify-content:center;
	text-align:center;
	margin-right:40px;
}
.corevalue li img {
	width:60px;
	margin:auto;
	display:block;
	padding:20px;
}
.skill ul li img {
	width:100px;
}
.skill .frontend li {
	display:inline-block;
	margin:10px 30px 10px 0;
}
.skill .backend li {
	display:inline-block;
	margin:10px 30px 10px 0;
}
.skill .devops li {
	display:inline-block;
	margin:10px 30px 10px 0;
}
.subline {
	width:100px;
	background:black;
	float:left;
}
.divisionline {
	width:1100px;
	background:#ededed;
}
</style>
</head>
<body>
<!-- header 영역 시작 -->
<%@ include file="../layout/header.jsp" %>
<!-- header 영역 끝 -->
<section>
<div class="container">
	<div class="about-title">ABOUT</div>
	<div style="text-align:left; line-height:28px; font-size:16px;">
	<div class="about-title">개발자 소개</div>
	<hr class="subline" />
	<div class="about-content">
		<div class="pic">
			<img src="/images/about/aboutimg.png">
		</div>
		<div class="profile">
			엄희경, Heekyeong Eom<br>
			93. 7. 2.<br>
			INFJ.<br>
			<br>
			<span style="font-weight:bold;">Contact.</span><br>
			github.com/heehee59<br>
			mchell9999@gmail.com<br>
			instagram.com/love_is_hee<br>
		</div>
	</div>
	<div class="subcontent">
		안녕하세요.<br>
		Java와 Spring F/W 기반으로 웹 개발을 하고 있는 엄희경입니다.<br>
		객체와 기능이 모여 하나의 웹앱을 만들어가는 과정을 즐기며, 트러블 슈팅을 두려워하지 않습니다.<br>
		새로운 기술에 도전하여 습득하는 것을 재미삼아 성장하고 있는 초급 개발자입니다.<br>
		<br>
		현재 보고 계시는 웹 사이트는 Java와 Spring Boot 기반으로 제작되었으며,<br>
		배포와 유지보수의 과정까지 오롯이 홀로 경험해볼 수 있었던 개인 프로젝트입니다.<br>
		<br>
		'Delightfullhee'의 의미는 제 이름에서 따온 희의 한자 의미를 담은 '기쁠 희'를 영문화한 것이며, 'Delightful'과 'hee'의 합성어입니다.
	</div>
	<hr class="divisionline" />
	<div class="about-title">핵심 가치</div>
	<hr class="subline" />
	<div class="about-content">
		<ul class="corevalue">
			<li><img src="/images/about/trust.png">신뢰</li>
			<li><img src="/images/about/passion.png">성실</li>
			<li><img src="/images/about/growth.png">성장</li>
			<li><img src="/images/about/communication.png">정확한 소통</li>
			<li><img src="/images/about/web.png">확실한 결과</li>
		</ul>
	</div>
	<hr class="divisionline" />
	<div class="about-title">기술 스택</div>
	<hr class="subline" />
	<div class="about-content">
		<div class="skill">
			<span>Front-end</span>
			<ul class="frontend">
				<li><img src="/images/about/html5.png"></li>
				<li><img src="/images/about/css3.png"></li>
				<li><img src="/images/about/js.png"></li>
				<li><img src="/images/about/jquery.png"></li>
			</ul>
			<span>Back-end</span>
			<ul class="backend">
				<li><img src="/images/about/java.png"></li>
				<li><img src="/images/about/spring.png"></li>
				<li><img src="/images/about/oracle.png"></li>
				<li><img src="/images/about/mysql.png"></li>
			</ul>
			<span>Dev-ops</span>
			<ul class="devops">
				<li><img src="/images/about/linux.png" style="width:80px; margin-right:25px;"></li>
				<li><img src="/images/about/github.png" style="width:80px;"></li>
			</ul>
		</div>
	</div>
	<hr class="divisionline" />
	<div class="about-title">사이트 이미지 레퍼런스</div>
	<hr class="subline" />
	<div class="about-content">
		<div class="refer">
<pre>
index.jsp - 개발자 이미지 : pngtree https://kor.pngtree.com/
about.jsp - 랩탑 이미지 : pngtree https://kor.pngtree.com/
		핵심가치 이미지 : flaticon https://www.flaticon.com/
		기술스택 이미지 : pixabay https://pixabay.com/ko/
footer.jsp - e-mail, git, instagram 이미지 : flaticon https://www.flaticon.com/
</pre>
		</div>
	</div>
	</div>
</div>
<!-- footer 영역 시작 -->
	<hr class="line">
	<%@ include file="../layout/footer.jsp" %>
<!-- footer 영역 끝 -->
</section>
</body>
</html>