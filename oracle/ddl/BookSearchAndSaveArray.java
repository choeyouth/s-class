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

public class BookSearchAndSaveArray {
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
            //L1 ~ L100
            //String[] titles = {"The Boy Who Cried Wolf", "The Treasure in the Vineyard", "The Ugly Duckling", "Little Red Riding Hood", "Goldilocks and the Three Bears", "The Toyrtoise and the Hare", "포도밭에 숨겨진 보물", "여우와 까마귀", "수탉, 강아지와 여우", "꽃사슴", "미녀와 야수", "음식을 만드는 도토리", "여러 가지 과일", "몸에 좋은 채소", "태양의 꽃 해바라기", "부지런한 나팔꽃", "봄과 여름에 피는 꽃", "가을에 피는 꽃", "꽃의 생김새", "\"물에서 사는 식물, 수생 식물\"", "어둠을 가르는 날짐승 박쥐", "코가 손인 코끼리", "인간과 가장 흡사한 동물 원숭이", "\"친구 같은 동물, 개\"", "귀엽고 깔끔한 고양이", "조가비를 지고 다니는 달팽이", "위협적인 집게다리의 소유자 가재", "껍데기 안에 근육을 숨긴 게", "폐와 피부로 숨쉬는 개구리", "봄의 전령사 제비", "인체의 구조와 작용", "음식물의 중요성과 소화 과정", "비행기의 발전과 종류", "배의 발전과 종류", "밤의 수호신 달", "신비로운 우주", "우주 개발", "화산과 화석", "우리나라의 자연", "환경이 오염됐어요", "아름다운 행성 지구", "뽐내기를 잘하는 동물들 1", "뽐내기를 잘하는 동물들 2", "서로 돕고 사는 동물들 1", "서로 돕고 사는 동물들 2", "사냥을 잘하는 동물들 1", "사냥을 잘하는 동물들 2", "변신을 잘하는 동물들 1", "변신을 잘하는 동물들 2", "싸움을 잘하는 동물들 1", "싸움을 잘하는 동물들 2", "방어를 잘하는 동물들 1", "방어를 잘하는 동물들 2", "삶을 시작하는 아기 동물들 1", "삶을 시작하는 아기 동물들 2", "혼자서도 잘 크는 동물들 1", "혼자서도 잘 크는 동물들 2", "부모의 보살핌을 받는 동물들 1", "부모의 보살핌을 받는 동물들 2", "끝까지 살아남는 동물들 1", "끝까지 살아남는 동물들 2", "선녀와 나무꾼", "멧돼지 도사", "주인을 구한 누렁이", "왕자와 백일홍", "혹부리 영감", "우렁이 색시", "이상한 옥피리", "사윗감을 찾는 쥐", "호랑이와 곶감", "에밀레종", "은혜갚은 까치", "불개", "푸줏간 주인과 돼지로 태어난 어머니", "효녀를 도운 개", "바보와 돌부처", "볶은 깨를 밭에 심은 바보", "바보 사위의 장보기", "바보 소금 장수", "호동왕자와 낙랑공주", "심청전", "옹고집전", "전우치전", "토끼전", "흥부와 놀부", "박씨전", "장화홍련전", "콩쥐팥쥐전", "대머리가 된 독수리", "로렐라이", "맛있는 빵", "베짜는 학", "공주의 시험", "세가지 소원", "새우등이 꼬부라진 이유", "유리 언덕 위의 공주", "물고기 열두 토막", "닭과 솔개", "친구 숫염소를 구해 준 토끼", "달나라 공주를 사랑한 왕자"};
            //String[] titles = {"참새 날개를 단 쥐", "개를 구해준 늑대", "슬기로운 토끼", "뱀과 요술보자기", "우렁이 소녀", "공주의 신랑감 구하기", "여우는 아무도 못당해", "은혜를 저버린 늑대", "바보 농부의 지혜", "두견이가 된 젊은이", "아내를 얻기 위한 네가지 시험", "학과 나무꾼", "개미가 된 짱아", "나도 쓸모가 있대", "방울이의 세상구경", "사막에서", "산딸기는 어디에", "서로 돕고 살아요", "수박씨 하나", "신발장수 반달곰", "심부름 가는 아기곰", "아기 동박새를 찾아라", "아기펭귄 똘이", "엄마 무서워", "우리집을 찾아줘", "우주비행사 곰동이", "원님의 실수", "이상한 기차", "째깍째깍 시계귀신", "초롱아 위험해", "치치는 외롭지 않아", "호랑나비가 되었어요", "동물 1 - 동물의 세계", "동물 2 - 분류학", "동물 3 - 동물계", "동물 4 - 다양한 동물을 가진 섬", "동물 5 - 대양", "동물 6 - 북극", "동물 7 - 남극", "동물 8 - 유럽1", "동물 9 - 유럽2", "동물 10 - 아시아1", "동물 11 - 아시아2", "동물 12 - 아프리카1", "동물 13 - 아프리카2", "동물 14 - 북아메리카1", "동물 15 - 북아메리카2", "동물 16 - 북아메리카3", "동물 17 - 남아메리카", "동물 18 - 오스트랄라시아1", "동물 19 - 오스트랄라시아2", "동물 20 - 멸종위기의 동물", "바다 1 - 바다와 사람들", "바다 2 - 바다의 탄생", "바다 3 - 바다와 지형", "바다 4 - 역동하는 바다", "바다 5 - 격동의 바다", "바다 6 - 바닷물의 흐름", "바다 7 - 바다 밑의 세계", "바다 8 - 얕은 바다의 생물", "바다 9 - 깊은 바다의 생물", "바다 10 - 바다의 탐험", "바다 11 - 북극해", "바다 12 - 남극해", "바다 13 - 대서양1", "바다 14 - 대서양2", "\"바다 15 - 북해, 발트해, 지중해\"", "\"바다 16 - 내해, 카리브해\"", "바다 17 - 태평양1", "바다 18 - 태평양2", "바다 19 - 인도양1", "바다 20 - 인도양2", "우주 1 - 우주 여행의 시작", "우주 2 -우주와 지구", "우주 3 -천체 탐구1", "우주 4 -천체 탐구2", "우주 5 -태양계와 태양", "우주 6 -수성과 금성", "우주 7 -지구와 달", "우주 8 -소행성과 유성", "우주 9 -화성", "우주 10 -목성", "우주 11 -토성", "우주 12 -천왕성과 해왕성", "우주 13 -명왕성 너머와 혜성", "우주 14 -별", "우주 15 -은하계", "우주 16 -우주의 확장", "우주 17 -우주 탐험", "우주 18 -우주 비행체와 우주 정거장", "우주 19 -우주 여행", "우주 20 -인공위성과 우주 탐사", "The Fox and the Crane", "The Ant and the Grasshopper", "The Cat in the Boots", "The Wolf and the Seven Little Goats", "The Three Little Pigs", "\"The Rooster, the Dog and the Fox\"", "The Baby Deer", "The Happy Prince" };
            //String[] titles = {"트렌드 코리아", "우리가 빛의 속도로 갈 수 없다면"};
            String[] titles = {"Cinderella", "Beauty and the Beast", "Thumbelina", "The Lion and the Mouse", "Androcles and the Lion", "Snow White and the Seven Dwarfs", "The Little Mermaid", "Sleeping Beauty", "The Monkey and the Dolphin", "The Country Mouse and the City Mouse", "The Pied Piper", "The Little Boy that Beat the Giant", "Hansel and Gretel", "Jack and the Beanstalk", "앤드로킬리스와 사자", "원숭이와 돌고래", "피리 부는 사나이", "거인을 물리친 엄지 동자", "가장 아름다운 여신", "제물이 된 이피게네이아", "파트로클로스의 죽음", "트로이의 목마", "구두장이와 오리의 모험 (유럽편)", "황금 카네이션 (유럽편)", "찌르레기의 꾸짖음 (유럽편)", "왕자들의 선물 (유럽편)", "땜장이의 세 가지 소원 (유럽편)", "읽고 쓸 줄 아는 당나귀 (페르시아편)", "토끼의 충고 (페르시아편)", "욕심 많은 세 명의 도둑 (페르시아편)", "농부와 장사꾼 (페르시아편)", "영리한 토끼 (페르시아편)", "동물의 왕이 된 피리새 (아프리카편)", "미련한 하이에나 (아프리카편)", "츄크우디의 요술 항아리 (아프리카편)", "사람을 닮은 원숭이 (아프리카편)", "말 안 듣는 아이 (아프리카편)", "꾀 많은 주머니 쥐 (아메리카편)", "부모보다 늙은 아들 (아메리카편)", "신기한 대나무 줄기 (아메리카편)", "성안토니오 이야기 (아메리카편)", "양치기와 태양의 딸 (아메리카편)", "날아다니는 배 (러시아편)", "보석보다 값진 말씀 (러시아편)", "농부와 붉은 도깨비 (일본편)", "떼굴떼굴 주먹밥 (일본편)", "마량의 신비한 붓 (중국편)", "약초산 (중국편)", "어리석은 푸른 늑대 (인도편)", "죽은 한 마리로 부자 되기 (인도편)", "꾀보 살람 (인도네시아편)", "절름발이와 장님 형제 (인도네시아편)", "라푼첼", "일곱 마리의 까마귀", "세 자매와 숲속 오두막", "왕자와 여섯 명의 신하", "사냥꾼이 된 공주", "황금 거위", "시녀가 된 공주", "행복한 한스", "감나무에 감이 주렁주렁", "감자와 고구마는 어디있지", "개구쟁이 원숭이와 복숭아", "고추랑 마늘이랑", "국화꽃 향기가 달콤해요", "금불초와 톱풀의 화려한 꽃잔치", "꽃밭에 피어난 접시꽃과 옥잠화", "꽃의 여왕 장미", "\"꽃잔디야, 수선화야 춥지 않니\"", "나리와 꽃을 사랑한 할아버지", "\"나비야, 개미취와 금계국 보러가자\"", "따따따 나팔꽃", "매의 발톱을 닮은 매발톱꽃", "모과와 석류는 과일 주에 으뜸", "모란꽃으로 피어난 왕자", "몰래 숨어 온 목화", "무궁화는 우리나라 꽃", "물위에 피어나는 연꽃과 수련", "민들레의 비밀이야기", "바닷가 모래밭에서 피어난 해당화", "배가 되고 싶은 배꽃 요정들", "보리와 밀을 밟아 주세요", "붓꽃은 꽃창포와 친척이래요", "뿌리로 추운 겨울을 보내는 작약", "사계절나라에 사는 앵두와 등나무", "사과나무가 있어 외롭지 않아", "산기슭에 자라나는 노루 오줌과 으아리", "산에서 양지꽃과 애기똥풀을 보았어요", "수줍은 비비추와 삐죽삐죽 엉겅퀴", "아기동물들의 수박기르기", "\"안녕, 제비꽃\"", "엄마엄마 딸기 좀 보세요", "오이와수세미오이에게는덩굴손이있어요", "옥수수 하모니카", "우리 할아버지는 진달래 박사", "인동과 담쟁이덩굴처럼 씩씩해요", "조와 기장은 닮은 꼴이래요", "찔레꽃 향기가 솔솔", "\"참외야, 토마토야, 미안해\"", "채송화도 패랭이꽃도 한창입니다." };
            
            // 3. API Key 설정
            String apiKey = "ttbdbwjd22ek1603001";  // 본인의 알라딘 API Key로 교체

            for (String title : titles) {
            	
            	searchCount++; 

            	System.out.println(searchCount);
            	
            	
                // 제목 인코딩 (띄어쓰기 및 특수문자 처리)
                String encodedTitle = URLEncoder.encode(title, "UTF-8");

                // API 호출 URL 생성
                String urlString = "https://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey="
                        + apiKey + "&Query=" + encodedTitle
                        + "&QueryType=Title&MaxResults=2&start=1&SearchTarget=Book&output=xml&Version=20131101";

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
                            System.out.println("장르 카테고리를 찾을 수 없습니다: " + genreName);
                            System.out.println("============================================================================");
                            continue;
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
                            System.out.println("서브 장르 카테고리를 찾을 수 없습니다: " + subGenreName);
                            System.out.println("============================================================================");
                            continue;
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
            }
            

        	System.out.println(searchCount);
        	
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
