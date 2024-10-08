package com.test.toy.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class OutputUtil {
	
	public static void redirect(HttpServletResponse resp, String msg) throws IOException {
		
		PrintWriter writer = resp.getWriter();
		writer.print("<html><head><meta charset='UTF-8'></head><body><script>"); 
		writer.printf("alert('%s');", msg);
		writer.print("history.back();");
		writer.print("</script></body></html>"); 
		writer.close();
		
	}

}
