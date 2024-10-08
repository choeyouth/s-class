<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>결과</h1>
	<div>
		전달받은 나이: <%= request.getParameter("age") %>
	</div>	
	<div>
		txt1: <%= request.getParameter("txt1") %>
	</div>	
</body>
</html>














