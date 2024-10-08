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
	<!-- ex19_form.jsp -->
	<h1>파일 업로드(파일 전송)</h1>

	<!-- 
	
		파일 업로드 설정(클라이언트)
		1. <form method="POST"> 
			- 제한 용량이 없는 POST 타입
			- GET 방식 > 제한 용량을 넘는 경우가 많기 때문에 파일이 잘려서 보내짐
		2. <input type="file">
		3. <form enctype="">
			a. application/x-www-from-urlencoded
				- 폼으로 전송하는 데이터를 문자열로 보내겠다.
			b. multipart/form-data
				- 문자열 + 비문자열 동시에 보내겠다.
	
	 -->
	
	<form method="POST" action="ex19_ok.jsp" enctype="multipart/form-data">
	<table class="vertical">
		<tr>
			<th>문자</th>
			<td><input type="text" name="txt" value="홍길동"></td>
		</tr>
		<tr>
			<th>숫자</th>
			<td><input type="number" name="num" value="100"></td>
		</tr>
		<tr>
			<th>파일</th>
			<td><input type="file" name="attach"></td>
		</tr>
	</table>
	<div>
		<button>보내기</button>
	</div>
	</form>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>