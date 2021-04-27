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
.container {
	text-align:center;
	margin-top:30px;
}
.container-write {
	margin:auto;
	display:flex;
	text-align:center;
	justify-content:center;
}
.story-title {
	font-size:30px;
	margin:auto;
	margin-bottom:50px;
}
.contentarea .title {
	background:transparent;
	outline:none;
	border:none;
	border-bottom:1px solid black;
	margin-left:10px;
	margin-bottom:20px;
	width:600px;
	font-size:15px;
}
#btn-save {
	font-family:'LotteMartDream';
	font-size:15px;
	border:none;
	outline:none;
	background:transparent;
	cursor:pointer;
	margin-top:30px;
}
</style>
</head>
<body>
<!-- header 영역 시작 -->
<%@ include file="../../layout/header.jsp" %>
<!-- header 영역 끝 -->
<section>
<div class="container">
	<div style="font-size:15px; padding-top:100px; line-height:35px;">
		<div class="story-title">DEVELOP.STORY</div>
		<div class="container-write">
		 <div class="contentarea">
		 <form>
		 	<label for="title">제목</label>
		 	<input type="text" class="title" id="title">
			<textarea class="summernote" id="content" rows="3" cols=""></textarea>
			 <button id="btn-save">등록</button>
			 <script src="/js/story.js"></script>
		 </form>
		 </div>		 
		 </div>
	</div>
</div>
    <script>
      $(".summernote").summernote({
        tabsize: 2,
        height: 400,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
<!-- footer 영역 시작 -->
	<hr class="line">
	<%@ include file="../../layout/footer.jsp" %>
<!-- footer 영역 끝 -->
</section>
</body>
</html>