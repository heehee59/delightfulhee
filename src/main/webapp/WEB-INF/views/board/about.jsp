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
}
.abouttitle {
}
.aboutcontent {
	text-align:left;
}
</style>
</head>
<body>
<!-- header 영역 시작 -->
<%@ include file="../layout/header.jsp" %>
<!-- header 영역 끝 -->
<section>
<div class="container">
	<div class="wraper" style="padding-top:100px;">
	<div class="abouttitle">개발자 소개</div>
	<div class="aboutcontent">
		<div class="corevalue">
			<ul>
				<li>신뢰</li>
				<li>소통</li>
				<li>성실</li>
			</ul>
		</div>
		<div class="subcontent">
			안녕하세요.<br>
			Java와 Spring F/W 기반으로 웹 개발을 하고 있는 엄희경입니다.
			객체와 기능이 모여 하나의 웹앱을 만들어가는 과정을 즐기며, 트러블 슈팅을 두려워하지 않습니다.<br>
			새로운 기술에 도전하여 습득하는 것을 재미삼아 성장하고 있는 초급 개발자입니다.<br>
			<br>
			현재 보고 계시는 웹 사이트는 Java와 Spring Boot 기반으로 제작되었으며,<br>
			배포와 유지보수의 과정까지 오롯이 홀로 경험해볼 수 있었던 개인 프로젝트입니다.<br>
			<br>
		</div>
	</div>
	<ul>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
	</div>
</div>
<!-- footer 영역 시작 -->
	<hr class="line">
	<%@ include file="../layout/footer.jsp" %>
<!-- footer 영역 끝 -->
</section>
</body>
</html>