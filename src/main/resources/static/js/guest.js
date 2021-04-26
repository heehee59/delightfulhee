let index = {
	init: function() {
		$("#btn-save").on("click",()=>{
			this.save();
		});
		$("#btn-delete").on("click",()=>{
			this.deleteById();
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
		var id = $("#id").val();
		
		$.ajax({
			type: "DELETE",
			url: "/api/guest/"+id,
			dataType: "json"
		}).done(function(resp){
			alert("글이 삭제되었습니다.");
			location.href = "/guestbook";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}
	
}

index.init();