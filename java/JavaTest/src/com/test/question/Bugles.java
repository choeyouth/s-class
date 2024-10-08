package com.test.question;

import java.util.Calendar;

public class Bugles {
	

    private int price;
    private int weight;
    private Calendar creationTime;
    private int expiration;


    //getter, setter 구현
	public void setWeight(int weight) {
		
		if (!(this.weight == 300 || this.weight == 500 || this.weight == 850 )) {
			return;
		}
		
		this.weight = weight;
	}
    
	
	public void setSize(int price) {
		
		if(price == 300) {
			price = 850;
			this.expiration = 7;
		} else if(price == 500) {
			price = 1200;
			this.expiration = 10;
		} else if(price == 850) {
			price = 1950;
			this.expiration = 15;
		} 
		
		this.price = price;
	}
    
    public int getPrice() {
		return price;
	}


	public void setCreationTime(String date) {
		
		Calendar c = Calendar.getInstance();
		
		c.set(Integer.parseInt(date.substring(0, 4))
		    , Integer.parseInt(date.substring(5, 7)) -1
			, Integer.parseInt(date.substring(8, 10)));
		
		this.creationTime = c;
	}

	public int getExpiration() {
		
		Calendar now = Calendar.getInstance();
		this.expiration = this.expiration - (int)((now.getTimeInMillis() - creationTime.getTimeInMillis())
							/ 1000 / 60 / 60 / 24); // 1일 차이남 ? 
		
		return this.expiration;
	}


	public void eat() {
		
		if(this.expiration >= 0) {
			System.out.println("과자를 맛있게 먹습니다.\n");
			
		} else {
			System.out.println("유통기한이 지나 먹을 수 없습니다.");
		}

    }
	
}


