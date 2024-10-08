package com.test.java;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Ex03 {

	public static void main(String[] args) {
		
		try {
			
			String url = "http://localhost:8090/crawling/list.jsp";
			
			Document document = Jsoup.connect(url).get();
			
			Elements list = document.select("#list .item");
			
			for (Element item : list) {
				
				//System.out.println(item);
				System.out.println(item.firstElementChild().text());
				
			}
			
			System.out.println("end");
			
		} catch (Exception e) {
			System.out.println("Ex03.main");
			e.printStackTrace();
		}
		
	}
	
}
