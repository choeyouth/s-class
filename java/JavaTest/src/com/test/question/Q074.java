package com.test.question;

public class Q074 {

	public static void main(String[] args) {
		
		/*
			0	0	1	0	0
			0	2	3	4	0
			5	6	7	8	9
			0  10  11  12	0
			0	0  13	0	0				
		*/
		
		int[][] nums = new int[5][5];
		int n = 1;
		for(int i=0; i<3; i++) {
			for(int j=2-i; j<i+3; j++) {
				nums[i][j] = n;
				n++;
			}
		}
		
		for(int i=3; i<5; i++) {
			for(int j=i-2; j<=6-i; j++) {
				nums[i][j] = n;
				n++;
			}
		}
		
		
		
		// 출력 
		for(int i=0; i<5; i++) {
			for(int j=0; j<5; j++) {
				System.out.printf("%4d", nums[i][j]);
			}
			System.out.println();
		}
		
		
	}
}
