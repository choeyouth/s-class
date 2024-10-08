package com.test.java;

import javax.lang.model.element.Element;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class Ex01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//Ex01.java
		
		/*
		 
		  크롤링(Crawling) or 스크래핑(Scraping)
		  - 웹 사이트의 페이지를 탐색해서 내가 원하는 정보를 수집하는 행동
		  	a. 상대방(웹사이트)이 나에게 DB 권한을 준다면.. 
		  		> 가장 이상적인 방법 > 불가능
		  	b. 상대방이 외부에 OpenAPI 공개 > 제한적 > 무난한 방법~
		  	c. a(x), b(x) > 웹 페이지의 소스를 긁어서 직접 원하는 정보를 추출 > 크롤링 
		  	
		  크롤링 주의점!!
		  - 허가 문제, 저작권 문제 
		  - 정도껏~ > 긁어오는 작업 > 프로그램 > 속도 빠름 && 무제한 > 서버 입장 > 비용 발생!!
		  
		  크롤링 필요 지식
		  1. HTML, CSS, JavaScript 이해
		  2. Java > 클라이언트를 코드 파싱 > 라이브러리 
			 공부하기싫엉
		 */
		
		
		//- https://jsoup.org
		
		//Jsoup
		//- 브라우저처럼 사이트 접속 > 접속한 페이지의 소스를 읽기 > 소스 분석 > 탐색 > 원하는 데이터 접근 & 추출
		
		try {
			
			String url = "https://jsoup.org";
			
			//접속해서 읽어온 문서 내용을 다 담고 있는 참조 객체
			Document document = Jsoup.connect(url).get();
			
//			System.out.println(document);
			
			Elements list = document.select(".content > .col1 > h1");
			
			System.out.println(list.size()); //1
			System.out.println(list.get(0).text());
			
		} catch (Exception e) {
			System.out.println("Ex01.main");
			e.printStackTrace();
		}
		
		
		
		
	}

}



















