<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "홍길동";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- ex03.jsp -->
	<h1>제목</h1>
	
	<p>내용</p>
	<p>내용</p>
	<p>내용</p>
	<p>내용</p>
	<p>내용</p>
	
	<div>이름: <%= name %></div>
	
	<p>내용</p>
	<p>내용</p>
	<p>내용</p>
	
	<%@ include file="./inc/copyright.jsp" %>
	
</body>
</html>