package com.test.java;

public class Ex24_For {

	public static void main(String[] args) {
	
		/*
		
			중첩된 반복문
			
			- 단일 For문
			- 2중 For문
			- 3중  For문
			
			for () {
			
			}
			
			
			for () {
			
				for () {
			
				}
			
			}
			
			
			for() {
			
				for() {
			
					for() {
			
					}
			
				} 
			
			}		
		
		
		
		*/
		
		
		//m1(); //중첩 for문 작성 방법
		//m2(); //구구단
		//m3(); //for문 탈출
		m4(); //별찍기
		
		
	}

	private static void m4() {
		
		//별찍기(제어문)
		
		//5x5
		for (int i=0; i<5; i++) {
			for (int j=0; j<5; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println();
		
		
		for (int i=0; i<5; i++) {
			for (int j=i; j<5; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println();
		
		for (int i=0; i<5; i++) {
			for (int j=0; j<=i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println();
		
		
		
		
	}

	private static void m3() {
		
		for(int i=0; i<10; i++) {
			
			for(int j=0; j<10; j++) {
				
				if(i == 5 || j == 5) {
					break;
				}
				
				System.out.printf("i: %d, j: %d\n", i, j);
			}
			
		}
		
		
		
		
		
	}

	private static void m2() {
		// 구구단
		// 2단 ~ 9단
		
		/*
		2 x 1 = 2
		2 x 2 = 4
		2 x 3 = 6
		...
		2 x 9 = 18
		...
		3 x 1 = 3
		3 x 2 = 6
		... 
		3 x 9 = 18
		...
		9 x 1 = 9
		9 x 2 = 18
		...
		9 x 9 = 81
		*/
		
		for(int dan=2; dan<=9; dan++) {
		
			//int dan = 2;
			
			System.out.println("===========");
			System.out.printf("    %d단\n", dan);
			System.out.println("===========");
			
			for (int i=1; i<=9; i++) {
				System.out.printf("%d x %d = %2d\n",dan, i, dan * i );
				
			}
			System.out.println();
		}
		
		
	}

	private static void m1() {
		//단일 for문
		for(int i=0; i<10; i++) {
			System.out.println("i: " + i);
		}
		System.out.println();

		
		// 2중 for문 > 루프 변수 2개 
		for(int i=0; i<10; i++) { //대회전
			
			for(int j=0; j<10; j++) { //소회전
				
				System.out.println("안녕하세요."); //몇번 실행? 10 * 10 = 100번
				System.out.printf("i: %d, j: %d\n", i, j);
				
			} //j for
		}
		System.out.println();
		
		
		//3중 for문 - ex) 시계 
		for (int i=0; i<24; i++) { //대회전
			for (int j=0; j<60; j++) { //중회전
				for (int k=0; k<60; k++) { //소회전
					// 1000번 실행
					//System.out.printf("i: %d, j: %d, k: %d\n", i, j, k);
					System.out.printf("%d시, %d분, %d초\n", i, j, k);
				}
			}
		}

		
		//학교
/*
		for(학년) {
			for(반) {
				for(번호) {
					
				}
			}
		}
*/		
		
		//아파트 [4중 for문 - 잘 쓰지 않음(3중까지 연습)]
/*		
		for(단지) {
			for(동) {
				for(층) {
					for (호) {
					
					}
				}
			}
		}
*/
		
		
		
		
		
		
	}
	
}
