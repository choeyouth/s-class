package com.test.question;

import java.util.Calendar;

public class Q020 {
	
	public static void main(String[] args) {
		
		// [요구사항] 오늘 태어난 아이의 백일과 첫돌을 출력하시오.
		
		// [흐름]
		// 1. 현재 시각을 구한다.
		// 3. 백일을 더한 값
		// 5. 출력
		// 6. 현재 시각을 구한다. 
		// 7. 1년을 더한 값
		// 8. 출력
		
		Calendar hun = Calendar.getInstance();
		hun.add(Calendar.DATE, 100);
		System.out.printf("백일: %tF\n", hun);
		
		Calendar firstBirth = Calendar.getInstance();
		firstBirth.add(Calendar.YEAR, 1);
		System.out.printf("첫돌: %tF\n", firstBirth);
		
	}
}
