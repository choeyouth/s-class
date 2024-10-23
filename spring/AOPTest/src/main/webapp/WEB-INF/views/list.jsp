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
	<!-- list.jsp -->
	<h1>목록</h1>
	
	<table>
		<tr>
			<th>이름</th>
			<th>나이</th>
			<th>색깔</th>
		</tr>
		<c:forEach items="${list}" var="dto">
		<tr onclick="location.href='/aop/view.do?name=${dto.name}';">
			<td>${dto.name}</td>
			<td>${dto.age}</td>
			<td>${dto.color}</td>
		</tr>
		</c:forEach>
	</table>
	<div>
		<input type="button" value="추가하기"
			onclick="location.href='/aop/add.do';">
			
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>





