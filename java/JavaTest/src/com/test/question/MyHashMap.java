package com.test.question;

public class MyHashMap {
	
	private String[] keys;
	private String[] values;
	private int index;
	
	public MyHashMap() {
		
		this.keys = new String[4];
		this.values = new String[4];
		this.index = 0;
		
	}
	
	@Override
	public String toString() {

		String temp = "";
		
		temp += "\r\n";
		temp += String.format("keys length: %d\r\n", this.keys.length);
		temp += String.format("values length: %d\r\n", this.values.length);
		temp += String.format("index: %d\r\n", this.index);
		temp += "[\r\n";
		for(int i=0; i<this.keys.length; i++) {
			temp += "keys " + i + ": " + this.keys[i] + "\r\n";
		}
		for(int i=0; i<this.values.length; i++) {
			temp += "values " + i + ": " + this.values[i] + "\r\n";;
		}
		temp += "]\r\n";
		
		return temp;
	}
	
	public String put(String key, String value) {
		
		if(getIndex(key) == -1) {
			
			if(checkLengthKeys()) {
				doubleKeys();
			} 
			
			if(checkLengthValues()) {
				doubleValues();
			} 
			
			this.keys[this.index] = key;
			this.values[this.index] = value;
			index++;
			
		} else {
			this.values[getIndex(key)] = value;
		}
		
		return null;
		
	}
	
	
	public int getIndex(String key) {
		
		for(int i=0; i<this.index; i++) {
			if(this.keys[i].equals(key)) {
				return i;
			}
		}
		
		return -1;
	}
	
	

//	private boolean checkIndexOf(String key, String value) {
//
//		for (int i=0; i<this.keys.length; i++) {
//			
//			if(this.keys[i].indexOf(key) < 0) {
//				num = i;
//				return true;
//			} else {
//				return false;
//			}
//		}
//		return false;
//	}

	private void doubleValues() {
		String[] temp = new String[this.values.length * 2];

		for(int i=0; i<this.values.length; i++) {
			temp[i] = this.values[i];
		}
		this.values = temp;
	}

	private void doubleKeys() {
		String[] temp = new String[this.keys.length * 2];
		
		for(int i=0; i<this.keys.length; i++) {
			temp[i] = this.keys[i];
		}
		this.keys = temp;
	}

	private boolean checkLengthValues() {
		return this.index == this.values.length;
	}

	private boolean checkLengthKeys() {
		return this.index == this.keys.length;
	}

	public String get(String key) {
		
		String temp = "";
		
		for (int i=0; i<this.index; i++) {
			if(this.keys[i].contains(key)) {
				temp = this.values[i];
			}
		}
	
		return temp;
	}

	public int size() {
		return this.index;
	}

	public String remove(String key) {
		
		String temp = "";
		
		temp = this.values[getIndex(key)];
		
		for(int i=getIndex(key); i<this.keys.length-1; i++) {
			this.keys[i] = this.keys[i + 1];
			this.values[i] = this.values[i + 1];
		}
		this.index--;
		
		return temp;
	}

	public boolean containsKey(String key) {

		if(getIndex(key) > -1) {
			return true;
		}
		
		return false;
	}

	public boolean containsValue(String value) {
		
		for(int i=0; i<this.values.length; i++) {
			if (this.values[i].contains(value)) {
				return true;
			}
		}
		
		return false;
	}

	public void clear() {
		
		for(int i=0; i<this.index; i++) {
			this.keys[i] = null;
			this.values[i] = null;
		}

		this.index = 0;
	}

	public void trimToSize() {
		
		String[] temp = new String[this.keys.length];
		
		for(int i=0; i<temp.length; i++) {
			temp[i] = this.keys[i];
		}
		
		this.keys = temp;
	}
}
