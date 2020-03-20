<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
		<title>Member Registration</title>
		
		<script src="/resources/js/jQuery-2.1.4.min.js"></script>
		<script src="/resources/js/app/member.js"></script>
		
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
				margin-top : 130px;
				align-items : center;
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
	
	<h1 align="center">
		회원가입  
	</h1>
	
		<div align="center" class="main">
			<form action="/member/regist" method="post">
				
					
						<label for="userId">유저 ID</label>
						<input type="text" id="userId" name="userId" required>
						<button type="button" id="idChkBtn">중복  확인</button>
						<br/>
						
						<label for="userPw">비밀번호</label>
						<input type="Password" class="pw" id="pw1" name="userPw" required>
						<br/>
						
						<label for="userPw">비밀번호 확인</label>
						<input type="Password" id="pw2" required>
						<br/>
					
						<font id="chkNotice" size="2"></font>
						<br/>
					
						<label for="userName">이름</label>
						<input type="text" name="userName" required>
						<br/>
						
						<label for="job">직업</label>
						<input type="text" name="job">
						<br/>
						
						<label for="userMail">메일</label>
						<input type="email" id="userMail" name="userMail" placeholder="*본인 인증용 이메일*" required>
						<br/>
						
						<label for="userBirth">생년월일</label>
						<input type="date" name="userBirth">
						<br/>
											
						<label for="hobby">취미</label>
						<input type="text" name="hobby">
						<br/>
						
				<button style="color:white;background-color: green;">등록</button>
				
			</form>
			<br>
		</div>

</body>
</html>