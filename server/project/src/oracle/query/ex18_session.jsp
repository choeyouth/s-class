<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
		div > a { display: block; }
	</style>
</head>
<body>
	<!-- ex18_session.jsp -->
	<h1>세션</h1>
	
	<div>
		<a href="ex18_set.jsp">세션값 저장하기</a>
		<a href="ex18_del.jsp">세션값 삭제하기</a>
		<a href="ex18_reset.jsp">세션 초기화하기</a>
		<a href="ex18_interval.jsp">세션 만료시간 설정하기</a>
	</div>
	
	<h2>현재 내가 소유한 세션 객체의 정보</h2>
	<div>
		Session ID: <%= session.getId() %>
	</div>
	<div>
		Session Creation Time: 
		<%
			long tick = session.getCreationTime();
			Calendar time = Calendar.getInstance();
			time.setTimeInMillis(tick);
			out.println(String.format("%tF %tT", time, time));
		%>
	</div>
	<div>
		Session isNew: <%= session.isNew() %>
	</div>
	<div>
		Session Data: <%= session.getAttribute("data") %>
	</div>
	<div>
		Session Max Inactive Interval:
		<%= session.getMaxInactiveInterval() %>
	</div>
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>