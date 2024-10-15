<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/toy/asset/css/tagify.css">
	<%@include file="/WEB-INF/views/inc/asset.jsp" %>
	
	<style>

	</style>
</head>
<body>
	<!-- view.jsp -->
	<%@include file="/WEB-INF/views/inc/header.jsp" %>

	<div id="main">
		<h1 class="page">게시판 <small>상세보기</small></h1>
		
		<table class="vertical" id="view">
			<tr>
				<th>번호</th>
				<td>${dto.seq}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${dto.name}(${dto.id})</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${dto.subject}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${dto.content}</td>
			</tr> 
			<c:if test="${not empty dto.attach}">
			<tr>
				<th>장소</th>
				<td><img src="/toy/asset/place/${dto.attach}" id="imgPlace"></td>
			</tr>
			<c:if test="${not empty lat}">
			<tr>
				<th>위치</th>
				<td><div id="map"></div></td>
			</tr>
			</c:if>
			</c:if>
			<tr>
				<th>날짜</th>
				<td>${dto.regdate}</td>
			</tr>
			<tr>
				<th>읽음</th>
				<td>${dto.readcount}</td>
			</tr>
			<tr>
				<th>좋아요/싫어요</th>
				<td>
					<div id="goodbad">
						<span class="material-symbols-outlined" id="btnGood" data-seq="${dto.seq}">thumb_up</span>
						<span id="good">0</span>
						<span class="material-symbols-outlined" id="btnBad" data-seq="${dto.seq}">thumb_down</span>
						<span id="bad">0</span>
					</div>
				</td>
			</tr>
			<tr>
				<th>태그</th>
				<td><input type="text" id="tag" class="full" readonly></td>
			</tr>
		</table>
		
		
		<!-- 댓글 보기  -->
		<table id="comment">
			<tbody></tbody>
			<!-- <tr>	
				<td>
					<div>댓글 내용입니다.</div>
					<div>2024-10-11 14:10:05</div>
				</td>
				<td>
					<div>
						<div>홍길동(hong)</div>
						<div>
							<span class="material-symbols-outlined">delete</span>
							<span class="material-symbols-outlined">edit_note</span>
						</div>
					</div>
				</td>
			</tr> -->
			
		</table>
		
		
		<!-- 댓글 쓰기 -->
		<c:if test="${not empty auth}">
		<form id="addCommentForm" onsubmit="return false;">
		<table id="addComment">
			<tr>	
				<td><input type="text" name="content" class="full"></td>
				<td><button type="button" class="comment" id="btnAddComment">댓글 쓰기</button></td>
			</tr>
		</table>
		</form>
		</c:if>
		
		
		<div>
			<button type="button" class="back" onclick="location.href='/toy/board/list.do?word=${word}&column=${column}&page=${page}';">돌아가기</button>
			
			<!-- <button type="button" class="back" 
					onclick="history.back();">돌아가기</button> -->
			
			<c:if test="${not empty auth && (dto.id == auth || lv == '2')}">
			<button type="button" class="edit" onclick="location.href='/toy/board/edit.do?seq=${dto.seq}&word=${word}&column=${column}';">수정하기</button>
			<button type="button" class="del" onclick="location.href='/toy/board/del.do?seq=${dto.seq}';">삭제하기</button>
			</c:if>	
			<button type="button" class="reply" onclick="location.href='/toy/board/add.do?mode=reply&thread=${dto.thread}&depth=${dto.depth}';">답변하기</button>
					
		</div>
	</div>
	
	<script src="/toy/asset/js/tagify.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b110087c83f1727854d20ad1daf02f30"></script>	
	<script>
	
		const lv = ${empty lv ? 0 : lv};
		const auth = '${auth}';
		const seq = ${dto.seq};
	
		<c:if test="${not empty lat}">
		//지도를 담을 영역의 DOM 레퍼런스
		var container = document.getElementById('map');
		
		//지도를 생성할 때 필요한 기본 옵션
		var options = { 
			center: new kakao.maps.LatLng(${lat}, ${lng}), 
			level: 3
		};
	
		var map = new kakao.maps.Map(container, options); 
		
		const path = '/toy/asset/place/studio.png';
		const size = new kakao.maps.Size(64, 64);
		const op = {
			offset: new kakao.maps.Point(32, 64)
		};
		
		const mImg = new kakao.maps.MarkerImage(path, size, op);			
		
		const m1 = new kakao.maps.Marker({
			position: new kakao.maps.LatLng(${lat}, ${lng})
		});
		
		m1.setImage(mImg);
		m1.setMap(map);
		</c:if>
		
		document.getElementById('tag').value = '${dto.tag.toString().substring(1,dto.tag.toString().length()-1)}';
		new Tagify(document.getElementById('tag'));
		
		const tagify = new Tagify(document.getElementById('tag'));
		
		tagify.on('click', (e) => {
			//alert(e.detail.data.value);
			location.href = '/toy/board/list.do?tag=' + e.detail.data.value;
		
		});
		 
	</script>
</body>
</html>