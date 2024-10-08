package com.test.api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class BookDAO {

	public HashMap<String,Object> search(String word, String count, String start) {
		
		HashMap<String,Object> map = new HashMap<String,Object>();
		
        String clientId = "42sFlFsjhAgR1fY6zoJ4"; //애플리케이션 클라이언트 아이디
        String clientSecret = "LZa4iiPvjh"; //애플리케이션 클라이언트 시크릿

        String text = null;
        
        try {
            text = URLEncoder.encode(word, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }


        // JSON 결과
        String apiURL = "https://openapi.naver.com/v1/search/book.json?"
        		+ "query=" + text
        		+ "&display=" + count
        		+ "&start=" + start;
        

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);

        //System.out.println(responseBody);
		
        //responseBody(문자열) > JSON > ArrayList<BookDTO>
        
        try {
			
        	JSONParser parser = new JSONParser();
        	
        	JSONObject root = (JSONObject)parser.parse(responseBody);
        	//System.out.println(root.get("total"));
        	
        	JSONArray list = (JSONArray)root.get("items");
        	ArrayList<BookDTO> result = new ArrayList<BookDTO>();
        	
        	for (int i=0; i<list.size(); i++) {
        		
        		//JSONObject > bookDTO
        		JSONObject book = (JSONObject)list.get(i);
        		//System.out.println(book.get("title"));
        		
        		BookDTO dto = new BookDTO();
        		
        		dto.setTitle(book.get("title").toString());
        		dto.setLink(book.get("link").toString());
        		dto.setImage(book.get("image").toString());
        		dto.setAuthor(book.get("author").toString());
        		dto.setDiscount(book.get("discount").toString());
        		dto.setPublisher(book.get("publisher").toString());
        		dto.setPubdate(book.get("pubdate").toString());
        		dto.setIsbn(book.get("isbn").toString());
        		dto.setDescription(book.get("description").toString());
        		
        		//돌려줄 ArrayList
        		result.add(dto);
        		
        	}
        	
        	map.put("result", result);
        	map.put("total", root.get("total").toString());
        	
        	return map;
        	
		} catch (Exception e) {
			System.out.println("BookDAO.search");
			e.printStackTrace();
		}
        
		return null;
	}
	
	
	   private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }


	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else { // 오류 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }


	    private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }


	    private static String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);


	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();


	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }


	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
	        }
	    }

}
