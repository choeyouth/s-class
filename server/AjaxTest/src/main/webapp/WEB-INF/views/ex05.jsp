<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
		table th { width: 140px; }
	</style>
</head>
<body>
	<!-- ex05.jsp -->
	<h1>아이디 중복 검사</h1>
	
	<form method="POST" action="/ajax/ex05ok.do">
	<table>
		<tr>
			<th>이름</th>
			<td></td>
		</tr>
		<tr>
			<th>암호</th>
			<td></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id" class="short" readonly>
				<input type="button" value="중복검사" id="btnCheck">
			</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="id2" class="short">
				<input type="button" value="중복검사" id="btnCheck2">
				<span id="result2"></span>
			</td>
		</tr>
		<tr>
			<th>주소</th>
			<td></td>
		</tr>
	</table>
	<div>
		<input type="submit" value="가입하기" disabled>
	</div>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		$('#btnCheck').click(() => {
			window.open('/ajax/ex05check.do', 'check', 'width=400, height=350');
		});
		
		$('#btnCheck2').click(() => {
			
			if ($('input[name=id2]').val().trim() == '') return;
			
			$.ajax({
				type: 'POST',
				url: '/ajax/ex05data.do',
				data: 'id=' + $('input[name=id2]').val(),
				success: function(result) {
					//alert(result);
					if (result == '1') {
						$('#result2').text('이미 사용중인 아이디입니다.');
						$('input[type=submit]').prop('disabled', true)
					} else {
						$('#result2').text('사용 가능한 아이디입니다.');
						$('input[type=submit]').prop('disabled', false)
					}
				}
			});
		});
		
		/*
		//해당 영역에서 벗어나면 발생하는 이벤트 
		$('input[name=id2]').blur(() => {
			alert();
		});
		*/
		
		//값을 고치면 발생하는 이벤트
		$('input[name=id2]').change(() => {
			$('input[type=submit]').prop('disabled', true);
		});

	</script>
</body>
</html>