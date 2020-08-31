<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴페이지에요</title>
</head>
<body>

	<div>${member.member_id}${member.member_no}님 정말 탈퇴하실거에요? 탈퇴하시면
		우리가 데이터 가지고 있다가 때되면 삭제시킬겁니다. 탈퇴에 동의하시면 밑의 탈퇴하기 버튼을 눌러주세요</div>


	<label><input type="checkbox" name="agree" value="agree">
		동의합니다.</label>

	<form method="post" action="delete">
		<input type="hidden" name=member_no value=${member.member_no}>

		<input type="submit" value="탈퇴하기">
	</form>

</body>
</html>