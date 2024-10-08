package com.oracle.query;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import com.oracle.BasicInfo;

public class BookReviewViewer {
	
	public static void main(String[] args) throws SQLException {
        
		BasicInfo dbHelper = new BasicInfo();
		Connection conn = dbHelper.getConnection();
		
		try {
            Statement statement = conn.createStatement();

            // 뷰에서 데이터 조회
            String sql = "SELECT * FROM vwNote";
            ResultSet resultSet = statement.executeQuery(sql);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

            // 조회한 데이터를 콘솔에 출력
            while (resultSet.next()) {
                int seq = resultSet.getInt("seq");
                String name = resultSet.getString("name");
                String author = resultSet.getString("author");
                String content = resultSet.getString("content");
                String bookdate = resultSet.getString("bookdate");
                
                String formattedDate = dateFormat.format(resultSet.getDate("bookdate"));
                //서평등록일 우측에 00:00:00.0 표시는 수정해야함.
                System.out.println("----------------------------------------------");
                System.out.println("[도서번호]: " + seq);
                System.out.println("도서명: " + name);
                System.out.println("작가: " + author);
                System.out.println("서평: " + content);
                System.out.println("서평등록일: " + bookdate);
                System.out.println("----------------------------------------------");
            }

            // 리소스 정리
            resultSet.close();
            statement.close();
            conn.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

   
    }

