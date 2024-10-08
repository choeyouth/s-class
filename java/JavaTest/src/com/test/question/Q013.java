package com.test.question;

import java.util.Scanner;

public class Q013 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		int kor, eng, math;
		String result;
		
		System.out.print("국어: ");
		kor = scan.nextInt();
		
		System.out.print("영어: ");
		eng = scan.nextInt();
		
		System.out.print("수학: ");
		math = scan.nextInt();
		
		scan.close();
		
		result = test(kor, eng, math);
		System.out.printf("%s입니다.", result);
	}
	
	public static String test(int kor, int eng, int math) {
		
		String result;
		
		result = (kor + eng + math) / 3 >= 60 // 평균 점수 
				&& kor >= 40 // 미만이면 과락 
				&& eng >= 40
				&& math >= 40
				? "합격" : "불합격";
		
		return result;
				
	}
	
}
