<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delightfulhee</title>
<link rel="stylesheet" href="/css/reset.css">
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
<%@ include file="../layout/header.jsp" %>
<section>
<div class="container">
	<div class="wraper" style="padding-top:100px;">
		 글쓰기 화면
		 <form>
		 <div>
		 <label for="title">제목</label>
		 <input type="text" id="title">
		 </div>
		 
		 <div>
		 <label for="content">내용</label>
		 <textarea class="summernote" id="content" rows="3" cols=""></textarea>
		 </div>
		 
		 <button id="btn-save">등록</button>
		 <script src="/js/board.js"></script>
		 </form>
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
	<hr class="line">
	<%@ include file="../layout/footer.jsp" %>
</section>
</body>
</html>