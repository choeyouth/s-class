package com.oracle.query;

import java.util.Scanner;

public class DAO_START {
    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);

        System.out.println("관리자 메뉴는 1번");
        System.out.println("회원 메뉴는 2번을 누르세요.");
        System.out.print("입력 : ");
        int select = scan.nextInt();
        
        if (select == 1) {
            DAO_Manager.main(null);
        } else if (select == 2) {
            DAO_Member.main(null);
        } else {
            System.out.println("잘못된 입력입니다. 다시 시도하세요.");
        }
        scan.close();
    }
}