
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import org.w3c.dom.*;
import javax.xml.parsers.*;

@WebServlet("/test")
public class Test extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");

        String apiKey = "ttbdbwjd22ek1603001";
        String title = request.getParameter("title");
        String encodedTitle = URLEncoder.encode(title, "UTF-8");

        String urlString = "https://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=" 
                + apiKey + "&Query=" + encodedTitle 
                + "&QueryType=Title&MaxResults=1&start=1&SearchTarget=Book&output=xml&Version=20131101";

        try (Connection conn = DriverManager.getConnection(
                "jdbc:oracle:thin:@43.202.205.134:1521:xe", "project", "java1234")) {

            URL apiUrl = new URL(urlString);
            HttpURLConnection httpConn = (HttpURLConnection) apiUrl.openConnection();
            httpConn.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(new InputStreamReader(httpConn.getInputStream(), "UTF-8"));
            String inputLine;
            StringBuilder responseBuilder = new StringBuilder();

            while ((inputLine = in.readLine()) != null) {
                responseBuilder.append(inputLine);
            }
            in.close();

            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse(new ByteArrayInputStream(responseBuilder.toString().getBytes("UTF-8")));
            Element root = document.getDocumentElement();
            NodeList items = root.getElementsByTagName("item");

            String message = "검색된 책이 없습니다.";
            if (items.getLength() > 0) {
                Element item = (Element) items.item(0);

                String itemId = item.getElementsByTagName("isbn13").item(0).getTextContent();
                String bookTitle = item.getElementsByTagName("title").item(0).getTextContent();
                String author = item.getElementsByTagName("author").item(0).getTextContent();
                String pubDate = item.getElementsByTagName("pubDate").item(0).getTextContent();
                String cover = item.getElementsByTagName("cover").item(0).getTextContent();
                String description = item.getElementsByTagName("description").item(0).getTextContent();

                // 데이터베이스에 저장
                String sql = "INSERT INTO tblBook (seq, name, author, publicationDate, story, cover) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, itemId);
                pstmt.setString(2, bookTitle);
                pstmt.setString(3, author);
                pstmt.setDate(4, java.sql.Date.valueOf(pubDate));
                pstmt.setString(5, description);
                pstmt.setString(6, cover);
                pstmt.executeUpdate();

                message = "책이 성공적으로 저장되었습니다: " + bookTitle;
            }

            request.setAttribute("message", message);
            request.getRequestDispatcher("/bookSearch.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("<p>오류가 발생했습니다: " + e.getMessage() + "</p>");
        }
    }
}
