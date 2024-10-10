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
	<!-- add.jsp -->
	<%@include file="/WEB-INF/views/inc/header.jsp" %>

	<div id="main">
		<h1 class="page">게시판 <small>쓰기</small></h1>
		
		<form method="POST" action="/toy/board/add.do">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" id="subject" required class="full"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="content" class="full"></textarea></td>
			</tr>
		</table>
		<div>
			<button type="button" class="back" class="back" onclick="location.href='/toy/board/list.do';">돌아가기</button>
			<button type="submit" class="add primary">쓰기</button>
		</div>
		</form>
	</div>

	<script>
	
	</script>
</body>
</html>