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
	<!-- customlogout.jsp -->
	
	<%@ include file="/WEB-INF/views/inc/menu.jsp" %>
	
	<h2>Custom Logout Page</h2>
	
	<form method="POST" action="/security/customlogout.do">
	<div>
		<button class="out">로그아웃</button>
	</div>
	<!-- 24. CSRF 토큰 -->
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>





