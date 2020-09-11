<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 이미지 등록</title>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
</head>
<body>
	<form action="/arori/imgAjax/classes/upload/${c_no}" method="post"
		enctype="multipart/form-data">
		<input type="file" accept=".jpg, .png, .jpeg" name="req">
		<button type="submit">이미지 등록</button>
	</form>
	<button name="close">창 닫기</button>
	<script>
		
	</script>
</body>
</html>