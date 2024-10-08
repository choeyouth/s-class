package com.oracle.query;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.util.Locale;

import com.oracle.BasicInfo;

public class MonthlyRank {
	
	  public static void main(String[] args) throws SQLException {
	
	
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
	    String isrank = "SELECT b.name AS book_name, COUNT(br.seq) AS review_count, AVG(r.score) AS avg_score " +
                "FROM tblBOOK b " +
                "JOIN tblBookReview br ON b.seq = br.book_seq " +
                "JOIN tblRank r ON br.seq = r.bookReview_seq " +
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



