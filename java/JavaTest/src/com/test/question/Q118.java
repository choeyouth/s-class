package com.test.question;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;

public class Q118 {
	
	public static void main(String[] args) {
		
		//[요구사항] 폴더 내의 모든 파일들을 찾아 크기를 비교하고, 크기가 큰 순으로 정렬하시오.
		//[조건]
		// - 자식 폴더내의 파일도 모두 검색하시오.
		// - 부모 자식 폴더에 상관없이 파일을 한번에 비교하시오.
		
		String path = "C:\\Users\\ee\\Downloads\\파일 디렉토리 문제\\크기 정렬";
		
		File dir = new File(path);
		
		count(dir);
		
				
		
	
	}

	private static void count(File dir) {
		
		ArrayList<FileCount> files = new ArrayList<>();
		File[] list = dir.listFiles();
		
		ArrayList<String> filename = new ArrayList<>();
		ArrayList<String> fileparent = new ArrayList<>();
		ArrayList<Long> filelength = new ArrayList<>();
		
		for (File file : list) {
			if(file.isFile()) {
				
				files.add(new FileCount(file.getParent().substring(file.getParent().lastIndexOf("\\") + 1)
						, file.length()
						, file.getName()));
				
				
				filename.add(file.getName());
				filelength.add(file.length());
				System.out.println(file.getParent().substring(file.getParent().lastIndexOf("\\") + 1));
				
				
//				System.out.println(file.getParent().substring(file.getParent().lastIndexOf("/") + 1));
//				System.out.println(file.length());
//				System.out.println(file.getName());
//				System.out.println();
				
//				ArrayList<Long> fileLength = new ArrayList<>();
//				fileLength.add(file.length());
////				fileLength.sort();

			}
		}
		
		for(File subdir : list) {
			if(subdir.isDirectory()) {
				count(subdir);
			}
		}
		
		System.out.println(files);
		
		
		
		
		

	}//

}//main

class FileCount {
	
	private String extParent;
	private long fileLength;
	private String fileName;
	
	public FileCount(String extParent, long fileLength, String fileName) {
		super();
		this.extParent = extParent;
		this.fileLength = fileLength;
		this.fileName = fileName;
	}

	public String getExtParent() {
		return extParent;
	}

	public long getFileLength() {
		return fileLength;
	}

	public String getFileName() {
		return fileName;
	}

	@Override
	public String toString() {
		
		String temp = "";
		
		//temp += "[파일명]\t[크기]\t[파일이 들어있는 폴더]\r\n";
		temp += fileName + "\n" + fileLength + "\n" + extParent + "\n\n";
		
		return temp;
	}
	
	
	
}













