package com.test.question;

import java.io.File;

public class Q117 {
	
	private static int countDir;
	private static int countFile;

	public static void main(String[] args) {
		
		//[요구사항] 내용물이 있는 'delete' 폴더를 삭제하시오.
		//[조건] 
		// - 재귀 메소드 사용
		// - 삭제된 파일과 자식 폴더 개수를 출력하시오.
		
		String path = "C:\\Users\\ee\\Downloads\\파일 디렉토리 문제\\폴더 삭제\\delete";
		File dir = new File(path);
		
		try {
		
		if(dir.exists()) {
				checkFile(dir);
				
				System.out.println("폴더를 삭제했습니다.");
				System.out.printf("삭제된 폴더는 %d개이고, 파일은 %d개입니다.\n"
									, countDir, countFile);
			}
		
		} catch (Exception e){
			System.out.println("폴더가 없습니다.");
		}
		
	}

	private static void checkFile(File dir) {

		File[] list = dir.listFiles();
		
		for (File file : list) {
			if(file.isFile()) {
				file.delete();
				countFile++;
			}
		}
		
		for (File subdir : list) {
			if(subdir.isDirectory()) {
				countDir++;
				checkFile(subdir);
			}
		}
		
		
	}
	
}
