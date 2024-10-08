<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	/* 
		<form enctype="multitype/form-data">
	
		- request.getParameter()       > 동작 불능
		- request.getParameterValues() > 동작 불능
	
		cos.jar
		- MultipartRequest 클래스 > 기존의 request를 대신한다.
		1. 기존의 request 객체를 Wrapping 한 객체
	    	- getParameter() 동작 가능
		2. 파일 업로드 처리
		
	*/
	
	/*
	String txt = request.getParameter("txt");
	String num = request.getParameter("num");
	*/
	
	String txt = "";
	String num = "";
	String filename = "";
	String orgfilename = "";
	
	//1. 업로드된 파일을 저장할 경로 > 로컬 경로 사용(C:\)
	// - webapp > files
	//String path = "C:\\class\\code\\server\\JSPTest\\src\\main\\webapp\\files";
	String path = application.getRealPath("/files");
	System.out.println(path); //C:\class\code\server\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPTest\files
	
	//2. 업로드 파일의 최대 크기 지정
	//- 바이트 단위
	int size = 1024 * 1024 * 100; //100MB
	
	try {
	
		//3. MultipartRequest 객체 생성
		//- 파일업로드 완료
		MultipartRequest multi = new MultipartRequest(
					request, //기존의 request
					path, 	 //업로드 위치
					size,    //최대 크기
					"UTF-8",  //인코딩
					new DefaultFileRenamePolicy()
				);
		
		//텍스트 데이터
		//txt = multi.getParameter("txt");
		//num = multi.getParameter("num");
		
		
		//첨부 파일명
		//- <input type="file" name="attach">
		filename = multi.getFilesystemName("attach");
		
		orgfilename = multi.getOriginalFileName("attach");
		
		
	} catch(Exception e) {
		System.out.println(e.getMessage());
	}
	
	
	
	
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
	<!-- ex19_ok.jsp -->
	<h1>결과</h1>
	
	<div>
		문자: <%= txt %>	
	</div>
	
	<div>
		숫자: <%= num %>	
	</div>
	
	<div>
		파일명: <%= filename %>	
	</div>
	
	<div>
		파일명: <%= orgfilename %>	
	</div>
	
	<hr>
	
	<h2>파일 다운로드</h2>
	
	<!--  
		장점: 단순함
		단점: 브라우저가 실행 가능한 포맷의 파일을 직접 실행한다.
			  파일명이 원본가 다를 수 있다.      
	-->
	<div>
		<a href="/jsp/files/<%= filename %>"><%= orgfilename %></a>
	</div>
	
	<!--  
		장점: 간단함. 모든 파일을 다운로드
		단점: 파일명이 원본과 다를 수 있다.
	-->
	<div>
		<a href="/jsp/files/<%= filename %>" download><%= orgfilename %></a>
	</div>
	
	<!--  
		장점: 평범한 다운로드를 제공(모든 파일 다운로드, 이름 원본 유지)
		단점: download.jsp 작성 비용 발생
	-->
	<div>
		<a href="download.jsp?filename=<%= filename %>&orgfilename=<%= orgfilename %>"><%= orgfilename %></a>
	</div>
	
	<hr>
	
	<div>
		<a href="ex18_session.jsp" download>18번 예제</a>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
		
	</script>

</body>
</html>















