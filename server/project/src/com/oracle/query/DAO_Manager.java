package com.oracle.query;

import java.util.Scanner;

public class DAO_Manager {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);
		BasicInfo db = new BasicInfo();
		
		 while (true) {
	            System.out.println("=============================");
	            System.out.println("      관리자 메뉴입니다.");
	            System.out.println("  원하시는 메뉴를 고르세요");
	            System.out.println("                         ");
	            System.out.println("       1. 단어 관리");
	            System.out.println("       2. 명언 관리");
	            System.out.println("     3. 책 리뷰 관리");
	            System.out.println("       4. 종료하기");
	            System.out.println("-----------------------------");
	            System.out.print("원하시는 메뉴 번호를 입력하세요: ");
	            int choice = scan.nextInt();
	            
	            if(choice == 1) {
	            	System.out.println("단어관리 메뉴입니다");
	            	System.out.println("원하시는 기능을 고르세요");
	            	System.out.println("1. 수정");
	            	System.out.println("2. 삭제");
	            	System.out.println("3. 입력");
	            	System.out.print("선택 : ");
	            	int subchoice = scan.nextInt();
	            	if(subchoice == 1) {
	            		String query = "select * from tblWordList";
	            		
	            		db.executeQuery(query);
	            		
	            		String updateQuery = "UPDATE tblWordList SET title = '새로운 제목' WHERE seq = 1";
	            		//db.updateData(updateQuery);
	            	}
	            }
		 }
	}
}
