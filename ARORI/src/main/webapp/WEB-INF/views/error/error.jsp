<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<title>Arori | 당신의 지식</title>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<meta charset="UTF-8">


<Style>
	* {
	font-family: 'Do Hyeon', sans-serif;
	}
	
	body {
		background-color: rgb(74, 112, 223);
	}

	/* 로고 */
	.logo {
		width:350px;
		height:350px;
		padding:3px;
		border-radius: 100%;
		background-color: white;
	}

	/* 문구 */
	.message {
		color : white;
		font-size:40px;
	    text-align: center;
	}
	
	/*홈으로 돌아가기*/
	.gohome {
	text-align:center;
	}
	a {
		color : rgb(35, 85, 173);
		font-size: 30px;
	    text-align: center;
	    text-decoration:none;
	}
	
	a:hover {
		text-decoration:none;
	}


</style>

</head>

<body>

	 <div class="container-fluid w-100">
	 	<div class="row w-100 mt-5">
	 		<div class="col-12 w-100 d-flex justify-content-center mt-5 w-100">	
	 			<div class="row mt-5">	 			
				 	<img alt="arori" src="${pageContext.request.contextPath }/resources/img/arori_logo.png" class="logo mt-5">
	 			</div>
	 		</div>
	 	</div>
	 	<div class="row w-100 mt-5">
	 		<div class="col-12 w-100">
	 			<div class="row d-flex justify-content-center ">	 			
		 			<div class="message">
					 	"현재 서비스의 상태가 원활하지 않습니다."
					 </div>
	 			</div>
	 			<div class="row d-flex justify-content-center ">
					<div class="gohome">
						<a href="#" onClick="history.back()" class="text-warning">이전 페이지로 돌아가기</a>
					</div>
	 			</div>
	 		</div>
	 	</div>
	 </div>
</body>

</html>



