<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//삭제할 파일명 가져오기
	String filename = request.getParameter("filename");

	//System.out.println(filename);
	
	//파일 삭제
	String path = application.getRealPath("/pic");
	
	File file = new File(path + "/" + filename);
	file.delete();
	
	response.sendRedirect("ex21.jsp");
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style>
	
</style>
</head>
<body>
	<!-- ex21_del.jsp -->
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
		
	</script>
</body>
</html>










