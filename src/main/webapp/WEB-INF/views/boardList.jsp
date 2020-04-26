<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Board</title>
	
	<script src="/resources/js/jQuery-2.1.4.min.js"></script>
	<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="/resources/css/boardList.css">
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<h1 align="center">
		게시판 목록  
	</h1>
	
	<div align="center" class="container">		
			<div id="table">
				<div class="row">
					<span class="cell col1">순번</span>
					<span class="cell col2">제목</span>
					<span class="cell col3">글쓴이</span>
					<span class="cell col4">등록날짜</span>
					<span class="cell col5">수정날짜</span>
					<span class="cell col6">기능</span>
				</div>
					 <c:forEach items="${bdList}" var="board">
						 <div class="row">
							<span class="cell col1">${board.boardNo}</span>
							<span class="cell col2" onclick="location.href='/board/detail/${board.boardNo}'">${board.boardTitle }</span>
							<span class="cell col3">${board.userId }</span>
							<span class="cell col4">${board.regDate }</span>
							<span class="cell col5">${board.updDate }</span>
							<span class="cell col6">
							<c:if test="${loginUser.userId==board.userId }">
								<form action="/board/update/${board.boardNo}" method="GET">
									<button id="updBtn" style="color: white;background: blue;" onclick="location.href='/board/update/${board.boardNo}'" >수정</button>
								</form>
								<form action="/board/delete/${board.boardNo}" method="POST">
									<input type="hidden" name="_method" value="delete"/>
									<input id="delBtn" type="submit" style="color: white;background: red;" value="삭제"/>
								<!--<button id="delBtn" style="color: white;background: red;">삭제</button> -->
								</form>
							</c:if>
							</span>
						</div>
					 </c:forEach>
		    </div>
		    
		    <div align="center">
                    <table>
						<tr>
						    <c:if test="${pageMaker.prev}">
						    <td>
						        <a href='<c:url value="/board/list?page=${pageMaker.startPage-1}"/>'>&laquo;</a>
						    </td>
						    </c:if>
						    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						    <td>
						        <a href='<c:url value="/board/list?page=${idx}"/>'>${idx}</a>
						    </td>
						    </c:forEach>
						    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						    <td>
						        <a href='<c:url value="/board/list?page=${pageMaker.endPage+1}"/>'>&raquo;</a>
						    </td>
						    </c:if>
						</tr>
					</table>
             </div>	  
	</div>
	
	<div style="margin-top: 30px" align="center" class="container-1">
			<button onclick="location.href='/board/write'">글쓰기</button>
			<button style="color: white;background: green;" onclick="location.href='/board/mylist'">내가 쓴 글 목록</button>
	</div>
		
</body>
</html>