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
	<!-- ex08.jsp -->
	<h1>고양이 + Ajax</h1>
	
	<!-- 
	<div><img src="images/catty01.png"></div>
	<div><img src="/ajax/WEB-INF/views/images/catty01.png"></div>
	<div><img src="/ajax/images/catty01.png"></div>
	 -->
	 
	<div><img src="/ajax/images/catty01.png" id="cat1"></div>
	 
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
		//고양이의 위치값 저장 공간
		//1. 쿠키 > 양호, 접속 위치 불편 (하나의 컴퓨터에 유지 시킬 때 양호)
		//2. 세션 > 안 좋음 (일시적으로 가능, 장기간 보관X)
		//3. DB  > 아주 양호 (비용이 비쌈)
		
		$('#cat1').draggable({
			stop: function(event, ui) {
				//alert(ui.position.left + ", " + ui.position.top);
				//alert(this.id);
				
				$.ajax({
					type: 'POST',
					url: '/ajax/ex08data.do',
					data: 'catid=' + this.id + '&left=' + ui.position.left + '&top=' + ui.position.top,
					error: function(a,b,c) {
						console.log(a,b,c);
					}
				});
			}
		});

		$('#cat1').css({
			left: '${dto.left}px',
			top: '${dto.top}px'
		});
		
	</script>
</body>
</html>