package com.test.question;

import java.util.Scanner;

public class Q065 {

	public static void main(String[] args) {
		
		// [요구사항] 난수를 담고 있는 배열을 생성한 뒤 아래와 같이 출력하시오.
		// [조건]
		
		// - 난수를 20개 발생 후 배열에 넣는다.
		// - 난수는 1 ~ 20 사이
		// - 배열을 탐색하여 범위에 만족하는 숫자만 출력한다.
		
		Scanner scan = new Scanner(System.in);
		
		int max = 0;
		int min = 0;
		int num = 0;
		String sum = "";
		int[] nums = new int[20];
		
		System.out.print("최대 범위: ");
		max = scan.nextInt();
		
		System.out.print("최소 범위: ");
		min = scan.nextInt();
		
		for (int i=0; i<nums.length; i++) {
			num = (int)(Math.random() * 20) + 1;
			nums[i] = num;
		}
		
		System.out.print("원본: ");
		for (int i=0; i<nums.length; i++) {
			System.out.printf("%d, ", nums[i]);
		}
		System.out.println();
		
		System.out.print("결과: ");
		for (int i=0; i<nums.length; i++) {
			if (nums[i] <= max && nums[i] >= min) {
				sum += nums[i] + ", "; 
			}
		}
		
		System.out.printf("%s ", sum);
		
		scan.close();
		
	}
	
}
