<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@include file="/WEB-INF/views/inc/asset.jsp" %>
	
	<style>

	</style>
</head>
<body>
	<!-- list.jsp -->
	<%@include file="/WEB-INF/views/inc/header.jsp" %>

	<div id="main">
		<h1 class="page">
			게시판 
			<c:if test="${map.search == 'n'}">
			<small>목록보기</small>
			</c:if>
			<c:if test="${map.search == 'y'}">
			<small>검색하기</small>
			</c:if>
		</h1>
		
		<c:if test="${map.search == 'y'}">
		<div id="labelSearchResult">
			'${map.word}'(으)로 검색한 결과 ${totalCount}개의 게시물이 있습니다.
		</div>
		</c:if>
 		
<%--		<div id="pagebar">
			<input type="number" class="shor" id="page" value="${nowPage}" min="1" max="${totalPage}">
			<input type="button" value="이동하기" onclick="location.href='/toy/board/list.do?page=' + $('#page').val();">
		</div> --%>
<%-- 		<div id="pagebar">
			<select onchange="location.href='/toy/board/list.do?page=' + $(this).val();">
				<c:forEach var="i" begin="1" end="${totalPage}">
				<option value="${i}"   <c:if test="${i == nowPage}">selected</c:if>   >${i}페이지</option>
				</c:forEach>
			</select>
		</div> --%>
		
		<table id="list">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>날짜</th>
				<th>읽음</th>
			</tr>
			<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.seq}</td>
				<td>
					<a href="/toy/board/view.do?seq=${dto.seq}&word=${map.word}&column=${map.column}&page=${nowPage}">${dto.subject}</a>
					<c:if test="${dto.isnew < 1}">
					<span class="isnew">new</span>
					</c:if>
				</td>
				<td>${dto.name}</td>
				<td>${dto.regtime}</td>
				<td>${dto.readcount}</td>
			</tr>
			</c:forEach>
			<c:if test="${empty list or list.size() == 0}">
			<tr>
				<td colspan="5">게시물이 없습니다.</td>
			</tr>
			</c:if>
		</table>
		
		<!-- 검색 인터페이스 --> 
		<form id="searchForm" method="GET" action="/toy/board/list.do">
			<select name="column">
				<option value="subject">제목</option>
				<option value="content">내용</option>
				<option value="name">이름</option>
				<option value="all">제목/내용/이름</option>
				<!-- 검색의 정확도 증가, DB(오라클) 부담 감소 -->
			</select>
			<input type="text" name="word" class="long" required value="${map.word}">
			<input type="submit" value="검색하기">
		</form>
		
		<!-- 페이지바 -->
		<div id="pagebar">${pagebar}</div>
		
		<div>
			<c:if test="${not empty auth}">
			<button type="button" class="add primary" onclick="location.href='/toy/board/add.do';">쓰기</button>
			</c:if>
		</div>
	</div>
			
	<script>
		
		<c:if test="${map.search == 'y'}">
		$('#searchForm select[name=column]').val('${map.column}');
		$('#searchForm select[name=word]').val('${map.word}');
		</c:if>
		
	</script>
</body>
</html>