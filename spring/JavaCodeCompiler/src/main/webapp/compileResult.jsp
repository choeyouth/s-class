<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Java Code Compiler</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");  // 요청 인코딩 설정
    response.setContentType("text/html; charset=UTF-8");  // 응답 인코딩 설정

    String javaCode = request.getParameter("javaCode");  // 입력된 코드 가져오기

    // 코드가 제대로 전송되었는지 서버 콘솔에 출력 (디버깅용)
    System.out.println("Received Java Code: \n" + javaCode);

    // Test.java 파일 생성
    String path = application.getRealPath("/") + "Test.java";
    try (FileWriter writer = new FileWriter(path)) {
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

