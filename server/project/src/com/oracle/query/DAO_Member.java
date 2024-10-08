package com.oracle.query;

import com.oracle.ex13_wordList_dml;
import java.util.Scanner;

public class DAO_Member {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        ex13_wordList_dml wordSearch = new ex13_wordList_dml();
        BasicInfo db = new BasicInfo();

        while (true) {
            System.out.println("=============================");
            System.out.println("       회원 메뉴입니다.");
            System.out.println("  원하시는 메뉴를 고르세요");
            System.out.println("                         ");
            System.out.println("      1. 단어 검색");
            System.out.println("      2. 명언 검색");
            System.out.println("    3. 책 리뷰 살펴보기");
            System.out.println("      4. 종료하기");
            System.out.println("-----------------------------");
            System.out.print("원하시는 메뉴 번호를 입력하세요: ");
            int choice = scan.nextInt();
            scan.nextLine();

            if (choice == 1) {
                System.out.print("검색할 단어를 입력하세요: ");
                String word = scan.nextLine();
                wordSearch.searchWord(word);

                System.out.println("  메뉴로 돌아가시려면 1번,");
                System.out.println("종료하시려면 2번을 누르세요");
                System.out.print("번호 입력 : ");
                int subchoice = scan.nextInt();
                System.out.println("프로그램을 종료합니다");
                
                if (subchoice == 2) {
                	break;
                }

                if (subchoice == 2) {
                    System.out.println("프로그램을 종료합니다");
                    break;
                } else {
                	System.out.println("잘못된 입력입니다. 메뉴로 돌아갑니다.");
                }
            } else if (choice == 2) {
            	System.out.print("책 이름을 입력하세요 : ");	// 읽으면서 바로 써먹는 어린이 스도쿠 : 학교 괴담
            	String name = scan.nextLine();
            	String query = "SELECT B.NAME AS BOOK_NAME, F.FAMOUSLINE AS FAMOUSLINE " +
                        "FROM tblFamousLine F " +
                        "INNER JOIN tblBook B ON F.BOOK_SEQ = B.SEQ " +
                        "WHERE B.NAME = '" + name + "'";
            	
                db.executeQuery(query);
                
                System.out.println("  메뉴로 돌아가시려면 1번,");
                System.out.println("종료하시려면 2번을 누르세요");
                System.out.print("번호 입력 : ");
                int subchoice = scan.nextInt();
                System.out.println("프로그램을 종료합니다");
                
                if (subchoice == 2) {
                	break;
                }
            } else if (choice == 3) {
            	System.out.print("책 이름을 입력하세요 : ");	// 나는 다정한 관찰자가 되기로 했다 , 저는 브랜딩을 하는 사람입니다
            	String name = scan.nextLine();
            	String query = "SELECT B.NAME, R.COMMEND " +
                        "FROM tblBookReview R " +
                        "INNER JOIN tblBook B ON R.BOOK_SEQ = B.SEQ " +
                        "WHERE B.NAME = '" + name + "'";
            	
                db.executeQuery(query);
                
                System.out.println("  메뉴로 돌아가시려면 1번,");
                System.out.println("종료하시려면 2번을 누르세요");
                System.out.print("번호 입력 : ");
                int subchoice = scan.nextInt();
                System.out.println("프로그램을 종료합니다");
                
                if (subchoice == 2) {
                	break;
                }
            } else if (choice == 4){
            	System.out.println("프로그램을 종료합니다. 다시 선택해 주세요.");
            	break;
            } else {
                System.out.println("잘못된 입력입니다. 다시 선택해 주세요.");
            }
        }

        scan.close();
    }
}
