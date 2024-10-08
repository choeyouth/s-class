<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- ex18_interval.jsp -->
	<h1>세션 만료시간 설정하기</h1>
	<%
	
		/* 
		
			1. 로그인
			- 개인 정보 + 페이지 이동(+유지)
			- 접속 해지 > 유지 불필요 
			
			2. 장바구니
			- 개인 정보 + 페이지 이동(+유지)
			- 접속 해지 > 유지 불필요 
			
		
		*/
	
		session.setMaxInactiveInterval(30);
	%>
	
	<a href="ex18_session.jsp">돌아가기</a>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>