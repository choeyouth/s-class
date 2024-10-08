package com.test.java.obj;

public class Ex33_Class {

	public static void main(String[] args) {
		
		User u1 = new User();
		
		String[] nick = { "코딩초보", "에러마왕", "오타쟁이" };
		
		u1.setName("홍길동");
		u1.setId("hong");
		
		u1.setNick(nick);
		
		// 별명이 여러개일 때 
		//u1.setNick("코딩초보");
		//u1.setNick("에러마왕");
		//u1.setNick("오타쟁이"); // 덮어쓰기 
		
		// 전부 다 넣고싶을 때
		//u1.setNick("코딩초보, 에러마왕, 오타쟁이"); // X -변수 하나에는 더이상 쪼갤 수 없는 값만 넣어야 함 
		
		// 클래스를 다시 만들어야 함
		
		
		
		System.out.println(u1);
		
		//방금 만든 객체(u1)의 상태를 확인하고 싶다. > 개발자 업무
		System.out.println(u1.getName());
		System.out.println(u1.getId());
		System.out.println(u1.getNick()); 
		
		System.out.println(u1.info()); // 디버깅용(덤프)
		// 출력: 이름(홍길동), 아이디(hong), 별명(코딩초보)
		
		System.out.println();
		
		
		
		// 홍길동 별명?
		//System.out.println(u1.getNick()); // [Ljava.lang.String;@6f75e721 -> for문
		
		for (int i=0; i<u1.getNick().length; i++) {
			System.out.println("별명: " + u1.getNick()[i]); // 메서드가 돌려준 배열에 방번호 
		}
		
		
		
		Person p1 = new Person();
		
		p1.setName("홍길동");
		p1.setAge(20);
		
		//매개변수가 배열일 때, 객체를 생성하면 손이 많이 감
//		String[] nickList = new String[3];
//		nickList[0] = "강아지";
//		nickList[1] = "고양이";
//		nickList[2] = "병아리";
//		p1.setNick(nickList);
		
		
		p1.addNick("강아지");
		p1.addNick("고양이");
		p1.addNick("병아리");
		
		System.out.println(p1.info());
		
		System.out.println(p1.getNick(0));
		System.out.println(p1.getNick(1));
		System.out.println(p1.getNick(2));
		
		
		
		
		
		
		
	}
	
}
