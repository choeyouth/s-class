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
	<!-- accesserror.jsp -->
	
	<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
	
	<h1>Access Denied Page</h1>
	
	<div>접근할 권한이 없습니다.</div>
	
	<div class="message">${auth}</div>
	
	<div class="message">${SPRING_SECURITY_403_EXCEPTION.getMessage()}</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>





