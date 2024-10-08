package com.oracle.dao;

import java.sql.SQLException;
import java.util.Scanner;

public class HomeController {

	public static void main(String[] args) throws SQLException {

		Scanner mainScan = new Scanner(System.in);
		View view = new View();
		LoginService ls = new LoginService();
		SignUp su = new SignUp();
		boolean loginLoop = true;
		
		while(loginLoop) {
			
			view.loginMenu();
			
			String loginSel = mainScan.nextLine();
			
			if (loginSel.equals("1")) {
				//회원 로그인 
				ls.memberLogin();
				loginLoop = false;
			} else if (loginSel.equals("2")) {
				//아이디 찾기 
				ls.findMember(loginSel);
				loginLoop = false;
			} else if (loginSel.equals("3")) {
				//비밀번호 찾기
				ls.findMember(loginSel);
				loginLoop = false;
			} else if (loginSel.equals("4")) {
				//회원 가입 
				su.register();
				loginLoop = false;
			} else if (loginSel.equals("0")) {
				//관리자 로그인 
				ls.managerLogin();
				loginLoop = false;
			} else {
				//종료
				loginLoop = false;
			} 
		}
	}
}
