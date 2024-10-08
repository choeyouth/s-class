package com.test.question;

import java.util.Scanner;

public class Q076 {

	public static void main(String[] args) {
		
		// [요구사항] 성적을 입력받아 아래와 같이 출력하시오.
		// [조건] String[][] score = new String[10][3];
		
		String[][] score = new String[10][3];
		
		int kor = 0;
		int eng = 0;
		int math = 0;
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("국어 점수: ");
		kor = scan.nextInt()/10;
		
		System.out.print("영어 점수: ");
		eng = scan.nextInt()/10;
		
		System.out.print("수학 점수: ");
		math = scan.nextInt()/10;
		
		String square = "■";

		for(int i=0; i<3; i++) {
			for(int j=score.length-1; j>=0; j--) {
				if(i == 0) {
					if(kor-j <= 0) {
						score[j][i] = "";
					} else if (kor-j > 0){
						score[j][i] = square;
					}
				}
				else if (i == 1) {
					if(eng-j <= 0) {
						score[j][i] = "";
					} else if (kor-j > 0){
						score[j][i] = square;
					}
					
				}
				else {
					if(math-j <= 0) {
						score[j][i] = "";
					} else if (kor-j > 0){
						score[j][i] = square;
					}
					
				}
			}
		}
		
		
		for(int i=score.length-1; i>=0; i--) {
			for(int j=0; j<score[i].length; j++) {
				System.out.print(" " + score[i][j] + "\t");
			}
			System.out.println();
		}
		
		System.out.println("--------------------");
		System.out.println("국어\t영어\t수학");
		
		scan.close();
		
	}
	
}
