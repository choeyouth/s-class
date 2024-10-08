package com.test.java.array;

import java.util.Calendar;

public class Ex26_Calendar {

	public static void main(String[] args) {
		
		//달력 만들기
		//1. 해당 년월의 마지막 일
		//2. 해당 년월의 1일의 요일
		
		//int year = 2024;
		//int month = 7;
		//printCalendar(year, month);
		
		Calendar now = Calendar.getInstance();
		
		//printCalendar(now.get(Calendar.YEAR)
		//		, now.get(Calendar.MONTH) + 1);
		
		// 올해 달력
		for (int i=1; i<=12; i++) {
			printCalendar(2024, i);
			System.out.println();
			System.out.println();
		}
		
	} //main

	private static void printCalendar(int year, int month) {
		
		//1. 해당 년월의 마지막 일
		int lastDay = getLastDay(year, month);
		
		//System.out.println(lastDay); // 2024년 7월의 마지막 일 
		
		
		//2. 해당 년월의 1일의 요일
		
		int dayOfWeek  = getDaOfWeek(year, month);
		//System.out.println(dayOfWeek);
		
		
		
		System.out.println("====================================================");
		System.out.printf("                   %d년 %02d월\n", year, month);
		System.out.println("====================================================");
		System.out.println("[일]\t[월]\t[화]\t[수]\t[목]\t[금]\t[토]\t");
		
		for (int i=0; i<dayOfWeek; i++) { // 요일에 따른 회전수 
			System.out.print("\t"); // 0일 때 일요일 -> 탭x
		}
		
		for(int i=1; i<=lastDay; i++) {
			
			System.out.printf("%3d\t", i);
			
			// 토요일 개행
			//if(i % 7 == 6) { // 7월에만 해당
			if((i + dayOfWeek) % 7 == 0) {
				System.out.println();
			}
			
			
		}
		
	}

	private static int getDaOfWeek(int year, int month) {
		
		// 서기 1년 1월 1일 ~ 2024년 07월 1일
		int date = 1;
		
		int sum = 0; // 누적 변수
		
		// 서기 1년 1월 1일 ~ 2023년 12월 31일 > 1년 365일
		
		for(int i=1; i<year; i++) {
			sum += 365;
			
			if (isLeafYear(i)) {
				sum++;
			} 
		}
		
		// 2024 1월 1일 ~ 2024년 6월 30일 > 1달씩
		for (int i=1; i<month; i++) {
			sum += getLastDay(year, i);
		} 
		
		// 2024년 7월 1일 ~ 2024년 7월 1일
		sum += date;
		
		
		return sum % 7;
	}

	private static int getLastDay(int year, int month) { // 월의 마지막 일
		
		switch (month) {
			case 1: case 3: case 5: case 7: case 8: case 10: case 12:
				return 31;
			case 4: case 6: case 9: case 11:
				return 30;
			case 2:
				return isLeafYear(year) ? 29 : 28;
		}
		return 0;
	}

	private static boolean isLeafYear(int year) { // 윤년, 평년 판단

		if(year % 4 == 0) {
			if(year % 100 == 0) {
				if (year % 400 == 0) {
					return true;
				} else {
					return false;
				}
			} else {
				return true; //윤년
			}
		} else {
			return false; //평년
		}
		
		
	}
}
