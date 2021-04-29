let index = {
	init: function() {
		$("#btn-save").on("click",()=>{
			this.save();
		});
		$("#btn-update").on("click",()=>{
			this.update();
		});
		$("#btn-delete").on("click",()=>{
			this.delete();
		});
	},
	
	save: function() {
		let data = {
			username: $("#username").val(),
			password: $("#password").val(),
			nickname: $("#nickname").val(),
			email: $("#email").val()
		};
		
		$.ajax({
			type: "POST",
			url: "/auth/joinProc",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			alert("회원가입이 완료되었습니다.");
			console.log(resp);
			location.href = "/";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	update: function() {
		let data = {
			id: $("#id").val(),
			username: $("#username").val(),
			password: $("#password").val(),
			nickname: $("#nickname").val(),
			email: $("#email").val()
		};
		
		$.ajax({
			type: "PUT",
			url: "/mypage/modify",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			alert("정보 수정이 완료되었습니다.");
			location.href = "/mypage";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	delete: function() {
		var id = $("#id").val();
		
		$.ajax({
			type: "DELETE",
			url: "/mypage/"+id,
			dataType: "json"
		}).done(function(resp){
			alert("회원 탈퇴가 완료되었습니다.");
			location.href = "/";
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
}

index.init();