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
	<h1>Kakao Map<small>클릭 이벤트 + 마커 표시</small></h1>
	<div>
		<div id="map"></div>
	</div>
	
	<div class="message"></div>
	
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
		
		//kakao.maps.event.addListener(지도, 이벤트, 콜백함수);
		kakao.maps.event.addListener(map, 'click', function(evt) {
			//alert(evt.latLng); //클릭한 좌푯값 
			
			let msg = `클릭한 위치는 위도(\${evt.latLng.getLat()}), 경도(\${evt.latLng.getLng()})입니다.`;
			$('.message').text(msg);
			
			//마커 표시하기
			//1. 마커 객체를 생성한다.
			//2. 지도와 연결한다. 
			
			//이미지 마커
			const path = '/api/images/default.png';
			const size = new kakao.maps.Size(64, 64);
			const op = {
				offset: new kakao.maps.Point(32, 64)
			};
			
			const mImg = new kakao.maps.MarkerImage(path, size, op);			
			
			const m1 = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(evt.latLng.getLat(), evt.latLng.getLng())
			});
			
			m1.setImage(mImg);
			m1.setTitle(`\${evt.latLng.getLat()},\${evt.latLng.getLng()}`);
			m1.setMap(map);
		
		});
		
		/*
		//일반 마커 
		const home = new kakao.maps.Marker({
			position: options.center
		});
		
		home.setMap(map);
		*/
		
		//이미지 마커 
		const path = '/api/images/marker.png';
		const size = new kakao.maps.Size(64, 64);
		const op = {
			offset: new kakao.maps.Point(0, 64)
		};
		
		const mImg = new kakao.maps.MarkerImage(path, size, op);
		
		const home = new kakao.maps.Marker({
			position: options.center
		});
		
		home.setImage(mImg);
		home.setTitle('현재 위치');
		home.setMap(map);
		
		
		
	</script>
</body>
</html>