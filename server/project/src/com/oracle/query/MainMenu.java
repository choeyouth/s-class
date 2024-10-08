package com.oracle.query;

import java.util.Scanner;

import com.oracle.query.BookSearchAndSave;

public class MainMenu {
	
	public void mainService(int seq) {
		
		Scanner scan = new Scanner(System.in);
		View br = new View();
		BookSearchAndSave bs = new BookSearchAndSave();
		DiscussionBoard db = new DiscussionBoard();
		boolean mainLoop = true;
		
		while (mainLoop) {
			
			br.mainView();
			
			String mainSel = scan.nextLine();
			
			if (mainSel.equals("1")) {
				bs.main(seq);
			} else if (mainSel.equals("2")) {
				
			} else if (mainSel.equals("3")) {
				db.mainBoard(seq);
			} else {
				mainLoop = false;
			}
			
		}//while
		
		System.out.println("프로그램을 종료합니다.");
		
		
	}

}
