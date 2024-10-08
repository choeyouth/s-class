<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@include file="/WEB-INF/views/inc/asset.jsp" %>
	
	<style>

	</style>
</head>
<body>
	<!-- unregister.jsp -->
	<%@include file="/WEB-INF/views/inc/header.jsp" %>

	<div id="main">
		<h1>회원 <small>탈퇴하기</small></h1>
		
		<form method="POST" action="/toy/user/unregister.do">
		<div>
			회원 탈퇴를 진행하겠습니까?
		</div>
		<div>
			<button type="button" class="back" onclick="location.href='/toy/index.do'">돌아가기</button>
			<button type="submit" class="in primary">탈퇴하기</button>
		</div>
		</form>
	</div>

	<script>
	
	</script>
</body>
</html>