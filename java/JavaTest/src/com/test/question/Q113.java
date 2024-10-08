package com.test.question;

import java.io.File;

public class Q113 {

	public static void main(String[] args) {
		
		//[요구사항] 음악 파일이 100개 있다. 파일명 앞에 일련 번호를 붙이시오.
		//[조건] '001'부터 3자리 형식으로 붙이시오.
		
		String path = "C:\\Users\\ee\\Downloads\\파일 디렉토리 문제\\음악 파일\\Music";
		
		File dir = new File(path);
		File[] list = dir.listFiles();
		
		
		
		if(dir.exists()) {
			
			for(File file : list) {
				if(file.isFile()) {
					for(int i=0; i<100; i++) {
						
						File renameList = new File(path + "\\" + String.format("[%03d] %s",i+1, list[i].getName()));
						file.renameTo(renameList);
						
						//System.out.printf("[%03d] %s\n",i+1, list[i].getName());
						//System.out.println(file.getName());
					}
				}
			}
		}
		
		//System.out.println(file.getName());
		
		
	}
	
}
