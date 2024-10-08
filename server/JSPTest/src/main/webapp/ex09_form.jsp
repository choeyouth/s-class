<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	<!-- ex09_form.jsp -->
	<h1>폼 입력 양식 테스트</h1>
	
	<!-- ★★★모든 컨트롤은 value가 서버로 전송된다.  -->
	
	<!-- 폼 태그 사용: POST
		 GET 사용 경우 정해짐(GET 사용 경우X > POST)
	 -->
	<form method="POST" action="ex09_ok.jsp">
	<table class="vertical">
		<tr>
			<th>텍스트 박스</th>
			<td><input type="text" name="txt1"></td>
		</tr>
		<tr>		
			<th>암호 상자</th>
			<td><input type="password" name="txt2"></td>
		</tr>
		<tr>
			<th>다중 텍스트 박스</th>
			<td><textarea name="txt3"></textarea></td>
		</tr>
		<tr>
			<th>체크 박스</th>
			<td><input type="checkbox" name="cb1" value="java"></td>
		</tr>
		<tr>
			<th>체크 박스들</th>
			<td>
				<h3>취미를 선택하세요.(복수 선택 가능)</h3>
				<label><input type="checkbox" name="cb2" value="독서">독서</label>
				<label><input type="checkbox" name="cb3" value="운동">운동</label>
				<label><input type="checkbox" name="cb4" value="코딩">코딩</label>
			</td>
		</tr>
		<tr>
			<th>체크 박스들</th>
			<td>
				<h3>취미를 선택하세요.(복수 선택 가능)</h3>
				<label><input type="checkbox" name="cb5" value="독서">독서</label>
				<label><input type="checkbox" name="cb5" value="운동">운동</label>
				<label><input type="checkbox" name="cb5" value="코딩">코딩</label>
			</td>
		</tr>
		<tr>
			<th>라디오 버튼</th>
			<td>
				<h3>성별을 선택하세요.</h3>
				<label><input type="radio" name="gender" value="male" checked>남자</label>
				<label><input type="radio" name="gender" value="female">여자</label>
			</td>
		</tr>
		<tr>
			<th>셀렉트 박스</th>
			<td>
				<select name="sel1">
					<option value="a1">강아지</option>
					<option value="a2">고양이</option>
					<option value="a3">거북이</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>셀렉트 박스</th>
			<td>
				<!-- ?sel2=a1&sel2=a2&sel2=a3 -->
				<select name="sel2" multiple size="3">
					<option value="a1">강아지</option>
					<option value="a2">고양이</option>
					<option value="a3">거북이</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>히든 태그</th>
			<td><input type="hidden" name="mode" value="delete"></td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><input type="date" name="regdate"></td>
		</tr>
		<tr>
			<th>색상</th>
			<td><input type="color" name="color" style="height: 20px"></td>
		</tr>	
		<tr>
			<th>사용자 정의 컨트롤(JavaScript, jQuery 등..)</th>
			<td><img src="images/catty01.png" id="cat1" name="cat1"></td>
		</tr>
	</table>
	<div>
		<input type="submit" value="보내기">
	</div>
	
	<input type="hidden" name="left">
	<input type="hidden" name="top">
	</form>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://code.jquery.com/ui/1.14.0/jquery-ui.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		$('#cat1').draggable({
			stop: function(event, ui) {
				//alert(ui.position.left);
				//alert(ui.position.top);
				$('input[name=left]').val(ui.position.left);
				$('input[name=top]').val(ui.position.top);
			}
		});
	</script>
</body>
</html>