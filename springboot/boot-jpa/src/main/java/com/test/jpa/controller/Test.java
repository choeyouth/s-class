package com.test.jpa.controller;

import java.util.Arrays;

public class Test {
	
	public static void main(String[] args) {
		
		int a = 10;
		m1(a);
		System.out.println(a); //10
		
		int[] nums = { 10, 20, 30 };
		m2(nums);
		//System.out.println(nums[0]); //100
		System.out.println(Arrays.toString(nums));
	}
	
	//주소값 전달 > Call by Reference(X)
	//            > Call by Value(O)
	private static void m2(int[] nums) { 
		
		//nums[0] = 100;
		nums = new int[] { 5, 6, 7 };
		
	}

	public static void m1(int a) { //값 전달 > Call by Value
		a = 20;
	}

}









