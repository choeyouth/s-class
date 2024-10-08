package com.test.question;

import java.util.Arrays;
import java.util.Scanner;

public class Q062 {

	public static void main(String[] args) {
		
		// [요구사항] 학생의 이름을 N개 입력받아 아래와 같이 출력하시오.
		// [조건] 이름을 오름차순 정렬하시오.
		
		Scanner scan = new Scanner(System.in);
		int count = 0;
		
		System.out.print("학생 수: ");
		count = scan.nextInt();
		scan.nextLine();
		
		String[] names = new String[count];
		
		for (int i=0; i<count; i++) {
			System.out.print("학생명: ");
			names[i] = scan.nextLine();
		}
		
		System.out.printf("입력한 학생은 총 %d명입니다. \n", count);
		
		
		Arrays.sort(names);
//		System.out.println(Arrays.toString(names));
		
		
		for (int i=0; i<count; i++) {
			
			System.out.printf("%d. %s \n", i + 1, names[i]);
			
		}
		
		scan.close();
		
		
		// Arrays.sort 쓰지 말고 더 해보기 
		
	}
	
	
}
