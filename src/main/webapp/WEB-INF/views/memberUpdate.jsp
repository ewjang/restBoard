<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
		<title>Member update</title>
		
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
			회원정보 수정
		</h1>
		
		<div align="center" class="main">
			<form action="/member/update" method="post">
				<table>
				
					<tr>
						<td><label for="userId">User ID</label></td>
						<td><input type="text" name="userId" value="${update.userId }" readonly="readonly"></td>
					</tr>
					
					<tr>
						<td><label for="userPw">Password</label></td>
						<td><input type="Password" name="userPw"></td>
					</tr>
					
					<tr>
						<td><label for="userName">Name</label></td>
						<td><input type="text" name="userName" value="${update.userName }"></td>
					</tr>
					
					<tr>
						<td><label for="job">Job</label></td>
						<td><input type="text" name="job" value="${update.job }"></td>
					</tr>
					
					<tr>
						<td><label for="userMail">email</label></td>
						<td><input type="text" name="userMail" value="${update.userMail }"></td>
					</tr>
					
					<tr>
						<td><label for="userBirth">Birth</label></td>
						<td><input type="text" name="userBirth" value="${update.userBirth }"></td>
					</tr>
					
					<tr>
						<td><label for="hobby">Hobby</label></td>
						<td><input type="text" name="hobby" value="${update.hobby }"></td>  <!-- 콤보박스  -->
					</tr>
				
				</table>
				
				<button style="color:white;background-color: green;">등록</button>
				<!-- <input style="color: white;background-color: green;" type="button" value="등록" id="memberRegistBtn"/> -->
			</form>
				<button style="color:white;background-color: black;" onclick="location.href='/member/delete/${update.userId}'">삭제</button>
			
		</div>

</body>
</html>