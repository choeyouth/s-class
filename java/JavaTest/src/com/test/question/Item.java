package com.test.question;

import java.util.Calendar;

public class Item {
	
	private String name;
	private Calendar expiration;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getExpiration() {
		
		return String.format("%tF", this.expiration);
	}
	
	Calendar c = Calendar.getInstance();
	
	public void setExpiration(String expiration) {
		
		c.set(Integer.parseInt(expiration.substring(0, 4))
			, Integer.parseInt(expiration.substring(5, 7))-1
			, Integer.parseInt(expiration.substring(8)));
		
		this.expiration = c;
	}
	
}
