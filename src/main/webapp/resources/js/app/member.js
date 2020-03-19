/**
 * 
 */
$(document).ready(function(){
	
	$("#idChkBtn").on("click",function(){
		
		var userId = $("#userId").val();
		
		if(!userId){
			alert('아이디를 입력해주시기 바랍니다.');
			return false;
		}else{
			alert('입력하신 아이디 [ '+$("#userId").val()+'] 가 중복된 아이디인지 확인합니다.');
		}
		
		$.ajax({
			type : "GET",
			url : "/member/idchk/"+$("#userId").val(),
			contentType : "application/json; charset=UTF-8",
			success : function(data) {
				console.log(data);
				
				alert(JSON.stringify(data));
			},
			error : function(xhr, status, error) {
				alert("code:" + xhr.status + "\n"
					+ "message:" + xhr.responseText + "\n"
					+ "error:" + error);
			}
		});
	});

});