<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
	
//JSP 페이지
//- 상단 > 자바 코드
//- 하단 > HTML 코드
//이러한 스타일 > JSP Model 1

	int a = 10; 
	String name = "홍길동";
	String color = "cornflowerblue";
	String tag  = "<input type='text'>";
	String css = "color: gold;";
%>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
		h1 {
			color: <%= color %>
		}
		
		div {
			<%= css %>
		}
	</style>
</head>
<body>
	<!-- ex05_scriptlet.jsp -->
	<h1>스크립틀릿 + 표현식</h1>
	
	<div>숫자: <%= a %></div>
	<div style="background-color: <%= color %>">이름: <%= name %></div>
	<input type="button" value="버튼" id="btn1">
	<div><%= tag %></div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		$('#btn1').click(() => {
			alert('<%= name %>');
		});
	</script>
</body>
</html>