<%@page import="java.util.Comparator"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String path = application.getRealPath("/files");

	//목록 가져오기
	File dir = new File(path);
	File[] list = dir.listFiles();	
	
	//배열 정렬(수정된 날짜로)
	/* 
	Arrays.sort(list, (a, b) -> {
		
		return Long.compare(a.lastModified(), b.lastModified());
	}); 
	*/
	
	Arrays.sort(list, new Comparator() {
		public int compare(Object a, Object b) {
			return Long.compare(((File)b).lastModified(), ((File)a).lastModified());
		}
	});

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style>
	.table {
		margin-top: 20px;
	}
	
	.table th:nth-child(1) { width: auto; }
	.table th:nth-child(2) { width: 100px; }
	.table th:nth-child(3) { width: 200px; }
	
	form > div {
		margin-bottom: 10px;
	}
	
	.table td > * {
		float: left;
		margin-right: 5px;
	}
	
	.table td:nth-child(2) {
		text-align: right;
	}
	.table td:nth-child(3) {
		text-align: center;
	}
	.table td img {
		border: 1px solid #999;
	}
		
	.table td > span {
		display: none;
		cursor: pointer;
	}
	
	.table td:hover > span {
		display: inline;
	}
	
</style>
</head>
<body>
	<!-- ex22_form.jsp -->
	
	<div class="container">
		<h1>자료실(탐색기) webapp > files</h1>
		
		<table class="table table-bordered">
			<tr>
				<th>파일명</th>
				<th>크기</th>
				<th>수정된 날짜</th>
			</tr>
			<% for (File file : list) { %>
			<tr>
				<td>
					<%
					
						//만약 파일이 이미지라면.. 미리보기
						if (file.getName().toLowerCase().endsWith(".jpg")
							|| file.getName().toLowerCase().endsWith(".jpeg")
							|| file.getName().toLowerCase().endsWith(".gif")
							|| file.getName().toLowerCase().endsWith(".png")) {
							
							out.println(String.format("<img src='files/%s' height='30'>", file.getName()));
							
						}
							
					
					%>
					<b><%= file.getName() %></b>
					<span onclick="del('<%= file.getName() %>');">&times;</span>
				</td>
				<td><%= String.format("%,d", file.length()) %>B</td>
				<td>
					<%
						Calendar time = Calendar.getInstance();
						time.setTimeInMillis(file.lastModified());
						out.println(String.format("%tF %tT", time, time));
					%>
				</td>
			</tr>
			<% } %>
		</table>
		<hr>
		
		<form method="POST" action="ex22_ok.jsp" enctype="multipart/form-data">
			<div>파일: <input type="file" name="attach"></div>
			<div><input type="submit" value="업로드" class="btn btn-primary"></div>
		</form>
		
	</div>
	
	<script>
	
		function del(filename) {
			
			if (confirm('삭제하겠습니까?')) {
				
				location.href = 'ex22_del.jsp?filename=' + filename;
				
			}
			
		}
	
	</script>
	
</body>
</html>



















