<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Write</title>


	<!--<script src="//cdn.ckeditor.com/4.14.0/standard/ckeditor.js"></script>  -->
	<script src = "${path}/ckeditor/ckeditor.js"></script>	
	<link rel="stylesheet" href="/resources/css/boardwrite.css">
	
		
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
		글쓰기
	</h1>
	
	<div class="main" align="center">
		<form action="/board/create" method="post">
			<div class="container" align="center">
				<div>
					<span>작성자 : ${loginUser.userId }</span>
					<span>등록일자 : <%=request.getAttribute("calldate") %></span>
					<br/>
					<input type="text" class="form-title" placeholder="제목" name="boardTitle" maxlength="40">
				</div>
					<div>	
						<textarea class="form-content" id="pcontent" placeholder="내용" name="boardContent" maxlength="2000"></textarea>
						<script type="text/javascript">CKEDITOR.replace('pcontent', {height: 400},{width:900});</script>
					</div>	
				</div>
			<input type="submit" value="등록">
		</form>
	</div>
</body>
</html>