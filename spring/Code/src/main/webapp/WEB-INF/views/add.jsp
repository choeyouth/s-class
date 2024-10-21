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
	<!--  -->
	<h1>Code <small>쓰기</small></h1>
	
	<form method="POST" action="/code/addok.do">
	<table class="vertical">
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" required class="full"></td>
		</tr>
		<tr>
			<th>코드</th>
			<td><textarea name="code" required class="full"></textarea></td>
		</tr>
		<tr>
			<th>언어</th>
			<td>
				<select name="language">
					<option value="java">JAVA</option>
					<option value="sql">SQL</option>
					<option value="html">HTML</option>
				</select>
			</td>
		</tr>
	</table>
	<div>
		<button type="button" class="back" onclick="history.back();">돌아가기</button>
		<button type="submit" class="add">쓰기</button>
	</div>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>