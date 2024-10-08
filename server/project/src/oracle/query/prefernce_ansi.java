package com.oracle.query;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Scanner;
import com.oracle.BasicInfo;

public class prefernce_ansi {
	public static void main(String[] args) {
		// DBHelper 객체 생성
    	BasicInfo dbHelper = new BasicInfo();
    	//스캐너 생성
    	Scanner scan = new Scanner(System.in);
    	
    	//회원 번호 입력
    	System.out.print("회원 번호를 입력하세요 : ");
    	
    	int seq=scan.nextInt();//회원번호 입력받기 / 임시
    	//서브장르 seq
    	int subgenre=dbHelper.check
    			("select subgenre_seq from tblpreference where seq = "+ seq);
    	
    	//목표권수 정보
    	int targetread=dbHelper.check
    			("select targetRead from tblpreference where seq = "+ seq);
    	
    	//서브장르 데이터 카운트
    	String query = "select sub.subGenre, book.name, book.author from tblBook book "
                + "inner join tblsubgenre sub "
                + "on book.subgenre_seq = sub.seq";
    	
    	int subCount = dbHelper.check
    			("select count(*) from tblBook book\r\n"
    				+ "inner join tblsubgenre sub\r\n"
    				+ "on book.subgenre_seq = sub.seq\r\n"
    				+ "where sub.seq = " + subgenre);
    	System.out.println(subCount);

    	if (targetread <= subCount) {
    		dbHelper.executeQuery("select * from (" + query + " ORDER BY DBMS_RANDOM.VALUE)"
    							+ " where rownum <= " + targetread);
    	} else {
    		dbHelper.executeQuery("select * from (" + query + " ORDER BY DBMS_RANDOM.VALUE)"
    							+ "where rownum <= " + subCount);
    		System.out.println("준비된 책이 부족합니다. 가까운 시일안에 준비하도록 하겠습니다.");
    	}

	}
	
}



