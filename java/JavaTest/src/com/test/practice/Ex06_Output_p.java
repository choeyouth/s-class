package com.test.practice;

public class Ex06_Output_p {

	public static void main(String[] args) {

		// print 행 전환 없음
		// println 행 전환
		// printf format 서식
		// - 행 전환 없음 
		
		// %s String
		// %d 정수 byte, short, int, long
		// %f float, double
		// %c char
		// %b boolean
		
		String name = "최유정";
		System.out.printf("제 이름은 %s입니다.\n" ,name);
		System.out.println();
		
		// %숫자s, %숫자d, %숫자f, %숫자c, %숫자b
		// 자릿수 너비 
		System.out.printf("%20d\n", 12345);
		System.out.println();
		
		// %s
		System.out.printf("안녕하세요. %s입니다.\n", "홍길동");
		System.out.printf("안녕하세요. %s입니다.\n", 100);
		System.out.printf("안녕하세요. %s입니다.\n", 3.14);
		System.out.printf("안녕하세요. %s입니다.\n", 'A');
		System.out.printf("안녕하세요. %s입니다.\n", true);
		System.out.println();
		// 모두 출력 가능
		
		// %d -> %,d
		// 3자리 수마다 콤마 출력
		System.out.printf("%,d", 1000000000);
		System.out.println();
		
		// %f
		// 1. %.숫자f : 소수점 이하 자릿수
		System.out.printf("%.2f", 12345.67890);
		System.out.println();
		
		// 세 가지 전부 합치기 순서
		// % -> , (콤마 출력) -> 숫자 (너비) .숫자 (소수점 이하 자릿수) -> f / s / d / c / b
		System.out.printf("%,15.2f\n", 12345.67890);
		
		// 카페 메뉴판 만들기
		System.out.println("========================");
		System.out.println("       음료 가격 ");
		System.out.println("========================");
		System.out.printf("%s\t\t%,6d원\n", "카페라떼", 4500);
		System.out.printf("%s\t%,6d원\n", "자바프라푸치노", 10500);
		System.out.printf("%s\t%,6d원\n", "히비스커스", 9500);
		System.out.printf("%s\t\t%,6d원\n", "녹차라떼", 6500);
		System.out.printf("%s\t\t%,6d원\n", "생수", 500);
		
		
	}

}
