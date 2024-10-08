package com.test.question;

public class Q009 {
	
	public static void main(String[] args) {
		
		// [요구사항] 이름을 전달하면 이름뒤에 '님'을 붙여서 반환하는 메소드를 선언하시오.
		// [조건]
		// - String getName(String name)
		// - name: OOO(이름)
		// - return: OOO(이름)님
		
		// [흐름]
		// 1. String getName 메서드 생성
		// 2. 메서드에 사용할 변수 선언
		// 3. return 값 출력 
		// 4. main 메서드에서 사용할 변수 선언
		// 5. getName 메서드 호출 
		// 6. 출력 
		
		
		String result;
		
		result = getName("홍길동");
		System.out.printf("고객: %s\n", result);
		
		result = getName("아무개");
		System.out.printf("고객: %s\n", result);
		
		
	}
	
	public static String getName(String name) {
		
		return name + "님";
		
	}
	
}
