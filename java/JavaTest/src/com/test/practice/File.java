package com.test.practice;

import java.util.Scanner;

public class File {

	public static void main(String[] args) {
		
		boolean loop = true;
		Scanner scan = new Scanner(System.in);
		
		while(loop) {
			
			System.out.println("=============");
			System.out.println("   성적관리");
			System.out.println("=============");
			System.out.println("1. 성적추가");
			System.out.println("2. 성적확인");
			System.out.println("3. 성적수정");
			System.out.println("4. 성적삭제");
			System.out.println("5. 종료");
			System.out.println("-------------");
			
			System.out.print("선택(번호): ");
			
			String sel = scan.nextLine();
			
			if(sel.equals("1")) {
				
			} else if(sel.equals("2")) {
				
			} else if(sel.equals("3")) {
				
			} else if(sel.equals("4")) {
				
			} else {
				loop = false;
			}
			
		}
		
		System.out.println("프로그램을 종료합니다.");
		
		
	}
	
}
