package com.oracle.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.Date;
import java.util.Locale;
import java.util.Scanner;

import com.oracle.BasicInfo;

public class RankDAO {
	
	BookSearchDAO bs = new BookSearchDAO();
	Scanner scan = new Scanner(System.in);
	
	public void mainMenu(int seq) throws SQLException {
		
		System.out.println("1. 평점 등록");
		System.out.println("2. 월간 평점 랭킹");
		System.out.print("입력: ");
		String mainInput = scan.nextLine();
		
		if (mainInput.equals("1")) {
			UserRank_register(seq);
		} else if (mainInput.equals("2")) {
			MonthlyRank(seq);
		} else {
			System.out.println("잘못 입력하셨습니다.");
		}
		
	}
	
	public void UserRank_register(int seq) throws SQLException {
		
	    // SQL 실행부를 담당하는 DBHelper 객체 생성
	    BasicInfo dbHelper = new BasicInfo();
	
	    // 데이터베이스 연결
	    Connection conn = dbHelper.getConnection(); // dbHelper에서 연결 객체를 받아옴
	
	    String title = "";
	    String rank = "";
	    String rankdate = null;
	    String BookReview_seq = "";
	    String Book_seq = "";
	    
	    System.out.println("----------------------------------------------");
        System.out.print("책제목: ");
        title = scan.nextLine(); // 책 제목 입력
        Book_seq = bs.main(seq, title);
        
        System.out.println("----------------------------------------------");
        System.out.print("평점등록일을 입력하시겠습니까?(y/n): ");
        
        String input = scan.nextLine();
		
		if (input.equals("y")) {
			
			System.out.println("평점등록일(ex.2024-01-11)을 입력하세요.");

            //YYYY-MM-DD 형식으로 데이터 입력하도록 유효성 검사
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	        dateFormat.setLenient(false);//setLenient(false): 잘못된 입력시 예외 발생 
	        
	        while (true) {
	            System.out.print("평점등록일: ");// 평점등록일 입력
	            rankdate = scan.nextLine(); 
	            
	            try {
	                Date inputDate = dateFormat.parse(rankdate);
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
	            System.out.print("평점(1~5): "); 
	            rank = scan.nextLine(); // 평점 입력
	            
            try {
	            	
	            int rankValue = Integer.parseInt(rank);
	            
	            if (rankValue >= 1 && rankValue <= 5) {
	                // 평점이 유효한 경우 데이터베이스에 저장
	                String insertRank = "INSERT INTO tblRANK (seq, book_seq, member_seq, score, rankdate) VALUES (rank_seq.NextVal, ?, ?, ?, ?)";
	                
	                if (rankdate == null) {
	                    insertRank = "INSERT INTO tblRANK (seq, book_seq, member_seq, score, rankdate) VALUES (rank_seq.NextVal, ?, ?, ?, sysdate)";
	                }
	                
	                try {
	                    PreparedStatement rankPstmt = conn.prepareStatement(insertRank);
	                   
	                    rankPstmt.setString(1, Book_seq);
	                    rankPstmt.setInt(2, seq);
	                    rankPstmt.setInt(3, rankValue);

	                    if (rankdate != null) {
	                        rankPstmt.setString(4, rankdate); 
	                    }
	                    
	                    int rowsInserted = rankPstmt.executeUpdate();
	                    
	                    if (rowsInserted > 0) {
	                    	System.out.println("----------------------------------------------");
	                        System.out.println("평점이 등록되었습니다.");
	                        System.out.println("----------------------------------------------");
	                    } 
	                    
	                    // 자원 반환
	                    rankPstmt.close();
	                    
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	                
	                break;
	                
	            } else {
	                System.out.println("1~5 사이의 값으로 입력해주세요.");
	            }
	            
	        } catch (NumberFormatException e) {
	            System.out.println("숫자를 입력해주세요.");
	        }
	    }
	    
	}
	
	private void MonthlyRank(int seq) throws SQLException {
		// SQL 실행부를 담당하는 DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();

        // 데이터베이스 연결
        Connection conn = dbHelper.getConnection(); // dbHelper에서 연결 객체를 받아옴
        
        //오늘 날짜를 기준으로 월간 도서 랭킹 계산.해당월에 작성하지 않은 리뷰는 계산에 포함되지 않음!
        LocalDate now = LocalDate.now();
        LocalDate startOfMonth = now.withDayOfMonth(1);
        LocalDate endOfMonth = now.withDayOfMonth(now.lengthOfMonth());
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

        
        String monthName = now.getMonth().getDisplayName(TextStyle.FULL, Locale.KOREAN);
        
        
        System.out.println("----------------------------------------------");
	    System.out.println("\t\t" +"["+monthName+"]"+"도서랭킹");
	    System.out.println("----------------------------------------------");

	    
	    //리뷰수 기준으로 내림차순정렬
	    String isrank = "SELECT b.name AS book_name, COUNT(r.seq) AS review_count, AVG(r.score) AS avg_score " +
                "FROM tblBOOK b " +
                "JOIN tblRank r ON b.seq = r.book_seq " +
                "WHERE r.rankdate BETWEEN TO_DATE('" + startOfMonth.format(formatter) + "', 'YYYY-MM-DD') " +
                "AND TO_DATE('" + endOfMonth.format(formatter) + "', 'YYYY-MM-DD') " +
                "GROUP BY b.name " +
                "ORDER BY review_count DESC";

	    
	   try { PreparedStatement rankPstmt = conn.prepareStatement(isrank); 
	        ResultSet rs = rankPstmt.executeQuery();

            System.out.println("|도서명|\t\t |리뷰수|\t\t|도서 평균 평점|");
            System.out.println("----------------------------------------------");

            while (rs.next()) {
                String bookName = rs.getString("book_name");
                int reviewCount = rs.getInt("review_count");
                double avgScore = rs.getDouble("avg_score");

                System.out.printf("%-20s\t%d\t\t%.2f%n", bookName, reviewCount, avgScore);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
		   
	}

	
}