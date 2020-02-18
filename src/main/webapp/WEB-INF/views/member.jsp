<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
		<title>Member Registration</title>
</head>


<script src="/resources/js/jQuery-2.1.4.min.js"></script>
<!-- <script src="/resources/js/lib/member.js"></script> -->

<body>

	<h1 align="center">
		회원가입  
	</h1>
	<hr>
	<br>
	<br>
		<div align="center" class="container">
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