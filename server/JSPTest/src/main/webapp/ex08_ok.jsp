<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 
		클라이언트 > (전송 데이터) > 서버
		- request 객체 담당
		- String request.getParameter(String key)
			- GET, POST 모두 동일하게 수신 
			
		1. GET
			- URL 뒤에 데이터를 붙여서 전송 > 편법 
			- 택배 상자 겉에 송장에 데이터를 추가해서 전송
			- ex08_ok.jsp?name=홍길동&age=20
			- 쿼리 스트링(Query String)
			- 톰캣의 인코딩 > UTF-8 (한글 깨짐X)
			
		2. POST
			- 패킷 본문(body) 안에 넣어서 전송 > 정석
			- 택배 상자 안에 데이터를 넣어서 전송
			- ex08_ok.jsp
			- 웹에서 데이터를 송수신 기본 인코딩 > ISO-8859-1 (톰캣: UTF-8 > 한글 깨짐)
			- ISO-8859-1 > (변환) > UTF-8
			
	*/
	
	// 클라이언트 > (데이터 인코딩) > 서버 
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String age = request.getParameter("age");

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>

	</style>
</head>
<body>
	<!-- ex08_ok.jsp -->
	<h1>결과</h1>
	
	<div>이름: <%= name %></div>
	<div>나이: <%= age %></div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>



















