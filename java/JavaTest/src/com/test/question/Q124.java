package com.test.question;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.Scanner;

public class Q124 {

	public static void main(String[] args) {
		
		//[요구사항] 이름을 입력받아 회원 주문 정보를 검색 후 출력하시오.
		
		String namePath = "C:\\Users\\ee\\Downloads\\파일 입출력 문제\\검색_회원.dat";
		String orderPath = "C:\\Users\\ee\\Downloads\\파일 입출력 문제\\검색_주문.dat";
		
		Scanner scan = new Scanner(System.in);
		String search = "";
		
		System.out.print("이름: ");
		search = scan.nextLine();
		
		File namefile = new File(namePath);
		File orderfile = new File(orderPath);
		
		if(namefile.exists() && orderfile.exists()) {
			
			try {
				
				BufferedReader nameReader = new BufferedReader(new FileReader(namePath));
				BufferedReader orderReader = new BufferedReader(new FileReader(orderPath));
				
				String nameLine = null;
				String orderLine = null;
				
				String name = "";
				String number = "";
				String address = "";
				
				String product = "";
				String productNum = "";
				
				while ((nameLine = nameReader.readLine()) != null) {
					
					String[] nameTemp = nameLine.split(",");
					
					if(nameTemp[1].equals(search)) {
						name = nameTemp[1];
						number = nameTemp[0];
						address = nameTemp[2];
						break;
					}
				}
				
				if(!(number.equals(""))) {
					
					while ((orderLine = orderReader.readLine()) != null) {
						String[] orderTemp = orderLine.split(",");
						
						if(number.equals(orderTemp[3])) {
							
							product = orderTemp[1];
							productNum = orderTemp[2];
							
							System.out.println("==== 구매내역 ====");
							System.out.println("[번호]\t[이름]\t[상품명]\t[개수]\t[배송지]");
							System.out.printf("%s\t%s\t%s\t%s\t%s\n", number, name, product, productNum, address);
							
							break;
							
						}
						
					}
					
				}
				
				nameReader.close();
			    orderReader.close();
				
			} catch (Exception e) {
				System.out.println("Q124.main");
				e.printStackTrace();
			}
			
		}
		
		scan.close();
		
	}
	
}
