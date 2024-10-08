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
		#map {
			width: 770px;
			height: 400px;
		}
	</style>
</head>
<body>
	<!--  -->
	<h1>Kakao Map<small>좌표 이동 or 레벨 변경</small></h1>
	<div>
		<div id="map"></div>
	</div>
	<div>
		<input type="button" value="한독 빌딩으로 이동하기" id="btn1">
		<input type="button" value="상암 경기장으로 이동하기" id="btn2">
		<input type="button" value="역삼역으로 이동하기" id="btn3">
	</div>
	<hr>
	<div>
		<input type="button" value="확대" id="btn4">
		<input type="button" value="축소" id="btn5">
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b110087c83f1727854d20ad1daf02f30"></script>	
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
		//지도를 담을 영역의 DOM 레퍼런스
		var container = document.getElementById('map');
		
		//지도를 생성할 때 필요한 기본 옵션
		var options = { 
			center: new kakao.maps.LatLng(37.499326, 127.033311), 
			level: 3
		};
	
		var map = new kakao.maps.Map(container, options); 
	
		$('#btn1').click(()=>{
			const pos = new kakao.maps.LatLng(37.499326, 127.033311);
			//map.setCenter(pos); > 순간이동
			map.panTo(pos);
			//눈에 안 보이면 순간이동, 근처에 있으면 패닝 
		});

		$('#btn2').click(()=>{
			const pos = new kakao.maps.LatLng(37.568354, 126.897266);
			//map.setCenter(pos);
			map.panTo(pos);
		});
		
		$('#btn3').click(()=>{
			const pos = new kakao.maps.LatLng(37.500415, 127.036280);
			//map.setCenter(pos);
			map.panTo(pos);
		});
	
		$('#btn4').click(()=>{
			//map.setLevel(1);
			map.setLevel(map.getLevel() - 1);
		});
		
		
		$('#btn5').click(()=>{
			//map.setLevel(14);
			map.setLevel(map.getLevel() + 1);
		});
		
		map.setDraggable(false); //위치 드래그 > 이동 불가능 
		map.setZoommable(false); //위치 휠 > 확대/축소 불가능
		
		
	</script>
</body>
</html>