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
	<!-- info.jsp -->
	<%@include file="/WEB-INF/views/inc/header.jsp" %>

	<div id="main">
		<h1 class="sub">회원 <small>정보</small></h1>
		
		<table id="info">
			<tr>
				<td rowspan="3"><img src="/toy/asset/pic/${dto.pic}"></td>
				<th>이름</th>
				<td>${dto.name}</td>
				<th>아이디</th>
				<td>${dto.id}</td>
			</tr>		
			<tr> 
				<th>등급</th>
				<td>${dto.lv == '1' ? '일반회원' : '관리자'}</td>
				<th>이메일</th>
				<td>${dto.email}</td>
			</tr>		
			<tr>
				<td colspan="4">${dto.intro}</td> 
			</tr>		
		</table>
		
		<h2 id="titleCalendar">
			<span>
				<span>활동 내역</span>
				<span>2024. 10</span>
			</span>	
			<span>
				<span class="material-symbols-outlined" id="btnPrev">skip_previous</span>
				<span class="material-symbols-outlined" id="btnNow">today</span>
				<span class="material-symbols-outlined" id="btnNext">skip_next</span>
			</span>
		</h2>
		
		<table id="tblCalendar">
			<thead>
				<tr>
					<th>SUN</th>
					<th>MON</th>
					<th>TUE</th>
					<th>WED</th>
					<th>THU</th>
					<th>FRI</th>
					<th>SAT</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>

	<script>
	
		let year = 0;
		let month = 0;
		
		let now = new Date();
		year = now.getFullYear();
		month = now.getMonth();
		
		function create(year, month) {
			$('#titleCalendar span:first-child span:last-child').text(year + '.' + String(month + 1).padStart(2, '0'));
		
			//해당 월 1일의 요일
			let date = new Date(year, month, 1);
			let firstDay = date.getDay();
			//alert(firstDay);
			
			//해당 월의 마지막 날
			//console.log(new Date(year, month + 1, 0));
			//month > Mon Sep 30 2024 00:00:00 GMT+0900 (GMT+09:00)
			//month + 1 > Thu Oct 31 2024 00:00:00 GMT+0900 (GMT+09:00)
			
			let lastDate = new Date(year, month + 1, 0).getDate();
			
			let temp = '';
			
			temp += '<tr>';

			for (let i=0; i<firstDay; i++) {
				temp += '<td></td>';
			}
			
			//날짜 <td>
			for (let i=1; i<=lastDate; i++) {
				temp += '<td>';
				temp += `<span class="no" data-date="\${i}">\${i}</span>`;
				temp += '<div>';
				//temp += '<span class="lcnt">1</span>'
				//temp += '<span class="bcnt">2</span>'
				//temp += '<span class="ccnt">1</span>'
				temp += '</div>'
				temp += '</td>';
				
				if ((i + firstDay) % 7 == 0) {
					temp += '</tr><tr>'
				}
			}
			
			temp += '</tr>';
			
			$('#tblCalendar tbody').html(temp);
			loadCalendar(year, month);
		}
		
		create(year, month);
		
		$('#btnPrev').click(()=>{
			now.setMonth(now.getMonth() - 1);
			year = now.getFullYear();
			month = now.getMonth();
			create(year, month);
		});
		
		$('#btnNow').click(()=>{
			now = new Date();
			year = now.getFullYear();
			month = now.getMonth();
			create(year, month);		
		});
				
		$('#btnNext').click(()=>{
			now.setMonth(now.getMonth() + 1);
			year = now.getFullYear();
			month = now.getMonth();
			create(year, month);
		});

		
		function loadCalendar(year, month) {
			
			$.ajax({
				type: 'GET',
				url: '/toy/user/loadcalendar.do',
				data: {
					year: year,
					month: month + 1
				},
				dataType: 'json',
				success: function(result) {
					
					//console.log(result);
					//{cnt: '1', regdate: '2024-10-08', ccnt: '0', bcnt: '1'}
					
					$(result).each((index, item)=>{

						let date = parseInt(item.regdate.split('-')[2]);
						$('#tblCalendar span[data-date=' + date + '] + div')
							.append('<span class="lcnt">' + item.cnt + '</span>');
				
						if (item.bcnt > 0) {
							$('#tblCalendar span[data-date=' + date + '] + div')
								.append('<span class="bcnt">' + item.cnt + '</span>');
						}
						
						if (item.ccnt > 0) {
							$('#tblCalendar span[data-date=' + date + '] + div')
								.append('<span class="ccnt">' + item.cnt + '</span>');
						}
						
					});
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		}
		
		
	</script>
</body>
</html>