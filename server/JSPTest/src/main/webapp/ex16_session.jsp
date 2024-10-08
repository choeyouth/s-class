<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	/* 
	
		session 객체
		
		- 유저가 사이트에 접속할 때 생성(톰캣)
		- 개인에게 종속된 객체(다른 유저가 접근 불가능)
		- 페이지 이동 시에도 지참 
		- 유저가 사이트에서 나갈 때 소멸
		- (사이트 모든 페이지) 전역 변수
	
	*/
	
	
	
	session.setAttribute("a", 10);
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
	<!-- ex16_ssesion.jsp -->
	<h1>Session</h1>
	
	<div>a: <%= session.getAttribute("a") %></div>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>