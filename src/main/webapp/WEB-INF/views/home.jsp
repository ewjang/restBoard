<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>

<head>
	<title>Home</title>
</head>

<body>
<P>  The time on the server is ${serverTime}. </P>

<h1 align="center">
	메인화면  
</h1>

	<div align="center">
		<table>
			<tr>		
				<td><a href="/views/loginPageGo">로그인</a></td>
				<td><a href="/views/memberPageGo">회원가입</a></td>			
			</tr>
		</table>
	</div>
<hr>
<br>
<br>

</body>
</html>
