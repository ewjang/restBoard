	/*
$(document).ready(function(){
	
	$("#memberRegistBtn").on("click", function(){
		
		var memberData = {
			userId : $("#userId").val(),
			userPw : $("#userPw").val(),
			userName : $("#userName").val(),
			userMail : $("#userMail").val(),
			userBirth : $("#userBirth").val(),
			hobby : $("#hobby").val(),
			job : $("#job").val()
		};
		
		alert(JSON.stringify(memberData));
		
		console.log(memberData);
		
		$.ajax({
			type : "POST",
			url  : "/member/regist",
			data : JSON.stringify(memberData),
			contentType : "application/json; charset=UTF-8",
			success : function(){
				alert("Regist Success");
			},
			error : function(){
				alert("Regist Fail");
			}
		});
	});
});*/


