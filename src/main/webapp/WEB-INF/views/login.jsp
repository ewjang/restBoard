<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Login</title>
		
		<link rel="stylesheet" href="/resources/css/login.css">
		
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="sign-in-form">
		<h1>로그인 화면 </h1>
		
		<form action="/loginPost" method="POST">
		
			<%if(session.getAttribute("loginUser")==null){ %>
			<div>
				${ loginResult }
			</div>
			<%} %>
					
			<!--아이디 -->
			<input type="text" class="input-box" name="userId" placeholder="아이디를 입력해주세요." required>
			<!--비밀번호  -->
			<input type="password" class="input-box" name="userPw" placeholder="비밀번호를 입력해주세요." required>
				
			<label for="userCookie">
				<input type="checkbox" id="useCookie" name="useCookie" />Remember
			</label>
			
			<br/>
			<button class="btn" style="color: white;background: green;">로그인</button>			
		</form>
			<hr>
			<button class="btn" style="color: white;background: green;" onclick="location.href='/member/regist'">회원가입</button>	
	</div>

</body>
</html>