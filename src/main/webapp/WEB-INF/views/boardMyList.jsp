<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Board</title>

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
			margin-top : 150px;
		}
		
		#table {display: table; width: 65%;}
		.row {display: table-row;}
		.cell {display: table-cell; padding: 3px; border-bottom: 1px solid #DDD;}
		.col1 { width: 5%;}
		.col2 {width: 30%;}
		.col3 {width: 5%;}
		.col4 {width: 10%;}
		.col5 {width: 15%;}
	</style>
</head>

<body>
<P>  The time on the server is ${serverTime}. </P>

	<h1 align="center">
		게시판 목록  
	</h1>

	<div class="nav">
		<div class="nav-right-items">	
			<div class="nav-item">
				<% if( session.getAttribute("loginUser")==null){ %>
					Please Login in !!!!!
				<% } else { %>
					${loginUser.userName }
				<%} %>
			</div>
			<div class="nav-item">		
				<% if( session.getAttribute("loginUser")==null){ %>
					<a href="/views/loginPageGo" style="text-decoration:none">로그인</a>
				<% } else { %>
					<a href="/logout" style="text-decoration:none">로그아웃</a>
				<%} %>
			</div>
			<div class="nav-item">	
				<a href="/views/memberPageGo" style="text-decoration:none">회원가입</a>			
			</div>
			<div class="nav-item">
				<a href="/board/list" style="text-decoration:none">게시판목록</a>
			</div>
		</div>	
	</div>

	<div align="center" class="container">		
			<div id="table">
				<div class="row">
					<span class="cell col1">순번</span>
					<span class="cell col2">제목</span>
					<span class="cell col3">글쓴이</span>
					<span class="cell col4">등록날짜</span>
					<span class="cell col5">기능</span>
				</div>
					 <c:forEach items="${bdMyList}" var="board">
						 <div class="row">
							<span class="cell col1">${board.boardNo}</span>
							<span class="cell col2" onclick="location.href='/board/detail/${board.boardNo}'">${board.boardTitle }</span>
							<span class="cell col3">${board.userId }</span>
							<span class="cell col4">${board.date }</span>
							<span class="cell col5">
							<c:if test="${loginUser.userId==board.userId }">
								<!-- <button>보기</button>  -->
								<button id="updBtn" style="color: white;background: blue;">수정</button>
								<button id="delBtn" style="color: white;background: red;" onclick="location.href='/board/delete/${board.boardNo}'" >삭제</button>
							</c:if>
							</span>
						</div>
					 </c:forEach>
		    </div>
	</div>
	
	<div style="margin-top: 30px" align="center" class="container-1">
			<button onclick="location.href='/board/write'">글쓰기</button>
			<button style="color: white;background: green;" onclick="location.href='/board/mylist'">내가 쓴 글 목록</button>
	</div>
</body>
</html>