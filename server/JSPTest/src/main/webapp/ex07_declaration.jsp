<%@page import="com.test.java.MyMath"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	
	//변수의 종류? 
	int a = 10; //지역 변수
	
	/*
	//불가능 (메서드 안에 메서드)
	public int sum(int a, int b) {
		return a + b;
	}
	*/

%>
<%!
	//멤버 변수
	int c = 30;	

	//멤버 메소드 > 현재 JSP 페이지 외부에서 사용 불가능
	public int sum(int a, int b) {
		return a + b;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<%
		System.out.println(a);
		int b = 20; //a와 같은 영역 내의 지역 변수(_jspService 메소드)
	%>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>

	</style>
</head>
<body>
	<!-- ex07_declaration.jsp -->
	<h1>연산 결과</h1>
	<div>a + b = <%= sum(a, b) %></div>
	
	<%
		MyMath m = new MyMath();
	%>
	
	<div>a + b = <%= m.sum(a, b) %></div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>