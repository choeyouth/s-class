package com.oracle;

import org.w3c.dom.*;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.ByteArrayInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class BookSearchAndSave {
    public static void main(String[] args) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 1. 데이터베이스 연결
            String dbUrl = "jdbc:oracle:thin:@43.202.205.134:1521:xe";  // 오라클 DB 주소
            String user = "project";  // 오라클 DB 사용자 이름
            String password = "java1234";  // 오라클 DB 비밀번호
            conn = DriverManager.getConnection(dbUrl, user, password);
            System.out.println("DB 연결 성공!");

            // 2. API Key와 검색할 제목 입력
            String apiKey = "ttbdbwjd22ek1603001";  // 본인의 알라딘 API Key로 교체
            Scanner scan = new Scanner(System.in);
            System.out.print("검색할 책 제목: ");
            String title = scan.nextLine();

            // 제목 인코딩 (띄어쓰기 및 특수문자 처리)
            String encodedTitle = URLEncoder.encode(title, "UTF-8");

            // API 호출 URL 생성
            String urlString = "https://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=" 
                    + apiKey + "&Query=" + encodedTitle 
                    + "&QueryType=Title&MaxResults=1&start=1&SearchTarget=Book&output=xml&Version=20131101";

            URL apiUrl = new URL(urlString);
            HttpURLConnection httpConn = (HttpURLConnection) apiUrl.openConnection();
            httpConn.setRequestMethod("GET");

            // API 응답을 BufferedReader로 읽음
            BufferedReader in = new BufferedReader(new InputStreamReader(httpConn.getInputStream(), "UTF-8"));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            // XML 파싱 준비 (API 응답을 메모리에서 읽기 위해 ByteArrayInputStream 사용)
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            ByteArrayInputStream input = new ByteArrayInputStream(response.toString().getBytes("UTF-8"));
            Document document = builder.parse(input);

            // XML 루트 엘리먼트 가져오기
            Element root = document.getDocumentElement();

            // 특정 엘리먼트 (item 엘리먼트) 가져오기
            NodeList items = document.getElementsByTagName("item");

            for (int i = 0; i < items.getLength(); i++) {
                Node item = items.item(i);

                if (item.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element) item;

                    // itemId 속성 가져오기
                    String itemId = element.getElementsByTagName("isbn13").item(0).getTextContent();  

                    // title 엘리먼트 값 가져오기
                    String bookTitle = element.getElementsByTagName("title").item(0).getTextContent();

                    // author 엘리먼트 값 가져오기
                    String author = element.getElementsByTagName("author").item(0).getTextContent();

                    // priceSales 엘리먼트 값 가져오기
                    String priceSales = element.getElementsByTagName("priceSales").item(0).getTextContent();

                    // pubDate 엘리먼트 값 가져오기
                    String pubDate = element.getElementsByTagName("pubDate").item(0).getTextContent();

                    // cover 엘리먼트 값 가져오기
                    String cover = element.getElementsByTagName("cover").item(0).getTextContent();

                    // description 엘리먼트 값 가져오기 (줄거리)
                    String description = element.getElementsByTagName("description").item(0).getTextContent();

                    // categoryName 엘리먼트 값 가져오기 (카테고리)
                    String categoryName = element.getElementsByTagName("categoryName").item(0).getTextContent();

                    // 카테고리 문자열을 분리
                    String[] categoryParts = categoryName.split(">");
                    if (categoryParts.length < 2) {
                        System.out.println("카테고리 형식이 잘못되었습니다: " + categoryName);
                        continue;
                    }

                    String genreName = categoryParts[1].trim();
                    String subGenreName = categoryParts.length > 2 ? categoryParts[2].trim() : "";

                    // 장르 카테고리 검색
                    String genreSql = "SELECT seq FROM tblGenreList WHERE genre LIKE ?";
                    pstmt = conn.prepareStatement(genreSql);
                    pstmt.setString(1, "%" + genreName + "%");
                    rs = pstmt.executeQuery();
                    Integer genreSeq = null;
                    if (rs.next()) {
                        genreSeq = rs.getInt("seq");
                    }
                    rs.close();

                    if (genreSeq == null) {
                        System.out.println(genreName + " 장르 카테고리를 찾을 수 없습니다. 기타 장르에 저장합니다. : ");
                        System.out.println("============================================================================");
                        
                        genreName = "기타";
                        genreSeq = 64;
                    }

                    // 서브 장르 카테고리 검색
                    String subGenreSql = "SELECT seq FROM tblSubGenre WHERE genre_seq = ? AND subGenre LIKE ?";
                    pstmt = conn.prepareStatement(subGenreSql);
                    pstmt.setInt(1, genreSeq);
                    pstmt.setString(2, "%" + subGenreName + "%");
                    rs = pstmt.executeQuery();
                    Integer subGenreSeq = null;
                    if (rs.next()) {
                        subGenreSeq = rs.getInt("seq");
                    }
                    rs.close();

                    if (subGenreSeq == null) {
                        System.out.println(subGenreName + " 서브 장르 카테고리를 찾을 수 없습니다. 기타 장르에 저장합니다. : ");
                        System.out.println("============================================================================");
                        
                        subGenreName = "기타";
                        subGenreSeq = 9863;
                    }
                    
                    //Null 처리 
                    if(itemId == "" || bookTitle == "" || author == "" || priceSales == "" ||
                       pubDate == "" || categoryName == "" || cover == "") {
                    	System.out.println("잘못된 데이터입니다.");
                    	continue;
                    } else if (itemId == null || bookTitle == null || author == null || priceSales == null ||
                               pubDate == null || categoryName == null || cover == null) {
                    	System.out.println("잘못된 데이터입니다.");
                    	continue;
                    }
                    
                    if (description == "" || description == null) {
                    	description = "준비 중입니다.";
                    }
                    

                    // 데이터베이스에 동일 ISBN 있는지 확인
                    String checkSql = "SELECT COUNT(*) FROM tblBook WHERE seq = ?";
                    pstmt = conn.prepareStatement(checkSql);
                    pstmt.setString(1, itemId);
                    rs = pstmt.executeQuery();
                    rs.next();
                    int count = rs.getInt(1);  // 동일 ISBN 개수 확인
                    
                    if (count > 0) {
                        System.out.println("이미 존재하는 책입니다: " + bookTitle + " (ISBN: " + itemId + ")");
                        System.out.println("============================================================================");
                    } else {
                        // 데이터베이스에 삽입
                        String insertSql = "INSERT INTO tblBook (seq, subGenre_seq, name, author, publicationDate, story, cover) VALUES (?, ?, ?, ?, ?, ?, ?)";
                        pstmt = conn.prepareStatement(insertSql);
                        pstmt.setString(1, itemId);
                        pstmt.setInt(2, subGenreSeq);
                        pstmt.setString(3, bookTitle);
                        pstmt.setString(4, author);
                        pstmt.setDate(5, java.sql.Date.valueOf(pubDate));  // 발행일 처리
                        pstmt.setString(6, description);
                        pstmt.setString(7, cover);

                        pstmt.executeUpdate();  // 데이터베이스에 저장
                        
                        System.out.println("데이터 저장 완료: " + bookTitle);
                        System.out.println("Item ID: " + itemId);
                        System.out.println("subGenreSeq: " + subGenreSeq);
                        System.out.println("Title: " + bookTitle);
                        System.out.println("Author: " + author);
                        System.out.println("발행일: " + pubDate);
                        System.out.println("Description: " + description);
                        System.out.println("Cover: " + cover);
                        System.out.println("genreName: " + genreName);
                        System.out.println("subGenreName: " + subGenreName);
                        System.out.println("============================================================================");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                // 자원 해제
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
