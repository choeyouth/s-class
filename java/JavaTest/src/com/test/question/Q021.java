package com.test.question;

import java.util.Calendar;
import java.util.Scanner;

public class Q021 {
 
	public static void main(String[] args) {
		
		// [요구사항] 태어난 년도를 입력하면 나이를 출력하시오.
		// [조건] 
		// 올해를 기준으로 나이를 계산하시오.
		// 내년, 내후년에 실행해도 그때에 맞는 나이를 출력한다.
		// 우리나라 나이로 출력하시오.
		
		// [흐름] 
		// 스캐너를 생성한다.
		// 현재 시각을 구한다.
		// 나이를 저장할 시각
		// 안내 메시지를 출력한다. 
		// 입력받을 년도 변수를 선언한다. 
		// 나이를 계산한다. 
		// 출력
		
		Scanner scan = new Scanner(System.in);
		
		Calendar now = Calendar.getInstance();
		Calendar age = Calendar.getInstance();
		System.out.print("태어난 년도: ");
		int birthYear = scan.nextInt();
		
		age.set(birthYear, 6, 26);  
		
		System.out.printf("나이: %d세", 
				(now.get(Calendar.YEAR)) - (age.get(Calendar.YEAR)) + 1); // 답: + 1 ??
				
		scan.close();
		
		
	}
	
}
