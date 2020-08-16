<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 및 소셜 로그인</title>
<!-- Ajax -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.min.js" integrity="sha512-VZ6m0F78+yo3sbu48gElK4irv2dzPoep8oo9LEjxviigcnnnNvnTOJRSrIhuFk68FMLOpiNz+T77nNY89rnWDg==" crossorigin="anonymous"></script>
<!-- Firebase -->
<script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-app.js"></script>
<!-- Firebase > 사용하고자 하는 app -->
<script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-firestore.js"></script>
<!-- Firebase 클라이언트 -->
<script src="${pageContext.request.contextPath }/resources/js/member/firebase_client.js"></script>
<!-- Firebase Style js / css -->
<script src="https://cdn.firebase.com/libs/firebaseui/3.5.2/firebaseui.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.firebase.com/libs/firebaseui/3.5.2/firebaseui.css" />
<!-- 로그인 JavaScript -->
<script src="${pageContext.request.contextPath }/resources/js/member/login.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/login.css">
</head>
<body>
	<h1>Sign In</h1>
	<form action="loginSuccess" method="post">
		<input type="text" name="member_id" placeholder="ID">
		<br><br>
		<input type="password" name="member_pw" placeholder="Password">
		<br><br>
		<input type="submit" value="Sing In">
		<br><br>
	</form>
<!-- 로그인 버튼 -->
	<div>
		<div onclick="login(this);" id="google" class="firebaseui-idp-button mdl-button mdl-js-button mdl-button--raised firebaseui-idp-google firebaseui-id-idp-button">
			<span class="firebaseui-idp-icon-wrapper">
				<img src="https://www.gstatic.com/firebasejs/ui/2.0.0/images/auth/google.svg" class="firebaseui-idp-icon">
			</span>
			<span class="firebaseui-idp-text firebaseui-idp-text-long">Sign in with Google</span>
			<span class="firebaseui-idp-text firebaseui-idp-text-short">Google</span>
		</div>
		<div onclick="login(this);" id="github" class="firebaseui-idp-button mdl-button mdl-js-button mdl-button--raised firebaseui-idp-github firebaseui-id-idp-button">
			<span class="firebaseui-idp-icon-wrapper">
				<img src="https://www.gstatic.com/firebasejs/ui/2.0.0/images/auth/github.svg" class="firebaseui-idp-icon">
			</span>
			<span class="firebaseui-idp-text firebaseui-idp-text-long">Sign in with Github</span>
			<span class="firebaseui-idp-text firebaseui-idp-text-short">Github</span>
		</div>
		<div onclick="login(this);" id="arori" class="firebaseui-idp-button mdl-button mdl-js-button mdl-button--raised firebaseui-idp-twitter firebaseui-id-idp-button">
			<span class="firebaseui-idp-icon-wrapper">
				<img src="${pageContext.request.contextPath}/resources/img/arori_logo.png" class="firebaseui-idp-icon">
			</span>
			<span class="firebaseui-idp-text firebaseui-idp-text-long">Sign in with Arori</span>
			<span class="firebaseui-idp-text firebaseui-idp-text-short">Arori</span>
		</div>
	</div>
</body>
</html>