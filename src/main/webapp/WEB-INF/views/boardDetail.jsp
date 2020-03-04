<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Write</title>

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
		
		.container{
			margin-top : 80px;
		}
		
		.form-title{
			wifth : 900px;
		}
		.form-content{
			height : 400px;
			width : 900px;
			align-items :center;
			margin-top : 10px;
			overflow:auto;
		}
		
		.container-reply{
			width : 900px;
			background-color:silver;
			margin-left : 500px;
		}
		
		.container-reply-1{
			padding-top : 10px;
			padding-left : 10px;
			border-bottom: 1px solid black;
		}
		
		.form-reply-textarea{
			padding-top : 5px;
			padding-left : 10px;
			width : 700px;
			height : 40px;
		}
		
		.container-replay-2{
			padding-top : 5px;
			padding-left : 10px;
			padding-bottom: 5px;
			border-bottom: 1px solid black;
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
		글 읽기  
	</h1>

	<div class="container" align="center">
		<div>
			<span>작성자 : ${detail.userId }</span>
			<span>등록일자 : ${detail.regDate }</span>
			<br/>
			<span class="form-title">제목 : ${detail.boardTitle }</span>
		</div>
			<div>	
			<textarea class="form-content" placeholder="내용" name="boardContent" maxlength="2000" readonly="readonly">${detail.boardContent }</textarea>
		</div>	
	</div>
	
	<div class="container-reply">
		<form action="/board/reply/create/${detail.boardNo}" method="post">
			<div class="container-reply-1">
				<h6>${loginUser.userId}님의 Comment<h6>
				<textarea class="form-reply-textarea" type="text" placeholder="댓글을 입력하세요." name="replyContent"></textarea>
				<button>입력</button>
			</div>
		</form>
		
		<c:forEach items="${rep}" var="reply">
			<div class="container-replay-2">
				<h6>${reply.userId}<h6>
				<h6>${reply.regDate }</h6>
				${reply.replyContent }
			</div>
		</c:forEach>
	</div>
</body>
</html>