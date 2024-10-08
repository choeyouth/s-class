<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<script src="https://kit.fontawesome.com/7121714adf.js"></script>
	<style>

	</style>
</head>
<body>
	<!-- ex11_form.jsp -->
	<h1>버튼 만들기</h1>
	
	<form method="POST" action="ex11_ok.jsp">
		<table class="vertical">
			<tr>
				<th>너비(px)</th>
				<td>
					<input type="number" min="20" max="300" step="10" value="120" name="width">
				</td>
			</tr>
			<tr>
				<th>높이(px)</th>
				<td>
					<input type="number" min="10" max="200" step="10" value="30" name="height">
				</td>
			</tr>
			<tr>
				<th>텍스트</th>
				<td>
					<input type="text" name="txt" value="Button">
				</td>
			</tr>
			<tr>
				<th>배경색</th>
				<td>
					<input type="color" name="bgcolor" value="#FFFFFF">
				</td>
			</tr>
			<tr>
				<th>글자색</th>
				<td>
					<input type="color" name="fontcolor" value="#000000">
				</td>
			</tr>
			<tr>
				<th>글자 크기(px)</th>
				<td>
					<input type="number" min="10" max="100" step="1" value="16" name="fontsize">
				</td>
			</tr>
			<tr>
				<th>버튼 개수(ea)</th>
				<td>
					<input type="number" min="1" max="30" step="1" value="1" name="buttoncount">
				</td>
			</tr>
			<tr>
				<th>버튼 간격</th>
				<td>
					<div>좌우 간격 : <input type="range" name="widthrange" value="0" max="50" min="0"></div>
					<div>상하 간격 : <input type="range" name="heightrange" value="0" max="50" min="0"></div>	
				</td>
			</tr>
			<tr>
				<th>아이콘</th>
				<td>
					<label><input type="radio" name="rd" value="" checked> 없음</label>
					<label><input type="radio" name="rd" value=""> <i class="fa-solid fa-house"></i></label>
					<label><input type="radio" name="rd" value=""> <i class="fa-solid fa-image"></i></label>
					<label><input type="radio" name="rd" value=""> <i class="fa-solid fa-location-dot"></i></label>
					<label><input type="radio" name="rd" value=""> <i class="fa-brands fa-github"></i></label>
					<label><input type="radio" name="rd" value=""> <i class="fa-solid fa-paperclip"></i></label>
				</td>
			</tr>
			<tr>
				<th>테두리</th>
				<td>
					<select name="sel1">
						<div><option value="a1">감추기</option></div>
						<div><option value="a2">보이기</option></div>
					</select>
				</td>
			</tr>
		</table>
		
		<input type="submit" value="만들기" name="sb">
	</form>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>