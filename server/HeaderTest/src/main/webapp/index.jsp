<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<head>
    <title>ReBook</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <style>
        /* CSS 스타일 추가 */
        /* 로그인 메뉴 li에 상대 위치 설정 */
        .login-menu {
            position: relative; /* 부모 요소를 기준으로 드롭다운 위치 설정 */
        }

        /* 드롭다운 기본 스타일 설정 */
        .login-dropdown {
            display: none; /* 기본적으로 숨김 */
            position: absolute; /* 부모 요소에 대해 절대 위치 */
            background-color: #fff;
            padding: 10px; /* 드롭다운 패딩 조정 */
            width: 200px; /* 드롭다운 너비 */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
            z-index: 1000; /* 드롭다운이 상위에 나타나도록 설정 */
            border-radius: 8px; /* 모서리 둥글게 */
            top: 100%; /* 부모 요소의 아래쪽에 위치 */
            left: 50%; /* 부모 요소의 가운데에 맞춤 */
            transform: translateX(-50%); /* 수평 가운데 정렬 */
        }

        /* 로그인 메뉴에 마우스를 올렸을 때 드롭다운 표시 */
        .login-menu:hover .login-dropdown {
            display: block; /* 로그인 메뉴에 마우스를 올리면 드롭다운 표시 */
        }

        /* 드롭다운 항목 스타일 */
        .login-dropdown ul {
            list-style: none; /* 리스트 스타일 제거 */
            padding: 0; /* 패딩 제거 */
            margin: 0; /* 마진 제거 */
        }

        .login-dropdown li {
            padding: 15px 0; /* 항목 패딩 (위아래로 넓힘) */
        }

        .login-dropdown li a {
            color: #333; /* 텍스트 색상 */
            text-decoration: none; /* 밑줄 제거 */
            display: block; /* 전체 영역을 클릭 가능하게 */
            text-align: center; /* 텍스트 가운데 정렬 */
        }

        /* 드롭다운 항목 hover 시 배경색 변경 */
        .login-dropdown li:hover {
            background-color: #f1f1f1; /* hover 시 배경색 변경 */
        }
    </style>
</head>
<header class="homepage is-preload">
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
                    <c:if test="${empty auth}">
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
                    <c:if test="${not empty auth}">
                        <a href="#">홍길동님 환영합니다.</a>
                    </c:if>
                </li>
            </ul>
        </nav>
    </div>

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.dropotron.min.js"></script>
    <script src="assets/js/jquery.scrolly.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
</header>

