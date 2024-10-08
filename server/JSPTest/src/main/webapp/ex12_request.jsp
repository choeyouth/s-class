<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- ex12_request.jsp -->
	<h1>요청 시 발생 정보들</h1>
	
	<p>요청 URL: <%= request.getRequestURL() %></p> <!-- 요청 URL: http://localhost:8090/jsp/ex12_request.jsp -->
	<p>요청 서버 도메인: <%= request.getServerName() %></p> <!-- 요청 서버 도메인: localhost -->
	<p>요청 서버 포트: <%= request.getServerPort() %></p><!-- 요청 서버 포트: 8090 -->
	<p>쿼리 문자열: <%= request.getQueryString() %></p>
	<p>요청 메소드 방식: <%= request.getMethod() %></p><!-- 요청 메소드 방식: GET -->
	<p>컨텍스트 경로: <%= request.getContextPath() %></p><!-- 컨텍스트 경로: /jsp -->
	
	
	<div>
		<a href="ex11_form.jsp">11번 문제</a>
		<a href="/<%= request.getContextPath() %>/ex11_form.jsp">11번 문제</a>
	</div>
	
	<p>클라이언트 주소: <%= request.getRemoteAddr() %></p>
	<p>클라이언트: <%= request.getHeaders("") %></p>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>