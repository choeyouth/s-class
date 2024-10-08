package com.oracle.query;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;
import com.oracle.BasicInfo;

public class managerLogin {

    public static void main(String[] args) throws SQLException {

        // SQL 실행부를 담당하는 DBHelper 객체 생성
        BasicInfo dbHelper = new BasicInfo();

        // 데이터베이스 연결
        Connection conn = dbHelper.getConnection(); // dbHelper에서 연결 객체를 받아옴

        Scanner scan = new Scanner(System.in);

        String managerId = "";
        String managerPw = "";
        System.out.print("관리자 아이디: ");
        managerId = scan.nextLine(); // 사용자 입력

        System.out.print("관리자 비밀번호: ");
        managerPw = scan.nextLine(); // 사용자 입력

        // SQL 쿼리: tblManager에서 입력된 ID와 비밀번호가 일치하는지 확인
        String isIdAndPw = "SELECT * FROM tblManager WHERE id = ? AND password = ?";

        try {
            // PreparedStatement로 SQL 쿼리 준비
            PreparedStatement pstmt = conn.prepareStatement(isIdAndPw);
            pstmt.setString(1, managerId); // 첫 번째 ?에 managerId 값 바인딩
            pstmt.setString(2, managerPw); // 두 번째 ?에 managerPw 값 바인딩

            // 쿼리 실행 후 결과 저장
            ResultSet rs = pstmt.executeQuery();

            // 결과가 있는지 확인
            if (rs.next()) {
                System.out.println("로그인 성공! 관리자 아이디와 비밀번호가 일치합니다.");
            } else {
                System.out.println("로그인 실패. 아이디 또는 비밀번호가 일치하지 않습니다.");
            }

            // 자원 반환
            rs.close();
            pstmt.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        scan.close();
    }
}
