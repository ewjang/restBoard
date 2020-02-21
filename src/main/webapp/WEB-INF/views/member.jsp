<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
		<title>Member Registration</title>
		
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


<script src="/resources/js/jQuery-2.1.4.min.js"></script>
<!-- <script src="/resources/js/lib/member.js"></script> -->

<body>

	<h1 align="center">
		회원가입  
	</h1>
		<div class="nav">
			<div class="nav-right-items">	
				<div class="nav-item">
				<% if( session.getAttribute("loginUser")==null){ %>
					Please Login in !!!!!
				<% } else { %>
					${loginUser.userName }
				<%} %>
			</div>
			<div class="nav-item">		
				<% if( session.getAttribute("loginUser")==null){ %>
					<a href="/views/loginPageGo" style="text-decoration:none">로그인</a>
				<% } else { %>
					<a href="/logout" style="text-decoration:none">로그아웃</a>
				<%} %>
			</div>
				<div class="nav-item">	
					<a href="/views/memberPageGo" style="text-decoration:none">회원가입</a>			
				</div>
				<div class="nav-item">
					<a href="/board/list" style="text-decoration:none">게시판목록</a>
				</div>
			</div>	
		</div>
	
		<div align="center" class="main">
			<form action="/member/regist" method="post">
				<table>
				
					<tr>
						<td><label for="userId">User ID</label></td>
						<td><input type="text" name="userId"></td>
						<td><button style="color: white;background: green;">Nested ID Check</button></td>
					</tr>
					
					<tr>
						<td><label for="userPw">Password</label></td>
						<td><input type="Password" name="userPw"></td>
					</tr>
					
					<tr>
						<td><label for="userName">Name</label></td>
						<td><input type="text" name="userName"></td>
					</tr>
					
					<tr>
						<td><label for="job">Job</label></td>   <!-- 콤보박스  -->
						<td><input type="text" name="job"></td>
					</tr>
					
					<tr>
						<td><label for="userMail">email</label></td>
						<td><input type="text" name="userMail"></td>
					</tr>
					
					<tr>
						<td><label for="userBirth">Birth</label></td>
						<td><input type="text" name="userBirth"></td>
					</tr>
					
					<tr>
						<td><label for="hobby">Hobby</label></td>
						<td><input type="text" name="hobby"></td>  <!-- 콤보박스  -->
					</tr>
				
				</table>
				
				<button style="color:white;background-color: green;">등록</button>
				<!-- <input style="color: white;background-color: green;" type="button" value="등록" id="memberRegistBtn"/> -->
			</form>
			<br>
		</div>

</body>
</html>