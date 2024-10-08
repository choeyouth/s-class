package com.test.question;

public class Macaron {
	
	private int size;
	private String color;
	private int thickness;
   
	public Macaron() {
		this.thickness = (int)(Math.random()*20)+1;
		this.size = (int)(Math.random()*11)+5;
		String[] colors = {"red", "blue", "yellow", "white", "pink", "purple", "green", "black"};
		this.color = colors[(int)(Math.random()*7)+1];
	}
	
	
	public void setSize(int size) {
		this.size = size;
	}

	
	public int getSize() {
		// 호출될 때마다 랜덤값을 출력 -> 다른 값을 반환하게 됨 
		//this.size = (int)(Math.random()*11)+5;
		return this.size;
	}

	public void setColor(String color) {
		
		this.color = color;
	}
	
	public String getColor() {
		//String[] colors = {"red", "blue", "yellow", "white", "pink", "purple", "green", "black"};
		//return colors[(int)(Math.random()*7)+1];
		return color;
	}

	public void setThickness(int thickness) {
		this.thickness = thickness;
	}
	
	public int getThickness() {
		//this.thickness = (int)(Math.random()*20)+1;
		return this.thickness;
	}

}
