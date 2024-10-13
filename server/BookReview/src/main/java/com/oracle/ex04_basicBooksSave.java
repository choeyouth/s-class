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

public class ex04_basicBooksSave {
    public static void main(String[] args) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int searchCount = 0;

        try {
            // 1. 데이터베이스 연결
            String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";  // 오라클 DB 주소
            String user = "system";  // 오라클 DB 사용자 이름
            String password = "oracle";  // 오라클 DB 비밀번호
            conn = DriverManager.getConnection(dbUrl, user, password);
            System.out.println("DB 연결 성공!");

            // 2. 검색할 책 제목 배열
            String[] titles = {
            		"달과 6펜스", 
            		"이방인", 
            		"페스트", 
            		"오십에 읽는 손자병법 - 불확실한 삶을 대비하기 위한 2,500년의 전략", 
            		"사피엔스 - 유인원에서 사이보그까지, 인간 역사의 대담하고 위대한 질문", 
            		"이기적 유전자 - 40주년 기념판", 
            		"총 균 쇠 - 인간 사회의 운명을 바꾼 힘", 
            		"지리의 힘 - 지리는 어떻게 개인의 운명을, 세계사를, 세계 경제를 좌우하는가", 
            		"오만과 편견", 
            		"시시포스 신화 - 부조리에 관한 시론", 
            		"차라투스트라는 이렇게 말했다", 
            		"니체의 자존감 수업 - 니체에게 배우는 나를 사랑하고 긍정하는 기술", 
            		"동양철학산책 (워크북 포함)", 
            		"완득이 - 제1회 창비 청소년문학상 수상작", 
            		"돈의 역사는 되풀이된다 - 돈의 흐름을 읽는 눈", 
            		"마흔에 읽는 니체 - 지금 이 순간을 살기 위한 철학 수업", 
            		"혼자일 수 없다면 나아갈 수 없다 - 프리드리히 니체 아포리즘", 
            		"니체의 인생 수업", 
            		"아주 작은 습관의 힘 - 최고의 변화는 어떻게 만들어지는가",
            		"청춘, 거침없이 달려라", 
            		"노인과 바다", 
            		"어린 왕자", 
            		"마법의 순간", 
            		"당신의 완벽한 1년", 
            		"참을수 없는 존재의 가벼움", 
            		"조승연의 이야기 인문학", 
            		"앵무새죽이기", 
            		"롤리타", 
            		"나는 나로 살기로 했다", 
            		"1984", 
            		"죄와 벌", 
            		"위대한 개츠비", 
            		"인간 실격", 
            		"지킬 박사와 하이드 씨", 
            		"백년 동안의 고독", 
            		"안나 카레니나", 
            		"지금 이 순간을 살아라", 
            		"호밀밭의 파수꾼", 
            		"초판본 동물 농장", 
            		"연금술사", 
            		"무기여 잘 있거라", 
            		"모비 딕", 
            		"걸리버 여행기", 
            		"돈키호테", 
            		"고전이 답했다 마땅히 살아야 할 삶에 대하여", 
            		"영원한 천국"
            		};
            //count: 46
            
            
           
            
            // 3. API Key 설정
            String apiKey = "ttbdbwjd22ek1603001";  // 본인의 알라딘 API Key로 교체

            for (String title : titles) {
                searchCount++;
                System.out.println("Searching for: " + title);

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

                // XML 파싱 준비
                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
                DocumentBuilder builder = factory.newDocumentBuilder();
                ByteArrayInputStream input = new ByteArrayInputStream(response.toString().getBytes("UTF-8"));
                Document document = builder.parse(input);

                Element root = document.getDocumentElement();
                NodeList items = document.getElementsByTagName("item");

                if (items.getLength() == 0) {
                    System.out.println("No items found for: " + title);
                    continue;
                }

                for (int i = 0; i < items.getLength(); i++) {
                    Node item = items.item(i);

                    if (item.getNodeType() == Node.ELEMENT_NODE) {
                        Element element = (Element) item;

                        // Extract details
                        String itemId = element.getElementsByTagName("isbn13").item(0).getTextContent();  
                        String bookTitle = element.getElementsByTagName("title").item(0).getTextContent();
                        String author = element.getElementsByTagName("author").item(0).getTextContent();
                        String priceSales = element.getElementsByTagName("priceSales").item(0).getTextContent();
                        String pubDate = element.getElementsByTagName("pubDate").item(0).getTextContent();
                        String cover = element.getElementsByTagName("cover").item(0).getTextContent();
                        String description = element.getElementsByTagName("description").item(0).getTextContent();
                        String categoryName = element.getElementsByTagName("categoryName").item(0).getTextContent();

//                        System.out.println("Item ID: " + itemId);
                        
//                        System.out.println("Processing book: " + bookTitle);
//                        System.out.println("Item ID: " + itemId);

                        // 카테고리 문자열을 분리
                        String[] categoryParts = categoryName.split(">");
                        if (categoryParts.length < 2) {
                            System.out.println("카테고리 형식이 잘못되었습니다: " + categoryName);
                            System.out.println("============================================================================");
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
                            System.out.println("데이터 저장 완료: ");

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

                        // ResultSet, PreparedStatement 자원 해제
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                    }
                }
            }
            
            System.out.println("Total searches: " + searchCount);
            
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
