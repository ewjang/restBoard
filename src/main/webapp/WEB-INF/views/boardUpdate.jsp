<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Write</title>

	
	<script src = "${path}/ckeditor/ckeditor.js"></script>	
	<link rel="stylesheet" href="/resources/css/boardUpdate.css">
	
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<h1 align="center">
		글 수정  
	</h1>

	<div class="container" align="center">
			<form action="/board/update/${update.boardNo}" method="POST">
				
				<div>
					<input type="text" name="userId" value="${update.userId }" style="display: none">
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