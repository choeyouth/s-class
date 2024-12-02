package oracle.tblBookReview;

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

public class ex10_BookReview_dml_2 {
    public static String searchBookByTitle(String title) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // 1. 데이터베이스 연결
            String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";  // 오라클 DB 주소
            String user = "sever";  // 오라클 DB 사용자 이름
            String password = "java1234";  // 오라클 DB 비밀번호
            conn = DriverManager.getConnection(dbUrl, user, password);

            // API Key 설정
            String apiKey = "ttbdbwjd22ek1603001";  // 본인의 알라딘 API Key로 교체

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

            // ISBN 리스트를 저장할 변수
            String itemId = null;

            for (int i = 0; i < items.getLength(); i++) {
                Node item = items.item(i);

                if (item.getNodeType() == Node.ELEMENT_NODE) {
                    Element element = (Element) item;
                    // itemId 속성 가져오기
                    itemId = element.getElementsByTagName("isbn13").item(0).getTextContent();  
                }
            }

            // 데이터베이스에서 itemId로 책 정보를 확인
            String checkSql = "SELECT seq FROM tblBook WHERE seq = ?";
            pstmt = conn.prepareStatement(checkSql);
            pstmt.setString(1, itemId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                return rs.getString("seq");
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
    }

    public static void main(String[] args) {
        // 메인 메서드에서 책 제목 입력을 받아 searchBookByTitle 메서드 호출
        Scanner scan = new Scanner(System.in);
        System.out.print("검색할 책 제목: ");
        String title = scan.nextLine();
        String bookSeq = searchBookByTitle(title);
        
        if (bookSeq != null) {
            System.out.println("책의 시퀀스 번호: " + bookSeq);
        } else {
            System.out.println("해당 책이 존재하지 않습니다.");
        }
    }

    
}

