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

 public class UserReview_register {
	
    public static void main(String[] args) throws SQLException {

        // SQL 실행부를 담당하는 DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();

        // 데이터베이스 연결
        Connection conn = dbHelper.getConnection(); // dbHelper에서 연결 객체를 받아옴

        Scanner scan = new Scanner(System.in);
        
        String name = "";
        String bookReview_seq = "";
        String bookdate = "";
        String content = "";
        
        
        boolean bookExists = false;
        
        do {
        	System.out.println("----------------------------------------------");
        	System.out.println("\t\t[도서 서평 등록]");
        	System.out.println("----------------------------------------------");
            System.out.print("책제목: ");
           
            name = scan.nextLine(); // 책 제목 입력
            
            // 조인 구문 추가. 쿼리문 뒤에 스페이스 제거 시 오류발생!
            String isNote = "SELECT br.seq FROM tblBooK b " +
            		        "JOIN tblBookReview br ON b.seq = br.book_seq " +
                            "JOIN tblNote n ON br.seq = n.bookReview_seq " +                      
                            "WHERE b.name = ? ";
            
            try {
                PreparedStatement notePstmt = conn.prepareStatement(isNote); 
                notePstmt.setString(1, name);
                ResultSet rs = notePstmt.executeQuery();
                
                if (rs.next()) {
                    // BookReview_seq 값을 가져옴
                    bookReview_seq = rs.getString("seq");
                    System.out.println("----------------------------------------------");
                    System.out.println("평점등록일(ex.2024-01-11)을 입력하세요.");
                    bookExists = true;
                } else {
                    System.out.println("아직 등록되어 있지 않은 도서입니다.");
                }
                
                // 자원 반환
                rs.close();
                notePstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        
            } while(!bookExists);
            
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

            while (true) {
                System.out.println("----------------------------------------------");
                System.out.print("서평: "); 
                content = scan.nextLine(); // 서평 입력
                
                String insertNote = "INSERT INTO tblNote (seq, BookReview_seq, content, bookdate) VALUES (note_seq.NextVal, ?, ?, ?)";
                
                try {
                    PreparedStatement notePstmt = conn.prepareStatement(insertNote);
                    
                    notePstmt.setInt(1, Integer.parseInt(bookReview_seq));
                    notePstmt.setString(2, content);
                    notePstmt.setString(3, bookdate);
                    
                    int rowsInserted = notePstmt.executeUpdate();
                    if (rowsInserted > 0) {
                        System.out.println("----------------------------------------------");
                        System.out.println("서평이 등록되었습니다.");
                        System.out.println("----------------------------------------------");
                        break;
                    }
                    
                    notePstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                  scan.close();
            }
    }
    }
 