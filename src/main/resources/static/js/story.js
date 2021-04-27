let index = {
	init: function() {
		$("#btn-save").on("click",()=>{
			this.save();
		});
		$("#btn-delete").on("click",()=>{
			this.deleteById();
		});
		$("#btn-update").on("click",()=>{
			this.update();
		});
		$("#btn-reply-save").on("click",()=>{
			this.replySave();
		});
		$("#btn-reply-delete").on("click",()=>{
			this.replyDelete();
		});
	},
	
	save: function() {
		let data = {
			title: $("#title").val(),
			content: $("#content").val()
		};
		
		$.ajax({
			type: "POST",
			url: "/api/develstory",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			alert("글이 등록되었습니다.");
			location.href = "/auth/develstory";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	deleteById: function() {
		var id = $("#id").val();
		
		$.ajax({
			type: "DELETE",
			url: "/api/develstory/"+id,
			dataType: "json"
		}).done(function(resp){
			alert("글이 삭제되었습니다.");
			location.href = "/auth/develstory";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	update: function() {
		var id = $("#id").val();
		
		let data = {
			title: $("#title").val(),
			content: $("#content").val()
		};
		
		$.ajax({
			type: "PUT",
			url: "/api/develstory/"+id,
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			alert("글이 수정되었습니다.");
			location.href = "/auth/develstory";
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
			url: '/api/develstory/'+data.boardid+'/reply',
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			alert("댓글이 등록되었습니다.");
			location.href = '/auth/develstory/'+data.boardid;
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	replyDelete: function(boardid, replyid) {
		
		console.log(boardid);
		console.log(replyid);
		
		$.ajax({
			type: "DELETE",
			url: '/api/develstory/'+boardid+'/reply/'+replyid,
			dataType: "json"
		}).done(function(resp){
			alert("댓글이 삭제되었습니다.");
			location.href = '/auth/develstory/'+data.boardid;
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}
	
}

index.init();