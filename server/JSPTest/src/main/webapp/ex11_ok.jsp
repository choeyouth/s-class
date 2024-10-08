<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String width = request.getParameter("width");
	String height = request.getParameter("height");
	String txt = request.getParameter("txt");
	String bgcolor = request.getParameter("bgcolor");
	String fontcolor = request.getParameter("fontcolor");
	String fontsize = request.getParameter("fontsize");
	int buttoncount = Integer.parseInt(request.getParameter("buttoncount"));
	String widthrange = request.getParameter("widthrange");
	String heightrange = request.getParameter("heightrange");
	
	String rd = request.getParameter("rd");
	String sel1 = request.getParameter("sel1");

%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<link rel="stylesheet" href="http://bit.ly/3WJ5ilK">
	<style>
		
		button {
			
			width: <%= width %>px;
			height: <%= height %>px;
			
			background-color: <%= bgcolor %>;
			color: <%= fontcolor %>;
			font-size: <%= fontsize %>px;
			
			margin: <%= heightrange %>px <%= widthrange %>px;
<%-- 		margin-left: <%= widthrange %>px;
			margin-right:  <%= widthrange %>px;
			margin-top: <%= heightrange %>px;
			margin-bottom: <%= heightrange %>px; --%>
		}
		
	</style>
</head>
<body>
	<!-- ex11_ok.jsp -->
	<h1>결과</h1>
	
	<table>
		<tr>
			<th>버튼</th>
		</tr>
		<tr>
			<td>
				<% for (int i=0; i<buttoncount; i++) { %>
				<button><%= txt %></button>
				<% } %>
			</td>
		</tr>
	</table>
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>