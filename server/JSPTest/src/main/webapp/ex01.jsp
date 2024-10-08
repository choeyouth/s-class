<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	/* CSS 영역 */
</style>
<body>
	<!-- ex01.jsp -->
	<!-- 
		java: web.xml에 경로 설정 필수
		jsp: 가상 주소 매핑 필요X > 바로 불러오기 가능
	 -->	

	<h1>Hello world</h1>

	<%
		// 자바 영역
		Calendar now = Calendar.getInstance();
	%>
	
	<div><%= String.format("%tT", now) %></div>
	
	<script>
	</script>
	
</body>
</html>