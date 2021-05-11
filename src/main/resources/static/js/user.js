let index = {
	init: function() {
		$(".dupl-btn").on("click",()=>{
			this.check();
		});
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
		var username = $("#username").val().trim();
		
		let data = {
			username: $("#username").val(),
			password: $("#password").val(),
			passwordConfirm: $("#passwordConfirm").val(),
			nickname: $("#nickname").val(),
			email: $("#email").val()
		};
		
		if(username == 0) {
			alert("아이디를 입력해주세요.");
			$("#username").focus();
			return false;
		} else if(data.password == 0) {
			alert("비밀번호를 입력해주세요.");
			$("#password").focus();
			return false;
		} else if(data.passwordConfirm == 0) {
			alert("비밀번호를 입력해주세요.");
			$("#passwordConfirm").focus();
			return false;
		} else if(data.password != data.passwordConfirm) {
			alert("비밀번호가 일치하지 않습니다.");
		} else if(data.nickname == 0) {
			alert("닉네임을 입력해주세요.");
			$("#nickname").focus();
			return false;
		} else if(data.email == 0) {
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return false;
		} else if($("#policy").is(":checked") == false) {
			alert("약관에 동의해주세요.");
			return false;
		}
		
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
		
		console.log(data);
		
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
	
	check: function() {
		var pattern = /^([a-z0-9]){6,12}$/;
		
		if(!pattern.test($("#username").val())){
			alert("아이디는 영문 소문자 및 숫자 포함 6 ~ 12자이어야 합니다.");
			$("#chkValidation").html('<p class="chkValidation">영문소문자 숫자포함 6~12자를 입력하세요</p>');
		} else {
			let data = {
				username: $("#username").val()
			}
			
			$.ajax({
				url: "/auth/chkValidation",
				type: "POST",
				data: JSON.stringify(data),
				contentType: "application/json; charset=utf-8",
				dataType: "json",
				success: function(data) {
					if(data == 0) {
						$("#chkValidation").css("color","red");
						$("#chkValidation").html('<p id="chkValidation">사용하실 수 있는 아이디입니다.</p>');
						$(".dupl-btn").attr("disabled",false);
						document.userInfo.idDuplication.value="idCheck";
					} else {
						$("#chkValidation").css("color","red");
						$(".dupl-btn").attr("disabled",true);
						$("#chkValidation").html('<p id="chkValidation">중복된 아이디가 존재합니다.</p>');
					}
				}
			}).done(function(resp){
			}).fail(function(error){
				alert(JSON.stringify(error));
			});
		}
	}
	
}

index.init();