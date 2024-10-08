package com.test.question;

import java.io.File;
//import java.util.ArrayList;
//import java.util.HashSet;

public class Q119 {
	
	public static void main(String[] args) {
		
		// [요구사항] 아래의 조건에 따라 파일을 폴더별로 분류/이동하시오.
		// [조건]
		// - 1차: 직원 이름으로 폴더 생성
		// - 2차: 년도별로 폴더 생성
		// - 3차: 각 파일을 직원 > 년도 폴더에 이동
		 
		String path = "C:\\Users\\ee\\Downloads\\파일 디렉토리 문제\\직원";
		File dir = new File(path);
		File[] list = dir.listFiles();
		
		for(File file : list) {
			
			String filename = file.getName();
			String[] temp = filename.split("_");
			
			File namedir = new File(path + "\\" + temp[0]);
			if(!namedir.exists()) {
				namedir.mkdir();
			}
			
			File yeardir = new File(path + "\\" + temp[0] + "\\" + temp[1]);
			if(!yeardir.exists()) {
				yeardir.mkdir();
			}
			
			File movefile = new File(path + "\\" + temp[0] + "\\" + temp[1] + "\\" + filename);
			file.renameTo(movefile);
			
			System.out.println(movefile.getAbsolutePath());
			
		}

		System.out.println("complete");
		
		
	}
	
}
		
//		HashSet<String> employee = new HashSet<String>();
//		HashSet<String> yeardir = new HashSet<String>();
//
//		for(File file : list) {
//			
//			String filename = file.getName();
//			
//			employee.add(file.getName().substring(0, 3));
//			
//			
//			ArrayList<String> names = new ArrayList(employee);
//			ArrayList<String> years = new ArrayList(yeardir);
//			yeardir.add(file.getName().substring(file.getName().indexOf("_") 
//					+ 1, file.getName().indexOf("_") + 5));
//			String[] movepath = new String[years.size()];
//			
//			
//			for(int j=0; j<names.size(); j++) {
//				String employeePath = "C:\\Users\\ee\\Downloads\\파일 디렉토리 문제\\직원\\" 
//				+ names.get(j);
//				File employeeFile = new File(employeePath);
//				employeeFile.mkdir();
//			}
//				
//			for(int i=0; i<years.size(); i++) {
//				String yearPath = "C:\\Users\\ee\\Downloads\\파일 디렉토리 문제\\직원\\"
//				+ names.get(0) + "\\" + years.get(i);
//				File yearfile = new File(yearPath);
//				yearfile.mkdir();
//				
//				movepath[0] = yearfile.getAbsolutePath();
//			}
//			
//			for(int k=0; k < names.size() + years.size() ; k++) {
//				String movePath = movepath[0] + "\\" + filename;
//				File movefile = new File(movePath);
//				file.renameTo(movefile);
//				
//				System.out.println(movefile.getAbsolutePath());
//				}
//			}
//		}
	
	
	
	
	
//		for(File file : list) {
//			
//			String filename = file.getName();
//			
//			employee.add(file.getName().substring(0, 3));
//			
//			ArrayList<String> names = new ArrayList(employee);
//			ArrayList<String> years = new ArrayList(yeardir);
//			yeardir.add(file.getName().substring(file.getName().indexOf("_") + 1, file.getName().indexOf("_") + 5));
//			String[] movepath = new String[years.size()];
//			
//			for(int j=0; j<names.size(); j++) {
//				
//				String employeePath = "C:\\Users\\ee\\Downloads\\파일 디렉토리 문제\\직원\\" + names.get(j);
//				File employeeFile = new File(employeePath);
//				employeeFile.mkdir();
//				
//				//System.out.println(employeeFile.getAbsolutePath());
//				
//				
//				for(int i=0; i<years.size(); i++) {
//					
//					String yearPath = "C:\\Users\\ee\\Downloads\\파일 디렉토리 문제\\직원\\" + names.get(j) + "\\" + years.get(i);
//					File yearfile = new File(yearPath);
//					yearfile.mkdir();
//					
//					//System.out.println(yearfile.getAbsolutePath());
//					
//					movepath[i] = yearfile.getAbsolutePath();
//					
//					
//					for(int k=0; k < names.size() + years.size() ; k++) {
//						
//						String movePath = movepath[0] + "\\" + filename;
//						File movefile = new File(movePath);
//						file.renameTo(movefile);
//						
//						System.out.println(movefile.getAbsolutePath());
//						
//					}
//				}
//				
//				
//			}
//			
//			
//
//			
//		}
		
		

	




