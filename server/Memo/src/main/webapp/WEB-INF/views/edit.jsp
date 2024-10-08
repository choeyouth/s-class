<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<style>

	</style>
</head>
<body>
	<!-- add.jsp > edit.jsp -->
	<div id="main">
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<div id="content">
			<h2>메모 수정</h2>
			
			<form method="POST" action="/memo/editok.do">
			<table class="vertical">
				<tr>
					<th>메모</th>
					<td><textarea name="memo" required class="long">${dto.memo}</textarea></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" required class="short" value="${dto.name}" readonly></td>
				</tr>
				<tr>
					<th>암호</th>
					<td><input type="password" name="pw" required class="short"> (수정 확인용)</td>
				</tr>
			</table>
			<div>
				<input type="submit" value="수정하기">
				<input type="button" value="뒤로가기" onclick="location.href='/memo/list.do';">			
			</div>
			<input type="hidden" name="seq" value="${dto.seq}"> 
			</form>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>