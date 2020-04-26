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
	<jsp:include page="header.jsp"></jsp:include>
	
	
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