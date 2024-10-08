<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
		#fileList > div {
			margin-top: 5px;
		}
		#fileList > div > span {
			font-size: 1.5rem;
			margin-left: 5px;
			cursor: pointer;
		}
	</style>
</head>
<body>
	<!-- ex20_form.jsp -->
	<h1>다중 파일 업로드</h1>
	
	<form method="POST" action="ex20_ok.jsp" enctype="multipart/form-data">
	<table class="vertical">
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject"></td>
		</tr>
		<tr>
			<th>파일</th>
			<td>
				<div><input type="file" name="attach1"></div>
				<div id="fileList"></div>
				<hr>
				<input type="button" value="첨부파일 늘리기" id="btnFile">
			</td>
		</tr>
	</table>
	<div>
		<button>보내기</button>
	</div>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
		let n = 2;
		
		$('#btnFile').click(() => {
			
			$('#fileList').append('<div><input type="file" name="attach' + n + '"><span onclick="del();">&times;</span></div>');
			n++;
			
		});		
		
		function del() {
			if (confirm('delete?')) {
				$(event.target).parent().remove();
			}
		}
	
	</script>
</body>
</html>