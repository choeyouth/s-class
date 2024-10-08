<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
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
		
		.item > span {
			font-size: 12px;
			background-color: #FFF;
			border-radius: 20px;
			padding: 5px;
			margin: 5px;
		}
	</style>
</head>
<body>
	<!-- ex01.jsp -->
	<h1>설문 조사</h1>
	
	<table class="content">
		<tr>
			<th>${dto.question}</th>
		</tr>
		<tr>	
			<td>${dto.item1}(${dto.cnt1})</td>
		</tr>
		<tr>	
			<td>${dto.item2}(${dto.cnt2})</td>
		</tr>
		<tr>	
			<td>${dto.item3}(${dto.cnt3})</td>
		</tr>
		<tr>	
			<td>${dto.item4}(${dto.cnt4})</td>
		</tr>
	</table>
	<hr>
	<div>
		<div class="item" id="item1">${dto.item1}<span>${dto.cnt1}</span></div>
		<div class="item" id="item2">${dto.item2}<span>${dto.cnt2}</span></div>
		<div class="item" id="item3">${dto.item3}<span>${dto.cnt3}</span></div>
		<div class="item" id="item4">${dto.item4}<span>${dto.cnt4}</span></div>
	</div>
	
	<h2>또 다른 내용</h2>
	
	<div>
		<input type="text">
		<br><br>
		<input type="checkbox">
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		$('#item1').css('width', '${dto.cnt1 * 30 + 80}px');
		$('#item2').css('width', '${dto.cnt2 * 30 + 80}px');
		$('#item3').css('width', '${dto.cnt3 * 30 + 80}px');
		$('#item4').css('width', '${dto.cnt4 * 30 + 80}px');
		
		setTimeoit(() => {
			location.reload(); //F5
		}, 5000);
		
	</script>
</body>
</html>
















