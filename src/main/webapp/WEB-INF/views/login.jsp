<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Login</title>
		
	<style>
		.nav{
			height : 70px;
			display : flex;
			border-bottom : 1px solid black;
			align-items : center;
		}
		
		.nav-right-items{
			margin-left : auto;
			display :flex;
		
		}
		
		.nav-item{
			margin-left : 10px;
		}
		
		
		.main{
			margin-top : 230px;
			align-items : center;
		}
		
		.btn{
			display :flex;
		}
	
	</style>
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
	
	<h1 align="center">
		로그인 화면  
	</h1>
	
	<div align="center" class="main">
		<form action="/loginPost" method="POST">
		
			<%if(session.getAttribute("loginUser")==null){ %>
			<div>
				${ loginResult }
			</div>
			<%} %>
			
			<div>	
				<label for="userId">userId</label>
				<input type="text" name="userId">
			</div>
			<div>
				<label for="password">password</label>
				<input type="password" name="userPw">
			</div>
			<div>
				<label for="userCookie">
					<input type="checkbox" id="useCookie" name="useCookie" />Remember
				</label>
			</div>	
			<div>	
				 <button class="btn" style="color: white;background: green;">로그인</button>
			</div>
		</form>
				 <button class="btn" style="color: white;background: green;" onclick="location.href='/views/memberPageGo'">회원가입</button>	
	</div>

</body>
</html>