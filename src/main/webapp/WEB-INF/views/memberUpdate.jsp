<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Member update</title>
	
	<link rel="stylesheet" href="/resources/css/memberUpdate.css">
	
	<script src="/resources/js/jQuery-2.1.4.min.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="/resources/js/addressapi.js"></script>
	<script src="/resources/js/app/member.js"></script>
	<script src="/resources/js/app/postcode.js"></script>
		
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>	
		
	<div class="sign-up-form">
		<h1>회원정보 수정</h1>
		<form action="/member/update" method="POST">
			
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
			
			<div>
				<input type="hidden" name="_method" value="put" />
				<button type="submit" style="color:white;background-color: green;">수정 등록</button>
			</div>
			<hr/>
		</form>
		<form action="/member/delete/${update.userId }" method="POST">
			<div>
				<input type="hidden" name="_method" value="delete" />
				<button type="submit" style="color:white;background-color: black;">계정 삭제</button>
			</div>
		</form>
	</div>
</body>
</html>