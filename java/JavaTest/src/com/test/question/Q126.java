package com.test.question;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;

public class Q126 {

	public static void main(String[] args) {
		
		// [요구사항] 직원들의 지각과 조퇴를 카운트하시오.
		// [조건]
		// - 출근 : 오전 9시
		// - 퇴근 : 오후 6시
		
		String path = "C:\\Users\\ee\\Downloads\\파일 입출력 문제\\출결.dat";
		
		//Calendar get = Calendar.getInstance();
		//Calendar out = Calendar.getInstance();
		
		File file = new File(path);
		String line = null;
//		String date = "";
		String name = "";
		String in = "";
		String out = "";
		
//		int late = 0;
//		int leave = 0;
		
		
		if(file.exists()) {
			
			try {
				
				System.out.println("[이름]\t[지각]\t[조퇴]");
				
				BufferedReader reader = new BufferedReader(new FileReader(path));
				ArrayList<EmployeeTime> list = new ArrayList<>();
				
				while ((line = reader.readLine()) != null) {
					
					String[] temp = line.split(",");
//					date = temp[0];
					name = temp[1];
					in = temp[2];
					out = temp[3];
					
					EmployeeTime e = getEmployee(list, temp[1]);
					
					if (e == null) {
						e = new EmployeeTime(name, 0, 0);
						list.add(e);
					}
					
					int inHour = Integer.parseInt(in.substring(0, in.indexOf(":")));
					int inMinute = Integer.parseInt(in.substring(in.indexOf(":") + 1));
					int outHour = Integer.parseInt(out.substring(0, out.indexOf(":")));
					
					if(inHour == 9) {
						if(inMinute != 0) {
							e.late++;
						}
					} else if(inHour > 9) {
						e.late++;
					}
					
					if(outHour < 18) {
						e.leave++;
					} 
					
//				if(temp[2].compareTo("9:00") > 0) {
//					e.late++;
//				}
//				
//				if(temp[3].compareTo("18:00") < 0) {
//					e.leave++;
//				}
				
					
				}
				
				for(EmployeeTime e : list) {
					System.out.printf("%s\t%4d회\t%4d회\n"
									, e.name
									, e.late
									, e.leave);
				}
				
				reader.close();
				
			} catch (Exception e) {
				System.out.println("Q126.main");
				e.printStackTrace();
			}
			
		}
		
		
		
	}//main

	private static EmployeeTime getEmployee(ArrayList<EmployeeTime> list, String name) {

		for(EmployeeTime e : list) {
			if(e.name.equals(name)) {
				return e;
			}
		}
		return null;
	}
	
}//class

class EmployeeTime {
	
	public String name;
	public int late;
	public int leave;
	
	public EmployeeTime(String name, int late, int leave) {
		
		this.name = name;
		this.late = late;
		this.leave = leave;
		
	}

	@Override
	public String toString() {
		return "EmployeeTime [name=" + name + ", late=" + late + ", leave=" + leave + "]";
	}
}
