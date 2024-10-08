package com.test.question;

public class Q078 {

	public static void main(String[] args) {
		
		int[][] nums = new int[5][5];
		int n = 1;
		int k=0; 
		
		/*
			1	2	3	4	5
			16	17	18	19	6
			15	24	25	20	7
			14	23	22	21	8
			13	12	11	10	9
		*/
		
		for(int i=0; i<5; i++) {
			int a = i;
			for(int j=0; j<5; j++) {
				nums[j][a] = n;
				n++;
				a++;
			}
		}
		
		
		

		//입력
		
		//출력
		for(int i=0; i<5; i++) {
			for(int j=0; j<5; j++) {
				System.out.printf("%4d", nums[i][j]);
			}
			System.out.println();
		}
		
		
		
		
	}
	
}


//for(int i=0; i<5; i++) { //대회전 
//for(int j=9; j>i*2; j--) {
//	if(i%2==0) {
//		k=0;
//		if(k+i<5) {
//			nums[i][k+i] = n;
//			k++;
//			n++;
//		} else if(k>=5 && k<9) {
//			nums[k-4][4-i] = n;
//			n++;
//			k++;
//		} else if(k==9) {
//			k=4;
//			break;
//		}
//	} else {
//		k=4;
//		if(k >= i) {
//			nums[5-i][k-i+1] = n;
//			k--;
//			n++;
//		} else if(k<1 && k>-8) {
//			nums[k+8][i-1] = n;
//			n++;
//			k--;
//		} else if(k==-8) {
//			k=0;
//			break;
//		}
//	}
//	
//}
//}