package com.oracle.query;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import com.oracle.BasicInfo;

public class SignUp {
	
    BasicInfo dbHelper = new BasicInfo();
	MainMenu mmu = new MainMenu();
	View brv = new View();
	Scanner scan = new Scanner(System.in);
	
	String id = "";
	String pw = "";
	String pwCheck = "";
	String name = "";
	String address = "";
	String tel = "";
	String email = "";
	
	public void register() {
		
		brv.sleep(500);
		System.out.println();
		System.out.println("=============================");
		System.out.println("           회원 가입");
		System.out.println("=============================");
		System.out.println();
		brv.sleep(800);
		
		System.out.print("아이디: ");
		this.id = scan.nextLine();
		idValid(this.id);
		brv.sleep(800);
		
		System.out.println("전화번호 입력 (8자리 숫자로만 입력하세요.)");
		brv.sleep(1000);
		telValid();
		brv.sleep(800);

		System.out.print("비밀번호: ");
		this.pw = scan.nextLine();
		pwValid(this.pw);
		brv.sleep(800);
		
		System.out.print("비밀번호 확인: ");
		this.pwCheck = scan.nextLine();
		pwCheck(this.pwCheck, this.pw);
		brv.sleep(800);
		
		System.out.print("이름: ");
		this.name = scan.nextLine();
		nameValid(this.name);
		brv.sleep(800);
		
		System.out.println("주소 입력");
		addressValid();
		brv.sleep(800);
		
		System.out.println("이메일 주소의 사용자 이름 부분을 입력하세요. ");
		brv.sleep(1000);
		System.out.println();
		emailValid();
		
		regInfoValid();
		
		//선호도 조사
		
	}

	private void telValid() {
		
		String inputTel = "";
		String telMiddle = "";
		String telEnd = "";
		
		boolean isTel = true;
		
		while (isTel) {
			System.out.print("010-");
			inputTel = scan.nextLine();
			
			if (!inputTel.matches("^\\d{8}$")) {
				System.out.println("전화번호는 8자리 숫자로만 입력해 주세요.");
				System.out.println();
			} else {
				isTel = false;
			}
			
		}
		
		telMiddle = inputTel.substring(0, 4);
		telEnd = inputTel.substring(4, 8);
		
		this.tel = "010-" + telMiddle + "-" + telEnd;
		System.out.println("입력한 전화번호: " + this.tel);
		System.out.println();
		
	}

	private void idValid(String id) {
		
		boolean idLoop = true;
		boolean isId = false;
		isId = dupId(id);
		
		while (idLoop) {
			
			if (isId) {
				System.out.println("아이디가 이미 존재합니다.");
			} else if (this.id == null || this.id.isEmpty()) {
				System.out.println("아이디를 입력해 주세요.");
			} else if (this.id.length() < 4 || this.id.length() > 12) {
				System.out.println("아이디는 4자 이상 12자 이하로 입력해 주세요.");
			} else if (!this.id.matches("^[a-zA-Z0-9]+$")) {
				System.out.println("아이디는 영문자, 숫자만 입력 가능합니다.");
			} else {
				System.out.println("아이디가 유효합니다.");
				System.out.println();
				idLoop = false;
				return;
			}
			
			System.out.println();
			System.out.print("아이디: ");
			this.id = scan.nextLine();
			isId = dupId(this.id);
			
		}
		
	}
	

	private boolean dupId(String id) {
		
		String query = "SELECT count(*) FROM tblMember WHERE id = '" + id + "'";
		boolean isId = false;
		
		try (Connection conn = dbHelper.getConnection();
			     Statement stmt = conn.createStatement();
			     ResultSet rs = stmt.executeQuery(query)) 
			{  
			
			if (rs.next()) {
				
				int count = rs.getInt(1);
				
				if (count > 0) {
					isId = true;
				} 
				
			} 
			
		} catch (Exception e) {
			System.out.println("DiscussionBoard.postView");
			e.printStackTrace();
		}
		
		return isId;
	}

