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
	<!-- main.jsp -->
	<h1>유저 <small>CSR</small></h1>
	
	<table id="list">
		<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
		</tr>
		</thead>
		<tbody>
		<!-- 
		<tr>
			<td></td>
			<td></td>
			<td></td>
		</tr>
		-->
		</tbody>
	</table>
	<hr>
	<form id="form1">
	<table class="vertical">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id" id="id" class="short"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" id="name" class="short"></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><input type="text" name="gender" id="gender" class="short"></td>
		</tr>
	</table>
	<div>
		<button type="button" id="btn-add">추가하기</button>
	</div>
	</form>
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>

		function list() {
			$.ajax({
				type: 'GET',
				url: '/ajax/user',
				dataType: 'json',
				success: function(result) {
	
					$('#list tbody').html('');
					
					$(result).each((index, item) => {
						
						$('#list tbody').append(`
								
							<tr>
								<td>\${item.id}</td>
								<td>\${item.name}</td>
								<td>\${item.gender}</td>
							</tr>	
							
						`);
					});
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		}
		
		list();
		
		$('#btn-add').click(()=>{
			
			$.ajax({
				type: 'POST',
				url: '/ajax/user',
				
				//클라이언트 > 서버
				contentType: 'application/json; charset=UTF-8',
				data: JSON.stringify({
					'id': $('#id').val(),
					'name': $('#name').val(),
					'gender': $('#gender').val()
				}),
				
				//서버 > 클라이언트
				dataType: 'json',
				success: function(result) {
					
					if (result == 1) {
						list();
						$('#id').val('');
						$('#name').val('');
						$('#gender').val('');
					}
				
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		});
	
	</script>
</body>
</html>





