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
	<!-- ex05check.jsp -->
	<h1>아이디 중복검사</h1>
	
	<!-- action > 자기 자신을 부름 -->
	<form method="GET" action="/ajax/ex05check.do">
	<table>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" class="short" required value="${id}">
				<input type="submit" value="검사하기">
			</td>
		</tr>
	</table>
	<c:if test="${result == 1}">
	<div>이미 사용중인 아이디입니다.</div>
	</c:if>
	
	<c:if test="${result == 0}">		
	<div>사용 가능한 아이디입니다.</div>
	</c:if>
	<div>
		<input type="button" value="사용하기" id="btnUse" disabled>
		<input type="button" value="닫기" id="btnClose">
	</div>
	</form>


	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
		$('#btnUse').click(() => {
			$(opener.document).find('input[name=id]').val('${id}');
			$(opener.document).find('input[type=submit]').prop('disabled', false)
			window.close();
		});
		
		$('#btnClose').click(() => {
			window.close();
		});	
		
		<c:if test="${result == 0}">
		$('#btnUse').prop('disabled', false);
		</c:if>
		
	</script>
</body>
</html>