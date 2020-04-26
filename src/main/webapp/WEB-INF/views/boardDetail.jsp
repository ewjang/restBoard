<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Write</title>
	
	<script src="/resources/js/jQuery-2.1.4.min.js"></script>

	<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" href="/resources/css/boardDetail.css">

</head>
<body>
	
	<jsp:include page="header.jsp"></jsp:include>
	
	<h1 align="center">
		글 읽기  
	</h1>
	
	<p id="boarduserid" style="display: none">${detail.userId }</p>
	<p id="replyuserid" style="display: none">${loginUser.userId }</p>
	
	
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
	
	<div align="center">
		<div class="container-reply">
			<form action="/board/reply/create/${detail.boardNo}" method="post">
				<div class="container-reply-1">
					<h6>${loginUser.userId}님의 Comment</h6>
					<textarea class="form-reply-textarea" type="text" placeholder="댓글을 입력하세요." name="replyContent"></textarea>
					<button id="replyBtn">입력</button>
				</div>
			</form>
		
			<c:forEach items="${rep}" var="reply">
				<div class="container-replay-2">
					<h6>${reply.userId}</h6>
					<h6>${reply.regDate }</h6>
					${reply.replyContent }
					<c:if test="${loginUser.userId==reply.userId }">
						<form action="/board/reply/delete/${detail.boardNo}/${reply.replyNo}" method="post">
							<input type="hidden" name="_method" value="delete" />
							<button type="submit">댓글 삭제</button>
						</form>
					</c:if>	
					
				</div>
			</c:forEach>
		</div>
	</div>
	
	 <div align="center">
      	<table>
			<tr>
			    <c:if test="${pageMaker.prev}">
			    <td>
			        <a href='<c:url value="/board/detail/${detail.boardNo }?page=${pageMaker.startPage-1}"/>'>&laquo;</a>
			    </td>
			    </c:if>
			    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			    <td>
			        <a href='<c:url value="/board/detail/${detail.boardNo }?page=${idx}"/>'>${idx}</a>
			    </td>
			    </c:forEach>
			    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
			    <td>
			        <a href='<c:url value="/board/detail/${detail.boardNo }?page=${pageMaker.endPage+1}"/>'>&raquo;</a>
			    </td>
			    </c:if>
			</tr>
		</table>
      </div>
      <!--websocket 테스트 
      <div class="well">
      	<input type="text" id="msg" value="1212" class="form-control"/>
      	<button id="btnSend">Send Message</button>
      </div>
   	   -->	
   	
	<script>
	
   	
   	//댓글 작성시 게시판 글 작성자에게 알림 메시지 전달
   	 

   /*websocket 테스트
   	*
   	$('#btnSend').on('click', function(evt) {
   		evt.preventDefault();
   		if (socket.readyState !== 1)
   			return;
   		let msg = $('input#msg').val();
   		socket.send(msg);
   	});
    */
    
   	$('#replyBtn').on('click',function(){
   		var boardUserId=document.getElementById('boarduserid').innerText;
   		var replyUserId=document.getElementById('replyuserid').innerText;
   		var boardNo=${detail.boardNo};
   		console.log("reply.js::socket>>",socket);
		if(socket){
			let socketMsg="reply,"+replyUserId+","+boardUserId+","+boardNo;
			console.log("sssssssmsg>>",socketMsg);
			socket.send(socketMsg);
		}
   	});
	</script>
	
</body>
</html>