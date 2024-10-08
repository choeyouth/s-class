package com.test.question;



public class Q064 {

	public static void main(String[] args) {
		
		// [요구사항] 1~20 사이의 난수를 담고 있는 배열을 생성하고 최댓값과 최솟값을 출력하시오.
		// [조건]
		// - 난수를 20개 발생 후 배열에 넣는다.
		// - 난수는 1 ~ 20 사이
		
		int num = 0;
		int max = 0;
		int min = 0;
		
		int[] nums = new int[20];

		for (int i=0; i<20; i++) {
			num = (int)(Math.random() * 20) + 1;
			nums[i] = num;
		}
		
		System.out.print("원본: ");
		
		
		for (int i=0; i<nums.length; i++) {
			System.out.printf("%d, ", nums[i]);
		}
		System.out.println();
		
		int i = 0;
		max = nums[i];
		min = nums[i];
		
		for (i=1; i<nums.length; i++) {
			
			if (nums[i] > max) {
				max = nums[i];
			} 
			
			if (nums[i] < min) {
				min = nums[i];
			}
			
		}
		
		System.out.println("원본: " + max);
		System.out.println("최댓값: " + min);
		
		
	}
	
}
