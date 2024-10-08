package com.test.question;

import java.io.File;
import java.util.HashMap;

public class Q114 {

	public static void main(String[] args) {
		
		//[요구사항] 이미지 파일이 있다. 확장자별로 파일이 몇개 있는지 세시오.
		//[조건] 
		// - 새로운 확장자 파일이 추가되도 동작이 가능하게 구현하시오.
		// - 'mouse.bmp' 추가를 하면.. 소스 수정 없이도 *.bmp : 1개 출력이 되게 하시오.
		
		String path = "C:\\Users\\ee\\Downloads\\파일 디렉토리 문제\\확장자별 카운트";
		
		HashMap<String, Integer> ext = new HashMap<String, Integer>();
		
		File dir = new File(path);
		File[] list = dir.listFiles();
		String extention = "";
		String temp = "";
		
		
		for(File file : list) {
			
			if(file.isFile()) {
				
				extention = "*" + file.getName().substring(file.getName().lastIndexOf("."));
				
				if(ext.get(extention) == null) {
					ext.put(extention, 1);
					temp += "," + "*" + file.getName().substring(file.getName().lastIndexOf("."));
				} else if (ext.containsKey(extention)) {
					//
					ext.put(extention, ext.get(extention) + 1);
				}
			}
		}

		String[] temps = temp.split(",");
		
		for(int i=1; i<temps.length; i++) {
			
			System.out.printf("%s: %d개\n", temps[i], (ext.get(temps[i])));
			
		}
		
		
		
	}
}
