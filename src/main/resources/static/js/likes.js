let start = {
	init: function() {
		$(".likes-img").on("click",()=>{
			this.unlike();
		});
		$(".unlikes-img").on("click",()=>{
			this.like();
		});
	},
	
	unlike: function() {
		let data = {
			boardid: $("#boardid").val(),
			count: $("#count").val(),
			check: $("#check").val()
		};
		
		console.log(data);
		
		$.ajax({
			type: "POST",
			url: "/project/"+boardid+"/unlike",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			let el = document.querySelector('.c__1'+boardid);
			el.innerHTML = "<img src='/images/unlike.png' />";
			let el2 = document.querySelector('.like'+boardid);
			el2.innerHTML = "<b>좋아요 "+(count-1)+"개</b>";
			location.href = "/project/"+boardid;
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	},
	
	like: function() {
		let data = {
			boardid: $("#boardid").val(),
			count: $("#count").val(),
			check: $("#check").val()
		};
		
		console.log(data);
		
		$.ajax({
			type: "POST",
			url: "/project/"+boardid+"/like",
			data: JSON.stringify(data),
			contentType: "application/json; charset=utf-8",
			dataType: "json"
		}).done(function(resp){
			let el = document.querySelector('.c__1'+boardid);
			el.innerHTML = "<img src='/images/like.png' />";
			let el2 = document.querySelector('.like'+boardid);
			el2.innerHTML = "<b>좋아요 "+(count+1)+"개</b>";
			el3.append(myDom);
			location.href = "/project/"+boardid;
		}).fail(function(error){
			alert(JSON.stringify(error));
		});
	}
}

start.init();