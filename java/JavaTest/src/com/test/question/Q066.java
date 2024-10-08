package com.test.question;

import java.util.Arrays;

public class Q066 {

	public static void main(String[] args) {
		
		// [요구사항] 중복되지 않는 임의의 숫자 6개를 만드시오.(로또)
		// [조건]
		// - 숫자의 범위: 1 ~ 45
		// - 오름차순 정렬
		
		int num = 0;
		
		int[] lotto = new int[6];
		
		for(int i=0; i<lotto.length; i++) {
			num = (int)(Math.random()*45) + 1;
			lotto[i] = num;
		}
		
		Arrays.sort(lotto);
		
		
		for(int i=0; i<lotto.length-1 ; i++) {
			for (int j=0; ; j++) {
				if (lotto[i] == lotto[i+1]) {
					num--;
					
				} else {
					break;
				}
			}
		}
		
		Arrays.sort(lotto);
		System.out.println(Arrays.toString(lotto));
		
		
		
		
		
		
//		for(int i=0; i<lotto.length-1 ; i++) {
//			for (int j=0; ; j++) {
//				if (lotto[i] == lotto[i+1]) {
//					num = (int)(Math.random()*45) + 1;
//					lotto[i] = num;
//					
//				} else {
//					break;
//				}
//			}
//		}
		
		
		
		
		
		
	}
	
}
