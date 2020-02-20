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
				<a href="/views/loginPageGo" style="text-decoration:none">로그인</a>
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
		<div>			
			<table border="1" >
				
				<thead>
					<tr>
						<th>순번</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>등록날짜</th>
						<th colspan="3">기능</th>
					</tr>
				</thead>
				<tbody>
					 <c:forEach items="${bdList}" var="board">
						<tr>
							<td>${board.boardNo}</td>
							<td>${board.boardTitle }</td>
							<td>${board.userId }</td>
							<td>${board.date }</td>
							<td><button>보기</button></td>
							<td><button>수정</button></td>
							<td><button>삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
		
			</table>
		</div>
		<div class="container-1">
			<button onclick="location.href='/board/write'">글쓰기</button>
				<button style="color: white;background: green;" onclick="location.href='/views/memberPageGo'">회원가입</button>
		</div>
	</div>
</body>
</html>