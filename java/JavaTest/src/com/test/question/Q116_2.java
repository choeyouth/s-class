package com.test.question;

import java.io.File;
import java.util.ArrayList;

public class Q116_2 {

	public static void main(String[] args) {
		
		String path1 = "C:\\Users\\ee\\Downloads\\파일 디렉토리 문제\\동일 파일\\MusicA";
		String path2 = "C:\\Users\\ee\\Downloads\\파일 디렉토리 문제\\동일 파일\\MusicB";
		
		File dir1 = new File(path1);
		File dir2 = new File(path2);
		
		File[] list1 = dir1.listFiles();
		File[] list2 = dir2.listFiles();
		
		ArrayList<File> flist = new ArrayList<File>();
		
		for(File file1 : list1) {
			for (File file2 : list2) {
				if(file1.getName().equals(file2.getName())) {
					flist.add(file1);
				}
			}
		}
		
		for (File file : flist) {
			System.out.println(file.getName());
		}
		
		
	}
	
}
