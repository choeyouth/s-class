package com.oracle.query;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import com.oracle.BasicInfo;

public class UserRank_register {
	
    public static void main(String[] args) throws SQLException {

        // SQL 실행부를 담당하는 DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();

        // 데이터베이스 연결
        Connection conn = dbHelper.getConnection(); // dbHelper에서 연결 객체를 받아옴

        Scanner scan = new Scanner(System.in);

        String title = "";
        String rank = "";
        String rankdate = "";
        String Book_seq = "";
        
        boolean bookExists = false;
        
        do {
        	System.out.println("----------------------------------------------");
            System.out.print("책제목: ");
           
            title = scan.nextLine(); // 책 제목 입력
            
            // 조인 구문 추가
            String isBook = "SELECT br.seq FROM tblBOOK b " +
                            "JOIN tblBookReview br ON b.seq = br.book_seq " +
                            "WHERE b.name = ?";
            
            try {
                PreparedStatement titlePstmt = conn.prepareStatement(isBook); 
                titlePstmt.setString(1, title);
                ResultSet rs = titlePstmt.executeQuery();
                
                if (rs.next()) {
                    //Book_seq 값을 가져옴
                    Book_seq = rs.getString("seq");
                    System.out.println("----------------------------------------------");
                    System.out.println("평점등록일(ex.2024-01-11)을 입력하세요.");
                    bookExists = true;
                } else {
                    System.out.println("아직 등록되어 있지 않은 도서입니다.");
                }
                
                // 자원 반환
                rs.close();
                titlePstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        
        } while (!bookExists);
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
        
	        while (true) {
	        	System.out.println("----------------------------------------------");
	            System.out.print("평점(1~5): "); 
	            rank = scan.nextLine(); // 평점 입력
	            
	            try {
                int rankValue = Integer.parseInt(rank);
                if (rankValue >= 1 && rankValue <= 5) {
                    // 평점이 유효한 경우 데이터베이스에 저장
                    String insertRank = "INSERT INTO tblRANK (seq, BookReview_seq, score, rankdate) VALUES (rank_seq.NextVal, ?, ?, ?)";
                    try {
                        PreparedStatement rankPstmt = conn.prepareStatement(insertRank);
                       
                        rankPstmt.setInt(1, Integer.parseInt(Book_seq));
                        rankPstmt.setInt(2, rankValue);
                        rankPstmt.setString(3, rankdate);
                        
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
        
        scan.close();
    }        
}


