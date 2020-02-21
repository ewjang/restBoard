<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

	</style>
</head>
<body>

		<div class="nav">
		<div class="nav-right-items">
			<div class="nav-item">		
				<a href="/views/loginPageGo" style="text-decoration:none">로그인</a>
			</div>
			<div class="nav-item">	
				<a href="/views/memberPageGo" style="text-decoration:none">회원가입</a>			
			</div>
			<div class="nav-item">
				<a href="/board/list" style="text-decoration:none">게시판목록</a>
			</div>
		</div>	
	</div>
</body>
</html>