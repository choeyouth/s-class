package com.test.question;

public class MyStack {

	private String[] colors;
	private int index;
	
	
	public MyStack() {
		
		this.colors = new String[4];
		this.index = 0;
	}
	
	@Override
	public String toString() {

		String temp = "";
		
		temp += "\r\n";
		temp += String.format("lenth: %d\r\n", this.colors.length);
		temp += String.format("index: %d\r\n", this.index);
		temp += "[\r\n";
		
		for(int i=0; i<this.colors.length; i++) {
			temp += " " + i + ":" + this.colors[i] + "\r\n";
		}
		
		temp += "]\r\n";
		
		return temp;
	}
	
	public boolean push(String value) {
		
		if(this.index == this.colors.length) {
			String[] temp = new String[this.colors.length * 2];
			
			for(int i=0; i<this.colors.length; i++) {
				temp[i] = colors[i];
			}
			this.colors = temp;
		}
		
		this.colors[this.index] = value;
		this.index++;
		
		System.out.println(index);
		return true;
	}
	
	public String pop() {
		
		if(this.index == 0) {
			return null;
		}
		
		String temp = this.colors[index-1];
		
		for(int i=this.index-1; i>=0; i--) {
			this.colors[this.index-1] = this.colors[this.index];
		}
		
		this.index--;
		
		return temp;
		
	}
	


	public int size() {
		return this.index;
	}

	public String peek() {
		
		if(this.index == 0) {
			return null;
		}
		
		String temp = this.colors[index-1];
		
		return temp;
	}

	public void trimToSize() {

		String[] temp = new String[this.index];
		for(int i=0; i<temp.length; i++) {
			temp[i] = this.colors[i];
		}
		
		this.colors = temp;
		
	}

	public void clear() {
		
		this.index = 0;
		
	}
	
	
}
