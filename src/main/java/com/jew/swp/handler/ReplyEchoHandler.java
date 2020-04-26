package com.jew.swp.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.jew.comm.interceptor.SessionKeys;
import com.jew.domain.Member;
import com.mysql.jdbc.StringUtils;

public class ReplyEchoHandler extends TextWebSocketHandler{
	
	private final Logger logger = LoggerFactory.getLogger(ReplyEchoHandler.class);
	
	/**
	 * 모든 유저의 정보가 들어있다.
	 */
	List<WebSocketSession> sessions=new ArrayList<>();
	
	Map<String,WebSocketSession> userSessions=new HashMap<>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info("afterConnectionEstablished :"+session);
		sessions.add(session);
		String senderId=getId(session);
		userSessions.put(senderId, session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("handleTextMessage : "+session+" : "+message);
		String senderId=getId(session);
		
		/**
		 * 모든 유저에게 브로드캐스팅
		 */
		/*
		for(WebSocketSession sess:sessions) {
			sess.sendMessage(new TextMessage(senderId + ": "+message.getPayload()));
		}
		*/
		
		//protocol: cmd, 댓글 작성자, 게시글작성자,boardNo   (예시 : reply, user2, user1, 3)
		String msg=message.getPayload();
		if(StringUtils.isNullOrEmpty(msg)) {
			
		}else {
			String[] strs=message.getPayload().split(",");
			if(strs!=null&&strs.length==4) {
				String cmd=strs[0];
				String replyWriter=strs[1];
				String boardWriter=strs[2];
				String bno=strs[3];
				
				WebSocketSession boardWriterSession= userSessions.get(boardWriter); 
				if("reply".equals(cmd) && boardWriterSession!=null) {
					TextMessage tmpMsg= new TextMessage(replyWriter+"님이 "+bno+"번 게시글에 댓글을 작성했습니다.");
					boardWriterSession.sendMessage(tmpMsg);
					logger.info("boardWriterSession.sendMessage : "+tmpMsg);
				}
			}
		}
	}

	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession=session.getAttributes();
		Member loginUser=(Member)httpSession.get(SessionKeys.LOGIN);
		
		if(null==loginUser) {
			return session.getId();
		}else {
			return loginUser.getUserId();
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		logger.info("afterConnectionClosed : "+session+" : "+status);
		
	}

}
