package com.test.question;

import java.util.Scanner;

public class Q025 {

		public static void main(String[] args) {
			
			// [요구사항] 숫자 2개를 입력받아 큰수와 작은수를 출력하시오.
			// [조건] 두 숫자가 얼마의 차이를 보이는지 출력하시오.
			
			// 흐름
			// 스캐너 생성
			// 라벨 출력
			// 숫자 저장
			// if문 조건식 
			
			Scanner scan = new Scanner(System.in);
			
			System.out.print("첫번째 숫자: ");
			int n1 = scan.nextInt();
					
			System.out.print("두번째 숫자: ");
			int n2 = scan.nextInt();
			
			if (n1 > n2) {
				System.out.printf("큰 수는 %d이고, 작은 수는 %d입니다. 두 숫자는 %d(가)이 차이납니다."
								, n1, n2, n1-n2);
			} else if (n1 < n2) {
				System.out.printf("큰 수는 %d이고, 작은 수는 %d입니다. 두 숫자는 %d(가)이 차이납니다."
						, n2, n1, n2-n1);
			} else {
				System.out.println("두 숫자는 동일합니다.");
			}
			
			scan.close();
			
		}
	
}
