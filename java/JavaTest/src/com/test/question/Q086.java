package com.test.question;

import java.util.Scanner;

public class Q086 {

	public static void main(String[] args) {
		
		// [요구사항] 숫자를 입력받아 3자리마다 , 를 붙이시오.
		// [조건] %,d 사용 금지
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("숫자: ");
		String num = scan.nextLine();
		String n = "";
		
		if (num.length() % 3 == 0) { // 몫 : , 개수 // 나머지 : 맨 앞에 오는 수의 개수 (세자리 이하) 
			
			for(int i=0; i<num.length(); i+=3) {
				n += num.substring(i, i+3) + ",";
			}
			
		} else if (num.length() % 3 == 1){
				n += num.substring(0, 1) + ",";
			for(int i=1; i<num.length(); i+=3) {
				n += num.substring(i, i+3) + ",";
			}
		} else if (num.length() % 3 == 2) {
				n += num.substring(0, 2) + ",";
			for(int i=2; i<num.length(); i+=3) {
				n += num.substring(i, i+3) + ",";
			}
		}
		
		System.out.println(n + "\b");
		scan.close();
		
	}
	
}


//n += num.substring(0, num.length()-6);
//n += "," + num.substring(num.length()-6, num.length()-3);
//n += "," + num.substring(num.length()-3, num.length());
//System.out.println(n);

//for (int i=0; i<num.length()/3; i++) {
//	n += "," + num.substring(num.length()-3*(i+1), num.length()-3*i);
//}

//for (int i=num.length()-1; i>=0; i--) {
//	n += "," + num.substring(num.length()-i-1, num.length()-i);
//}
//
//System.out.println(n);