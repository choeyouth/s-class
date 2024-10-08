package com.oracle.query;

import java.util.Scanner;

import com.oracle.query.BookSearchAndSave;

public class mainMenu {
	
	public void mainService() {
		
		Scanner scan = new Scanner(System.in);
		bookReviewView br = new bookReviewView();
		BookSearchAndSave bs = new BookSearchAndSave();
		boolean mainLoop = true;
		
		while (mainLoop) {
			
			br.mainView();
			
			String mainSel = scan.nextLine();
			
			if (mainSel.equals("1")) {
				bs.main();
			} else if (mainSel.equals("2")) {
				
			} else {
				mainLoop = false;
			}
			
		}//while
		
		System.out.println("프로그램을 종료합니다.");
		
		
	}

}
