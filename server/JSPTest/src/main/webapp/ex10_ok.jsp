<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	request.setCharacterEncoding("UTF-8");

	String width = request.getParameter("width");
	String height = request.getParameter("height");
	String bgcolor = request.getParameter("bgcolor");
	String txt = request.getParameter("txt");
	int count = Integer.parseInt(request.getParameter("conut"));
	
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
	<!-- ex10_ok.jsp -->
	<h1>결과</h1>
	
	
	<% for (int i=0; i<count; i++) { %>
	<div style="width: <%= width %>px; height: <%= height %>px; border: 1px solid black; background-color: <%= bgcolor %>; margin: 20px"><%= txt %></div>
	
	<% } %>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>