package com.oracle;

import com.oracle.BasicInfo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;
import org.w3c.dom.*;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.ByteArrayInputStream;

public class ex13_wordList_dml {

    // XML 파싱 시 특정 태그의 값을 가져오는 헬퍼 메서드
    private static String getValue(String tag, Element element) {
        NodeList nodeList = element.getElementsByTagName(tag);
        if (nodeList.getLength() > 0 && nodeList.item(0).getFirstChild() != null) {
            return nodeList.item(0).getFirstChild().getNodeValue();
        }
        return null;
    }
    // 단어 검색 메서드
    public void searchWord(String word) {
        BasicInfo dbHelper = new BasicInfo();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // DB에서 검색
            String query = "SELECT * FROM tblWordList WHERE word = ?";
            conn = dbHelper.getConnection(); // DB 연결 가져오기
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, word);
            rs = pstmt.executeQuery();

            boolean foundInDb = false;
            
            while (rs.next()) {
                foundInDb = true;
                System.out.println("검색 결과입니다.");
                System.out.println("단어번호: " + rs.getInt("target_code"));
                System.out.println("단어: " + rs.getString("word"));
                System.out.println("구분: " + rs.getString("pos"));
                System.out.println("뜻: " + rs.getString("definition"));
                System.out.println("==============================================");
            }

            // DB에 결과가 없을 경우 API 호출 및 저장
            if (!foundInDb) {
                // API 호출 및 DB 저장 로직은 이전과 동일하게 구현
                String key = "";
                String encodedWord = URLEncoder.encode(word, "UTF-8");
                String urlString = "https://stdict.korean.go.kr/api/search.do?key=760C3909BB89C07D50BD72F9FEE11727" + key + "&type_search=search&q=" + encodedWord;
                URL apiUrl = new URL(urlString);
                HttpURLConnection httpConn = (HttpURLConnection) apiUrl.openConnection();
                httpConn.setRequestMethod("GET");

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

                // XML 데이터를 파싱하여 DB에 삽입 및 출력
                NodeList items = document.getElementsByTagName("item");
                for (int i = 0; i < items.getLength(); i++) {
                    Node item = items.item(i);
                    if (item.getNodeType() == Node.ELEMENT_NODE) {
                        Element element = (Element) item;

                        // target_code, word, pos, definition 값 가져오기
                        String targetCode = element.getElementsByTagName("target_code").item(0).getTextContent();
                        String wordValue = element.getElementsByTagName("word").item(0).getTextContent();
                        String pos = element.getElementsByTagName("pos").item(0).getTextContent();
                        String definition = element.getElementsByTagName("definition").item(0).getTextContent();

                        // DB에 저장
                        String insertSql = "INSERT INTO tblWordList (target_code, word, pos, definition) VALUES (?, ?, ?, ?)";
                        pstmt = conn.prepareStatement(insertSql);
                        pstmt.setInt(1, Integer.parseInt(targetCode));
                        pstmt.setString(2, wordValue);
                        pstmt.setString(3, pos);
                        pstmt.setString(4, definition);

                        pstmt.executeUpdate();  // 데이터베이스에 저장

                        // API로 검색된 결과 출력
                        System.out.println("검색 결과입니다.");
                        System.out.println("단어번호: " + targetCode);
                        System.out.println("단어: " + wordValue);
                        System.out.println("구분: " + pos);
                        System.out.println("뜻: " + definition);
                        System.out.println("==============================================");
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
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
}
