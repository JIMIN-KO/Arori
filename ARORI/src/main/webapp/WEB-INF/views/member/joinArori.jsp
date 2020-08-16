<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 및 소셜 로그인</title>
<!-- Ajax -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.min.js" integrity="sha512-VZ6m0F78+yo3sbu48gElK4irv2dzPoep8oo9LEjxviigcnnnNvnTOJRSrIhuFk68FMLOpiNz+T77nNY89rnWDg==" crossorigin="anonymous"></script>
</head>
<body>
	<h1>회원 가입 (아로리)</h1>
	<form action="joinArori" method="post">
		<input type="text" name="member_id" placeholder="ID">
		<br><br>
		<input type="password" name="member_pw" placeholder="Password">
		<br><br>
		<input type="text" name="member_email" placeholder="Email">
		<br><br>
		<input type="text" name="member_nick" placeholder="Nick">
		<br><br>
		<input type="text" name="member_phone" placeholder="Phone">
		<br><br>
		<select name="member_q">
			<c:forEach var="passwordQ" items="${passwordQ }">
				<option value="${passwordQ.pq_no }">${passwordQ.pq_content }</option>
			</c:forEach>
		</select>
		<br><br>
		<input type="text" name="member_a" placeholder="Answer">
		<br><br>
		<input type="submit" value="회원 가입">
	</form>
</body>
</html>