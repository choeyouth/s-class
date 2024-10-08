package com.test.question;

import java.util.Scanner;

public class Q005 {
	
	public static void main(String[] args) {
		
		// [요구사항] 자전거가 있다. 자전거의 바퀴는 지름(직경)이 26인치이다. 
		// 			사용자가 페달을 밟은 횟수를 입력하면 자전거가 총 몇 m를 달렸는지 출력하시오.
		// [조건] 
		// 1. 기어비 1:1 → 페달 1회전 == 자전거 바퀴 1회전
		// 2. 모든 출력 숫자는 천단위 표기하시오.
		
		// [흐름]
		// 1. 스캐너를 생성한다. 
		// 2. 사용할 변수를 사용한다.
		// 3. 안내 메시지를 출력한다.
		// 4. 페달 횟수의 값을 입력 받는다. 
		// 5. 기어비 연산을 한다. 
		// 6. 출력한다. 
		
		Scanner scan = new Scanner(System.in);
		
		// 1인치 -> 2.54cm 
		// double wheel = 26 * 2.54; // 바퀴의 지름이 66.04cm
		// double wheel = 26 * 0.0254; // 바퀴의 지름이 0.6604m 
		double wheel = 26 * 0.0254 * 3.14; // 원의 둘레를 구하는 공식 : 지름 x 3.14
		int pedal = 0;
		
		System.out.print("사용자가 페달을 밟은 횟수 : ");
		pedal = scan.nextInt();
		
		// double disatace = wheel * 3.14 * pedal / 100;
		double distance = wheel * pedal;
		System.out.printf("사용자가 총 %,d회 페달을 밟아 자전거가 총 %,.3fm를 달렸습니다.", pedal, distance);
		
		scan.close();
		
		
		
	}
}
