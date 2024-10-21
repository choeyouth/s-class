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
		
		.main {
			display: grid;
			grid-template-columns: repeat(3, 1fr);
		}
		
		.main .item {
			width: auto;
			border: 1px solid #AAA;
			margin: 10px;
			cursor: pointer;
		}
		
		.main .item div:nth-child(1) {
			padding: .5rem;
			padding-left: 1rem;
		}
		
		.main .item div:nth-child(2) {
			min-height: 120px;
			display: flex;
			justify-content: center;
			align-items: center;
			border-top: 1px solid #AAA;
			border-bottom: 1px solid #AAA;
		}
		
		.main .item div:nth-child(3) {
			padding: .5rem;
			font-size: 14px;
			text-align: right;
		}
		
	</style>
</head>
<body>
	<!-- list.jsp -->
	<h1>Code <small>목록</small></h1>
	
	<div class="main">
		<c:forEach items="${list}" var="dto">
		<div class="item" onclick="location.href='/code/view.do?seq=${dto.seq}';">
			
			<c:choose>
				<c:when test="${dto.language == 'java'}">
					<c:set var="color" value="tomato"/>
				</c:when>
				<c:when test="${dto.language == 'sql'}">
					<c:set var="color" value="gold"/>
				</c:when>
				<c:when test="${dto.language == 'html'}">
					<c:set var="color" value="cornflowerblue"/>
				</c:when>
			</c:choose>
			
			<div style="background-color: ${color};">${dto.language}</div>
			<div>${dto.subject}</div>
			<div>${dto.regdate}</div>			
		</div>
		</c:forEach>
	</div>
	<div>
		<button type="button" class="add" onclick="location.href='/code/add.do';">쓰기</button>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>
</body>
</html>





