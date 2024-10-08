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
	<!-- ex28_cookie_form.jsp -->
	<h1>로그인</h1>
	
	<form method="POST" action="ex28_cookie_ok.jsp">
	<table class="vertical content">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="txtId" required class="short"></td>
		</tr>
		<tr>
			<th>암호</th>
			<td><input type="password" name="txtPw" required class="short"></td>
		</tr>
	</table>
	<div>
		<div style="margin-bottom: 10px">
			<label><input type="checkbox" name="cbRemember" id="cbRemember" value="y">아이디 기억하기</label>
		</div>
		<div><input type="submit" value="로그인"></div>	
	</div>
	</form>
	
	<hr>
	
	<div><%= session.getId() %></div>
	
	<hr>
	
	<c:if test="${result}">
	<div class="message">인증 O</div>
	</c:if>
	
	<c:if test="${not result}">
	<div class="message">인증 X</div>
	</c:if>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="js/cookie.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		//페이지 접속 > 기억한 아이디 있는지?
		if (getCookie('id') != '') {
			//아이디 기억했음
			$('input[name=txtId]').val(getCookie('id'));
			$('input[name=txtPw]').focus();
			$('#cbRemember').prop('checked', true);
			
		} else {
			//처음 방문 or 아이디 기억 안 했음
			$('input[name=txtId]').focus();
		}

		$('#cbRemember').change(() => {
			
			if ($(event.target).prop('checked')) {
				alert('공공장소나 PC방에서 해당 기능을 주의해서 사용하세요. \n개인정보가 노출될 가능성이 있습니다.')
			}
			
		})
		
	</script>
</body>
</html>