package com.test.question;

import java.util.Calendar;
import java.util.Scanner;

public class Q024 {

	public static void main(String[] args) {
		
		// [요구사항] 여러 배달 음식을 같은 시간에 받기를 원하는 고객이 있다. 고객이 각각의 매장에 몇시에 전화를 해야 모든 음식을 같은 시간에 받을 수 있는지 알려주시오.
		
		// [조건]
		// 전화를 걸면 짜장면은 10분 뒤에 도착합니다.
		// 전화를 걸면 치킨은 18분 뒤 도착합니다.
		// 전화를 걸면 피자는 25분 뒤 도착합니다.
		// 음식을 받기 원하는 시간은 오후 11시 이전에만 가능합니다.(날짜 변경 금지)
		
		// [흐름]
		// 스캐너 생성
		// 현재 시간 생성
		// 안내 메시지 출력
		// 입력값 저장
		// 짜장 치킨 피자가 걸리는 시간 연산 
		// 출력
		
		Scanner scan = new Scanner(System.in);
		
		Calendar now = Calendar.getInstance();
		
		System.out.println("음식을 받기 원하는 시각");
		System.out.print("시: ");
		int hour = scan.nextInt();
		
		System.out.print("분: ");
		int minute = scan.nextInt();
		
		now.set(Calendar.HOUR_OF_DAY, hour);
		now.set(Calendar.MINUTE, minute);
		now.add(Calendar.MINUTE, -10);
		System.out.printf("짜장면: %d시 %d분\n", 
				now.get(Calendar.HOUR_OF_DAY), now.get(Calendar.MINUTE));
		
		now.set(Calendar.HOUR_OF_DAY, hour);
		now.set(Calendar.MINUTE, minute);
		now.add(Calendar.MINUTE, -18);
		System.out.printf("치킨: %d시 %d분\n", 
				now.get(Calendar.HOUR_OF_DAY), now.get(Calendar.MINUTE));
		
		now.set(Calendar.HOUR_OF_DAY, hour);
		now.set(Calendar.MINUTE, minute);
		now.add(Calendar.MINUTE, -25);
		System.out.printf("피자: %d시 %d분\n", 
				now.get(Calendar.HOUR_OF_DAY), now.get(Calendar.MINUTE));
		
		scan.close();
		
	}
	
}



//int jjajangHour, jjajangMinute, chickenHour, chickenMinute, pizzaHour, pizzaMinute;
//jjajangMinute = 10;
//chickenMinute = 18;
//pizzaMinute = 25;

//System.out.printf("짜장면: %d시 %d분\n", (hour - (minute / 60)) , ((minute % 60) - jjajangMinute));
//System.out.printf("치킨: %d시 %d분\n", (hour - (minute / 60)) , ((minute % 60) - chickenMinute));
//System.out.printf("피자: %d시 %d분\n", (hour - (minute / 60)) , ((minute % 60) - pizzaMinute));

//Calendar jjajang = Calendar.getInstance();
//jjajang.set(jjajang.HOUR_OF_DAY, hour - (minute / 60));
//jjajang.set(jjajang.MINUTE, ((minute % 60) - 10));
//System.out.printf("%d시 %d분\n", jjajang.HOUR_OF_DAY, jjajang.MINUTE);
