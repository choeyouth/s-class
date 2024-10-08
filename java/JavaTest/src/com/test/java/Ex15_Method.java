package com.test.java;

import java.util.Scanner;

public class Ex15_Method {
	
	public static void main(String[] args) {
		
		// public static void hello()
		
		// void : 반환타입
		// - void == 없다. == null
		
		String name = getName(); // 반환값
		System.out.println(name); // void java.io.PrintStream.println(String x) : 반환값 x
		
		String result = checkScore(100, 90, 80);
		System.out.println(result);
		
		Scanner scan = new Scanner(System.in);
		
		int num = scan.nextInt(); // int java.util.Scanner.nextInt() : 반환값 int


		
		
		
		
		
		
		
	} // main 
	
	// This method must return a result of type String
	// This method must return a result of type int
	
	// String > 반환타입 
	public static String getName() { 
		
		// return문
		return "홍길동"; // 메서드 종료 + 돌아가기
		// return 값은 단일값만 가능 // The left-hand side of an assignment must be a variable
		
		// System.out.println("종료"); // Unreachable code : 도달할 수 없는 코드 -> return문이 앞에 있기 때문에
		

	}
	
	
	public static String checkScore(int kor, int eng, int math) {
		
		int total = kor + eng + math;
		
		// double avg = (double)total / 3;
		double avg = total / 3.0;
		
		String result = avg >= 60 ? "합격" : "불합격";
		
		return result;
		
		
	}
}
