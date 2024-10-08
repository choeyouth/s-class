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
		table td:nth-child(1) { width: 120px; text-align: center; }
		table td:nth-child(2) div { margin-bottom: 5px; }
		table img { width: 110px; }
	</style>
</head>
<body>
	<!-- ex01.jsp -->
	<h1 class="main">Naver Book <small>search</small></h1>
	
	<form method="GET" action="/api/ex01.do">
	<div class="message">
		<div class="group">
			<label>검색어	</label>
			<input type="text" name="word" class="long" required value="${word}">
			&nbsp;
			<input type="submit" value="검색하기">
			<input type="button" value="초기화" onclick="location.href='/api/ex01.do';">
			&nbsp;
			<select name="count" id="count">
				<option value="5">5개씩 보기</option>
				<option value="10" selected>10개씩 보기</option>
				<option value="20">20개씩 보기</option>
				<option value="100">100개씩 보기</option>
			</select>
		</div>	
	</div>
	
	<div>
		<input type="button" value="이전 ${count}개"	id="btnPrev">
		<input type="button" value="다음 ${count}개"	id="btnNext">
	</div>
	<input type="hidden" name="start" id="start">
	</form>	
	
	<table>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td><img src="${dto.image}"></td>
			<td>
				<div>${dto.title}</div>
				<div>${dto.author}</div>
				<div>${dto.discount}</div>
				<div>${dto.publisher}</div>
			</td>
		</tr>
		</c:forEach>
	</table>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
		$('#count').val(${count});

		$('#count').change(()=>{
			$('input[type=submit]').click();
		});
		
		$('#btnPrev').click(()=>{
			let start = parseInt($('#start').val()) - parseInt($('#count').val());
	
			if (start < 1) return;
			
			$('#start').val(start);
			$('input[type=submit]').click();
		});
		
		$('#btnNext').click(()=>{
			//console.log(typeof $('#start').val()); //String
			//console.log(typeof $('#count').val()); //String
			/*  == $('#start').val() + ${count}; */
			let start = parseInt($('#start').val()) + parseInt($('#count').val());
			
			<c:if test="${not empty word}">
			if (start >= ${total}) return;
			</c:if>
			
			$('#start').val(start);
			$('input[type=submit]').click();
		});

		<c:if test='${empty start}'>
		$('#start').val(1);
		</c:if>
		
		<c:if test='${not empty start}'>
		$('#start').val(${start});
		</c:if>		
		
	</script>
</body>
</html>