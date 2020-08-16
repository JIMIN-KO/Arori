<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 / 비밀번호 찾기 결과</title>
</head>
<body>
	<h1>
		<c:choose>
			<c:when test="${not empty findId}">
				${findId.member_id}
				<%session.removeAttribute("findId"); %>
			</c:when>
			<c:when test="${not empty findPw}">
				${findPw} @ *** 로 임시 비밀번호를 발송했습니다. 로그인 후 정보를 수정해주세요.
				<%session.removeAttribute("findPw"); %>
			</c:when>
			<c:when test="${findPw == null || findId == null}">
				해당하는 정보가 없습니다.
			</c:when>
		</c:choose>
	</h1>
</body>
</html>