package com.test.question;

import java.io.File;
import java.util.ArrayList;

public class Q118_2 {
	
	public static void main(String[] args) {
		
		String path = "C:\\Users\\ee\\Downloads\\파일 디렉토리 문제\\크기 정렬";
		
		File dir = new File(path);

		ArrayList<File> flist = new ArrayList<File>();
		
		addFile(dir, flist);
		
		for (int i=0; i<flist.size(); i++) {
			for(int j=0; j<flist.size()-i-1; j++) {
				if(flist.get(j).length() < flist.get(j+1).length()) {
					File temp = flist.get(j);
					flist.set(j, flist.get(i+1));
					flist.set(j+1, temp);
				}
			}
		}
	
		System.out.printf("%-33s%s\t%10s\n", "[파일명]", "[크기]", "[파일이 들어있는 폴더]");
		
		for (File file : flist) {
			System.out.printf("%-30s\t%10s\t%s\n"
								, file.getName()
								, getSize(file.length())
								, file.getParentFile().getName());
		}
		
	}

	private static Object getSize(long length) {
		
		if(length < 1024) {
			return length + "B";
		} else if (length < 1024 * 1024) {
			return String.format("%.1f", length/1024.0) + "KB"; 
		} else if (length < 1024 * 1024 * 1024) {
			return String.format("%.1f", length/1024.0/1024.0) + "MB"; 
		} else if (length < 1024 * 1024 * 1024) {
			return String.format("%.1f", length/1024.0/1024.0/1024.0) + "GB"; 
		} else {
			return String.format("%.1f", length/1024.0/1024.0/1024.0/1024.0) + "TB"; 
		}
		
		
	}

	private static void addFile(File dir, ArrayList<File> flist) {

		File[] list = dir.listFiles();
		
		for(File file : list) {
			if(file.isFile()) {
				flist.add(file);
			}
		}
		
		for(File subdir : list) {
			if(subdir.isDirectory()) {
				addFile(subdir, flist);
			}
		}
		
		
	}

}
