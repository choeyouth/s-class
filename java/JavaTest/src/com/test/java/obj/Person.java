package com.test.java.obj;

import java.util.Arrays;

public class Person {

	private String name;
	private int age;
	
	private String[] nick = new String[3];

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

//	public String[] getNick() {
//		return nick;
//	}
//
//	public void setNick(String[] nick) {
//		this.nick = nick;
//	}
	
	
	
	// p1.addNick("강아지");
	// p1.addNick("고양이");
	
	private int index = 0; 
	// 지역변수로 만들면 별명을 새로 만들 때 다시 0이됨 
	// 멤버변수의 생명주기가 다름 -> 멤버변수는 누적
	
	public void addNick(String nick) { // 배열을 받지 않음 -> 별명 하나만 받음
		
		this.nick[this.index] = nick;
		this.index++;
		
	}
	
	public String getNick(int index) { // 별명을 하나씩 출력 -> 보고싶은 별명의 index를 반환
		
		return this.nick[index];
		
	}
	
	
	
	
	
	
	
	
	
	public String info() {
		
		String temp = "";
		
		temp += "이름: " + this.name + "\r\n";
		temp += "나이: " + this.age + "\r\n";
		temp += "별명: " + Arrays.toString(this.nick) + "\r\n";
		
		return temp;
		
	}
	
}
