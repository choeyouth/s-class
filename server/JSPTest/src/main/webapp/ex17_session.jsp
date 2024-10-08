<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//방문 횟수 카운트
	//- 누적 변수 필요 
	int count = 0; //지역 변수 > 소멸 
	
	// 누적 변수는 소멸하지 않고 계속 살아 있어야 함 > 생명 주기가 길어야 함
	// > 적합한 것 > DB

	//pageContext //X
	//request //X
	//session //O > 사이트를 나가기 전까지 살아있음
	
	if (session.getAttribute("count") == null) { //본인 세션 안에 한 번도 넣지 않음 > 방문한 적X
		session.setAttribute("count", 1);
	} else {
		session.setAttribute("count", (int)session.getAttribute("count") + 1);
	}
	
	//http or https 프로토콜은 비연결 지향이다.
	//- 연결을 지속하는 걸 지양한다. 
	
%>
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
	<!-- ex17_session.jsp -->
	
	<h1>방문 횟수</h1>
	
	<div>count : <%= session.getAttribute("count") %></div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>