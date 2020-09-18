<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>

<Style>
	/* 배경 */
	background-color {
		#4A70F6;	
	}
	
	bg-primary {
		text-align:center;
	}

	/* 로고 */
	.logo {
		width:400px;
		height:400px;
	}

	/* 문구 */
	.message {
		color : white;
	}
</Style>

</head>

<body class="bg-primary">


	 <img alt="arori" src="${pageContext.request.contextPath }/resources/img/arori_logo.png" class="logo">
	 <div class="message">
	 	현재 서비스의 상태가 원활하지 않습니다.
	 </div>
</body>

</html>



