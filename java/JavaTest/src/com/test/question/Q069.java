package com.test.question;

import java.util.Arrays;
import java.util.Scanner;

public class Q069 {

	public static void main(String[] args) {
		
		// [요구사항] 배열의 요소를 순차적으로 2개씩 더한 결과를 배열로 생성한 뒤 출력하시오.
		// [조건] 
		// - 원본 배열 길이: 사용자 입력
		// - 원본 배열 요소: 난수(1~9)
		// - 결과 배열 길이: 사용자 입력 / 2
		
		int length = 0;
		int num = 0;
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("배열 길이: ");
		length = scan.nextInt();
		
		
		int[] nums = new int[length];
		
		if (length % 2 == 1) {
			length++;
		} 
		
		int[] results = new int[Math.round((length/2))];
		int temp = 0;
		
		System.out.println(results.length);
		
		
		for (int i=0; i<nums.length; i++) {
			num = (int)(Math.random()*10);
			nums[i] = num;
		}
		
		System.out.println("원본: " + Arrays.toString(nums));

		
			
		for (int i=0; i<nums.length-1; i+=2) {
			
			if (length % 2 == 0) {
				results[results.length -1] = nums[nums.length - 1];
				temp = nums[i] + nums[i+1];
				results[i/2] = temp;
			} else {
				temp = nums[i] + nums[i+1];
				results[i/2] = temp;
			}
	
		}
		
			
		System.out.println("결과: " + Arrays.toString(results));
		scan.close();
	}
	
}


