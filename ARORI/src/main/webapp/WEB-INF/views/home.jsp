<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
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

	// 로그아웃
	function logout() {
		firebase.auth().signOut().then(function() {
			  // Sign-out successful.
			  console.log("로그아웃 성공")
			  window.location.href = "member/logout";
		}).catch(function(error) {
			  // An error happened.
		});
	}
</script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<hr>
<h2>${userinfo.member_id }</h2>
<button onclick="logout();">Logout</button>
</body>
</html>
