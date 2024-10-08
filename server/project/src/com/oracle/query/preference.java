package com.oracle.query;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Scanner;
import com.oracle.BasicInfo;

public class preference {
	public static void main(String[] args) {
		
    	//스캐너 생성
    	Scanner scan = new Scanner(System.in);
    	
    	//회원 번호 입력
    	System.out.print("회원 번호를 입력하세요 : ");
    	
    	int seq=scan.nextInt();//회원번호 입력받기 / 임시
    	//서브장르 seq
    	
    	Preference(seq);


	}

	public static void Preference(int seq) {
		// DBHelper 객체 생성
		BasicInfo dbHelper = new BasicInfo();
		
    	int subgenre=dbHelper.check
    			("SELECT subgenre_seq FROM tblpreference where seq="+ seq);
    	
    	//목표권수 정보
    	int targetread=dbHelper.check
    			("SELECT targetRead FROM tblpreference where seq="+ seq);
    	
    	String query = "SELECT sub.subGenre, book.name, book.author FROM tblBook book "
                + "INNER join tblsubgenre sub "
                + "ON book.subgenre_seq = sub.seq "
                + "WHERE sub.seq = "+subgenre;
    	
    	
    	//서브장르 데이터 카운트
    	int subCount=dbHelper.check
    			("SELECT count(*) FROM tblBook book\r\n"
    				+ "INNER join tblsubgenre sub\r\n"
    					+ "ON book.subgenre_seq = sub.seq\r\n");

    	if(targetread<=subCount) {
    		dbHelper.executeQuery("SELECT * FROM ("+query+" ORDER BY DBMS_RANDOM.VALUE)"
    							+ "where rownum <="+targetread);
    	}else {
    		dbHelper.executeQuery("SELECT * FROM ("+query+" ORDER BY DBMS_RANDOM.VALUE)"
    							+ "where rownum <="+subCount);
    		System.out.println("준비된 책이 부족합니다. 가까운 시일안에 준비하도록 하겠습니다.");
    	}

		
	}
	
}
