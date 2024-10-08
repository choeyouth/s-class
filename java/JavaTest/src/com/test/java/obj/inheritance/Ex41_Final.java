package com.test.java.obj.inheritance;

import java.util.Calendar;

public class Ex41_Final {

	public static void main(String[] args) {
		
		/*
			Final 키워드
			- 한 번 결정하면 바꿀 수 없다.
			- 안정성이 높아진다.
	
			1. 변수 적용(지역 변수, 멤버 변수) 
			    - 초기화 이후에 값을 변경할 수 없다.
			    - (이름 있는)상수
			    - 대문자
			    
			2. 메서드 적용
			    - 상속 시 메서드 오버라이딩 방지
			
			3. 클래스 적용
			    - 상속 방지
			    
		*/
		
		
		int a = 10;
		final int b = 20;
		
		a = 100;
		//b = 200; // b는 상수 -> 값 변화 불가능
		
		System.out.println(Calendar.YEAR); //상수 > final
		
		//성별
//		Gender gender = new Gender();
//		System.out.println(gender.male); // 1 > 남자 
//		
//		Gender gender2 = new Gender();
//		System.out.println(gender2.female);
//		
//		System.out.println(Gender.male);
//		
		
		System.out.println(Gender.MALE);
		System.out.println(Gender.FEMALE);
		
		
	}
	
}

class Gender {
	
	public final static int MALE = 1;
	public static final int FEMALE = 2;
	
}


final class FinalParent  {
	
	final public boolean check() {
		return true;
	}
}

//The type FinalChild cannot subclass the final class FinalParent
//class FinalChild extends FinalParent {
//	
////	@Override
////	public boolean check() {
////		return false;
////	}
//	
//	// 재정의하면 안 되는 메서드 > final 메서드 사용
//	
//}






