	private void pwValid(String pw) {

		boolean pwLoop = true;
		
		while (pwLoop) {

			if (this.pw == null || this.pw.isEmpty()) {
				System.out.println("비밀번호를 입력해 주세요.");
			} else if (this.pw.length() < 8) {
				System.out.println("비밀번호는 8자 이상으로 입력해주세요.");
			} else if (!this.pw.matches(".*[A-Z].*")) {
				System.out.println("비밀번호는 최소한 하나의 대문자가 포함되어야 합니다.");
			} else if (!this.pw.matches(".*[a-z].*")) {
				System.out.println("비밀번호는 최소한 하나의 영문자가 포함되어야 합니다.");
			} else if (!this.pw.matches(".*\\d.*")) {
				System.out.println("비밀번호에는 최소한 하나의 숫자가 포함되어야 합니다.");
			} else if (!this.pw.matches(".*[!@#$%^&*()_+\\\\[\\\\]{};':\\\"\\\\\\\\|,.<>?\\\\-].*")) {
				System.out.println("비밀번호에는 최소한 하나의 특수문자가 포함되어야 합니다.");
			} else if (this.pw.matches(".*(.)\\\\1{2,}.*")) {
				System.out.println("비밀번호에 연속된 문자를 사용할 수 없습니다.");
			} else if (this.pw.matches(".*(.)\\1{2,}.*")) {
				System.out.println("비밀번호에 연속된 문자를 사용할 수 없습니다.");
			} else {
				System.out.println("비밀번호가 유효합니다.");
				System.out.println();
				pwLoop = false;
				return;
			}
			
			System.out.println("다시 입력해주세요.");
			System.out.println();
			System.out.print("비밀번호: ");
			this.pw = scan.nextLine();
		}
	
	}


