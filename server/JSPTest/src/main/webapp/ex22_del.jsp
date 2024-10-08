<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	//파일명(GET)
	
	String filename = request.getParameter("filename");

	String path = application.getRealPath("/files");
	
	File file = new File(path + "\\" + filename);
	
	file.delete();
	
	
	response.sendRedirect("ex22.jsp");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
</head>
<body>
	<!-- ex22_del.jsp -->
	
</body>
</html>



















