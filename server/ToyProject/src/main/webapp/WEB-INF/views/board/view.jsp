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
			<tr>
				<th>날짜</th>
				<td>${dto.regdate}</td>
			</tr>
			<tr>
				<th>읽음</th>
				<td>${dto.readcount}</td>
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
			<button type="button" class="reply">답변하기</button>
			</c:if>			
		</div>
	</div>

	<script>
	
		const lv = ${empty lv ? 0 : lv};
		const auth = '${auth}';
		
	</script>
</body>
</html>