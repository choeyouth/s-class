package com.test.java;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Ex02 {

	public static void main(String[] args) {
		// Ex02.java
		
		 try {
			
			String url = "https://serieson.naver.com/v3/movie/ranking/monthly";
			
			Document document = Jsoup.connect(url).get();
			
//			System.out.println(url);
//			Elements list = document.select(".Title_title__s9o0D");
//			System.out.println(list.size()); //100
//			list.forEach(title -> System.out.println(title.text()));
			
			
			// ol 태그의 자식 li 100개
			Elements list = 
			document.select(".RankingList_ranking_list__N4QsH li");
			
//			System.out.println(list.size()); //100
			
			for (Element movie : list) {
				
				String title = movie.selectFirst(".Title_title__s9o0D").text();
				
				// 클래스 이름 순위마다 다름 > 불가능
				//String no = movie.selectFirst(".RankingNumber_num_1__4mpqa span").text();
				
				//#container > div.RankingPage_ranking_wrap__GB855 > ol > li:nth-child(2) > a > div.RankingNumber_ranking_area__p8B_q > em > span > span
				
				//a > div > em > span > span
//				String no = movie.selectFirst("a > div > em > span > span").text();
//				
				//순위 50위 > 5, 0 > 따로 > 불가능
				//System.out.println(no);
			
				Elements nlist = movie.select("a > div > em > span > span");
				String no = "";
				
				for (Element nitem : nlist) {
					no += nitem.text();
				}
				System.out.println(no + ": " + title);
				
				
				String href = movie.firstElementChild().attr("href");
				System.out.println("https://serieson.naver.com" + href);
				
				String src = movie.selectFirst("img").attr("src");
				System.out.println(src);
				
			}
			
		} catch (Exception e) {
			System.out.println("Ex02.main");
			e.printStackTrace();
			
		}
	}
}
