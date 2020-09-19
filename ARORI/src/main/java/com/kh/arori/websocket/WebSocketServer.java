package com.kh.arori.websocket;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class WebSocketServer extends TextWebSocketHandler {

	// 사용자 저장소 > 동기화
	private Set<WebSocketSession> users = new CopyOnWriteArraySet<WebSocketSession>();
	
	
	// 웹 소켓에 연결되었을 때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// 접속한 유저 웹 소켓 세션에 추가
		users.add(session);
		log.info("{} 연결 끊김.", session.getAttributes());
	}
	
	// 소켓에 메세지를 보을 때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		if(!StringUtils.isEmpty(msg)) {
			String[] strs = msg.split(",");
			
			if(strs != null && strs.length == 5) {
				String cmd = strs[0]; // cmd
 				String caller = strs[1]; // 새 글 작성자 번호
				String receiver = strs[2]; // 클래스 주인 번호 
				String reciverEmail = strs[3]; // ?
				String seq = strs[4];
				
				// 작성자가 로그인 해 있다면 
//				WebSocketSession boardWriterSession = users
			}
		}
	}

	// 웹 소켓과 연결이 끊겼을 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
	}
}
