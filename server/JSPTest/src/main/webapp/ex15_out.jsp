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
	<!-- ex15_out.jsp -->
	
	<%
		int dan = 5;
	%>
	
	<h1>구구단</h1>
	
	<h2>스크립틀릿 + 표현식</h2>
	<% for (int i=1; i<=9; i++) { %>
	<div><%= dan %> x <%= i %> = <%= dan * i %></div>
	<% } %>
		
		
	<h2>스크립틀릿 + out </h2>
	<%
		for (int i=1; i<=9; i++) {
			out.println(String.format("<div>%d x %d = %d</div>", dan, i, dan * i));
		}
	%>
	
	


	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>