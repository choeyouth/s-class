<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Tiles</title>
	<tiles:insertAttribute name="asset" />
	<style>
		
	</style> 
</head>
<body>
	<!-- member.jsp : 회원 관련 페이지의 템플릿 페이지(info, history, favorite) -->
	<header>
		<tiles:insertAttribute name="main_menu" />
		<tiles:insertAttribute name="member_menu" />
	</header>
	
	<tiles:insertAttribute name="content"></tiles:insertAttribute>

	<script>
		
	</script>
</body>
</html>