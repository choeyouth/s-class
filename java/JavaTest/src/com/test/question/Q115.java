package com.test.question;

import java.io.File;

public class Q115 {
	
	

	public static void main(String[] args) {
		
		//[요구사항] 파일의 크기가 0byte인 파일만 삭제하시오.
		
		String path = "C:\\Users\\ee\\Downloads\\파일 디렉토리 문제\\파일 제거";
		
		File dir = new File(path);
		int count = 0;
		File[] list = dir.listFiles();
		
		
		if(dir.exists()) {
			
			for(File file : list) {
				
				if(file.isFile()) {
					if(file.length() == 0) {
						count++;
						file.delete();
					}
				}
				
		}
		
		System.out.printf("총 %d개의 파일을 삭제했습니다.", count);
		
		}

	}
	
}
	

