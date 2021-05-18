let index = {
	init: function() {
		$("#btn-save").on("click",()=>{
			this.save();
		});
		$("#btn-delete").on("click",()=>{
			this.deleteById();
		});
		$("#btn-reply-save").on("click",()=>{
			this.replySave();
		});
	},
	
	save: function() {
		let data = {
			content: $("#content").val()
		};
		
		$.ajax({
			type: "POST",
			url: "/api/guest",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			alert("글이 등록되었습니다.");
			console.log(resp);
			location.href = "/guestbook";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	deleteById: function() {
		var boardid = $("#boardid").val();
		
		$.ajax({
			type: "DELETE",
			url: "/api/guest/"+boardid,
			dataType: "json"
		}).done(function(resp){
			alert("글이 삭제되었습니다.");
			location.href = "/guestbook";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	replySave: function() {
		let data = {
			userid: $("#userid").val(),
			boardid: $("#boardid").val(),
			content: $("#reply-content").val()
		};
		
		$.ajax({
			type: "POST",
			url: '/api/guest/'+data.boardid+'/reply',
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			alert("댓글이 등록되었습니다.");
			location.href = "/auth/guestbook";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
}

index.init();