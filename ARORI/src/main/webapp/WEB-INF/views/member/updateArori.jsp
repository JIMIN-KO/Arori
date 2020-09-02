<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script>

   	 $(document).ready(function(){

    	$("#update").click(function(){

    if(confirm("수정하시겠습니까?")){
        document.form.action="${path}/arori/member/myPage";
        document.form.submit();

   			 }
		});

    });


</script>
</head>
<body>
<form action="updateArori" method="post" name="form">
	<!-- 세션에 있는 아이디 불러오는 것 추가 -->
	<h1>정보수정</h1>
	<input type="hidden" value="${aroriMemberDto.member_no}">
	<br><br>
	password
	<input type="password" name="member_pw" value="${aroriMemberDto.member_pw}"> 
	<br><br> 
	email
	<input type="text" name="member_email" value="${aroriMemberDto.member_email}" required="required">
	 <br><br> 
	phone 
	<input type="text" name="member_phone"value="${aroriMemberDto.member_phone}" placeholder="PHONE" required="required"> 
		<br><br> 

	<input type="submit" value="수정" id="update">
	
</form>
</body>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>
