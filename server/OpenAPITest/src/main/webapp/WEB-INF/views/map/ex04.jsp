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
	<!-- ex04.jsp -->
	<h1>Kakao Map</h1>
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
	
		//지도 생성 및 객체 리턴
		var map = new kakao.maps.Map(container, options); 
	
		<c:forEach items="${list}" var="dto" varStatus="status">
		const m${status.count} = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(${dto.lat}, ${dto.lng})
		});
		m${status.count}.setMap(map);
		</c:forEach>
	
		//DB > Servlet > JSP > 마커 표시에 사용
		//DB > Servlet > JSP > JavaScript에서 사용
		const mlist = [];
		let mcount = 0; //지도 상에 보이는 마커 개수 > 누적 변수
		
		<c:forEach items="${list}" var="dto">
		mlist.push({
			seq: ${dto.seq},
			lat: ${dto.lat},
			lng: ${dto.lng}
		});
		</c:forEach>
		
		//지도 이벤트(줌인/줌아웃)
		kakao.maps.event.addListener(map, 'zoom_changed', function(evt) {
			//alert();
			countMarker();
		});
		
		//지도 이벤트(패닝)
		kakao.maps.event.addList(map, 'dragend', function(evt) {
			countMarker();
		});
			
		
		//지도에 보이는 마커 개수 세기
		function countMarker() {
			
			mcount = 0;
			
			$(mlist).each((index, item) => {
				if (contains(item)) {
					mcount++;
				}
			});
			
			$('.message').text('출력된 마커 개수: ' + mcount + '개');
			
		}
		
		function contains(item) {
			
			//현재 맵 안에 itme(좌표)가 포함되었는지?
			const sw = map.getBounds().getSouthWest();
			const ne = map.getBounds().getNorthEast();
			
			if (item.lat >= sw.getLat()
			 && item.lat <= ne.getLat()
			 && item.lng >= sw.getLng()
			 && item.lng <= ne.getLng()) {
				return true;				
			}
			
			return false;
		}
		
	</script>
</body>
</html>