package TennisAPP;

import java.util.Scanner;

public class TennisView {
	
	
public void mainMenu() {
		
		//파일 데이터 CRUD(아래의 행동)
		System.out.println("===============");
		System.out.println("     테니스");
		System.out.println("===============");
		System.out.println("1.새 경기시작"); 
		System.out.println("2.지난 경기 불러오기"); 
		System.out.println("3.선수 정보"); 
		System.out.println("4.신규 선수 등록"); 
		System.out.println("5.종료");
		System.out.println("--------------");
		System.out.println("선택(번호): ");
		
	}

	public void subTitle(String title) {
		System.out.println();
		System.out.println(title);
		
	}
	
	public void pause() {
		
		System.out.println();
		System.out.println("계속 진행하려면 엔터를 입력하세요 !");
		
		Scanner scan = new Scanner(System.in);
		scan.hasNextLine();
		System.out.println();
		
	}
	
	public void backPause() {
		
		System.out.println();
		System.out.println("엔터를 누르면 처음으로 돌아갑니다.");
		
		Scanner scan = new Scanner(System.in);
		scan.hasNextLine();
		System.out.println();
		
	}
	
}
