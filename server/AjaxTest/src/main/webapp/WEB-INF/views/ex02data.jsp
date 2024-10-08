<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<style>

	</style>
</head>
<body>
	<!-- ex02data.jsp -->
	<h1>ex02data.jsp</h1>
	
	<div>${dto.question}</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
		//iframe 페이지 > 부모 페이지
		//top.document.body.style.backgroundColor = 'gold';
		
		//top.document.all.txt1.value = '테스트';
		//$(top.document).find('#item1').css('width', '100px');
		
		$(top.document).find('#table1 tr:nth-child(1) th').text('${dto.question}');
		
		$(top.document).find('#table1 tr:nth-child(2) td span:nth-child(1)').text('${dto.item1}')
		$(top.document).find('#table1 tr:nth-child(2) td span:nth-child(2)').text('${dto.cnt1}')
		
		$(top.document).find('#table1 tr:nth-child(3) td span:nth-child(1)').text('${dto.item2}')
		$(top.document).find('#table1 tr:nth-child(3) td span:nth-child(2)').text('${dto.cnt2}')
		
		$(top.document).find('#table1 tr:nth-child(4) td span:nth-child(1)').text('${dto.item3}')
		$(top.document).find('#table1 tr:nth-child(4) td span:nth-child(2)').text('${dto.cnt3}')
		
		$(top.document).find('#table1 tr:nth-child(5) td span:nth-child(1)').text('${dto.item4}')
		$(top.document).find('#table1 tr:nth-child(5) td span:nth-child(2)').text('${dto.cnt4}')		
	
		
		$(top.document).find('#item1 span:nth-child(1)').text('${dto.item1}');
		$(top.document).find('#item1 span:nth-child(2)').text('${dto.cnt1}');
		
		$(top.document).find('#item2 span:nth-child(1)').text('${dto.item2}');
		$(top.document).find('#item2 span:nth-child(2)').text('${dto.cnt2}');
		
		$(top.document).find('#item3 span:nth-child(1)').text('${dto.item3}');
		$(top.document).find('#item3 span:nth-child(2)').text('${dto.cnt3}');
		
		$(top.document).find('#item4 span:nth-child(1)').text('${dto.item4}');
		$(top.document).find('#item4 span:nth-child(2)').text('${dto.cnt4}');

		$(top.document).find('#item1').css('width', '${dto.cnt1 * 30 + 50}px');
		$(top.document).find('#item2').css('width', '${dto.cnt2 * 30 + 50}px');
		$(top.document).find('#item3').css('width', '${dto.cnt3 * 30 + 50}px');
		$(top.document).find('#item4').css('width', '${dto.cnt4 * 30 + 50}px');
		
		setTimeout(() => {
			location.reload();
		}, 5000);
		
	</script>
</body>
</html>