package com.test.question;

public class MyArrayList {

	private String[] list;
	private int index;
	
	public MyArrayList() {
		
		this.list = new String[4];
		this.index = 0;
		
	}
	
	public boolean add(String value) {
		
		if(this.list.length == this.index) {
			String[] temps = new String[this.list.length * 2];
			for(int i=0; i<this.list.length; i++) {
				temps[i] = this.list[i];
			}
			this.list = temps;
		}
		
		this.list[this.index] = value;
		this.index++;
		
		return true;
	}
	
	public String get(int index) {
		
		return this.list[index];
	}
	
	public int size() {
		
		return this.index;
		
	}
	
	public String set(int index, String value) {
		
		this.list[index] = value;
		
		return list[this.index];
	}
	
	public String remove(int index) {
		
		for(int i=index; i<this.list.length-1; i++) {
			this.list[i] = this.list[i + 1];
		}
		this.index--;
		
		return this.list[this.index];
		
	}
	
	public boolean add(int index, String value) {
		
		if(this.list.length == this.index+1) {
			String[] temps = new String[this.list.length * 2];
			for(int i=0; i<this.list.length+1; i++) {
				temps[i] = this.list[i];
			}
			this.list = temps;
		} 
		
		for(int i=index; i<this.index+1; i++) {
			this.list[i+1] = this.list[i];
		}
		this.list[index] = value;
		this.index++;
		
		return true;
	}
	
	public int indexOf(String value) {
		int index = -1;
		
		for(int i=0; i<this.list.length; i++) {
			if(this.list[i] == value) {
				index = i;
			} else {
				index = -1;
			}
		}
		
		return index;
	}
	
	public void clear() {
		
//		String[] temp = new String[this.index];
//		
//		for(int i=0; i<this.list.length; i++) {
//			this.list[i] = temp[i];
//		}
//		
//		this.list = temp;

		this.index = 0;
		
	}
	
	
	@Override
	public String toString() {
		
		String temp = "";
		
		temp += "\r\n";
		temp += String.format("length : %d\n", this.list.length);
		temp += String.format("index : %d\n", this.index);
		temp += String.format("[\n");
		for(int i=0; i<this.list.length; i++) {
			temp += String.format("%d : %s\n", i, this.list[i]);
		}
		temp += String.format("]\n");
		
		return temp;
	}
	
	
}
