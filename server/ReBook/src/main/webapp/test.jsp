<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Book Search</title>
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
    <h1>책 검색</h1>
    <form action="bookSearch" method="post">
        <label for="title">책 제목:</label>
        <input type="text" id="title" name="title" required />
        <button type="submit">검색</button>
    </form>

    <div id="searchResult">
        <h2>검색 결과</h2>
        <p id="resultMessage"></p>
    </div>
</body>
</html>
