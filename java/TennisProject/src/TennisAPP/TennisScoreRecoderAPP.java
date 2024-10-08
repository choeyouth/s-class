package TennisAPP;

import java.util.Scanner;

public class TennisScoreRecoderAPP {
	
	public static void main(String[] args) {
		
		
		boolean loop = true;
		Scanner scan = new Scanner(System.in);
		TennisService service = new TennisService();
		TennisView view = new TennisView();
		newGame game = new newGame();
		
		
		while(loop) {
			
			//파일 데이터 CRUD
			view.mainMenu();
	
			String sel = scan.nextLine();
		
			if(sel.equals("1")) {
				game.startGame(); 
			} else if (sel.equals("3")) {
				service.playerCheck();
			} else if (sel.equals("4")) {
				service.addPlayer();
			} else {
				//종료
				loop=false;
			}
			
			
			
			
		}
		
		System.out.println("\n프로그램을 종료하겠습니다");
		
	}
	

}