	private void pwCheck(String pwCheck, String pw) {
		
		boolean pwCheckLoop = true;
		
		while (pwCheckLoop) {
			if (!this.pw.equals(this.pwCheck)) {
				System.out.println("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			} else if (pw.equals(this.pwCheck)) {
				System.out.println("비밀번호가 일치합니다. ");
				System.out.println();
				pwCheckLoop = false;
				return;
			}
			
			System.out.println();
			System.out.print("비밀번호 확인: ");
			this.pwCheck = scan.nextLine();
			
		}
	}
	
	private void nameValid(String name) {
		
		boolean nameLoop = true;
		
		while (nameLoop) {
			
			if (this.name.length() < 2 || this.name.length() > 4) {
				System.out.println("이름은 2자 이상 4자 이하로 입력해 주세요.");
			} else if (!this.name.matches("[가-힣]+")) {
				System.out.println("이름은 한글로만 입력 가능합니다. ");
			} else {
				System.out.println("이름이 유효합니다. ");
				System.out.println();
				nameLoop = false;
				return;
			}
			
			System.out.println();
			System.out.print("이름: ");
			this.name = scan.nextLine();
		}
	}

	private void addressValid() {

		String city = "";
		String district = "";
		String roadName = "";
		
		boolean iscity = true;
		boolean isdistrict = true;
		boolean isroadName = true;

		while (iscity) {
			
			System.out.print("행정구역: ");
			city = scan.nextLine();

			if (!city.matches("^[가-힣]+시$")) {
				System.out.println("유효하지 않은 행정구역입니다. (예: 서울시)");
			} else {
				iscity = false;
			}
			
		}
		
		while (iscity) {
			
			System.out.print("행정구역: ");
			city = scan.nextLine();

			if (!city.matches("^[가-힣]+시$")) {
				System.out.println("유효하지 않은 행정구역입니다. (예: 서울시)");
				System.out.println();
			} else {
				iscity = false;
			}
			
		}
		
		while (isdistrict) {
			
			System.out.print("자치구: ");
			district = scan.nextLine();

			if (!district.matches("^[가-힣]+구$")) {
				System.out.println("유효하지 않은 자치구입니다. (예: 강남구)");
				System.out.println();
			} else {
				isdistrict = false;
			}
			
		}
		
		
		while (isroadName) {
			
			System.out.print("행정동/도로명: ");
			roadName = scan.nextLine();

			if (!(roadName.matches("^[가-힣]+동$") || roadName.matches("^[가-힣]+로$"))) {
				System.out.println("유효하지 않은 도로명입니다. (예: 역삼동/테헤란로)");
				System.out.println();
			} else {
				isroadName = false;
			}
			
		}
		
		this.address = city + " " + district + " " + roadName;
		System.out.println();
		System.out.println("유효한 주소입니다.");
		System.out.println("입력한 주소: " + this.address);
		System.out.println();
	}
	

	private void emailValid() {
		
		Scanner scan = new Scanner(System.in);
		
		boolean isLocal = true;
		boolean isDomain = true;
		String local = "";
		String domain = "";
		
		while (isLocal) {
			
			System.out.print("입력: ");
			local = scan.nextLine();
			System.out.println();
			
			if (local.length() < 3) {
				System.out.println("3자 이상으로 입력해주세요.");
			} else {
				isLocal = false;
			}
		}
		
		while (isDomain) {
			
			System.out.println("도메인을 입력하세요.");
			System.out.print("입력: " + local + "@");
			domain = scan.nextLine();
			System.out.println();
			
			if (!domain.matches("^[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}$")) {
				System.out.println("유효하지 않은 도메인입니다. 다시 입력해주세요.");
			} else {
				isDomain = false;
			}
		}
		
		this.email = local + "@" + domain;
		System.out.println("입력한 이메일 주소: " + this.email);
		System.out.println();
		
	}

	private void regInfoValid() {
		
		System.out.println("=============================");
		System.out.println("        입력한 회원 정보");
		System.out.println("=============================");
		System.out.println("아이디: " + this.id);
		System.out.println("비밀번호: " + this.pw);
		System.out.println("전화번호: " + this.tel);
		System.out.println("이름: " + this.name);
		System.out.println("주소: " + this.address);
		System.out.println("이메일: " + this.email);
		System.out.println("=============================");
		brv.sleep(1000);
		
		System.out.println();
		System.out.println("입력 하신 정보로 회원 가입을 진행하시겠니까?");
		brv.sleep(1000);
		brv.select();
		String sel = scan.nextLine();
        
        if (sel.equals("1")) {
        	
        	System.out.println();
        	System.out.println("회원 가입을 진행합니다.");
        	dbSave();

        	
        } else {
        	System.out.println("종료합니다.");
        }
	}

	private void dbSave() {
        
        int memberSeq = 0;

        
        // 데이터 삽입 SQL 쿼리
        String insertQuery = "INSERT INTO tblMember (seq, id, password) "
                		   + "VALUES (tblMember_seq.NEXTVAL, "
        				   + "'" + this.id + "', "
        				   + "'" + this.pw
        				   + "')";
        
        System.out.println("회원가입 진행 중...");
        System.out.println();
        dbHelper.insertData(insertQuery);
        brv.sleep(1000);
        
        
        String query = "SELECT seq FROM tblMember WHERE id = '" + this.id + "'";
        try (Connection conn = dbHelper.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            
            if (rs.next()) {
                memberSeq = rs.getInt("seq"); // memberSeq에 seq 값을 저장
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        String[] insertQueries = {
        	    "INSERT INTO tblMemberInfo (seq, member_seq, name, address, tel, email) "
        	  + "VALUES (memberInfo_seq.NEXTVAL, "
        	  + memberSeq + ", "
        	  + "'" + this.name + "', "
        	  + "'" + this.address + "', "
        	  + "'" + this.tel + "', "
        	  + "'" + this.email 
        	  + "')"
        };
        
        System.out.println();
        System.out.println("회원 정보 저장 중...");
        brv.sleep(1000);
        dbHelper.insertDataBatch(insertQueries);
        brv.sleep(1000);
    	System.out.println();
    	System.out.println("회원 가입 완료!");
    	
        
		//선호도 조사
    	System.out.println("선호도 조사를 진행합니다.");
    	brv.sleep(1000);
		newpreference pref = new newpreference();
		pref.preferenceData();
		System.out.println("메인 페이지로 이동합니다.");
    	brv.pause();
    	mmu.mainService(memberSeq);
    	
	}	
}



