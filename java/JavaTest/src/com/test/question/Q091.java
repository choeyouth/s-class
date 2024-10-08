package com.test.question;

import java.util.Scanner;

public class Q091 {

	public static void main(String[] args) {
		
		// [요구사항] 연산식을 입력받아 실제 연산을 하시오.
		
		// [조건]
		// 산술 연산자만 구현하시오.(+, -, *, /, %)
		// 연산식의 공백은 자유롭게 입력 가능합니다.
		// 산술 연산자가 반드시 존재하는지 체크하시오.
		// 피연산자의 갯수가 2개인지 체크하시오.
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("입력: ");
		String operator = scan.nextLine();
		
		//System.out.println(operator.length());
		operator = operator.replace(" ", "");
		//System.out.println(operator.length()); 
		
		String op = "";
		char op1 = '+';
		char op2 = '-';
		char op3 = '*';
		char op4 = '/';
		char op5 = '%';
		
		int index = -1;
		int sum = 0;
		
		// 메서드로 뺄 수 있음 
		if (operator.indexOf(op1) > -1) {
			index = operator.indexOf(op1);
			op = operator.substring(index, index+1);
		} else if (operator.indexOf(op2) > -1) {
			index = operator.indexOf(op2);
			op = operator.substring(index, index+1);
		} else if (operator.indexOf(op3) > -1) {
			index = operator.indexOf(op3);
			op = operator.substring(index, index+1);
		} else if (operator.indexOf(op4) > -1) {
			index = operator.indexOf(op4);
			op = operator.substring(index, index+1);
		} else if (operator.indexOf(op5) > -1) {
			index = operator.indexOf(op5);
			op = operator.substring(index, index+1);
		} 
		
		
		if (index > -1) { 
			
			if(index > 0 && index != operator.length()-1) {
			
				//System.out.println(index);
				int first = Integer.parseInt(operator.substring(0, index));
				int last = Integer.parseInt(operator.substring(index + 1, operator.length()));
				
				
				if (operator.indexOf(op1) > -1) {
					index = operator.indexOf(op1);
					sum = first + last;
				} else if (operator.indexOf(op2) > -1) {
					index = operator.indexOf(op2);
					sum = first - last;
				} else if (operator.indexOf(op3) > -1) {
					index = operator.indexOf(op3);
					sum = first * last;
				} else if (operator.indexOf(op4) > -1) {
					index = operator.indexOf(op4);
					sum = first / last;
				} else if (operator.indexOf(op5) > -1) {
					index = operator.indexOf(op5);
					sum = first % last;
				}
			
				System.out.printf("%d %s %d = %d", first, op, last, sum);
				
			} else {
				System.out.println("피연산자가 부족합니다.");
			}
			
			
		} else {
			System.out.println("연산자가 올바르지 않습니다.");
		}
		
		
		scan.close();
		
	}
	
}
