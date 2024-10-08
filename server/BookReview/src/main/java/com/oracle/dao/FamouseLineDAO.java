package com.oracle.dao;

import java.util.Scanner;

public class FamouseLineDAO {
	
	Scanner scan = new Scanner(System.in);
    BookSearchDAO bs = new BookSearchDAO();
    BasicInfo db = new BasicInfo();
	
	public void FamouseLineMain(int seq) {
		
		FamouseRead(seq);
		
	}

	public void FamouseRead(int seq) {
		
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
        	 System.out.println("해당 책의 명대사가 없습니다. ");
        	 System.out.println();
        	 
         }
		
		
	}

}
