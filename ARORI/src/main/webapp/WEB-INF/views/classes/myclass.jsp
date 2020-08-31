<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>마이클래스</h1>
<a href="${pageContext.request.contextPath}/classes/create"><button>클래스 만들기</button></a>

</body>
</html> 

<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>