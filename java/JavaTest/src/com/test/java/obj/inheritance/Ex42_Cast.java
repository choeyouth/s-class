package com.test.java.obj.inheritance;

public class Ex42_Cast {

	public static void main(String[] args) {
		
		/*
			형변환, Type Casting

			1. 값형 형변환
			    - 값형끼리 형변환
			    - byte, short, int, long, float, double, char
			
			2. 참조형 형변환
			    - 클래스끼리 형변환
			    
			참조형 형변환
			- 상속 관계에 있는 클래스끼리만 형변환이 가능하다.
			- 직계끼리 가능 (부모, 자식) 
			- 방계는 불가능 (형제)
			
			1. 업캐스팅, Up Casting
			    - 암시적인 형변환
			    - 자식 클래스 > (형변환) > 부모 클래스
			    
			
			2. 다운캐스팅, Down Casting
				- 명시적인 형변환
				- 부모 클래스 > (형변환) > 자식 클래스
				
		*/
		
		CastParent p1;
		CastChild c1;
		
		c1 = new CastChild(); // 자식 객체 > 원본 역할
		
		// 복사
		// CastParent = CastChild
		// 암시적인 형변환 > 100% 안전하다. 
		// 부모클래스 = 자식 클래스 
		// 업캐스팅 
		// 100% 가능
		p1 = c1; //(CastParent)c1
		
		// 검증?
		// - 값형 형변환 > 검증? > 복사본 출력 > 원본 동일? 
		// - 참조형 형변환 > 검증? 
		
		p1.a = 10;
		p1.b = 20;
		
		System.out.println(p1.a);
		System.out.println(p1.b);
		
		/*
		
			child 참조변수를 통해 child 객체를 보면 a, b, c, d가 다 보임
	
			parent 참조변수를 통해 Parent 객체를 보면 parent의 참조변수인 a, b 밖에 보이지 않음 (부모 껍데기를 갖고 있어서 상속된 값은 무조건 보임) → 안전하다. 
			
			- 변수가 Parent이기 때문에 Parent 객체를 쓰는 것……
			- 문제가 없음
			- 존재하지만 모르는 것 뿐… 모르는 건 문제가 되지 않는다.
		
		
		*/
		
		CastParent p2;
		CastChild c2;
		
		p2 = new CastParent(); //부모 객체 > 원본 역할
		
		// 복사
		// CastChild = CastParent
		// 자식 클래스 = 부모 클래스
		// 다운 캐스팅
		// 명시적 형변환
		// 100% 불가능
		//c2 = (CastChild)p2;
		// 오류 발생 
		
		// 검증?
//		c2.a = 10;
//		c2.b = 20;
//		c2.c = 30;
//		c2.d = 40;
		// 오류 발생 
		
		/*
		
			parent 객체로 만들어져서, child 변수가 c, d를 알고 있어도 객체를 생성할 수 없음
			- 다운캐스팅은 불가능한 작업
			- 안 되는 일부 때문에 되는 것을 포기함
			
			첫 줄부터 에러가 발생함. 
			→ 불가능한 작업이기 때문
			
			내가 들고 있는 참조 변수를 더 중요하게 생각함
			정의된 대로 찾아갔는데 실제로 객체가 있는 경우 > 안전
			정의된 대로 찾아갔는데 객체가 없는 경우 > 에러
		
		*/
		
		
		
	}//main
	
}//class


class CastParent {
	
	public int a;
	public int b;
	
}

class CastChild extends CastParent {
	
	public int c;
	public int d;
	
}



















