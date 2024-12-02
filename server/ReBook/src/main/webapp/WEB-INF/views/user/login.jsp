<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="/rebook/assets/css/main.css">
<link rel="stylesheet" href="/rebook/assets/css/login.css" />
<style>

</style>

<%@include file="/WEB-INF/views/inc/header.jsp" %>

</head>
<body class="loginbody">
<main class="main">

<div class="container" id="container">
  <div class="form-container sign-up-container">
    <form action="#">
      <h1 class="title">계정 생성</h1>  
      <input type="text" placeholder="Name" />
      <input type="email" placeholder="Email" />
      <input type="password" placeholder="Password" />
      <input type="text" name="name" id="name" required class="short" placeholder="Name">
      <input type="text" name="address" id="address" required class="short" placeholder="Address">
      <input type="file" name="pic" id="pic" class="long">
      <div class="btnSignUp">
      	<button>회원가입</button>
      </div>
    </form>
  </div>
  <div class="form-container sign-in-container">
    <form method="POST" action="/rebook/user/login.do">
      <h1 class="title">로그인</h1> 
      <input type="text" placeholder="id" name="id"/>
      <input type="password" placeholder="Password" name="pw"/>
      <a href="#" class="forgot">아이디/비밀번호 찾기</a>
      <button>로그인</button>
    </form>
  </div>
  <div class="overlay-container">
    <div class="overlay">
      <div class="overlay-panel overlay-left">
        <h1 class="titlecomment">다시 오셨군요!</h1>
        <p>이미 계정이 있다면 로그인 해주세요.</p>
        <button class="ghost" id="signIn">로그인</button>
      </div>
      <div class="overlay-panel overlay-right">
        <h1 class="titlecomment">처음이신가요?</h1>
        <p>지금 바로 가입해 보세요!</p>
       	<button class="ghost" id="signUp">회원가입</button>
      </div>
    </div>
  </div>
</div>
</main>
</body>
	<script>

		const signUpButton = document.getElementById('signUp');
		const signInButton = document.getElementById('signIn');
		const container = document.getElementById('container');
	
		signUpButton.addEventListener('click', () => {
		  container.classList.add("right-panel-active");
		});
	
		signInButton.addEventListener('click', () => {
		  container.classList.remove("right-panel-active");
		});

	</script>
</html>
