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
	</style>
	
	<script src = "${path}/ckeditor/ckeditor.js"></script>	
	<link rel="stylesheet" href="/resources/css/boardUpdate.css">
	
</head>
<body>
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
	
	<h1 align="center">
		글 수정  
	</h1>

	<div class="container" align="center">
			<form action="/board/update/${update.boardNo}" method="POST">
				
				<div>
					<span>작성자 : ${update.userId }</span>
					<span>등록일자 : ${update.regDate }</span>
					<br/>
					<input type="text" class="form-title" placeholder="제목" name="boardTitle" value="${update.boardTitle }" maxlength="40">
				</div>
				<div>	
					<textarea class="form-content" id="pcontent" name="boardContent" maxlength="2000" style="height: 350px;">${update.boardContent }</textarea>
					<script type="text/javascript">CKEDITOR.replace('pcontent', {height: 400},{width:900});</script>
				</div>
					<input type="hidden" name="_method" value="put" />
					<input type="submit" value="등록">
			</form>
	</div>
</body>
</html>