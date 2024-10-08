package TennisAPP;

import java.util.Calendar;
import java.util.Scanner;

public class newGame {

	TennisDTO player1_dto = new TennisDTO();
	TennisDTO player2_dto = new TennisDTO();

	TennisDAO dao = new TennisDAO();
	TennisView view = new TennisView();
	Scanner scan = new Scanner(System.in);
	
	String name1 = "";
	String name2 = "";
	String gender1 = "";
	String gender2 = "";
	
	String date = "";
	
	public void startGame() {
		
		while (true) {
			
			try { 
				
				System.out.print("첫 번째 선수 이름 입력: ");
				name1 = scan.nextLine();
				
				player1_dto = dao.get(name1);
				gender1  = player1_dto.getGender();
				
				System.out.println();
				System.out.println("====================================");
				System.out.println("         첫 번째 선수 정보");
				System.out.println("====================================");
				System.out.println("첫 번째 선수 이름: " + player1_dto.getName());
				System.out.println("첫 번째 선수 성별: " + player1_dto.getGender());
				System.out.println("첫 번째 선수 나이: " + player1_dto.getAge());
				System.out.println("====================================");
				System.out.println();
				
				System.out.print("두 번째 선수 이름 입력: ");
				this.name2 = this.scan.nextLine();
				
				player2_dto = dao.get(name2);
				gender2 = player2_dto.getGender();
				
				System.out.println();
				System.out.println("====================================");
				System.out.println("         두 번째 선수 정보");
				System.out.println("====================================");
				System.out.println("두 번째 선수 이름: " + player2_dto.getName());
				System.out.println("두 번째 선수 성별: " + player2_dto.getGender());
				System.out.println("두 번째 선수 나이: " + player2_dto.getAge());
				System.out.println("====================================");
				System.out.println();
				
                if (name1.equals(name2)) {
                    System.out.println("선수 이름이 중복되었습니다. 다시 입력해주세요.");
                    continue; // 이름이 중복되면 다시 입력 받도록 반복문 계속
                }

                if (!(gender1.equals(gender2))) {
                    System.out.println("같은 성별 간의 경기만 가능합니다.");
                    continue; // 성별이 다르면 다시 입력 받도록 반복문 계속
                } else {
            		if(gender1.equals("남")) {
            			manGame();
            		} else if(gender1.equals("여")) {
            			womanGame();
            		}
                }

                break; // 이름, 성별 유효성 검사 후에 반복문 종료
				
			} catch (Exception e) {
				System.out.println("선수 정보가 옳바르지 않습니다. 다시 확인해주세요.\n");
			}
			
		} 
		

	}


	private void manGame() {

		System.out.println("3세트를 먼저 따내면 승리입니다.");
		System.out.println("게임을 시작합니다.\n");
		view.pause();
		
		System.out.println("================================================");
		System.out.println(dateTime() + player1_dto.getName() + " vs " + player2_dto.getName());
		System.out.println("------------------------------------------------");
		System.out.println("|set| 1set | 2set | 3set | 4set | 5set | total |");
		System.out.println("------------------------------------------------");
		System.out.println("|   |      |      |      |      |      |       |");
		System.out.println("| A |   6  |   4  | 7<T> |   6  |      |   3   |");
		System.out.println("|   |      |      |      |      |      |       |");
		System.out.println("------------------------------------------------");
		System.out.println("|   |      |      |      |      |      |       |");
		System.out.println("| B |   3  |   6  |   4  |   1  |      |   3   |");
		System.out.println("|   |      |      |      |      |      |       |");
		System.out.println("------------------------------------------------");
		System.out.println();
		
		view.backPause();
		
	}

	private void womanGame() {

		System.out.println("2세트를 먼저 따내면 승리입니다.");
		System.out.println("게임을 시작합니다.\n");
		view.pause();
		
		System.out.println("================================================");
		System.out.println(dateTime() + player1_dto.getName() + " vs " + player2_dto.getName());
		System.out.println("------------------------------------------------");
		System.out.println("|set| 1set | 2set | 3set |      |      | total |");
		System.out.println("------------------------------------------------");
		System.out.println("|   |      |      |      |      |      |       |");
		System.out.println("| A |   6  |   4  | 7<T> |      |      |   2   |");
		System.out.println("|   |      |      |      |      |      |       |");
		System.out.println("------------------------------------------------");
		System.out.println("|   |      |      |      |      |      |       |");
		System.out.println("| B |   3  |   6  |   4  |      |      |   1   |");
		System.out.println("|   |      |      |      |      |      |       |");
		System.out.println("------------------------------------------------");
		System.out.println();
		
		view.backPause();
		
	}

	private String dateTime() {
		
		Calendar now = Calendar.getInstance();
		return String.format("%tF\t%tT\t", now, now);
		
	}

}

