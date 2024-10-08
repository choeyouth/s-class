<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");

	String path = application.getRealPath("/files");
	
	int size = 1024 * 1024 * 100;
	
	
	String filename = "";		
	//String orgfilename = "";
	
	try {
		
		MultipartRequest multi = new MultipartRequest(
									request, 	
									path,		
									size,		
									"UTF-8",	
									new DefaultFileRenamePolicy()
								); 
		
	} catch (Exception e) {
		System.out.println(e);
	}
	
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
	<!-- ex22_ok.jsp -->
	
</body>
</html>



















