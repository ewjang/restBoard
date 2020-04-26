<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>Login</title>
		
	<style>
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
	<jsp:include page="header.jsp"></jsp:include>
	
	
	<h1 align="center">
		메일 인증대기 화면 
		<br/>
		<br/>
		회원가입시 입력하신 메일주소로 본인 인증을 위한 메일을 발송하였습니다.
		
		인증 후 로그인이 가능합니다.
	</h1>
	

	
</body>
</html>