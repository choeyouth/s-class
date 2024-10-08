package com.test.question;

public class Q041 {
	
	public static void main(String[] args) {

		// [요구사항] 아래와 같이 출력하시오.
		// [조건] 누적값이 1000을 넘어가는 순간 루프를 종료하시오.
		
		boolean loop = true;
		int i = 0;
		int sum = 0;
		
		while (loop) {
			i ++;
			sum += i;
			System.out.print(i + " + ");
				
			if (sum > 1000) {
				loop = false;
				System.out.println("\b\b= " + sum);
			}
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
	
}
