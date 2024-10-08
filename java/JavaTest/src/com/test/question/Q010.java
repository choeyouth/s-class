package com.test.question;

public class Q010 {

	public static void main(String[] args) {
		
		// [요구사항] 숫자 1개를 전달하면 4자리로 출력하는 메소드를 선언하시오.
		// [조건]
		// - void digit(int num)
		// - 3항 연산자 사용(조건문 사용 금지)
		// - 입력한 숫자가 4자리 이상이면 그대로 출력한다.
		
		// [흐름]
		// 1. digit 메서드 생성
		// 2. 사용할 변수 선언
		// 3. 4자리로 출력하는 3항 연산자 생성
		// 4. 출력 
		// 5. main 메서드에서 digit 메서드 호출
		
		digit(1);
		digit(12);
		digit(321);
		digit(5678);
		digit(98765);
		
	}
	
	public static void digit(int num) {
		
		// System.out.printf("%04d\n", num);
		
//		String result;
//		String result2;
//		String result3;
//		String result4;
//		
//		result = num <= 9 ? "000" + num : "";
//		result2 = num <= 99 && num > 9 ? "00" + num : "";
//		result3 = num <= 999 && num > 99 ? "0" + num : "";
//		result4 = num > 999 ? "" + num : "";
//		
//		System.out.printf(result);
//		System.out.print(result2);
//		System.out.print(result3);
//		System.out.println(result4);
		
		String result;
		
		// 중첩 삼항 연산자 
		result = num <= 9 ? "000" + num 
				: num <= 99 ? "00" + num 
				: num <= 999 ? "0" + num 
				: "" + num; 
			   // == Integer.toString(num)
		
		System.out.printf("%d -> %s\n", num, result);
	
		
	}
}
