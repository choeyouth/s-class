package com.test.question;

public class Q042 {

	public static void main(String[] args) {
		
		// [요구사항] 서기 1년 1월 1일부터 오늘까지 며칠째인지 합을 구하시오.
		// [조건]
		// Calendar 클래스 사용 금지
		
		// [흐름]
		
		
		double lastYear = 365.2425;
		int lastMonth = 5;
		int lastDay = 0;
		String week = ""; 
		int date = 0;
		
		for (int i=1; i<=lastMonth; i++) {
		
			switch (i) {
				case 1:
				case 3:
				case 5:
				case 7:
				case 8:
				case 10:
				case 12:
					lastDay += 31;
					break;
				case 4:
			 	case 6:
			 	case 9:
			 	case 11:
			 		lastDay += 30;
			 		break;
			 	case 2:
			 		lastDay += 28;
			 		break;
			}
			
		}
		
		System.out.printf("서기 1년부터 작년까지의 날짜는 %,d일입니다.\n",  ((int)(lastYear * 2023) + 1));
		System.out.printf("서기 1년부터 지난 달까지의 날짜는 %,d일입니다.\n",  ((int)(lastYear * 2023) + 1) + lastDay);
		
		date = ((int)(lastYear * 2023) + 1) + lastDay + 30;
		
		switch (date % 7) {
			case 0:
				week = "일요일";
				break;
			case 1:
				week = "월요일";
				break;
			case 2:
				week = "화요일";
				break;
			case 3:
				week = "수요일";
				break;
			case 4:
				week = "목요일";
				break;
			case 5:
				week = "금요일";
				break;
			case 6:
				week = "토요일";
				break;
		}
		
		System.out.printf("2024년 6월 30일은 %,d일째 되는 날이고 %s입니다.\n", date, week);
		
		
		
		
	}
}
