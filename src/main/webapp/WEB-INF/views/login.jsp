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
	<h1 align="center">
		jew's webBoard  
	</h1>

	<div class="nav">
		<div class="nav-right-items">	
				
				<% if( session.getAttribute("loginUser")==null){ %>
					<div class="nav-item">
						<a href="/login" style="text-decoration:none">로그인</a>
						<a href="/member/regist" style="text-decoration:none">회원가입</a>
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
			<button class="btn" style="color: white;background: green;" onclick="location.href='/views/memberPageGo'">회원가입</button>	
	</div>

</body>
</html>