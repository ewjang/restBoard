<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<link rel="stylesheet" href="/resources/css/header.css">
	<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
</head>
<body>
	<div id="socketAlert" class="alert alert-primary" role="alert" style="display: none;">
  			A simple primary alert—check it out!
	</div>
	
	<h1 align="center">
		jew's webBoard  
	</h1>

	<div class="nav">
		<div class="nav-right-items">	
				
				<% if( session.getAttribute("loginUser")==null){ %>
					<div class="nav-item">
						<a href="/login" style="text-decoration:none">로그인</a>
					</div>
						<div class="nav-item">
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
	
	<script>
	var socket = null;
   	$(document).ready(function(){
   		connectWS();

   	});

   	function connectWS() {
   		console.log("tttttttttttttttttttttttttt");
   		var ws = new WebSocket("ws://localhost:8080/replyEcho?bno=1234");
   		socket = ws;

   		ws.onopen = function() {
   			console.log('info : connection opened.');
   		};

   		ws.onmessage = function(event) {
   			console.log("ReceiveMessage : " + event.data + '\n');
   			let $socketAlert = $('div#socketAlert');
   			$socketAlert.html(event.data);
   			$socketAlert.css('display','block');
   		};

   		ws.onclose = function(event) {
   			console.log('info:connection closed.');
   			// setTimeout(function(){ connect(); },1000);
   		};

   		ws.onerror = function(err) {
   			console.log('err:', err);
   		};
   	}
   	
	</script>
	
</body>
</html>