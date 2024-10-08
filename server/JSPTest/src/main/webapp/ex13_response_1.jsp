<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	/* 
	
		첫 번째 페이지 > (이동) > 두 번째 페이지
		
		1. HTML
		- <a href="URL">
		- 사용자의 클릭 > 사용자 의지
		- 클라이언트 측 구현
		
		2. JavaScript
		- location.href = 'URL'
		- 개발자의 코드 작성 > 자유롭게 통제 가능
		- 클라이언트 측 구현 
		
		3. Servlet/JSP
		- response.sendRedirect("URL")
		- 개발자의 코드 작성 > 자유롭게 통제 가능
		- 서버측 구현
		
	*/
	
	System.out.println("시작");
	response.sendRedirect("ex13_response_2.jsp");
	System.out.println("끝");
	
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
	<!--  -->
	<h1>첫번째 페이지</h1>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
		console.log('시작');
		location href = 'ex13_response_2.jsp'
		console.log('끝');
		
	</script>
</body>
</html>
<%
	System.out.println("바닥");
%>