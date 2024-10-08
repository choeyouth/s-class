package oracle.ddl;

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

public class tblBook_api_dml {
    public static void main(String[] args) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 1. 데이터베이스 연결
            String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";  // 오라클 DB 주소
            String user = "system";  // 오라클 DB 사용자 이름
            String password = "oracle";  // 오라클 DB 비밀번호
            conn = DriverManager.getConnection(dbUrl, user, password);
            System.out.println("DB 연결 성공!");

            // 2. API Key 설정 및 검색할 책 제목 배열 선언
            String apiKey = "ttbdbwjd22ek1603001";  // 본인의 알라딘 API Key로 교체
            
            //L1 ~ L100
            String[] bookTitles = {"The Boy Who Cried Wolf", "The Treasure in the Vineyard", "The Ugly Duckling", "Little Red Riding Hood", "Goldilocks and the Three Bears", "The Toyrtoise and the Hare", "포도밭에 숨겨진 보물", "여우와 까마귀", "수탉, 강아지와 여우", "꽃사슴", "미녀와 야수", "음식을 만드는 도토리", "여러 가지 과일", "몸에 좋은 채소", "태양의 꽃 해바라기", "부지런한 나팔꽃", "봄과 여름에 피는 꽃", "가을에 피는 꽃", "꽃의 생김새", "\"물에서 사는 식물, 수생 식물\"", "어둠을 가르는 날짐승 박쥐", "코가 손인 코끼리", "인간과 가장 흡사한 동물 원숭이", "\"친구 같은 동물, 개\"", "귀엽고 깔끔한 고양이", "조가비를 지고 다니는 달팽이", "위협적인 집게다리의 소유자 가재", "껍데기 안에 근육을 숨긴 게", "폐와 피부로 숨쉬는 개구리", "봄의 전령사 제비", "인체의 구조와 작용", "음식물의 중요성과 소화 과정", "비행기의 발전과 종류", "배의 발전과 종류", "밤의 수호신 달", "신비로운 우주", "우주 개발", "화산과 화석", "우리나라의 자연", "환경이 오염됐어요", "아름다운 행성 지구", "뽐내기를 잘하는 동물들 1", "뽐내기를 잘하는 동물들 2", "서로 돕고 사는 동물들 1", "서로 돕고 사는 동물들 2", "사냥을 잘하는 동물들 1", "사냥을 잘하는 동물들 2", "변신을 잘하는 동물들 1", "변신을 잘하는 동물들 2", "싸움을 잘하는 동물들 1", "싸움을 잘하는 동물들 2", "방어를 잘하는 동물들 1", "방어를 잘하는 동물들 2", "삶을 시작하는 아기 동물들 1", "삶을 시작하는 아기 동물들 2", "혼자서도 잘 크는 동물들 1", "혼자서도 잘 크는 동물들 2", "부모의 보살핌을 받는 동물들 1", "부모의 보살핌을 받는 동물들 2", "끝까지 살아남는 동물들 1", "끝까지 살아남는 동물들 2", "선녀와 나무꾼", "멧돼지 도사", "주인을 구한 누렁이", "왕자와 백일홍", "혹부리 영감", "우렁이 색시", "이상한 옥피리", "사윗감을 찾는 쥐", "호랑이와 곶감", "에밀레종", "은혜갚은 까치", "불개", "푸줏간 주인과 돼지로 태어난 어머니", "효녀를 도운 개", "바보와 돌부처", "볶은 깨를 밭에 심은 바보", "바보 사위의 장보기", "바보 소금 장수", "호동왕자와 낙랑공주", "심청전", "옹고집전", "전우치전", "토끼전", "흥부와 놀부", "박씨전", "장화홍련전", "콩쥐팥쥐전", "대머리가 된 독수리", "로렐라이", "맛있는 빵", "베짜는 학", "공주의 시험", "세가지 소원", "새우등이 꼬부라진 이유", "유리 언덕 위의 공주", "물고기 열두 토막", "닭과 솔개", "친구 숫염소를 구해 준 토끼", "달나라 공주를 사랑한 왕자"};
            
            // 3. 책 제목 배열을 순회하며 검색 및 저장
            for (String title : bookTitles) {
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
                        String itemId = element.getAttribute("itemId");

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

                        // 데이터 출력 (필요한 경우)
                        System.out.println("ISBN: " + itemId);
                        System.out.println("책 제목: " + bookTitle);
                        System.out.println("저자: " + author);
                        System.out.println("가격: " + priceSales);
                        System.out.println("발행일: " + pubDate);
                        System.out.println("책 표지: " + cover);
                        System.out.println("줄거리: " + description);
                        System.out.println("장르: " + categoryName);
                        System.out.println("============================================================================");

                        // 데이터베이스에 동일 ISBN 있는지 확인
                        String checkSql = "SELECT COUNT(*) FROM tblBooks WHERE id = ?";
                        pstmt = conn.prepareStatement(checkSql);
                        pstmt.setString(1, itemId);
                        rs = pstmt.executeQuery();
                        rs.next();

                        int count = rs.getInt(1);  // 동일 ISBN 개수 확인

                        if (count > 0) {
                            System.out.println("이미 존재하는 책입니다: " + bookTitle + " (ISBN: " + itemId + ")");
                        } else {
                            // 데이터베이스에 삽입
                            String insertSql = "INSERT INTO BOOKS (id, genre_seq, name, author, publicationDate, story, pageNum) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                            pstmt = conn.prepareStatement(insertSql);
                            pstmt.setString(1, itemId);
                            pstmt.setString(2, categoryName);
                            pstmt.setString(3, bookTitle);
                            pstmt.setString(4, author);
//                            pstmt.setDouble(4, Double.parseDouble(priceSales));
                            pstmt.setString(5, pubDate);
//                            pstmt.setString(6, cover);
                            pstmt.setString(6, description);
                            pstmt.setString(2, categoryName);

                            pstmt.executeUpdate();  // 데이터베이스에 저장
                            System.out.println("데이터 저장 완료: " + bookTitle);
                        }
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
