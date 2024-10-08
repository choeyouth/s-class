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

public class ex17_bestsellerSave {
    public static void main(String[] args) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int searchCount = 0;

        try {
            // 1. 데이터베이스 연결
            String dbUrl = "jdbc:oracle:thin:@43.202.205.134:1521:xe";  // 오라클 DB 주소
            String user = "project";  // 오라클 DB 사용자 이름
            String password = "java1234";  // 오라클 DB 비밀번호
            conn = DriverManager.getConnection(dbUrl, user, password);
            System.out.println("DB 연결 성공!");

            // 2. 검색할 책 제목 배열
            String[] titles = {
            		"여행의 이유", "아주 작은 습관의 힘", "1일 1페이지, 세상에서 가장 짧은 교양 수업 365", "관계의 심리학", "돈의 속성", "꿈꾸는 다락방 - 생생하게 꿈꾸면 이루어진다", "유재석처럼 말하고 강호동처럼 행동하라", "바람의 딸 걸어서 지구 세 바퀴 반 1", "인간의 흑역사", "설민석의 무도 한국사 특강", "그릿 GRIT", "돈의 심리학", "심리학이 이렇게 쓸모 있을 줄이야", "40대, 다시 한번 공부에 미쳐라", "부의 확장", "B급 세계사", "1등의 습관", "살아 있는 것은 다 행복하라 - 법정 잠언집", "연을 쫓는 아이", "노홍철의 '뻔뻔'한 서울", "생각정리법", "더 해빙", "습관을 조금 바꿨을 뿐인데 잘 풀리기 시작했다", "머니", "아들아, 돈 공부해야 한다", "미움받을 용기", "상식 밖의 경제학", "세계미래보고서 2021 (포스트 코로나 특별판)", "방구석 미술관", "역행자", "물고기는 존재하지 않는다", "명견만리", "주식투자자가 꼭 알아야 할 기본적 분석법", "이문열의 삼국지 1", "미드나잇 라이브러리", "기분이 태도가 되지 않게", "아비투스", "무례한 사람에게 웃으며 대처하는 법", "말의 내공", "오베라는 남자", "트렌드 코리아 2021", "세상에서 가장 짧은 세계사", "보통의 언어들", "연애 오프더 레코드", "아침의 재발견", "파리블루", "역사의 쓸모", "명견만리: 공존의 시대 편", "30가지 발명품으로 읽는 세계사", "인류이야기 1", "나는 나로 살기로 했다", "회계는 어떻게 역사를 지배해왔는가", "부자의 행동습관", "트렌드 코리아 2020", "굿 라이프", "독살로 읽는 세계사", "아홉 명의 완벽한 타인들", "2000만원으로 연봉버는 경매투자", "웰씽킹", "나는 절대 저렇게 추하게 늙지 말아야지", "나쁜 남자 (상)", "모든 관계는 말투에서 시작된다", "고양이에게 말 걸기 - 비룡소 창작 그림책 13", "게으른 게 아니라 충전 중입니다", "연금술사", "김형곤의 엔돌핀코드", "아들아, 삶에 지치고 힘들 때 이 글을 읽어라", "여름, 어디선가 시체가", "세계의 대통령, 반기문", "존리의 금융문맹 탈출", "사소해서 물어보지 못했지만 궁금했던 이야기", "내가 틀릴 수도 있습니다", "포노 사피엔스", "신경 끄기의 기술", "사랑을 선택하는 특별한 기준 1", "감정의 발견", "프로이트의 의자", "고요할수록 밝아지는 것들", "대한민국 부동산 투자", "어디서 살 것인가", "내 편이 아니라도 적을 만들지 마라", "실전에 바로 써먹는 주식투자 레슨 60", "50, 나는 태도를 바꾸기로 했다", "공간의 심리학", "우주에서 제일 쉬운 영문법", "1% 다른 스피치", "영혼을 위한 닭고기 수프 1", "넛지: 파이널 에디션", "성숙한 어른이 갖춰야 할 좋은 심리 습관", "한권으로 읽는 삼국지", "왕사슴 아델칸", "사고력을 키우는 수학책"
            		};
            //Total searches: 92 
            
            
           
            
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
