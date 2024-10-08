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
	<!-- ex26_cookie.jsp -->
	<h1>쿠키 <small>JavaScript</small></h1>
	
	<div>
		<input type="button" value="쿠키에 데이터 쓰기" id="btn1">
		<input type="button" value="쿠키의 데이터 읽기" id="btn2">
	</div>
	
	<hr>
	
	<div>
		<a href="ex26_cookie_2.jsp">두 번째 페이지</a>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="js/cookie.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
		//console.log(setCookie);
		//console.log(getCookie);
	
		let name;
	
		$('#btn1').click(() => {
			console.log(document.cookie);
			console.log(typeof document.cookie);
			//document.cookie = '홍길동';
			//name = '아무개';
			//document.cookie = '홍길동,100,90,80';
			//document.cookie = 'name=홍길동&kor=100&eng=90&math=89'; //키=값& ...
			setCookie('name', '홍길동');
			setCookie('kor', 100);
		});
		
		$('#btn2').click(() => {
			//console.log(document.cookie);
			//console.log(name);
			console.log(getCookie('name'));
			console.log(getCookie('kor'));
		});
	
	</script>
</body>
</html>