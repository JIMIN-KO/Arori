<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 / 비밀번호 찾기</title>
</head>
<body>
	<h1>Find ID</h1>
	<br>
	<form action="findId" method="post">
		<input type="text" name="member_phone" placeholder="HP">
		<select name="member_q">
			<c:forEach var="passwordQ" items="${passwordQ}">
				<option value="${passwordQ.pq_no}">${passwordQ.pq_content}</option>
			</c:forEach>
		</select>
		<input type="text" name="member_a" placeholder="Answer">
		<input type="submit" value="Find ID">
	</form>
	
	<br><hr><br>
	
	<h1>Find PW</h1>
	<br>
	<form action="findPw" method="post">
		<input type="text" name="member_id" placeholder="ID">
		<select name="member_q">
			<c:forEach var="passwordQ" items="${passwordQ}">
				<option value="${passwordQ.pq_no}">${passwordQ.pq_content}</option>
			</c:forEach>
		</select>
		<input type="text" name="member_a" placeholder="Anwser">
		<input type="submit" value="Find PW">
	</form>
</body>
</html>