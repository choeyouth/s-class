package com.oracle.query;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import com.oracle.BasicInfo;

public class memberLogin {

    public static void main(String[] args) throws SQLException {

        // SQL 실행부를 담당하는 DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();

        // 데이터베이스 연결
        Connection conn = dbHelper.getConnection();

        Scanner scan = new Scanner(System.in);

        String memberId = "";
        

        // 아이디 입력
        System.out.print("아이디: ");
        memberId = scan.nextLine();

        // 아이디가 존재하는지 확인하는 쿼리
        String isId = "SELECT * FROM tblMember WHERE id = ?";

        try {
            PreparedStatement idPstmt = conn.prepareStatement(isId); 
            idPstmt.setString(1, memberId); // 사용자 입력 아이디를 쿼리에 바인딩

            ResultSet irs = idPstmt.executeQuery();

            if (irs.next()) {
                System.out.println("아이디가 일치합니다.");

                // 아이디가 존재하는 경우 비밀번호 입력
                pwCheck(conn, memberId);
                
            } else {
                System.out.println("일치하는 아이디가 없습니다.");
            }

            irs.close();
            idPstmt.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        	
        scan.close();
    }

	private static void pwCheck(Connection conn, String memberId) throws SQLException {
		
		Scanner scan = new Scanner(System.in);
		
		String memberPw = "";
		
		for (int i=1; i<=5; i++) {
		
	        System.out.print("비밀번호: ");
	        memberPw = scan.nextLine();
	
	        // 비밀번호 일치 여부 확인하는 쿼리
	        String isPw = "SELECT * FROM tblMember WHERE id = ? AND password = ?";
	
	        PreparedStatement pwPstmt = conn.prepareStatement(isPw);
	        pwPstmt.setString(1, memberId); // 아이디를 첫 번째 ?에 바인딩
	        pwPstmt.setString(2, memberPw); // 비밀번호를 두 번째 ?에 바인딩
	
	        ResultSet pwRs = pwPstmt.executeQuery();
	        
	        if (pwRs.next()) {
	        	
	            System.out.println("비밀번호가 일치합니다. 로그인 성공!");
	            pwRs.close();
		        pwPstmt.close();
		        return;
		        
	        } else {
	            	
	        	if (i < 5) {
	        		
	        		System.out.println("비밀번호가 일치하지 않습니다.");
	            	System.out.println("다시 입력해주세요. (" + i + "번째 시도)");
	        		
	        	} else {
	        		System.out.println("비밀번호 입력 횟수를 초과헀습니다. ");
	        	}
	        }
		}
		scan.close();
	}
}

