package com.test.question;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.Stack;

public class Q125 {

	public static void main(String[] args) {
		
		// [요구사항] 모든 괄호가 서로 짝이 맞는지 검사하시오.
		// [조건]
		// - 대상 괄호: (), {}
		// - Stack 사용
		
		String path = "C:\\Users\\ee\\Downloads\\파일 입출력 문제\\괄호.java";
		
		File file = new File(path);
		String line = null;
		//int rcount = 0;
		//int bcount = 0;
		String temp = "";
		
		if(file.exists()) {
			
			try {
				
				BufferedReader reader = new BufferedReader(new FileReader(path));
				Stack<String> stack = new Stack<>();
				
				while ((line = reader.readLine()) != null) {
					
					temp += line + "\r\n";
					
				}
				
				for(int i=0; i<temp.length(); i++) {
					
					char c = temp.charAt(i);
					
					if(c == '(') {
						stack.push("(");
					} 
					if(c == ')') {
						stack.pop();
					}
					
					if(c == '{') {
						stack.push("{");
					}
					if(c == '}') {
						stack.pop();
					}
					
				}
				
				System.out.println(stack);
				System.out.println(stack.size());
				
				if(stack.size() == 0) {
					System.out.println("올바른 소스입니다.");
				} else {
					System.out.println("올바르지 않은 소스입니다.");
				}
				
				reader.close();
				
			} catch (Exception e) {
				System.out.println("Q125.main");
				e.printStackTrace();
			}
			
		}
		
		
	}
	
}
