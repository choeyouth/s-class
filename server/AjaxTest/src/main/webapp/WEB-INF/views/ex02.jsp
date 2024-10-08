<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<link rel="shortcut icon" href="#">
	<style>
		#item1 { background-color: tomato; }
		#item2 { background-color: gold; }
		#item3 { background-color: cornflowerblue; }
		#item4 { background-color: yellowgreen; }
		
		.item {
			margin: 10px;
			padding: 5px;
			text-align: right;
			padding-right: 15px;
			border-left: 7px solid #555;
			border-top-right-radius: 7px;
			border-bottom-right-radius: 7px;
		}
		
		.item > span:last-child {
			font-size: 12px;
			background-color: #FFF;
			border-radius: 20px;
			padding: 5px;
			margin: 5px;
		}
	</style>
</head>
<body>
	<!-- ex02.jsp -->
	<h1>설문 조사</h1>
	
	<table class="content" id="table1">
		<tr>
			<th></th>
		</tr>
		<tr>	
			<td><span></span>(<span></span>)</td>
		</tr>
		<tr>	
			<td><span></span>(<span></span>)</td>
		</tr>
		<tr>	
			<td><span></span>(<span></span>)</td>
		</tr>
		<tr>	
			<td><span></span>(<span></span>)</td>
		</tr>
	</table>
	<hr>
	<div>
		<div class="item" id="item1"><span></span><span></span></div>
		<div class="item" id="item2"><span></span><span></span></div>
		<div class="item" id="item3"><span></span><span></span></div>
		<div class="item" id="item4"><span></span><span></span></div>
	</div>
	
	<h2>또 다른 내용</h2>
	
	<div>
		<input type="text">
		<br><br>
		<input type="checkbox">
	</div>
	
	<hr>
	
	<iframe src="/ajax/ex02data.do" width="700" height="300" frameborder="1" scrolling="no" style="display: none;"></iframe>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	</script>
</body>
</html>
















