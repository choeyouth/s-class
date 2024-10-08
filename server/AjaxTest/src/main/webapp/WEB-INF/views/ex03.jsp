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
	<!-- ex03.jsp -->
	<h1>Ajax</h1>
	
	<!-- 
		1. 버튼을 클릭
		2. 서버에게 데이터를 주세요~
		3. 응답된 데이터를 화면에 출력
	 -->
	 <form action="/ajax/ex03data.do">
	 	<div><a href="/ajax/ex03data.do">가져오기</a></div>
	 	<div><input type="submit" value="가져오기"></div>
	 	<div><input type="button" value="가져오기" id="btn1"></div>
	 	<hr>
	 	<div class="message">${data}</div>
	 </form>
	 <hr>
	 <div>
	 	다른 업무: <input type="text">
	 </div>	 
	 
	 
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
		$('#btn1').click(() => {
			
			//Ajax 객체 (통신 도구) > 데이터 만을 주고 받는 별도의 서버 폼
			//서버와 통신할 수 있는 자바스크립트 객체
			const ajax = new XMLHttpRequest();
			//alert(ajax.readtState); //0
			
			// readyState: ajax 객체의 상태를 표현하는 값
			//on + readystate change 
			ajax.onreadystatechange = function() {
				//console.log(111);
				//$('.message').append('aa');
				//$('.message').append(`<div>\${ajax.readyState}</div>`);
				//$('.message').append(`<div>\${ajax.status}</div>}`);
				//return;
				
				// 이벤트 형식? 
				if (ajax.readyState == 4 && ajax.status != 500) {
					//서버에 요청한 응답이 돌아오는 시점 
					
					//서버가 ajax 객체에게 돌려준 데이터
					$('.message').text(ajax.responseText);
				}
			};
			
			//           통신 방법         누구랑 통신
			//<form method="GET" action='/ajax/data.txt'>
			//ajax.open('GET', '/ajax/data.txt'); //연결(X), 설정(O)
			ajax.open('GET', '/ajax/ex03data.do'); 
			
			//<input type="submit"> 클릭
			ajax.send(); //실제로 ajax 객체가 서버에 연결

		});
	
	</script>
</body>
</html>

















































