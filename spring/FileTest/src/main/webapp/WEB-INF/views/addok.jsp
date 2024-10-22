<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	<!--  -->
	<h1>결과</h1>
	
	<div class="message" title="txt">${txt}</div>
	
	<div class="message" title="file">
		<a href="/file/resources/files/${filename}" download>${filename}</a>
	</div>

	<div class="message" title="file">
		<a href="/file/download.do?filename=${filename}&orgfilename=${orgfilename}">${filename}</a>
	</div>
	
	<div class="message" title="files">
		<c:forEach items="${attach}" var="item">
		<div>${item.originalFilename}</div>
		</c:forEach>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>





