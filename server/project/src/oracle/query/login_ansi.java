package com.oracle.query;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import com.oracle.BasicInfo;

public class login_ansi {
	
    public static void main(String[] args) throws SQLException {

        // SQL 실행부를 담당하는 DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();

        // 데이터베이스 연결
        Connection conn = dbHelper.getConnection(); // dbHelper에서 연결 객체를 받아옴

        Scanner scan = new Scanner(System.in);

        String memberId = "";
        String memberPw = "";
        
        System.out.print("아이디: ");
        memberId = scan.nextLine(); // 사용자 입력

        String isId = "SELECT * FROM tblMember WHERE id = ?";

        try {
            PreparedStatement idPstmt = conn.prepareStatement(isId); 
            
            idPstmt.setString(1, memberId); 
            
            ResultSet irs = idPstmt.executeQuery();
            
            if (irs.next()) {
                System.out.println("아이디가 일치합니다.");
            } else {
                System.out.println("일치하는 아이디가 없습니다.");
            }
            
            // 자원 반환
            irs.close();
            idPstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        System.out.print("비밀번호: ");
        memberPw = scan.nextLine(); // 사용자 입력

        String isPw = "SELECT * FROM tblMember WHERE id = " + memberId + "AND password = ?";
        
        
        try {
        	
        	System.out.println("ss");
        	PreparedStatement pwPstmt = conn.prepareStatement(isPw); 
        	
        	pwPstmt.setString(1, memberPw);
        	
        	ResultSet pwRs = pwPstmt.executeQuery();
        	
        	if (pwRs.next()) {
        		System.out.println("비밀번호가 일치합니다. 로그인 성공!");
        	} else {
        		System.out.println("비밀번호가 일치하지 않습니다. ");
        	}
        	
        	pwRs.close();
            pwPstmt.close();
        	conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        scan.close();
    }

}
