package com.javacompiler.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.tools.JavaCompiler;
import javax.tools.ToolProvider;

public class CompilerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String code = request.getParameter("javaCode");
        System.out.println("here >>> " + code);
        PrintWriter out = response.getWriter();

        // JSP에서 전달된 파일 경로
        String filename = (String) request.getAttribute("filename");

        // Java Compiler API로 컴파일 수행
        JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
        int compileResult = compiler.run(null, null, null, filename);

        if (compileResult == 0) {
            out.println("<h2>컴파일 성공!</h2>");

            // 컴파일된 클래스 실행
            try {
                Process process = Runtime.getRuntime().exec("java -cp " + request.getServletContext().getRealPath("/") + " Test");
                BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream(), "UTF-8"));
                String line;
                out.println("<h3>실행 결과:</h3><pre>");
                while ((line = reader.readLine()) != null) {
                    out.println(line);
                }
                out.println("</pre>");
            } catch (Exception e) {
                out.println("<h3>실행 오류 발생:</h3><pre>" + e.getMessage() + "</pre>");
            }
        } else {
            out.println("<h2>컴파일 실패!</h2>");
        }
    }
}
