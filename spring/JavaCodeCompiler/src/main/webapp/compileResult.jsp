<%@ page import="java.io.IOException"%>
<%@ page import="java.io.FileWriter"%>
<%@ page import="java.io.OutputStreamWriter"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="javax.servlet.RequestDispatcher"%>
<%@ page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Java Code Compiler</title>
</head>
<body>
<%
	// UTF-8 인코딩 설정
	request.setCharacterEncoding("UTF-8"); 
	response.setContentType("text/html; charset=UTF-8");
	
	// 입력된 Java 코드 가져오기
	String javaCode = request.getParameter("javaCode");
	
	// 디버깅용으로 서버 콘솔에 코드 출력
	System.out.println("Received Java Code: \n" + javaCode);
	
	// Test.java 파일을 서버의 실제 경로에 생성
	String path = application.getRealPath("/") + "Testa.java";

    try (OutputStreamWriter writer = new OutputStreamWriter(
            new FileOutputStream(new File(path)), "UTF-8")) {
    	
    	System.out.println("<h2>인코딩 테스트: "+ "</h2>");
        writer.write(javaCode);
        
    } catch (IOException e) { 
        out.println("<h2>파일 저장 중 오류 발생: " + e.getMessage() + "</h2>");
    }

    // 서블릿으로 전송
    
    request.setAttribute("filename", path);
    RequestDispatcher dispatcher = request.getRequestDispatcher("CompilerServlet");
    dispatcher.forward(request, response);
%>
</body>
</html>

