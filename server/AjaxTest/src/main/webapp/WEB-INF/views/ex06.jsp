<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
	<!-- ex06.jsp -->
	<h1>Ajax 응답 데이터(형식에 따라 분류)</h1>
	
	<h2>Text</h2>
	<div>
		<input type="button" value="확인" id="btn1">
		<div class="message" id="div1"></div>
	</div>
	
	<h2>XML</h2>
	<div>
		<input type="button" value="확인" id="btn2">
		<div class="message" id="div2"></div>
	</div>
	
	<h2>JSON(***)</h2>
	<div>
		<input type="button" value="확인" id="btn3">
		<div class="message" id="div3"></div>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
		/* 
	
			$.ajax() 함수
			
			$.ajax({
				type: 'GET',				//메소드 방식
				url: '/ex01.do',			//서버측 URL
				async: true,				//동기(false), 비동기(true)
				data: 'key=value&key=value',//전송할 데이터
				dataType: 'text',		//응답 데이터 타입(text,xml,json)
				success: function(result) {
					console.log(result);	//응답 데이터
				},
				error: function(a,b,c) {
					console.log(a,b,c);		//예외 처리
				}
			});		
		
		*/
	
		/*
		$('#btn1').click(() => {
			$.ajax({
				type: 'GET',
				url: '/ajax/ex06data.do',
				data: 'type=1',
				
				
				//서버로부터 응답 받는 데이터의 형식(text, xml, json)
				dataType: 'text',
				
				success: function(result) {
					$('#div1').text(result);
				},
				error: function(a,b,c) {
					console.log(a,b,c)
				}
			});
		});
		*/
		
		$('#btn1').click(() => {
			$.ajax({
				type: 'GET',
				url: '/ajax/ex06data.do',
				data: 'type=2',
				
				
				//서버로부터 응답 받는 데이터의 형식(text, xml, json)
				dataType: 'text',
				
				success: function(result) {
					//$('#div1').text(result);
					
					const users = result.trim().split('\r\n');
					
					users.forEach(user => {
						//alert(user);
						const info = user.split(',');
						$('#div1').append(
							`
								<ul>
									<li>아이디: \${info[0]}</li>
									<li>암호: \${info[1]}</li>
									<li>이름: \${info[2]}</li>
									<li>등급: \${info[3]}</li>
								</ul>
								<hr>
							`
						);
					});
				},
				error: function(a,b,c) {
					console.log(a,b,c)
				}
			});
		});
		
		/*
		$('#btn2').click(() => {
			
			$.ajax({
				type: 'GET',
				url: '/ajax/ex06data.do',
				data: 'type=3',
				dataType: 'xml',
				success: function(result){
					//alert(result);
					//$(result).find('question');
					//alert($(result).find('#q1').text());
					$('#div2').text($(result).find('#q1').text());
				},
				error: function(a,b,c) {
					console.log(a,b,c)
				}
			});
		});
		*/
		
		$('#btn2').click(()=>{
			
			$.ajax({
				type: 'GET',
				url: '/ajax/ex06data.do',
				data: 'type=4',
				dataType: 'xml',
				success: function(result) {
					$(result).find('user').each((index, user)=>{
						
						$('#div2').append(
							`
								<ul>
									<li>아이디: \${$(user).find('id').text()}</li>
									<li>암호: \${$(user).find('pw').text()}</li>
									<li>이름: \${$(user).find('name').text()}</li>
									<li>등급: \${$(user).find('lv').text()}</li>
								</ul>
								<hr>
							`
						);						
					});
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		});
		
		/*
		$('#btn3').click(() => {
			$.ajax({
				type: 'GET',
				url: '/ajax/ex06data.do',
				data: 'type=5',
				dataType: 'json',
				success: function(result) {
					
					//result = {"qustion": 가장 자신있는 프로그래밍 언어는?};
					//alert(result.question);
					$('#div3').text(result.question);
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}	
			});
		});
		*/
		
		$('#btn3').click(() => {
			$.ajax({
				type: 'GET',
				url: '/ajax/ex06data.do',
				data: 'type=6',
				dataType: 'json',
				success: function(result) {
					
					console.log(result);
					
					$(result).each((index, user) => {
						//alert(user.name);	
						
						$('#div3').append(
							`
								<ul>
									<li>아이디: \${user.id}</li>
									<li>암호: \${user.pw}</li>
									<li>이름: \${user.name}</li>
									<li>등급: \${user.lv}</li>
								</ul>
								<hr>
							`
						);	
					});
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}	
			});
		});
	
	</script>
</body>
</html>