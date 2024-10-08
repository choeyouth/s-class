<%@page import="com.test.java.MyMath"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>


<%

	//DB > 회원 정보 select

	ArrayList<String> names = new ArrayList<String>();

	names.add("홍길동");
	names.add("아무개");
	names.add("강아지");
	names.add("고양이");
	names.add("거북이");

%>
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
	<!-- ex06_sciptlet.jsp -->
	
	<h1>회원 정보</h1>
	
	<table class="content">
		<tr>
			<th>번호</th>
			<th>이름</th>
		</tr>
		<% for (int i=0; i<names.size(); i++) { %>
		<tr>
			<td><%= i + 1 %></td>
			<td onclick="info('<%= names.get(i) %>');"><%= names.get(i) %></td>
		</tr>
		<% } %>
	</table>
	
	<!-- 7번 예제 파일의 객체 생성 > 불가능 -->
	<% MyMath m = new MyMath(); %>
	<div>10 + 20 = <%= m.sum(10, 20) %></div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		function info(name) {
			alert('안녕하세요. ' + name + '님');
		}
	</script>
</body>
</html>