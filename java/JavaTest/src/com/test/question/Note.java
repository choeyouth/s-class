package com.test.question;

public class Note {
	
    private String size;
    private String color;
    private int page;
    private String owner;
    private int price;
    
    //setter, getter 구현
	public void setSize(String size) {
		
		if (!(size.equals("A3") || size.equals("A4") || size.equals("A5") 
		   || size.equals("B3") || size.equals("B4") || size.equals("B5"))) {
			System.out.println("잘못된 값을 입력했습니다.");
			return;
		}
		this.size = size;
	}
	
	
	public void setColor(String color) {
		
		if (!(color.equals("검정색") || color.equals("흰색") 
		 || color.equals("노란색") || color.equals("파란색"))) {
			System.out.println("잘못된 색상을 입력했습니다.");
			return;
		}
		
		this.color = color;
	}
	
	
	String thick = "";
	public void setPage(int page) {
		
		if (page < 10 || page > 200) {
			System.out.println("잘못된 페이지 수를 입력했습니다.");
			return;
		}
		
		if (page >= 10 && page <= 50) {
			thick = "얇은";
		} else if (page <= 100) {
			thick = "보통";
		} else if (page <= 200) {
			thick = "두꺼운";
		}
		
		this.page = page;
	}
	
//	boolean own = true;
//	public void setOwner(String owner) {
//		
//		if (owner.length() < 2 || owner.length() > 5) {
//			own = false;
//			return;
//		}
//		
//		this.owner = owner;
//	}
//
	
	public void setOwner(String owner) {
		
		if (checkLength(owner) && checkName(owner)) {
			this.owner = owner;
		} else {
			System.out.println("잘못된 소유자 이름입니다.");
		}
		
	}
	
	
	public boolean checkLength (String owner) {
		
		if (owner.length() < 2 || owner.length() > 5) {
			return false;
		}
			
		return true;
	}
	
	
	public boolean checkName (String owner) {
		
		for(int i=0; i<owner.length(); i++) {
			char c = owner.charAt(i);
			if (c < '가' && c > '힣') {
				return false;
			} 
		}
		
		return true;
	}
	


    public String info() {
    	
		this.price = 500;
		
		if (this.size.equals("A3")) {
			this.price += 400;
		} else if (this.size.equals("A4")) {
			this.price += 200;
		} else if (this.size.equals("B3")) {
			this.price += 500;
		} else if (this.size.equals("B4")) {
			this.price += 300;
		} else if (this.size.equals("B5")) {
			this.price += 100;
		} 
		
		if (this.color.equals("검정색")) {
			this.price += 100;
		} else if (this.color.equals("노란색")) {
			this.price += 200;
		} else if (this.color.equals("파란색")) {
			this.price += 200;
		}	

		
		if (this.page > 10) {
			this.price += (this.page - 10) * 10;
		} 
		
		
    	
    	if ((this.owner != null)) {
          return String.format("■■■■■■ 노트 정보 ■■■■■■\r\n"
				          		+ "소유자 : %s\r\n"
				          		+ "특성 : %s %s %s노트\r\n"
				          		+ "가격 : %,d원\r\n"
				          		+ "■■■■■■■■■■■■■■■■■■■■■■\r\n"
				          		, this.owner
				          		, this.color
				          		, this.thick
				          		, this.size
				          		, this.price) ;
    	} else { 
    		return ("■■■■■■ 노트 정보 ■■■■■■\r\n"
    			  + "주인 없는 노트\r\n"
    			  + "■■■■■■■■■■■■■■■■■■■■■■");
    		
    	}
   
    }
    
    
}
