package com.test.question;

public class MySet {

	private String[] list;
	private int index;
	private int readIndex;
	
	public MySet() {

		this.list = new String[4];
		this.index = 0;
		this.readIndex = 0;
	
	}
	
	@Override
	public String toString() {
		
		String temp = "";
		
		temp += "\r\n";
		temp += String.format("length: %d\r\n", this.list.length);
		temp += String.format("index: %d\r\n", this.index);
		for(int i=0; i<this.list.length; i++) {
			temp += String.format("%d : %s\r\n", i, this.list[i]);		
		}
		
		return temp;
	}
	
	public boolean add(String value) {
		
		if(checkIndex(value) > -1) {

			return false;
			
		} else {
			if(checkLength()) {
				doubleList();
			}
			
			this.list[this.index] = value;
			this.index++;
		}
		
		return true;
			
	}
	
//	public boolean checkIndex(String value) {
//		
//		for(int i=0; i<this.index; i++) {
//			if(this.list[i].equals(value)) {
//				return true;
//			}
//		}
//		
//		return false;
//	}
	
	
	public int checkIndex(String value) {
		
		for(int i=0; i<this.index; i++) {
			if(this.list[i].indexOf(value) > -1) {
				return i;
			}
		}
		
		return -1;
	}
	
	
	private void doubleList() {
		
		String[] temp = new String[this.list.length * 2];
		
		for(int i=0; i<this.list.length; i++) {
			temp[i] = this.list[i];
		}
		
		this.list = temp;
	}

	private boolean checkLength() {
		return this.index == this.list.length;
	}

	public int size() {
		return this.index;
	}
	
	
	public boolean remove(String value) {

		for(int i=0; i<this.list.length; i++) {
			if (checkIndex(value) == i) {
				this.list[i] = this.list[i + 1];
				this.index--;
				this.list[this.index] = null;
			}
		}
		
		return true;
	}
	
	//
	public boolean hasNext() {
		
		if(this.index > this.readIndex) {
			return true;
		}
		
		return false;
	}
	
	//
	public String next() {
		
		String temp = "";
		
		temp = this.list[this.readIndex];
		this.readIndex++;
		
		return temp;
		
	}

	public void clear() {
		
		for(int i=0; i<this.list.length; i++) {
			this.list[i] = null;
		}
		this.index = 0;
		
	}
	
	
}
