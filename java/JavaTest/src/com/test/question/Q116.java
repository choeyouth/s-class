package com.test.question;

import java.io.File;

public class Q116 {

	public static void main(String[] args) {
		
		//[요구사항] MusicA 폴더와 MusicB 폴더를 서로 비교해서 양쪽 폴더에 모두 존재하는 파일만을 출력하시오.
		//[조건] 중복 파일을 찾아내시오.
		
		String path1 = "C:\\Users\\ee\\Downloads\\파일 디렉토리 문제\\동일 파일\\MusicA";
		String path2 = "C:\\Users\\ee\\Downloads\\파일 디렉토리 문제\\동일 파일\\MusicB";
		
		File dir1 = new File(path1);
		File dir2 = new File(path2);
		
		File[] list1 = dir1.listFiles();
		File[] list2 = dir2.listFiles();
		
		String temp = "";
		String both = "";
		
		if (dir1.exists()) {
			for(File file1 : list1) {
				//System.out.println(file1.getName());
				temp +=  file1.getName() + "★";
			}
		}
		//System.out.println();
		String[] temps = temp.split("★");
		
		
		if (dir2.exists()) {
			for(File file2 : list2) {
				//System.out.println(file2.getName());
				for(int i=0; i<temps.length; i++) {
					if(file2.getName().contains(temps[i])) {
						both += file2.getName() + "★";
					}
				}
			}
		}
		//System.out.println();
		
		
		//System.out.println(temp);
		//System.out.println(temps[0]);
		//System.out.println(both);
		
		String[] boths = both.split("★");
		
		for(int i=0; i<boths.length; i++) {
			System.out.println(boths[i]);
		}
		
		
		
		
		
	}
}
