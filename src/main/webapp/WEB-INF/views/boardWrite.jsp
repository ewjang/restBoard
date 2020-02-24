<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			margin-top : 150px;
		}
	</style>
</head>
<body>
		<P>  The time on the server is ${serverTime}. </P>

	<h1 align="center">
		글쓰기  
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
				<%} %>
			<div class="nav-item">
				<a href="/board/list" style="text-decoration:none">게시판목록</a>
			</div>
		</div>	
	</div>

	<div class="main" align="center">
		<form action="/board/create" method="post">
			<table>
				<thead>
					<tr>
						<th colspan="2" style="background-color: green;">글쓰기 작성</th>				
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="제목" name="boardTitle" maxlength="40"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="내용" name="boardContent" maxlength="2000" style="height: 350px;"></textarea></td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" name="userId" value="${loginUser.userId }" maxlength="40" readonly="readonly"></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="등록">
		</form>
	</div>
</body>
</html>