package com.test.java;

public class Ex66_String {

	public static void main(String[] args) {

		// “문자열은 불변(Immutable)이다.”
		
		//m1();
		//m2();
		//m3();
		//m4();
		m5();
		
		
	}//main

	private static void m5() {
		
		
	}

	private static void m4() {

		//문자열
		//1. String 클래스 
		//2. StringBuilder 클래스
		
		String s1 = "홍길동"; //혜택
		String s2 = new String("홍길동");
		
		// 조작 > 비용X 
		StringBuilder s3 = new StringBuilder("홍길동");
		System.out.println(s3);
		System.out.println(s3.length());
		System.out.println(s3.indexOf("홍"));
		
		long begin = 0, end = 0;
		begin = System.currentTimeMillis();

		String txt1 = "홍길동";
		for(int i=0; i<100000; i++) {
			txt1 += ".";
		}
		
		end = System.currentTimeMillis();
		System.out.printf("길이: %,d자\n시간: %,dms\n"
							, txt1.length()
							, end - begin);
		
		begin = System.currentTimeMillis();

		StringBuilder txt2 = new StringBuilder ("홍길동");
		for(int i=0; i<500000; i++) {
			txt2.append("."); // txt += "."
		}
		
		end = System.currentTimeMillis();
		System.out.printf("길이: %,d자\n시간: %,dms\n"
							, txt2.length()
							, end - begin);
		
		
	}

	private static void m3() {

		//문자열의 잦은 조작 > 금지!!
		String txt = "홍길동";
		
		for(int i=0; i<10000; i++) {
			txt += ".";
		}
		
		System.out.println(txt);
		//가비지가 10000번 생김 > 낭비 
		
		//커다란 문자열의 수정> 금지!!
		txt = "홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동홍길동";
		txt += ".";
		
	}

	private static void m2() {

		//자료형 > int[]
		int[] nums1 = new int[5];
		int[] nums2 = new int[10];
		
		//자료형 > String
		String txt1 = "홍길동";
		String txt2 = "홍길동";
		//String txt2 = txt1;
		
		System.out.println(txt1.hashCode()); //54150062
		System.out.println(txt2.hashCode()); //54150062
		
	}

	private static void m1() {

		String name1 = "홍길동";
		String name2 = "홍길동";
		String name3 = "홍";
		name3 = name3 + "길동";
		
		System.out.println(name1);
		System.out.println(name2);
		System.out.println(name3);
		
		System.out.println(name1 == name2); //true
		System.out.println(name1 == name3); //false
		
		System.out.println(name1.equals(name2)); //true
		System.out.println(name1.equals(name3)); //true
		
		// “문자열은 불변(Immutable)이다.”
		String txt = "홍길동";
		txt = txt + "님"; //수정 작업이 불가능하다.(X)
		System.out.println(txt);
		
	}
	
}//class

class item {
	
	private int num;
	private String type;
	
	@Override
	public String toString() {
		return String.format("item [num=%s, type=%s]", num, type);
	}
	
	
//	@Override
//	public String toString() {
//		StringBuilder builder = new StringBuilder();
//		builder.append("item [num=")
//				.append(num)
//				.append(", type=")
//				.append(type)
//				.append("]");
//		return builder.toString();
//	}
	
	//StringBuilder
//	@Override
//	public String toString() {
//		StringBuilder builder = new StringBuilder();
//		builder.append("item [num=");
//		builder.append(num);
//		builder.append(", type=");
//		builder.append(type);
//		builder.append("]");
//		return builder.toString();
//	}

	//concat
//	@Override
//	public String toString() {
//		return "item [num=" + num + ", type=" + type + "]";
//	}

	
	
	
	
	
	
}
