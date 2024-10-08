package com.test.question;

import java.util.Scanner;

public class Q014 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		int station, change, time, result;
		
		System.out.print("역의 개수: ");
		station = scan.nextInt();
		
		System.out.print("환승역의 개수: ");
		change = scan.nextInt();
		
		System.out.print("시간대(1. 평상시, 2. 출근시, 3. 퇴근시): ");
		time = scan.nextInt();
		
		scan.close();
		
		result = getTime(station, change, time);
		System.out.printf("총 소요 시간은 %d분입니다.", result);
		
	}
	
	public static int getTime(int station, int change, int time) {
		
		int result;
		time = time == 1 ? 3 
			 : time == 2 ? 4 : 5;
//			 : time == 3 ? 5 : 0;
		
		
		result = (station * 2) + (change * time);
		
		return result;
		
	}
	
}
