package com.oracle.dao;

import java.util.Scanner;

// 출력 담당 클래스 
public class View {

	public void loginMenu() {
		
		System.out.println();
		System.out.println("=====================");
		System.out.println("        로그인 ");
		System.out.println("=====================");
		System.out.println("1. 로그인");
		System.out.println("2. 아이디 찾기");
		System.out.println("3. 비밀번호 찾기");
		System.out.println("4. 회원가입");
		System.out.println("0. 관리자 로그인");
		System.out.println("*. 종료");
		System.out.println("---------------------");
		System.out.print("선택(번호): ");
		
	}

	public void mainView() {
		
		System.out.println();
		System.out.println("=====================");
		System.out.println("        메인 메뉴 ");
		System.out.println("=====================");
		System.out.println("1. 도서 검색");
		System.out.println("2. 도서 리뷰");
		System.out.println("3. 토론 게시판");
		System.out.println("4. 도서 평점");
		System.out.println("5. 도서 명대사");
		System.out.println("6. 단어 검색");
		System.out.println("7. 명언 검색");
		System.out.println("8. 선호도 조사");
		System.out.println("0. 종료");
		System.out.println("---------------------");
		System.out.print("선택(번호): ");
		
	}
	
	public void findLogin(String type) {
		
		System.out.println();
		System.out.println("=======================");
		System.out.println(" " + type + " 찾기 서비스입니다. ");
		System.out.println("-----------------------");
		System.out.println();
		System.out.println("전화번호 또는 이메일 중 어떤 방식을 통해 인증하시겠습니까?");
		System.out.println();
		System.out.println("1. 전화번호");
		System.out.println("2. 이메일");
		System.out.println("-----------------------");
		System.out.print("선택(번호): ");
	}
	
	public void pause() {
		
		System.out.println();
		System.out.println("계속 진행하시려면 엔터를 입력하세요.");
		Scanner scan = new Scanner(System.in);
		scan.nextLine();
		System.out.println();
		
	}
	
	public void sleep(int i) {
		try {
		    Thread.sleep(i); //대기
		} catch (InterruptedException e) {
		    e.printStackTrace();
		}
	}
	
	public void select() {
		System.out.println();
		System.out.println("계속 진행하시려면 1번을, 종료하시려면 다른 번호를 입력해주세요. ");
		System.out.print("선택(번호): ");
	}

}
