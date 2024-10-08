package com.oracle.query;

import com.oracle.ex13_wordList_dml;
import java.util.Scanner;

public class DAO_Member {
	
    Scanner scan = new Scanner(System.in);
    ex13_wordList_dml wordSearch = new ex13_wordList_dml();
    BookSearchDAO bs = new BookSearchDAO();
    BasicInfo db = new BasicInfo();
    int subchoice;
	
    public void mainMenu(int seq) {

        while (true) {
            System.out.println("=============================");
            System.out.println("       회원 메뉴입니다.");
            System.out.println("  원하시는 메뉴를 고르세요");
            System.out.println("                         ");
            System.out.println("      1. 단어 검색");
            System.out.println("      2. 명언 검색");
            System.out.println("    3. 책 리뷰 살펴보기");
            System.out.println("      4. 종료하기");
            System.out.println("-----------------------------");
            System.out.print("원하시는 메뉴 번호를 입력하세요: ");
            int choice = scan.nextInt();
            scan.nextLine();

            if (choice == 1) {
            	
            	wordMain(seq);
            	backView(seq);
                
            } else if (choice == 2) {
            	
            	quoteMain(seq);
            	backView(seq);
            	
            } else if (choice == 3) {
            	
            	bookReviewMain(seq);
            	backView(seq);
            	
            } else if (choice == 4){
            	
            	System.out.println("프로그램을 종료합니다. 다시 선택해 주세요.");
            	break;
            	
            } else {
            	
                System.out.println("잘못된 입력입니다. 다시 선택해 주세요.");
                
            }
        }

        scan.close();
    }

	private void bookReviewMain(int seq) {
		
		System.out.println();
    	System.out.print("책 이름을 입력하세요 : ");	// 나는 다정한 관찰자가 되기로 했다 , 저는 브랜딩을 하는 사람입니다
    	String name = scan.nextLine();
    	
		String book_seq = bs.main(seq, name);

    	String query = "SELECT B.NAME, R.COMMEND " +
                "FROM tblBookReview R " +
                "INNER JOIN tblBook B ON R.BOOK_SEQ = B.SEQ " +
                "WHERE B.seq = '" + book_seq + "'";
    	
        int result = db.executeQuery(query);
        
        if (result == 0) {
        	
       	 System.out.println();
       	 System.out.println("해당 책의 리뷰가 없습니다. ");
       	 System.out.println();
       	 
        }
	}

	private void quoteMain(int seq) {
    	
		System.out.println();
    	System.out.print("책 이름을 입력하세요 : ");	// 읽으면서 바로 써먹는 어린이 스도쿠 : 학교 괴담
		String name = scan.nextLine();
		
    	String book_seq = bs.main(seq, name);
    	
    	String query = "SELECT B.NAME AS BOOK_NAME, F.FAMOUSLINE AS FAMOUSLINE " +
                "FROM tblFamousLine F " +
                "INNER JOIN tblBook B ON F.BOOK_SEQ = B.SEQ " +
                "WHERE B.seq = '" + book_seq + "'";
    	
         int result = db.executeQuery(query);
        
         if (result == 0) {
        	 
        	 System.out.println();
        	 System.out.println("해당 책의 명언이 없습니다. ");
        	 System.out.println();
        	 
         }
        
	}

	private void backView(int seq) {
		
		while (true) {
			System.out.println();
	        System.out.println("  메뉴로 돌아가시려면 1번,");
	        System.out.println("종료하시려면 2번을 누르세요");
	        System.out.print("번호 입력 : ");
	        subchoice = scan.nextInt();
	        System.out.println("프로그램을 종료합니다");

	        if (subchoice == 2) {
	            System.out.println("프로그램을 종료합니다");
	            break;
	            
	        } else {
	        	System.out.println("잘못된 입력입니다. 메뉴로 돌아갑니다.");
	        	mainMenu(seq);
	        	break;
	        }
		}
	}

	private void wordMain(int seq) {
		
        System.out.print("검색할 단어를 입력하세요: ");
        String word = scan.nextLine();
        wordSearch.searchWord(word);
		
	}
}
