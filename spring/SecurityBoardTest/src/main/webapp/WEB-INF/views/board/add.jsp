<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
   
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
	<!-- add.jsp -->
	<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	
	<h2>Board <small>add</small></h2>

	<form method="POST" action="/spring/board/addok.do">
	<table class="vertical">
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" required class="full"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" required class="full"></textarea></td>
		</tr>
	</table>
	<div>
		<button>글쓰기</button>
	</div>
	<!-- 토큰이 없는 채로 addok(POST)로 이동하면 403 에러 > 쫓겨남 -->
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<!-- pk 없음 -->
	<input type="hidden" name="memberid" value="<sec:authentication property="principal.username"/>">
	</form>	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>





