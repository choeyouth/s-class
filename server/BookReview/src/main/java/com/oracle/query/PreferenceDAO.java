package com.oracle.query;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Scanner;
import com.oracle.BasicInfo;

public class PreferenceDAO {
	
	Scanner scan = new Scanner(System.in);
	BasicInfo dbHelper = new BasicInfo();
	

	public void PreferenceMain(int seq) {

		System.out.println("--------- 선호도 조사 --------");
		preferenceData(seq);

	}

	public void preferenceData(int seq) {
		// 스캐너 생성
		Scanner scan = new Scanner(System.in);

		// DBHelper 객체 생성
		BasicInfo dbHelper = new BasicInfo();

		// 변수 정의
		String genre = "";
		String sub = "";
		String targetRead = "";

		// 장르리스트 출력
		dbHelper.executeQuery("SELECT * FROM tblgenrelist");

		while (true) {

			// 장르 번호 입력
			System.out.print("관심 있는 장르의 번호를 알려주세요. : ");
			genre = scan.nextLine();
			// int값 판별 메서드 변수저장
			boolean firstValidation = isNumeric(genre);

			if (firstValidation == true) {
				int genrecheck = dbHelper.check
								("SELECT seq FROM tblgenrelist where seq=" + genre);
				if (genrecheck == Integer.parseInt(genre)) {
					break;
				} else {
					System.out.println("번호를 확인해주세요.");
				}
			} else {
				System.out.println("숫자만 입력가능합니다.");
			}
		};

		// 선택한 장르의 서브장르 출력
		dbHelper.executeQuery("SELECT * FROM tblsubGenre WHERE genre_seq =" + genre);

		while (true) {
			// 서브장르 입력
			System.out.print("관심 있는 서브 장르의 번호를 입력해주세요. : ");
			sub = scan.nextLine();
			System.out.println();
			// int값 판별 메서드 변수 저장
			boolean secondValidation = isNumeric(sub);

			if (secondValidation == true) {
				int subcheck = dbHelper.check("SELECT seq FROM tblsubGenre WHERE seq=" + sub
											+"AND genre_seq ="+genre);
				if (subcheck == Integer.parseInt(sub)) {
					break;
				} else {
					System.out.println("번호를 확인해주세요.");
				}
			} else {
				System.out.print("보이는 서브 장르의 숫자만 입력 가능합니다.");
			}
		};
		

		while (true) {
			// 목표 권수 입력
			System.out.print("몇 권의 책을 추천받을지 입력해주세요. : ");
			targetRead = scan.nextLine();
			// int값 판별 메서드 변수저장
			boolean thirdValidation = isNumeric(targetRead);
			if (thirdValidation = true) {
								
				//현재 저장된 마지막 회원의 seq 변수저장
//				int seq = dbHelper.check("select * from "
//						+ "(select seq from tblmember order by seq desc) where rownum=1");

				//tblPreference에 데이터 삽입
				dbHelper.insertData(String.format
						("INSERT INTO tblPreference VALUES"
						+ "(preference_seq.NEXTVAL,%d,%s,%s)",seq,sub,targetRead));
				
				//책 권수 확인
				int subCount=dbHelper.check
		    			("SELECT count(*) FROM tblBook book\r\n"+
		    			"INNER join tblsubgenre sub\r\n"+
		    			"ON book.subgenre_seq = sub.seq\r\n"+
		    			 "where sub.seq = "+sub
		    			 );
				
				//추천받을 책 목록쿼리
				String query = "SELECT sub.subGenre, book.name, book.author FROM tblBook book "
		                + "INNER join tblsubgenre sub "
		                + "ON book.subgenre_seq = sub.seq "
		                + "WHERE sub.seq = "+sub;
				
				if(Integer.parseInt(targetRead)<=subCount) {
		    		dbHelper.executeQuery("SELECT * FROM ("+query+" ORDER BY DBMS_RANDOM.VALUE)"
		    							+ "WHERE ROWNUM <="+targetRead);
		    	}else {
		    		dbHelper.executeQuery("SELECT * FROM ("+query+" ORDER BY DBMS_RANDOM.VALUE)"
		    							+ "WHERE ROWNUM <="+subCount);
		    		System.out.println("준비된 책이 부족합니다. 가까운 시일안에 준비하도록 하겠습니다.");
		    	}
				break;
			} else {
				System.out.println("숫자만 입력 가능합니다..");
			}

		};

	}

	// 받은 String값 내부의 숫자만 있는지 확인
	public static boolean isNumeric(String str) {
		if (str == null || str.isEmpty()) {
			return false;
		}
		try {
			Integer.parseInt(str);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}
	
	
}
