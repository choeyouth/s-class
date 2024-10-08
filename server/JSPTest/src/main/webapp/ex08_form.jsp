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
	<!-- ex08_form.jsp -->
	
	<h1>(모든 방식으로) 데이터 전송하기</h1>
	
	<h2>폼태그 + POST 방식으로 보내기</h2>
	<form method="POST" action="ex08_ok.jsp">
		<div>이름: <input type="text" name="name"></div>
		<div>나이: <input type="text" name="age"></div>
		<div><input type="submit" value="보내기" ></div>
	</form>
	
	<h2>폼태그 없이 GET 방식으로 보내기</h2>
	<div>
		<a href="ex08_ok.jsp?name=강아지&age=3">페이지 이동하기</a>
	</div>
	<div>
		<a href="ex08_ok.jsp?" id="a1">페이지 이동하기</a>
	</div>
	<div>
		<input type="submit" value="보내기" id="btn1">
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		let name = '고양이';
		let age = 2;
		
		$('#a1').attr('href', $('#a1').attr('href') + '?name=' + name + '&age=' + age);
		$('#btn1').click(() => {
			location.href = 'ex08_ok.jsp?name=거북이&age=100';
		})
	</script>
</body>
</html>