<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Member update</title>
	
	<link rel="stylesheet" href="/resources/css/memberUpd.css">
	<script src="/resources/js/jQuery-2.1.4.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="/resources/js/addressapi.js"></script>
	<script src="/resources/js/app/member.js"></script>

	<script>
		function execPostCode() {
	         new daum.Postcode({
	             oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	 
	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	 
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                console.log(data.zonecode);
	                console.log(fullRoadAddr);
	               
	                $("[name=addr1]").val(data.zonecode);
	                $("[name=addr2]").val(fullRoadAddr);
	            }
	         }).open();
	     }
	</script>
			
</head>

<body>
		<h1 align="center">
			jew's webBoard  
		</h1>
		
		<div class="nav">
			<div class="nav-right-items">	
					<% if( session.getAttribute("loginUser")==null){ %>
						<div class="nav-item">
							<a href="/views/loginPageGo" style="text-decoration:none">로그인</a>
						</div>
						<div class="nav-item">
							<a href="/views/memberPageGo" style="text-decoration:none">회원가입</a>
						</div>		
					<% } else { %>
						<div class="nav-item">
							<a href="/logout" style="text-decoration:none">로그아웃</a>
						</div>
						<div class="nav-item">
							<a href="/member/update/${loginUser.userId }" style="text-decoration:none">회원정보수정</a>
						</div>
						<div class="nav-item">
							<a href="/board/list" style="text-decoration:none">게시판목록</a>
						</div>
					<%} %>
			</div>	
		</div>
		
		<div class="sign-up-form">
			<h1>회원정보 수정</h1>
			<form action="/member/update" method="post">
	
				<!-- 유저 아이디  -->
				<div class="">
				<input type="text" class="input-box" id="userId" name="userId" value="${update.userId }" readonly="readonly">
				</div>
				<br/>
			
				<!-- 비밀번호  -->
				<input type="Password" class="input-box" id="pw1" name="userPw" placeholder="비밀번호" required>
				<br/>
				
				<!-- 비밀번호 재입력-->
				<input type="Password" class="input-box" id="pw2" placeholder="비밀번호 재입력" required>
				<br/>
				
				<font id="chkNotice" size="2"></font>
				<br/>
				
				<!-- 이름 -->
				<input type="text" class="input-box" name="userName" value="${update.userName }" placeholder="이름" required>
				<br/>
				
				<!-- 직업 -->
				<input type="text" class="input-box" name="job" value="${update.job }" placeholder="직업">
				<br/>
				
				<!-- 주소  -->
				<div class="form-group">                   
					<input class="input-box" placeholder="우편번호" name="addr1" id="addr1" type="text" value="${update.addr1}" readonly="readonly" >
					<button type="button" class="smallbtn" onclick="execPostCode();"><i class="fa fa-search"></i>찾기</button>                               
				</div>
				<div class="form-group">
			    	<input class="input-box" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" value="${update.addr2}" readonly="readonly" />
				</div>
				<div class="form-group">
					<input class="input-box" placeholder="상세주소" name="addr3" id="addr3" type="text" value="${update.addr3}"  />
				</div>
				<br/>
				
				<!-- 메일 -->
				<input type="email" class="input-box" name="userMail" value="${update.userMail }" placeholder="*본인 인증용 이메일*" required>
				<br/>
				
				<!-- 생년월일  -->
				<input type="date" class="input-box" name="userBirth" value="${update.userBirth }" placeholder="생년월일">
				<br/>
				
				<!-- 취미 -->
				<input type="text" class="input-box" name="hobby" value="${update.hobby }" placeholder="취미">
				<br/>
						
				<button style="color:white;background-color: green;">수정 등록</button>
				<hr/>
			</form>
				<button style="color:white;background-color: black;" onclick="location.href='/member/delete/${update.userId}'">계정 삭제</button>
		</div>
</body>
</html>