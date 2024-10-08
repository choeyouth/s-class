package com.oracle.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import com.oracle.query.BasicInfo;

public class ReviewDAO {
	
    Scanner scan = new Scanner(System.in);
    BookSearchDAO bs = new BookSearchDAO();
    BasicInfo db = new BasicInfo();
    
    public void bookReviewMain(int seq) {
    	
		System.out.println("1. 리뷰 조회");
		System.out.println("2. 리뷰 등록");
//		System.out.println("3. 리뷰 수정");
//		System.out.println("4. 리뷰 삭제");
		System.out.print("입력: ");
		String mainInput = scan.nextLine();
		
		if (mainInput.equals("1")) {
			
			bookReviewRead(seq);
			
		} else if (mainInput.equals("2")) {
			
			try {
				bookReviewCreate(seq);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} else {
			System.out.println("잘못 입력하셨습니다.");
		}
    	
    }
    
	private void bookReviewCreate(int seq) throws SQLException {

		// SQL 실행부를 담당하는 DBHelper 객체 생성
		BasicInfo dbHelper = new BasicInfo();

		// 데이터베이스 연결
		Connection conn = dbHelper.getConnection(); // dbHelper에서 연결 객체를 받아옴

		Scanner scan = new Scanner(System.in);

		String name = "";
		String bookdate = null;
		String content = "";

	
		System.out.println("----------------------------------------------");
		System.out.println("\t\t[도서 서평 등록]");
		System.out.println("----------------------------------------------");
		System.out.print("책제목: ");
		name = scan.nextLine(); // 책 제목 입력
		
		String book_seq = bs.main(seq, name);
		
		System.out.println("----------------------------------------------");
		System.out.print("평점등록일을 입력하시겠습니까?(y/n): ");
        String input = scan.nextLine();
		
		if (input.equals("y")) {
		
			System.out.println("평점등록일(ex.2024-01-11)을 입력하세요.");
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			dateFormat.setLenient(false); // setLenient(false): 잘못된 입력시 예외 발생
	
			while (true) {
				System.out.print("평점등록일: "); // 평점등록일 입력
				bookdate = scan.nextLine();
	
				try {
					Date inputDate = dateFormat.parse(bookdate);
					Date currentDate = new Date();
	
					if (inputDate.after(currentDate)) {
						System.out.println("----------------------------------------------");
						System.out.println("오늘 이후의 날짜는 등록할 수 없습니다.");
					} else {
						break;
					}
				} catch (ParseException e) {
					System.out.println("----------------------------------------------");
					System.out.println("날짜 형식이 올바르지 않습니다.");
					System.out.println("YYYY-MM-DD 형식으로 입력해주세요.");
				}
			}
		}

		while (true) {
			System.out.println("----------------------------------------------");
			System.out.print("서평: ");
			content = scan.nextLine(); // 서평 입력

			 String insertNote = "INSERT INTO tblBookReview (seq, book_seq, member_seq, commend, review_date) VALUES (bookreview_seq.NextVal, ?, ?, ?, ?)";

             if (bookdate == null) {
            	 insertNote = "INSERT INTO tblBookReview (seq, book_seq, member_seq, commend, review_date) VALUES (bookreview_seq.NextVal, ?, ?, ?, sysdate)";
             }
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(insertNote);

				pstmt.setString(1, book_seq);
				pstmt.setInt(2, seq);
				pstmt.setString(3, content);

                if (bookdate != null) {
                	pstmt.setString(4, bookdate); 
                }
				
				int rowsInserted = pstmt.executeUpdate();
				
				if (rowsInserted > 0) {
					System.out.println("----------------------------------------------");
					System.out.println("서평이 등록되었습니다.");
					System.out.println("----------------------------------------------");
					break;
				}

				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void bookReviewRead(int seq) {
		
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
}
