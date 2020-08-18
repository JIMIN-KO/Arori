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
<script src="${pageContext.request.contextPath }/resources/js/member/firebase_client.js"></script>
<!-- 로그인 JavaScript -->
<script src="${pageContext.request.contextPath }/resources/js/member/login.js"></script>
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
