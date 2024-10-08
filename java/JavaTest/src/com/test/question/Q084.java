package com.test.question;

public class Q084 {

	public static void main(String[] args) {
		
		// [요구사항] 특정 단어가 문장내에 몇회 있어있는지 수를 세시오.
		// [조건]
		// - 대상 문자열: String content = "안녕~ 길동아~ 잘가~ 길동아~";
		// - 검색 문자열: String word = "길동";
		
		String content = "안녕~ 길동아~ 잘가~ 길동아~";
		String word = "길동";
		String txt = "";
		int sum = 0;
		
		txt = content.replace(word, "");
		// 18 - 14 - 2 
		sum = (content.length() - txt.length()) / word.length() ;
		
		System.out.printf("\'길동\'을 총 %d회 발견했습니다.", sum);
		
		
		
		
		
//		for (int i=0; i<word.length(); i++) {
//			if (content.indexOf(word) > -1) {
//				sum++;
//			}
//		}
		
		
	}
	
}
