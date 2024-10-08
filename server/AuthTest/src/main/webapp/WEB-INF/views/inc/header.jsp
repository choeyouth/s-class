<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<header>
	<h1>JSP 인증 + 허가</h1>
	<ul>
		<li><a href="/auth/index.do">Index</a></li>
		
		<c:if test="${empty auth}">
		<li><a href="/auth/auth/login.do">Login</a></li>
		</c:if>
		
		<c:if test="${not empty auth}">
		<li><a href="/auth/auth/logout.do">Logout</a></li>
		</c:if>
		
<%--    <c:if test="${not empty auth}">
		<li><a href="/auth/member/member.do">Member</a></li>
		</c:if> --%>
		
		<c:if test="${empty auth}">
		<li><a href="#!" onclick="alert('회원만 접근 가능합니다.')">Member</a></li>
		</c:if>
		
		<c:if test="${not empty auth}">
		<li><a href="/auth/member/member.do">Member</a></li>
		</c:if>

		<c:if test="${empty auth or lv == 1}">
		<li><a href="#!">Administrator</a></li>
		</c:if>

		<c:if test="${not empty auth and lv == 2}">
		<li><a href="/auth/admin/admin.do">Administrator</a></li>
		</c:if>
		

	</ul>
</header>    	