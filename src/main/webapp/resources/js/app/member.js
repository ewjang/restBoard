/**
 * 아이디 중복체크 
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
			contentType : "application/text; charset=UTF-8",
			success : function(data) {
				console.log(data);
				
				alert(data);
			},
			error : function(xhr, status, error) {
				alert("code:" + xhr.status + "\n"
					+ "message:" + xhr.responseText + "\n"
					+ "error:" + error);
			}
		});
	});
	
/**
 * 비밀번호 일치 여부 
 */	
	
$(function(){ 
		 	$('#pw1').keyup(function(){
		      $('#chkNotice').html('');
		    });

		    $('#pw2').keyup(function(){

		        if($('#pw1').val() != $('#pw2').val()){
		          $('#chkNotice').html('비밀번호 일치하지 않음<br><br>');
		          $('#chkNotice').attr('color', '#f82a2aa3');
		        } else{
		          $('#chkNotice').html('비밀번호 일치함<br><br>');
		          $('#chkNotice').attr('color', '#199894b3');
		        }

		    });
	});
});