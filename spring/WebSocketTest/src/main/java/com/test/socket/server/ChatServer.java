package com.test.socket.server;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.test.socket.domain.Message;

@ServerEndpoint("/chatserver.do")
public class ChatServer {

	//현재 채팅에 참여한 모든 사람들 
	private static List<Session> sessionList;
	
	static {
		sessionList = new ArrayList<Session>();
	}
	
	//HttpSession != Session(websocket용)
	@OnOpen
	public void handleOpen(Session session) {
		
		System.out.println("[LOG] 클라이언트가 접속했습니다.");

		sessionList.add(session);
		
		//System.out.println(sessionList.size());
		 
	}

	@OnMessage
	public void handleMessage(String msg, Session session) {
		
		System.out.println(msg);
		
		Gson gson = new Gson();
		
		//Json Object > (변환) > DTO
		//Gson > DTO
		Message message = gson.fromJson(msg, Message.class);
		
		System.out.println(message);
		
		if (message.getCode().equals("1")) {
			//새로운 유저가 접속했습니다.
		
			for (Session s : sessionList) {
				if (s != session) {
					//나를 제외한 나머지 사람들의 세션 얻어오기
					//얻어낸 세션으로 세션과 연결된 클라이언트에게 데이터 전송 > 새로운 유저 접속 정보 보내기
					
					try {
						s.getBasicRemote().sendText(msg);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		} else if (message.getCode().equals("2")) {
			
			//기존 유저가 나갔습니다.
			sessionList.remove(session);
			
			for (Session s : sessionList) {
				try {
					s.getBasicRemote().sendText(msg);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else if (message.getCode().equals("3")) {
			
			//클라이언트가 보낸 메시지를 다른 클라이언트에게 전달 
			for (Session s : sessionList) {
				if (s != session) {
					try {
						s.getBasicRemote().sendText(msg);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		} else if (message.getCode().equals("4")) {
			
			for (Session s : sessionList) {
				if (s != session) {
					try {
						s.getBasicRemote().sendText(msg);
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	@OnClose
	public void handleOnClose(Session session) {

		System.out.println("[LOG] 클라이언트가 접속 종료했습니다.");
		//sessionList.add(session);
		sessionList.remove(session); //현재 접속한 사람의 세션 제거
		
		
	}

	@OnError
	public void handleError(Throwable e) {

		System.out.println("[LOG] 에러가 발생했습니다." + e.getMessage()) ;
		
	}
}
