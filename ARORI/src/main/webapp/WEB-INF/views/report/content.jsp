<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

//수정중

</script>

</head>
<body>
    
<h1>신고접수된 내용 확인하기</h1>

신고번호
<input name="report_member" value="${reportDto.report_no}" readonly="readonly">
<br>

신고한 날짜
<br>
<input name="report_member" value="${reportDto.report_date}" readonly="readonly">
<br>
신고한 회원
<input name="report_member" value="${reportDto.report_member}" readonly="readonly">
<br>
신고당한 회원
<input name="report_member" value="${reportDto.report_crimi}" readonly="readonly">
<br>
신고유형
<input name="report_member" value="${reportDto.report_type}" readonly="readonly">
<br>
신고내용
<textarea name= "report_member"  readonly="readonly">${reportDto.report_content}
</textarea>
<button><a href="${pageContext.request.contextPath}/admin/adminUpdate/${reportDto.report_crimi}">상태변경하기</a></button>
<button><a href="${pageContext.request.contextPath}/report/list">목록으로 돌아가기</a></button>
<form action="delete" method="post">
<button type="submit" value="삭제하기">
</form>
<br>


</body>
</html>
