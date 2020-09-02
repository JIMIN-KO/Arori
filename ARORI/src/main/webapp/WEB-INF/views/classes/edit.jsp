<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>클래스 정보 수정 페이지</h2>
	<form action="edit" method="post">

		<input type="hidden" name="c_no" value="${c_no}"> 
		클래스 이름 : <input type = "text" class="c_title" value="${classesDto.c_title}">
		클래스 정보 : <input type = "text" class="c_info" value="${classesDto.c_info}">
		<div>회원 닉네임 : ${userinfo.member_nick }</div>
		
			공개 여부 :
			<select name="c_public">
				<option value=1>공개</option>
				<option value=0>비공개</option>
			</select>
		
		<div>등록 시간 : ${classesDto.c_when}</div>

		<a href="redirect:/detail/{c_no}">
			<button id='btn' name="edit">취소</button>
		</a>

		<button type="submit">생성</button>

	</form>

</body>
</html>