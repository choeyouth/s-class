package TennisAPP;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.util.Scanner;

public class TennisService {
	
	
	private TennisDAO dao;
	private TennisView view;
	private Scanner scan;
	
	
	public void playerCheck() {
		String playerPATH = ".\\dat\\dummy.txt";
		final int perPage = 15;		
			System.out.println("저장된 선수 목록을 불러옵니다.");
			
			try {
			    BufferedReader reader = new BufferedReader(new FileReader(playerPATH));
			    String line;
			    int lineNumber = 0;
			    
			    while ((line = reader.readLine()) != null) {
			    	lineNumber++;
			    	System.out.println(line);
			    	
			    	if (lineNumber % perPage == 0) {
			    		System.out.print("\n 다음 목록으로..(엔터)");
			    		waitForEnter();
			    	}
				}
			    System.out.println();
			    System.out.println("마지막 페이지..");
			    System.out.println("엔터를 누르면 처음으로 돌아갑니다.");
			    reader.close();					
			    
			} catch (Exception e) {
					System.out.println("파일을 읽는 중 오류가 발생했습니다.");
					e.printStackTrace();
					
			}
			scan.skip("\r\n");
		}

	private void waitForEnter() {
		try {
			BufferedReader consoleReader = new BufferedReader(new InputStreamReader(System.in));
			consoleReader.readLine();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public TennisService() {
		
		this.view = new TennisView();
		this.dao = new TennisDAO();
		this.scan = new Scanner(System.in);
		
	}
	
	
	public void addPlayer() {
		
		TennisDAO dao = new TennisDAO();
		TennisView view = new TennisView();
		
		Scanner scan = new Scanner(System.in);
		String name = "";
		String age = "";
		int gender = 0;
		
		view.subTitle("신규 선수 등록");
		
		System.out.print("이름 : ");
		name = scan.nextLine();
		
		// int > String 
		System.out.print("나이 : ");
		age = scan.nextLine();
		
		
		TennisDTO dto = new TennisDTO();
		
		while(dto.getGender()==null) {
			System.out.print("성별(남:1 / 여:2) : ");
			
			gender = scan.nextInt();
			
		if(gender==1) {
			dto.setGender("남");
			break;
			
		}else if(gender ==2 ) {
			dto.setGender("여");
			break;
			
		}else {
			System.out.println("남자라면 1, 여자라면 2를 입력해주세요.");
		}
		}
		
		scan.skip("\r\n");
		
		
		
		dto.setName(name);
		dto.setAge(age);
		
		
		dao.addPlayer(dto);
		
		System.out.println("선수 등록 완료 !");
		
		view.pause();
		
	}
	
	
	
	
	

}
