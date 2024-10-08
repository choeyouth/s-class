package com.test.java.obj;

public class Book {

	public String title;
	//private int price; // 왜? (보호하기 위해 - 외부 사람이 건들이지 않기 위해)
	private int price;
	
	private String publisher;
	private String author;
	private int discount;
	private int pages;
	
	
	
	
	
	
	
	
	
	
	// aaa() > setPrice() > Setter
	// set키워드 + 멤버변수명 > 캐멀 표기법
	public void setPrice(int price) {
		
		//price = price; // 색으로 구분 - 변수끼리 충돌 
		// 영역이 넓은(넓은 범위의 식별자) 무언가와 영역이 좁은 무언가가 충돌이 나면, 
		// 무조건 영역이 좁은 것으로 인식
		
		// 해결방법 > this > 객체 접근 연산자
		this.price = price;
		
		
		//this.title = ""; // O - FM (나를 뜻하는 말)
		//title = "";		 // X - 생략 가능
		// 둘 다 가능(같은 값) - 그러나 두 번째는 틀림
		
		//this.price
		//b1.price
		//- 같은 기능
		//  this > 내가 나를 부를 때
		//  b1 > 나 혹은 남이 나를 부를 때
		
	}
	
	// bbb() > getPrice() > getter
	// - get키워드 + 멤버변수명 > 캐멀
	public int getPrice() {
		return this.price;
	}
	
	
	public void aaa(int a) {
		
		// 개입 (유효성 검사) > 통제 가능 
		
		if (a >=0 && a<=100000) {
			price = a;
		}
		
	}
	
	public int bbb() {
		return price;
	}
	
	
	
	
	
	
	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public int getPages() {
		return pages;
	}

	public void setPages(int pages) {
		this.pages = pages;
	}

	
	
	
}
