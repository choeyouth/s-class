package com.test.question;

public class Q072 {
	
	public static void main(String[] args) {
		
		/*
		
		1	6	11	16	21
		2	7	12	17	22
		3	8	13	18	23
		4	9	14	19	24
		5	10	15	20	25

		*/
		
		
		int[][] nums = new int[5][5];
		int n = 1;
		
		for(int i=0; i<5; i++) {
			for(int j=0; j<5; j++) {
				nums[j][i] = n;
				n++;
			}
		}
		
		// 출력 
		for(int i=0; i<5; i++) {
			for (int j=0; j<5; j++) {
				System.out.printf("%3d", nums[i][j]);
			}
			System.out.println();
		}
		
	}

}
