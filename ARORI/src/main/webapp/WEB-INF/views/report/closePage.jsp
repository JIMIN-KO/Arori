<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Arori | 당신의 지식</title>
</head>
<body>
	<script>
		// ?close  > 신고 후 해당 팝업창 닫기
		var param = location.search
		console.log(param)
		if (param === '?close') {
			console.log(param)
			window.close();
		}
	</script>
</body>
</html>