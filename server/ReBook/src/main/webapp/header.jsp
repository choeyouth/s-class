<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<head>
    <title>ReBook</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="/rebook/assets/css/main.css" /> 
</head>
<header class="login-header">
    <div id="page-wrapper">
        <!-- Nav -->
        <nav id="nav">
            <ul>
                <li class="current"><a href="index.jsp">Home</a></li>
                <li onclick="location.href='/mybook/list.do';">
                    <a>나의 책</a>
                    <ul>
                        <li onclick="location.href='/mybook/reviewlist.do';"><a>리뷰</a></li>
                        <li onclick="location.href='/mybook/lanklist.do';"><a href="#">평점</a></li>
                        <li onclick="location.href='/mybook/marklist.do';"><a href="#">북마크</a></li>
                    </ul>
                </li>
                <li onclick="location.href='/preference/booklist.do';"><a>추천 도서</a></li>
                <li onclick="location.href='/discussion/boardlist.do';"><a>토론 게시판</a></li>
                <li>
                    <a href="#">검색</a>
                    <ul>
                        <li onclick="location.href='/book/search.do';"><a>도서</a></li>
                        <li onclick="location.href='/word/search.do';"><a>단어</a></li>
                        <li onclick="location.href='/quote/search.do';"><a>명언</a></li>
                    </ul>
                </li>
                <li onclick="location.href='/library/search.do';">
                    <a>도서관 찾기</a>
                </li>
                <li class="login-menu" onclick="location.href='/user/login.do';">
                    <c:if test="${empty seq}">
                        <a href="#" class="dropdown">로그인</a>
                        <!-- 
                        <div class="login-dropdown">
                            <ul>
                                <li onclick="location.href='/user/login.do';"><a>로그인</a></li>
                                <li onclick="location.href='/user/signup.do';"><a>회원가입</a></li>
                            </ul>
                        </div>
                        -->
                    </c:if>
                    <c:if test="${not empty seq}">
                        <a href="#">홍길동님 환영합니다.</a>
                    </c:if>
                </li>
            </ul>
        </nav>
    </div>

    <!-- Scripts -->
    <script src="/rebook/assets/js/jquery.min.js"></script>
    <script src="/rebook/assets/js/jquery.dropotron.min.js"></script>
    <script src="/rebook/assets/js/jquery.scrolly.min.js"></script>
    <script src="/rebook/assets/js/browser.min.js"></script>
    <script src="/rebook/assets/js/breakpoints.min.js"></script>
    <script src="/rebook/assets/js/util.js"></script>
    <script src="/rebook/assets/js/main.js"></script>
</header>

