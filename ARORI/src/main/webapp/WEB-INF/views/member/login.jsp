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
<script>
	// Your web app's Firebase configuration
	var firebaseConfig = {
		apiKey : "AIzaSyD_SXWgHkEe9FSR2k6T5HT_V-IPSFgcqX0",
		authDomain : "d0-project.firebaseapp.com",
		databaseURL : "https://d0-project.firebaseio.com",
		projectId : "d0-project",
		storageBucket : "d0-project.appspot.com",
		messagingSenderId : "684872143927",
		appId : "1:684872143927:web:eb18bd47cbfd7a8fbbdbb2",
		measurementId : "G-63NPBL99Q9"
	};
	// Initialize Firebase
	firebase.initializeApp(firebaseConfig);
	firebase.analytics();
</script>
<!-- Firebase Style js / css -->
<script src="https://cdn.firebase.com/libs/firebaseui/3.5.2/firebaseui.js"></script>
<link type="text/css" rel="stylesheet" href="https://cdn.firebase.com/libs/firebaseui/3.5.2/firebaseui.css" />
<script>	
	// 참고 사이트
	// > http://blog.naver.com/PostView.nhn?blogId=wj8606&logNo=221206395970

	// 로그인
	function login(tag) {

		var tag = tag.id;
		var provider;
		
		if(tag == "google") {
			provider = new firebase.auth.GoogleAuthProvider();
		} else if(tag == "github") {
			provider = new firebase.auth.GithubAuthProvider();
		} else {
			window.location.href = "joinArori";
		}
		//인증서비스 제공업체설정
		
		//로그인창 호출
		firebase.auth().signInWithPopup(provider);
		
		//공식API 활용 예제
		firebase.auth().signInWithPopup(provider).then(function(result) {
			
			var emailPath = result.additionalUserInfo.providerId;
			var memberNick = result.user.displayName;
			var loginEmail = result.user.email;
			
			axios({
				url:"${pageContext.request.contextPath}/memberAjax/checkEmail?member_id=" + loginEmail,
				method:"get"
				}).then(function (resp) {
					console.log(resp)
					if(!resp.data) {
						// 소셜 로그인 > 로그아웃 
						this.logout();
						
						// 회원가입 페이지로 이동 
						window.location.href = "joinSocial?emailPath=" + emailPath + "&member_id=" + loginEmail + "&member_nick=" + memberNick;
					} else {
						// 해당 소셜 아이디가 있을 경우 > 홈으로 
						window.location.href = "loginSuccess?member_id=" + loginEmail;
					}
				})
			  
		  var token = result.credential.accessToken;
		  var user = result.user;

		}).catch(function(error) {
		  var errorCode = error.code;
		  var errorMessage = error.message;
		  var email = error.email;
		  var credential = error.credential;
		});	
	}
	
	// 로그아웃
	function logout() {
		firebase.auth().signOut().then(function() {
			  // Sign-out successful.
			  console.log("로그아웃 성공")
		}).catch(function(error) {
			  // An error happened.
		});
	}
	
	// 정보 가지고 오기
	firebase.auth().onAuthStateChanged(function(user) {

	});
</script>

<style>
	.firebaseui-idp-button {
		min-height: 20px;
		max-width: 155px;
	}
	
	.firebaseui-idp-twitter {
		background-color: #4A70F6;
	}
	
	body {
		text-align: center;
	}
</style>
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