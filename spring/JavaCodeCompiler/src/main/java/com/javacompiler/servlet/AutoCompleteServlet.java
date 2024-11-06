package com.javacompiler.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.lang.reflect.*;
import java.util.*;

public class AutoCompleteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
       
        PrintWriter out = response.getWriter();

        String prefix = request.getParameter("prefix");
        System.out.println("prefix >>>>>>>> " + prefix);
        List<String> suggestions = getSuggestions(prefix);

        // JSON 형태로 반환
        out.println("[\"" + String.join("\",\"", suggestions) + "\"]");
    }

    private List<String> getSuggestions(String prefix) {
        List<String> suggestions = new ArrayList<>();
        try {
            Class<?> clazz = Class.forName("java.lang.String"); // 예시로 String 클래스 사용
            for (Method method : clazz.getDeclaredMethods()) {
                if (method.getName().startsWith(prefix)) {
                    suggestions.add(method.getName() + "()");
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return suggestions;
    }
}
