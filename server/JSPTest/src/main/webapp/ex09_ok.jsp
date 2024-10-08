<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//POST > (한글) 인코딩
	request.setCharacterEncoding("UTF-8");

	//request.getParameter()의 기전
	//1. 입력하면		> 입력값 반환
	//2. 입력안하면	>  "" 반환
	//3. 컨트롤X 		> 키 없음 	>  null 반환  
	
	//텍스트 박스
	String txt1 = request.getParameter("txt1");
	//System.out.println(txt1 == null); 	//false
	//System.out.println(txt1 == ""); 	//true
	
	//암호 상자
	String txt2 = request.getParameter("txt2");
	
	//다중 텍스트 박스
	String txt3 = request.getParameter("txt3");
	txt3 = txt3.replace("\r\n", "<br>");
	
	//체크 박스
	//1. value 작성 X
	// - 체크 O > "on" 전송
	// - 체크 X > null 전송
	
	//2. value 작성 O
	// - 체크 O > value 전송
	// - 체크 X > null 전송
	
	String cb1 = request.getParameter("cb1");
	
	//체크 박스들
	String cb2 = request.getParameter("cb2");
	String cb3 = request.getParameter("cb3");
	String cb4 = request.getParameter("cb4");
	
	String temp = "";
	
	temp += cb2 + ", ";
	temp += cb3 + ", ";
	temp += cb4;
	
	//체크 박스들
	//String cb5 = request.getParameter("cb5");
	//System.out.println(cb5); //다중 선택 시 결과 > 독서(첫 번째 값) 	 
	
	//?cb5=독서&cb5=운동&cb5=코딩
	String[] cb5 = request.getParameterValues("cb5");
	
	//라디오 버튼
	String gender = request.getParameter("gender");

	//셀렉트 박스
	String sel1 = request.getParameter("sel1");
	
	String[] sel2 = request.getParameterValues("sel2");
	
/* 	temp = "";
	
	for (int i=0; i<sel2.length; i++) {
		temp += sel2[i] + ", ";
	} */
	
	//히든 태그
	String mode = request.getParameter("mode");

	//날짜
	String regdate = request.getParameter("regdate");
	
	//색상
	String color = request.getParameter("color");
		
	//이미지
	String cat1 = request.getParameter("cat1");
	
	//JavaScript
	String left = request.getParameter("left");
	String top = request.getParameter("top");

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
	<!-- ex09_ok.jsp -->
	<h1>결과</h1>
	
	<h2>텍스트 박스</h2>
	<div><%= txt1 %></div>
	
	<h2>암호 상자</h2>
	<div><%= txt2 %></div>
	
	<h2>다중 텍스트 박스</h2>
	<div><%= txt3 %></div>
	
	<h2>체크 박스</h2>
	<div><%= cb1 %></div>
		
	<h2>체크 박스들</h2>
	<div><%= temp %></div>
	
	<h2>체크 박스들</h2>
	<div><%= Arrays.toString(cb5) %></div>
	
	<h2>라디오 버튼</h2>
	<div><%= gender %></div>
		
	<h2>셀렉트 박스</h2>
	<div><%= sel1 %></div>
			
	<h2>셀렉트 박스2</h2>
	<div<%= Arrays.toString(sel2) %>></div>
	
	<h2>히든 태그</h2>
	<div><%= mode %></div>
	
	<h2>날짜</h2>
	<div style="background-color: <%= color %>;"><%= regdate %></div>
	
	<h2>이미지</h2>
	<div><%= cat1 %></div>	
		
	<h2>JavaScript</h2>
	<!-- <div><%= "left: " + left + " top: " + top %></div> -->
	<div><%= left %>, <%= top %></div>	
		
	<h2></h2>
	<div></div>	
		
	<h2></h2>
	<div></div>	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>