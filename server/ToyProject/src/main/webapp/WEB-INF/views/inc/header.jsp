<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<header>
	<h1>
		<c:if test="${empty auth}">
		<span>Toy</span>
		</c:if>
		
		<c:if test="${not empty auth and lv == '1'}">
		<span style="color: cornflowerblue;">Toy</span>
		</c:if>
		
		<c:if test="${not empty auth and lv == '2'}">
		<span style="color: tomato;">Toy</span>
		</c:if>
		
		Project
	</h1>
	<ul>
		<li><a href="/toy/index.do">Home</a></li>
		<li><a href="/toy/board/list.do">Board</a></li>

		
		<c:if test="${empty auth}">
		<li><a href="/toy/user/register.do">Register</a></li>
		<li><a href="/toy/user/login.do">Login</a></li>
		</c:if>
		
		<c:if test="${not empty auth}">
		<li><a href="/toy/user/info.do">Info</a></li>
		<li><a href="/toy/user/unregister.do">Unregister</a></li>
		<li><a href="/toy/user/logout.do">Logout</a></li>
		</c:if>
	</ul>
</header> 