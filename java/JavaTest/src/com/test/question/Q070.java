package com.test.question;

public class Q070 {
	
	public static void main(String[] args) {
		
		/*
		 1	 2	 3	 4	 5
		10	 9	 8	 7	 6
		11	12	13	14	15
		20	19	18	17	16
		21	22	23	24	25
		 */
		
		int[][] nums = new int[5][5];
		
		int n = 1;
		
		// 입력
		for (int i=0; i<5; i++) {
			for(int j=0; j<5; j++) {
				nums[i][j] = n;
				n++;
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
