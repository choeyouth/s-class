<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

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
	<!-- ex01.jsp -->
	<h1>Ex01</h1>
	
	<!-- 
		
		request.getParameter(key) > GET 방식(num=100&txt=홍길동&..)으로 넘어온 데이터 
		request.getAttribute(key) > Collection 안에 든 것을 꺼내는 것
	
	
	 -->
	
	<div>num: <%= request.getAttribute("num") %></div>
	<div>txt: ${txt} </div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>