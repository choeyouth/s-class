package com.test.question;

public class Q077 {

	public static void main(String[] args) {
		
		/*
			1	2	4	7	11
			3	5	8	12	16
			6	9	13	17	20
			10	14	18	21	23
			15	19	22	24	25
			
			0,0  0,1  0,2  0,3  0,4
			1,0  1,1  1,2  1,3  1,4
			2,0  2,1  2,2  2,3  2,4
			3,0  3,1  3,2  3,3  3,4
			4,0  4,1  4,2  4,3  4,4
		
			1 > 0,0
			
			2 > 0,1
			3 > 1,0
			
			4 > 0,2
			5 > 1,1 
			6 > 2,0
			
			7 > 0,3
			8 > 1,2
			9 > 2,1
			10 > 3,0
			
			11 > 0,4
			12 > 1,3
			13 > 2,2
			14 > 3,1
			15 > 4,0
			
			16 > 1,4
			17 > 2,3
			18 > 3,2
			19 > 4,1
			
			20 > 2,4
			21 > 3,3
			22 > 4,2
			
			23 > 3,4
			24 > 4,3
			
			35 > 4,4
		
		*/
		
		int[][] nums = new int[5][5];
		int n = 1;

		for(int i=0; i<5; i++) {
			int a = i;
			for(int j=0; j<=i; j++) {
				nums[j][a] = n;
				n++;
				a--;
			}
		}
		
		for(int i=1; i<5; i++) {
			int a = 4;
			for(int j=i; j<=4; j++) {
				nums[j][a] = n;
				n++;
				a--;
			}
		}
		
		
//		for(int i=0; i<5; i++) {
//			int a = i;
//			for(int j=0; j<=i; j++) {
//				nums[j][a] = n;
//				n++;
//				a--;
//			}
//		}
//		
//		for(int i=1; i<5; i++) {
//			int a = 4;
//			for(int j=i; j<=4; j++) {
//				nums[j][a] = n;
//				n++;
//				a--;
//			}
//		}
		
		for(int i=0; i<5; i++) {
			for(int j=0; j<5; j++) {
				System.out.printf("%4d", nums[i][j]);
			}
			System.out.println();
		}
		
	}
	
}

		
		
		
//			for(int j=0; j<9; j++) {
//				if(j%2 == 0) {
//					for(int i=0; i<5; i+=2) {
//						if(num < 4) {
//							
//							nums[j/2][num] = n;
//							n++;
//							nums[num][j/2] = n;
//							n++;
//							num++;
//							
//						} else if(num >= 4) {
//							nums[num][num] = n;
//							n++;
//						}
//					}
//				} else {
//					num=2;
//					for(int i=1; i<6; i+=2) {
//						if(num < 4) {
//							nums[j/3+1][num] = n;
//							n++;
//							nums[num][j/3+1] = n;
//							n++;
//							num++;
//							
//						} else if(num >= 4) {
//							break;
//						}
//					}
//				}
//			}
			
			
			
			
//			
//			for(int j=3; j<5; j++) {
//				for(int i=0; i<3; i++) {
//					if(num < 4) {
//						
//						nums[j][num] = n;
//						n++;
//						nums[num][j] = n;
//						n++;
//						
//					} else if(num >= 4) {
//						nums[num][num] = n;
//						n++;
//					}
//				}
//			}
		
		
		

		
//		for(int i=0; i<9; i++) {
//			if(i<5) {
//			  	for(int j=0; j<i; j++) {
//					nums[j][i] = n;
//					n++;
//				}
//			} else if(i>4 && i<9) {
//				for(int k=0; k<i-4; k++) {
//					nums[k][k] = n;
//					n++;
//					nums[i-4][k] = n;
//					n++;
//				}
//			} else {
//				for(int k=i; k==i; k++) {
//					nums[k][k] = n;
//					n++;
//				}
//			}
//			
//		}

		


//
//for(int i=0; i<5; i++) {
//	for(int j=0; j<i; j++) {
//		nums[i][j] = n;
//		n++;
//		nums[j][i] = n;
//		n++;
//	}
//}
