package com.oracle.query;

import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

//import org.jsoup.Jsoup;
//import org.jsoup.nodes.Document;
//import org.jsoup.nodes.Element;
//import org.jsoup.select.Elements;
//
//import oracle.BasicInfo;
//import oracle.tblBook.book_dml;

public class ex10_BookReview_dml {

    public static void main(String[] args) {

        BasicInfo db = new BasicInfo();
        Random random = new Random(); // Random 객체 생성

        try {
            String url = "https://www.kyobobook.co.kr/review";
//            Document document = Jsoup.connect(url).get();
//
//            Elements name_list = document.select(".prod_name");
//            Elements commend_list = document.select(".comment_text");
//            Elements date_list = document.select(".info_item");
//            
//            Pattern datePattern = Pattern.compile("\\d{4}\\.\\d{2}\\.\\d{2}");
//            
//            for (int i = 0; i < name_list.size(); i++) {
//                Element name_element = name_list.get(i);
//                Element commend_element = commend_list.get(i);
//                Element date_element = date_list.get(i);
//
//                String name = name_element.text();
//                String commend = commend_element.text();
//                String dateText = date_element.text();
//
//                // 정규표현식을 사용하여 날짜 추출
//                Matcher matcher = datePattern.matcher(dateText);
//                String date = null;
//                if (matcher.find()) {
//                    date = matcher.group();
//                } else {
//                    // 날짜가 없을 경우 sysdate로 설정
//                    date = "";
//                }
//
//
//                System.out.println("책 제목: " + name);
//                System.out.println("리뷰: " + commend);
//                System.out.println("날짜: " + date);
//                System.out.println("--------------------");
//
//                	
//
//                // 책 제목으로 ISBN 검색
//                String bookSeq = ex10_BookReview_dml_2.searchBookByTitle(name);
//
//                // 책이 없으면 API로 책 정보 검색
//                if (bookSeq == null) {
//                    System.out.println("해당 책이 존재하지 않습니다. API를 통해 정보를 가져옵니다...");
//                    book_dml.searchBookByTitle(name);
//                    bookSeq = ex10_BookReview_dml_2.searchBookByTitle(name);
//                }
//
//                int memberSeq = random.nextInt(80) + 1;
//
//                String query = "SELECT SEQ FROM tblBook WHERE name LIKE '%" + name + "%'";
//                
//                db.executeQuery(query);
//                
//                String insertQuery = "INSERT INTO tblBookReview VALUES (bookreview_seq.nextval, "
//                        + "(" + query + "), '" + commend + "', " + memberSeq + ", '" + date + "')";
//
//                db.insertData(insertQuery);
//                
//            }
        } catch (Exception e) {
            System.out.println("bookreview_dml.java");
            e.printStackTrace();
        }
    }
}