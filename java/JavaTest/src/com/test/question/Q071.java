package com.test.question;

public class Q071 {

	public static void main(String[] args) {
		
		/*
		25	24	23	22	21
		20	19	18	17	16
		15	14	13	12	11
		10	 9 	 8	 7	 6
		 5	 4	 3	 2	 1
		*/
		
		
		int[][] nums = new int[5][5];
		int n = 25;
		// 입력 
		for(int i=0; i<5; i++) {
			for (int j=0; j<5; j++) {
				nums[i][j] = n;
				n--;
			}
		}
		
		// 출력 
		for(int i=0; i<5; i++) {
			for(int j=0; j<5; j++) {
				System.out.printf("%3d", nums[i][j]);
			}
			System.out.println();
		}
		
		
	}
}
