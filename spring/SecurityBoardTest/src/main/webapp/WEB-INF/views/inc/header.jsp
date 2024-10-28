<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<header>
	
	<sec:authorize access="isAnonymous()">
	<h1>Spring Security</h1>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_MEMBER') and !hasRole('ROLE_ADMIN')">
	<h1 style="color: cornflowerblue;">Spring Security</h1>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_ADMID')">
	<h1 style="color: tomato;">Spring Security</h1>
	</sec:authorize>
	
	<ul>
		<li><a href="/spring/index.do">Index</a></li>
	
		<sec:authorize access="isAnonymous()">
		<li><a href="/spring/member/login.do">Login</a></li>
		</sec:authorize>
		
		<sec:authorize access="isAuthenticated()">
		<li><a href="/spring/member/logout.do">Logout</a></li>
		</sec:authorize>
		
		<li><a href="/spring/board/list.do">Board</a></li>
	</ul>
</header>





