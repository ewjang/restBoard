<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
		<title>Member Registration</title>
		
		<link rel="stylesheet" href="/resources/css/member.css">
		
		<script src="/resources/js/jQuery-2.1.4.min.js"></script>
		<script src="/resources/js/app/member.js"></script>		
		<script src="/resources/js/app/postcode.js"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="/resources/js/addressapi.js"></script>
</head>

<body>
		<jsp:include page="header.jsp"></jsp:include>
	
		<div class="sign-up-form">
			<h1>회원가입</h1>
			<form action="/member/regist" method="post">
				
				<!-- 유저 아이디 -->
				<div>
					<input type="text" class="input-box" id="userId" name="userId" placeholder="아이디" required>
					<button class="smallbtn"type="button" id="idChkBtn">확인</button>
				</div>
				<br/>
				
				<!-- 비밀번호 -->
				<input type="Password" class="input-box" id="pw1" name="userPw" placeholder="비밀번호" required>
				<br/>
				
				<!-- 비밀번호 재입력-->
				<input type="Password" class="input-box" id="pw2" placeholder="비밀번호 재입력" required>
				<br/>
			
				<font id="chkNotice" size="2"></font>
				<br/>
			
				<!-- 이름 -->
				<input type="text" class="input-box" name="userName" placeholder="이름" required>
				<br/>
				
				<!-- 직업 -->
				<input type="text" class="input-box" name="job" placeholder="직업">
				<br/>
				
				
				<div class="form-group">
					<!-- 주소 -->                   
					<input class="input-box" placeholder="우편번호" name="addr1" id="addr1" type="text" readonly="readonly" >
					<button type="button" class="smallbtn" onclick="execPostCode();"><i class="fa fa-search"></i>찾기</button>                               
				</div>
				<div class="form-group">
			    	<input class="input-box" style="top: 5px;" placeholder="도로명 주소" name="addr2" id="addr2" type="text" readonly="readonly" />
				</div>
				<div class="form-group">
					<input class="input-box" placeholder="상세주소" name="addr3" id="addr3" type="text"  />
				</div>
				<br/>
				
				<!-- 메일 -->
				<input type="email" class="input-box" id="userMail" name="userMail" placeholder="*본인 인증용 이메일*" required>
				<br/>
				
				<!-- 생년월일 -->
				<input type="date" class="input-box" name="userBirth" placeholder="생년월일">
				<br/>
									
				<!-- 취미 -->
				<input type="text" class="input-box" name="hobby" placeholder="취미">
				<br/>
				
				<button style="color:white;background-color: green;">등록</button>
				
			</form>
		</div>
	
</body>
</html>