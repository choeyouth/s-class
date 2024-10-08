<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<%@ include file="/WEB-INF/views/inc/asset.jsp" %>
	<style>
		#content .list {
			border: 0;
			display: grid;
			grid-template-columns: repeat(3, 1fr);
			gap: 10px;
		}
		#content .list .item {
			border: 1px solid #CCC;
			padding: 0;
			width: 235px;
			position: relative;
			left: 0;
			right: 0;
		}
		.item > div:nth-child(1) {
			min-height: 100px;
			padding: 15px;
			margin-bottom: 40px;
		}
		.item > div:nth-child(2) {
			font-size: 14px;
			background-color: #EEE;
			padding: 10px;
			border-top: 1px solid #CCC;
			position: absolute;
			bottom: 0;
			left: 0;
			right: 0;
		}
		#content > h2 {
			display: flex;
			justify-content: space-between;
		}
		
		#content > h2 > input {
			border: 0;
			background-color: white;
			font-size: 1.5rem;
		}
		
		.item > div:last-child {
			position: absolute;
			left: 0;
			top: 0;
			background-color: rgba(0, 0, 0, .05);
			width: 100%;
			height: 100%;
			display: none;
			justify-content: center;
			align-items: center;
			
		}
		
		.item:hover > div:last-child {
			display: flex;
		}
		
		.item > div:last-child > span {
			border: 1px solid #CCC;
			padding: 10px 20px;
			margin: 3px;
			cursor: pointer;
			background-color: #FFF;
		}
	</style>
</head>
<body>
	<!-- list.jsp -->
	<div id="main">
		<%@ include file="/WEB-INF/views/inc/header.jsp" %>
		<div id="content">
		 	<h2>
		 		메모 읽기
		 		<input type="button" value="+" onclick="location.href='/memo/add.do';">
		 	</h2>
		 	
		 	<div class="list">
		 	<c:forEach items="${list}" var="dto">
			 	<div class="item">
			 		<div>${dto.memo}</div>
			 		<div>
			 			<span>${dto.regdate}</span>
			 			<span>${dto.name}</span>
			 			<!-- <span onclick="location.href='/memo/edit.do'">[E]</span>
			 			<span onclick="location.href='/memo/del.do'">[D]</span> -->
			 		</div>
			 		<div>
						<span onclick="location.href='/memo/edit.do?seq=${dto.seq}'">Edit</span>
						<span onclick="location.href='/memo/del.do?seq=${dto.seq}'">Delete</span>			 		
			 		</div>
			 	</div>
		 	</c:forEach>
			</div>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>