package com.oracle.query;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import com.oracle.BasicInfo;

public class loginService {
	
    mainMenu mmu = new mainMenu();
    bookReviewView brv = new bookReviewView();
	
	public void memberLogin() throws SQLException {
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
                memberPwCheck(conn, memberId);
                
            } else {
                System.out.println("일치하는 아이디가 없습니다.");
                System.out.println("아이디 찾기를 진행하시겠습니까?");
                
                brv.select();
                String sel = scan.nextLine();
                
                if (sel.equals("1")) {
                	
                	String loginSel = "2";
                	findMember(loginSel);
                } else {
                	System.out.println("종료합니다.");
                }
                
                
            }

            irs.close();
            idPstmt.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        	
        scan.close();
	}
	
	private void memberPwCheck(Connection conn, String memberId) throws SQLException {
		
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
                brv.pause();
                mmu.mainService();
                return;
		        
	        } else {
	            	
	        	if (i < 5) {
	        		
	        		System.out.println("비밀번호가 일치하지 않습니다.");
	            	System.out.println("다시 입력해주세요. (" + i + "번째 시도)");
	        		
	        	} else {
	        		System.out.println("비밀번호 입력 횟수를 초과헀습니다. ");
	        		
	        		System.out.println("비밀번호 찾기를 진행하시겠습니까?");
	                
	                brv.select();
	                String sel = scan.nextLine();
	                
	                if (sel.equals("1")) {
	                	
	                	String loginSel = "3";
	                	findMember(loginSel);
	                } else {
	                	System.out.println("종료합니다.");
	                }
	        		
	        	}
	        }
		}
		
		scan.close();
		
	}

	public void managerLogin() throws SQLException {
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
                brv.pause();
                mmu.mainService();
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

	}

	public void findMember(String loginSel) throws SQLException {
		
		String findType = "";
		Scanner scan = new Scanner(System.in);
		String findSel = "";
		
		if (loginSel.equals("2")) {
			findType = "아이디";
			brv.findLogin(findType);
			findSel = scan.nextLine();
			
			if (findSel.equals("1")) {
				System.out.println("전화번호를 통해 아이디 찾기를 진행합니다.");
				findSel = "전화번호";
				findMemberId(findSel);
				
			} else if (findSel.equals("2")) {
				System.out.println("이메일을 통해 아이디 찾기를 진행합니다.");
				findSel = "이메일";
				findMemberId(findSel);
			}
			
		} else if (loginSel.equals("3")) {
			findType = "비밀번호";
			brv.findLogin(findType);
			findSel = scan.nextLine();
			
			if (findSel.equals("1")) {
				System.out.println("전화번호를 통해 비밀번호 찾기를 진행합니다.");
				findSel = "전화번호";
				findMemberPw(findSel);
				
			} else if (findSel.equals("2")) {
				System.out.println("이메일을 통해 비밀번호 찾기를 진행합니다.");
				findSel = "이메일";
				findMemberPw(findSel);
			}
			
		}
	}

	private void findMemberId(String findSel) throws SQLException {

		BasicInfo dbHelper = new BasicInfo();
		Connection conn = dbHelper.getConnection();
		
		Scanner scan = new Scanner(System.in);
		
		String input = "";
		System.out.println();
		System.out.print(findSel + ": ");
		input = scan.nextLine(); 
		String findId = "";
		
		if (findSel.equals("전화번호")) {
			findId = "SELECT id FROM vwMemberProfile WHERE tel = ?";
			
		} else if (findSel.equals("이메일")) {
			findId = "SELECT id FROM vwMemberProfile WHERE email = ?";
		}
		
		try {
            // PreparedStatement로 SQL 쿼리 준비
            PreparedStatement pstmt = conn.prepareStatement(findId);
            pstmt.setString(1, input); 

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
            	// 쿼리 결과에서 아이디를 가져옴
            	String id = rs.getString("id");
            	System.out.println();
                System.out.println("입력하신 정보와 일치하는 회원의 아이디는 " + id + " 입니다.");
            } else {
            	System.out.println();
                System.out.println("입력하신 정보와 일치하는 회원 아이디가 없습니다.");
            }

            rs.close();
            pstmt.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}

	
	private void findMemberPw(String findSel) throws SQLException {
		
		BasicInfo dbHelper = new BasicInfo();
		Connection conn = dbHelper.getConnection();
		Scanner scan = new Scanner(System.in);
		
		System.out.println();
		System.out.print("아이디: ");
		String id = scan.nextLine();
		
		String isId = "SELECT id FROM vwMemberProfile WHERE id = ?";
		
		try {
            PreparedStatement idPstmt = conn.prepareStatement(isId); 
            idPstmt.setString(1, id); // 사용자 입력 아이디를 쿼리에 바인딩

            ResultSet idRs = idPstmt.executeQuery();

            if (idRs.next()) {
                System.out.println("아이디가 일치합니다.");

                // 아이디가 존재하는 경우 비밀번호 찾기 구현 
        		System.out.println();
        		System.out.print(findSel + ": ");
        		String input = scan.nextLine();
        		
        		String findPw = "";
        		
                if (findSel.equals("전화번호")) {
        			findPw = "SELECT password FROM vwMemberProfile WHERE id = ? AND tel = ?";
        		} else if (findSel.equals("이메일")) {
        			findPw = "SELECT password FROM vwMemberProfile WHERE id = ? AND email = ?";
        		}
                
    	        PreparedStatement pwPstmt = conn.prepareStatement(findPw);
    	        pwPstmt.setString(1, id); // 아이디를 첫 번째 ?에 바인딩
    	        pwPstmt.setString(2, input); 
    	
    	        ResultSet pwRs = pwPstmt.executeQuery();
    	        
    	        if (pwRs.next()) {
    	        	
    	        	String pw = pwRs.getString("password");
    	        	System.out.println();
                    System.out.println("입력하신 정보와 일치하는 회원의 비밀번호는 " + pw + " 입니다.");
                    
    	        } else {
    	           
    	        	System.out.println();
                    System.out.println("입력하신 정보와 일치하는 회원의 비밀번호가 없습니다.");
    	        }
    	        
    	        pwRs.close();
    	        pwPstmt.close();
                
            } else {
                System.out.println("일치하는 아이디가 없습니다.");
            }

            idRs.close();
            idPstmt.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}

}
