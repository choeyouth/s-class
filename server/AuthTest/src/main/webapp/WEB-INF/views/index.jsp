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
	<!-- index.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	<div>
		<h2>시작 페이지</h2>
		
		<c:if test="${not empty auth}">
		<div class="message short" title="개인 정보">
			<div>아이디: ${auth}</div>
			<div>이름: ${name}</div>
			<div>등급: ${lv == 1 ? "일반회원" : "관리자"}</div>
		</div>
		</c:if>
		
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>