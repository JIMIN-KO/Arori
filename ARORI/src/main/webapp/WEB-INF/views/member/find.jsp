<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 / 비밀번호 찾기</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.min.js" integrity="sha512-VZ6m0F78+yo3sbu48gElK4irv2dzPoep8oo9LEjxviigcnnnNvnTOJRSrIhuFk68FMLOpiNz+T77nNY89rnWDg==" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha256-4+XzXVhsDmqanXGHaHvgh1gMQKX40OUvDEBTu8JcmNs=" crossorigin="anonymous"></script>
<script>
	function findId() {
		var formData = $("#findId").serialize();
		console.log(formData);

		axios({
			url: "${pageContext.request.contextPath}/nonMemberAjax/findId",
			method: "post",
			data: formData,
			processData: false,
            contentType: false
		}).then(function(resp){
			console.log(resp);
			var idResult = document.querySelector("#idResult");

			idResult.textContent = "";
			
			var h3 = document.createElement("h3");
			h3.textContent = "Your ID > " + resp.data;

			idResult.appendChild(h3);
		})
		
	}

	function findPw() {
		var formData = $("#findPw").serialize();
		console.log(formData);

		axios({
			url: "${pageContext.request.contextPath}/nonMemberAjax/findPw",
			method: "post",
			data: formData,
			processData: false,
			contentType: false
		}).then(function(resp) {
			console.log(resp.data);
			var pwResult = document.querySelector("#pwResult");
			pwResult.textContent = "";

			var h3 = document.createElement("h3");
			h3.textContent = "임시 비밀번호 발급 완료";
			var h4 = document.createElement("h4");
			h4.textContent = resp.data + " > 임시 비밀번호를 회원님의 이메일로 발급했습니다.";

			pwResult.appendChild(h3);
			pwResult.appendChild(h4);
		})
	}
</script>
</head>
<body>
	<h1>Find ID</h1>
	<br>
	<form id="findId" method="post">
		<input type="text" name="member_phone" placeholder="HP">
		<select name="member_q">
			<c:forEach var="passwordQ" items="${passwordQ}">
				<option value="${passwordQ.pq_no}">${passwordQ.pq_content}</option>
			</c:forEach>
		</select>
		<input type="text" name="member_a" placeholder="Answer">
		<input type="button" value="Find ID" onclick="findId();">
	</form>
	<br>
		<div id="idResult">
			
		</div>
	<br>
	<br><hr><br>
	
	<h1>Find PW</h1>
	<br>
	<form id="findPw" method="post">
		<input type="text" name="member_id" placeholder="ID">
		<select name="member_q">
			<c:forEach var="passwordQ" items="${passwordQ}">
				<option value="${passwordQ.pq_no}">${passwordQ.pq_content}</option>
			</c:forEach>
		</select>
		<input type="text" name="member_a" placeholder="Anwser">
		<input type="button" value="Find PW" onclick="findPw();">
	</form>
	<br>
		<div id="pwResult">
			
		</div>
	<br>
</body>
</html>