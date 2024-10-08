<%@page import="com.test.java.Student"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- ex23_el.jsp -->
	<h1>EL</h1>
	
	<%
		int a = 10; //자바 데이터 > 화면 출력
		
		//***** EL은 평범한 출력문이 아니라, 내장 객체의 컬렉션 값들을 출력하는 전용 출력문이다.
		//- pageCountext, request, session, application
		//		- setAttribute(key, value) > 이 값들을 출력하는 도구
		
		
		//EL이 키를 가져올 때 우선 순위
		//pageContext > request > session > application
		
		pageContext.setAttribute("b", 20); 
		request.setAttribute("c", 30);
		session.setAttribute("d", 40);
		session.setAttribute("b", 200);
		
		
	%>
	
	<h2>표현식</h2>
	<div>a: <%= a %></div>
	<div>b: <%= pageContext.getAttribute("b") %></div>
	
	<h2>EL</h2>
	<div>a: ${a}</div>
	<%-- <div>b: ${pageContext.getAttribute("b")}</div> --%>
	<div>b: ${b}</div> 
	<div>c: ${c}</div> 
	<div>d: ${d}</div> 
	<div>d: ${d}</div> 
	<div>session b: ${session.getAttribute("b")}</div>	
	<div>session b: ${sessionScope.b}</div>	
	<div>pageContext.b: ${pageScope.b}</div>	
	<div>request.b: ${requestScope.b}</div>	

	<hr>
	
	<%
		pageContext.setAttribute("n1", 10);
		pageContext.setAttribute("n2", 3);
	%>
	
	<h2>EL 기능</h2>
	<h3>EL 연산 기능</h3>
	
	<div>n1 + 10 = <%= (int)pageContext.getAttribute("n1") + 10 %></div>
	<div>n1 + 10 = ${n1} + 10</div>

	<div>n1 + 10 = ${n1 + 10}</div>
	<div>n1 - 10 = ${n1 - 10}</div>
	<div>n1 * 10 = ${n1 * 10}</div>
	<div>n1 / 10 = ${n1 / 10}</div>
	<div>n1 % 10 = ${n1 % 10}</div>
	<div>n1 mod 10 = ${n1 mod 10}</div>
	
	<div>n1 + n2 = <%= (int)pageContext.getAttribute("n1") + (int)pageContext.getAttribute("n2") %></div>
	
	<div>n1 + n2 = ${n1} + ${n2}</div>
	<div>n1 + n2 = ${n1 + n2}</div>
	
	<hr>
	
	<!-- '>' 이스케이프: &gt; -->
	<!-- '<' 이스케이프: &lt; -->
	<div>n1 &gt; 0 = ${n1 > 0}</div>
	<div>n1 &lt; 0 = ${n1 < 0}</div>

	<div>n1 &lt;= 0 = ${n1 >= 0}</div>
	<div>n1 &lt;= 0 = ${n1 <= 0}</div>

	<div>n1 == 0 = ${n1 == 0}</div>
	<div>n1 != 0 = ${n1 != 0}</div>
	
	<div>n1 &gt; 0 = ${n1 gt 0}</div>
	<div>n1 &lt; 0 = ${n1 lt 0}</div>

	<div>n1 &lt;= 0 = ${n1 ge 0}</div>
	<div>n1 &lt;= 0 = ${n1 le 0}</div>

	<div>n1 == 0 = ${n1 eq 0}</div>
	<div>n1 != 0 = ${n1 ne 0}</div>
	
	
	<hr>
	
	<div>true && true = ${true && true}</div>
	<div>true || false = ${true || false}</div>
	<div>!true = ${!true}</div>
	
	<div>true && true = ${true and true}</div>
	<div>true || false = ${true or false}</div>
	<div>!true = ${not true}</div>
	
	
	<hr>
	
	<div>${n1 > 0 ? "양수" : "음수" }</div>
	
	<!-- 권장 -->
	<!-- 이클립스 버그 > 실제 에러X -->
	<%-- <div>${"홍길동".equals("홍길동")}</div> --%>
	
	<!-- 비권장 -->
	<div>${"홍길동" == "홍길동"}</div>
	
	
	<hr>
	
	<%
		HashMap<String, String> map = new HashMap<String, String>();
	
		map.put("name", "홍길동");
		map.put("age", "20");
		map.put("address", "서울시");
		
		request.setAttribute("map", map);
		
	%>

	<h2>HashMap 객체 출력</h2>
	
	<div>이름: <%= map.get("name") %></div>
	<div>나이: <%= Integer.parseInt(map.get("age")) - 1%></div>
	<div>주소: <%= map.get("address") %></div>
	
	<div>이름: ${map.get("name")}</div>
	<div>나이: ${map.age - 1}</div>
	<div>주소: ${map["address"]}</div>
	
	<%
		
		Student s1 = new Student();
		
		s1.setName("아무개");
		s1.setAge(25);
		s1.setAddress("부산시");
		
		request.setAttribute("s1", s1);
	
	%>

	<h2>객체 출력</h2>
	
	<div>이름: <%= s1.getName() %></div>
	<div>나이: <%= s1.getAge() %></div> 
	<div>주소: <%= s1.getAddress() %></div>
	
	<div>이름: ${s1.getName()}</div>
	<div>나이: ${s1.age} getAge()</div> <!-- s1.age > s1.getAge() -->
	<div>주소: ${s1["address"]}</div>
	
	
	<%
		Student s2 = null;
		request.setAttribute("s2", s2);
		
		String s3 = "홍길동";
		request.setAttribute("s3", s3);
	%>
	
	<div><%= s2 == null %></div>
	<div>${s2 == null}</div>
	<div>${empty s2}</div>
	
	<div>null: ${s3 == null}</div>
	<div>"": ${s3.equals("")}</div>
	<div>문자열 없냐?: ${s3 == null || s3.equals("")}</div>
	<div>문자열 없냐?: ${empty s3}</div>
	<div>문자열 없냐?: ${empty s4}</div>
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://bit.ly/4cMuheh"></script>
	<script>
	
	</script>
</body>
</html>