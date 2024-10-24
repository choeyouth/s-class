package com.test.socket.server;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/server.do")
public class SocketServer {

	//클라이언트가 연결 요청을 했을 때
	@OnOpen
	public void handleOpen() {
		System.out.println("클라이언트가 접속했습니다.");
	}
	
	//클라이언트와의 연결이 종료되었을 때
	@OnClose
	public void handleClose() {
		System.out.println("클라이언트와 연결이 종료되었습니다.");
	}
	
	//클라이언트가 메시지를 전송 + 서버가 수신할 때
	@OnMessage
	public String handleMessage(String msg) {
		System.out.println("클라이언트가 메시지를 보냈습니다. >>> " + msg);
		
		return msg; //응답 메시지(서버 > 클라이언트)
	}
	
	
	//에러 발생
	@OnError
	public void handleError(Throwable e) {
		System.out.println("에러 발생: " + e.getMessage());
	}
	
}
