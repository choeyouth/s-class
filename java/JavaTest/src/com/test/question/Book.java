package com.test.question;


public class Book {
	
    private String title;
    private int price;
    private String author;
    private String publisher;
    private String pubYear = "2019";
    private String isbn;
    private int page;

    //getter, setter
    public String getTitle() {
    	return title;
	}

	public void setTitle(String title) {
		
		// *** 유효성 검사 
		// - 올바르지 않은 것을 찾아라!
		
		// 최대 50자 이내(한글, 영어, 숫자, 공백)
		if (title.length() > 50) {
			// 빈 리턴문(아무것도 돌려주지 않는다.)
			// 메서드 종료 역할
			return;
		}
		
		for(int i=0; i<title.length(); i++) {
			
			char c = title.charAt(i);
			
			if ((c < '가' || c > '힣')
			 && (c < 'A' || c > 'z')
			 && (c < 'a' || c > 'a')
			 && (c < '0' || c > '9')
			 && (c != ' ')) {
				return;
			} 
		}
		
		this.title = title;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		
		if(price < 0 || price > 1000000) {
			return;
		}
		
		this.price = price;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page < 1) {
			return;
		}
		
		this.page = page;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getPubYear() {
		return pubYear;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
	public String info() {
	    
		return String.format("제목: %s\r\n"
							+ "가격: %,d원\r\n"
							+ "저자: %s\r\n"
							+ "출판사: %s\r\n"
							+ "발행년도: %s년\r\n"
							+ "ISBN: %s\r\n"
							+ "페이지: %,d장"
							, this.title
							, this.price
							, this.author
							, this.publisher
							, this.pubYear
							, this.isbn
							, this.page);
	}	
}

//	public String getTitle() {
//		
//		if(this.title.length() < 50) {
//			return title;
//		} else {
//			return "제목은 50자 이내로 작성해주세요.";
//		}
//			
//	}
//	
//	public void setTitle(String title) {
//		
//		this.title = title;
//	}
//	public int getPrice() {
//		if(this.price >= 0 && this.price <= 1000000) {
//			return price;
//		} else {
//			return 0;
//		}
//	
//	}
//	
//	public void setPrice(int price) {
//		this.price = price;
//	}
//	
//	public String getAuthor() {
//		return author;
//	}
//	
//	public void setAuthor(String author) {
//		this.author = author;
//	}
//	
//	public int getPage() {
//		if(this.page >= 1) {
//			return page;
//		} else {
//			return 0;
//		}
//		
//	}
//	
//	public void setPage(int page) {
//		this.page = page;
//	}
//	
//	public void setPublisher(String publisher) {
//		this.publisher = publisher;
//	}
//	
//	public String getPubYear() {
//		return pubYear;
//	}
//	
//	public String getIsbn() {
//		return isbn;
//	}
//	
//	public void setIsbn(String isbn) {
//		this.isbn = isbn;
//	}
//	
//	public String info() {
//	    
//		String temp = "";
//		
//		temp += "제목: " + this.title + "\r\n";
//		temp += "가격: " + String.format("%,d원\r\n", this.price);
//		temp += "저자: " + this.author + "\r\n";
//		temp += "출판사: " + this.publisher + "\r\n";
//		temp += "발행년도: " + this.pubYear + "년\r\n";
//		temp += "ISBN: " + this.isbn + "\r\n";
//		temp += "페이지: " + String.format("%,d장\r\n", this.page);
//		
//		
//		return temp;

