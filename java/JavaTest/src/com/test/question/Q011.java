package com.test.question;

import java.util.Scanner;

public class Q011 {
	
	public static void main(String[] args) {
		
		// [메서드] 숫자를 2개 입력받아 연산식을 반환하는 메소드를 선언하시오.
		// [조건]
		// 1. String add(int, int)
		// 2. String subtract(int, int)
		// 3. String multiply(int, int)
		// 4. String divide(int, int)
		// 5. String mod(int, int)
	
		// [흐름]
		// 1. 스캐너 생성 
		// 2. 입력 받은 숫자를 저장할 변수 선언
		
		// 3. 메서드 생성
		// 4. 메서드 매개변수 선언
		// 5. 메서드 연산식 생성
	    // 6. 문장 반환
		
		// 7. 메서드 호출 
		// 8. 출력
		
	
		Scanner scan = new Scanner(System.in);
		
		String result;
		int n1, n2;
		
		System.out.print("첫 번째 숫자: ");
		n1 = scan.nextInt();
		
		System.out.print("두 번째 숫자: ");
		n2 = scan.nextInt();
	
		scan.close();
		
		result = add(n1, n2); 
		System.out.println(result);
		
		result = subtract(n1, n2);
		System.out.println(result);

		result = multiply(n1, n2);
		System.out.println(result);

		result = divide(n1, n2);
		System.out.println(result);

		result = mod(n1, n2);
		System.out.println(result);
		
	} // main 
	
	public static String add(int n1, int n2) { // String 메서드에 int 변수 가능한 이유?
		
		//1. int result = n1 + n2; // 오류 : Type mismatch: cannot convert from int to String 
		//2. System.out.println(n1 + " + " + n2 + " = " + result); 
		
		// 1. String result -> 오류
		// 2. int result -> return값 반환 못함 
		
		String result = String.format("%d", n1 + n2);
		System.out.printf("%d + %d = ", n1, n2);
		
		return result;
		
	}
	
	public static String subtract(int n1, int n2) { 
			
		String result = String.format("%d", n1 - n2);
		System.out.printf("%d - %d = ", n1, n2);
		
		
		return result;
		
	}
	public static String multiply(int n1, int n2) { 
		
		String result = String.format("%d", n1 * n2);
		System.out.printf("%d * %d = ", n1, n2);
		
		
		return result;
		
	}
	
	public static String divide(int n1, int n2) {
		
		String result = String.format("%.1f", (double) n1 / n2);
		System.out.printf("%d / %d = ", n1, n2);
		
		
		return result;
		
	}
	
	public static String mod(int n1, int n2) { 
		
		String result = String.format("%d", n1 % n2);
		System.out.printf("%d %% %d = ", n1, n2);
		
		return result;
		
	}
}









