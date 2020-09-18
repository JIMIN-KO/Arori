<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<meta charset="UTF-8">


<Style>
	* {
	font-family: 'Do Hyeon', sans-serif;
	}
	
	/* 배경 */
	background-color {
		#4A70F6;	
	}

	/* 로고 */
	.logo {
		width:350px;
		height:350px;
		padding:3px;
		border-radius: 100%;
		background-color: white;
		position:absolute;
	    top:25%;
	    left:40%;
	}

	/* 문구 */
	.message {
		color : white;
		font-size:40px;
	    text-align: center;
	    margin-top:630px;
	}
	
	/*홈으로 돌아가기*/
	.gohome {
	text-align:center;
	}
	a {
		color : rgb(35, 85, 173);
		font-size: 30px;
	    text-align: center;
	    margin-top:80px;
	    text-decoration:none;
	}
	
	a:hover {
		text-decoration:none;
	}


</style>

</head>

<body class="bg-primary">


	 <img alt="arori" src="${pageContext.request.contextPath }/resources/img/arori_logo.png" class="logo">
	 <div class="message">
	 	"현재 서비스의 상태가 원활하지 않습니다."
	 </div>

	 <div class="gohome">
		 <a href="#" onClick="history.back()">
		 	이전 페이지로 돌아가기		 
		 </a>
	 </div>
</body>

</html>


