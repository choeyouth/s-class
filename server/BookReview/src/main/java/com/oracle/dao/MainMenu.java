package com.oracle.dao;

import java.sql.SQLException;
import java.util.Scanner;

import com.oracle.query.BookSearchDAO;

public class MainMenu {
	
	public void mainService(int seq) {
		
		Scanner scan = new Scanner(System.in);
		View br = new View();
		BookSearchDAO bs = new BookSearchDAO();
		DiscussionBoardDAO db = new DiscussionBoardDAO();
		RankDAO rank = new RankDAO();
		WordDAO word = new WordDAO();
		ReviewDAO review = new ReviewDAO();
		FamouseLineDAO famouseLine = new FamouseLineDAO();
		PreferenceDAO preference = new PreferenceDAO();
		
		boolean mainLoop = true;
		
		while (mainLoop) {
			
			br.mainView();
			
//			System.out.println("1. 도서 검색");
//			System.out.println("2. 도서 리뷰");
//			System.out.println("3. 토론 게시판");
//			System.out.println("4. 도서 평점");
//			System.out.println("5. 도서 명대사");
//			System.out.println("6. 단어 검색");
//			System.out.println("7. 명언 검색");
//			System.out.println("8. 선호도 조사");
//			System.out.println("0. 종료");
			
			String mainSel = scan.nextLine();
			
			if (mainSel.equals("1")) {
				//도서 검색 
				bs.main(seq, null);
			} else if (mainSel.equals("2")) {
				//도서 리뷰 
				review.bookReviewMain(seq);
			} else if (mainSel.equals("3")) {
				//토론 게시판 
				db.mainBoard(seq);
			} else if (mainSel.equals("4")) {
				//도서 평점 
				try {
					rank.mainMenu(seq);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else if (mainSel.equals("5")) {
				//도서 명대사 
				famouseLine.FamouseLineMain(seq);
			} else if (mainSel.equals("6")) {
				//단어 검색 
				word.wordMain(seq);
			} else if (mainSel.equals("7")) {
				//명언 검색 
			} else if (mainSel.equals("8")) {
				//선호도 검사 
				preference.PreferenceMain(seq);
			}  else {
				mainLoop = false;
			}
			
		}//while
		
		System.out.println("프로그램을 종료합니다.");
		
		
	}

}
