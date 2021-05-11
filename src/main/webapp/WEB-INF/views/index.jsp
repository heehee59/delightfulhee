<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delightfulhee</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/style.css">
<script src="/js/jquery.js"></script>
<script src="/js/jquery.fadethis.min.js"></script>
<script>$(window).fadeThis();</script>
<script>
prop: 86;
const test = {
		prop: 2021,
		func: function() {
			return this.prop;
		},
	prop: 54,
	fnc2: function() {
		return this.prop;
	},
};
prop: 70;
console.log(test.func2());

</script>
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap');
@import url('https://fonts.googleapis.com/css?family=Gugi:400');
.container-title {
	display:inline-block;
	margin-top:-100px;
	margin-bottom:100px;
}
.index-img {
	display:inline-block;
	margin-left:70px;
}
</style>
</head>
<body>
<%@ include file="layout/header.jsp" %>
<section>
<div class="container">
	<div style="padding-top:100px;">
		<div class="container-title">
			Delightfulhee,<br>
			진심을 잇는 개발자 엄희경입니다.
		</div>
		<div class="index-img"><img src="/images/main.png" style="width:300px; height:300px;"></div>
	</div>
	<hr class="line">
	<div class="container-content">
		본 사이트는 스프링 부트 기반으로 구축되었으며,<br>
		Eclipse, JAVA/JSP, MySQL, HTML5, CSS3, JavaScript, jQuery, Ajax 등의 개발도구 및 기술이 사용되었습니다.
	</div>
	<hr class="line">
	<div class="container-content2">
		ddd
	</div>
</div>
	<hr class="line">
	<%@ include file="layout/footer.jsp" %>
</section>
</body>
</html>
