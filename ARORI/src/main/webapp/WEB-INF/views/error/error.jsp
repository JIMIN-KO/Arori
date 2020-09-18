<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>

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
</style>

</head>

<body class="bg-primary">


	 <img alt="arori" src="${pageContext.request.contextPath }/resources/img/arori_logo.png" class="logo">
	 <div class="message">
	 	"현재 서비스의 상태가 원활하지 않습니다."
	 </div>
</body>

</html>



