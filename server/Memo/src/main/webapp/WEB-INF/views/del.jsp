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
	<!-- add.jsp > del.jsp -->
	<div id="main">
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<div id="content">
			<h2>메모 삭제하기</h2>
			
			<form method="POST" action="/memo/delok.do">
			<table class="vertical"> 
				<tr>
					<th>암호</th>
					<td><input type="password" name="pw" required class="short"></td>
				</tr>
			</table>
			<div>
				<input type="submit" value="삭제하기">
				<input type="button" value="뒤로가기" onclick="location.href='/memo/list.do';">			
			</div>
			<input type="hidden" name="seq" value="${seq}">
			</form>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>