<%@page import="com.kh.arori.entity.MemberDto"%>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h1>신고글 작성</h1>

<form action="write" method="post">
신고자아이디 <input type="text" name="report_member" placeholder="아이디를 입력해주세요">
<br><br>
신고유형
<select name="report_type">
	<option value="유언비어" selected="selected">유언비어</option>
	<option value="욕설">욕설</option>
	<option value="불법 광고">불법 광고</option>
	<option value="저작권">저작권</option>
	<option value="기타">기타</option>
</select>

<br><br>
신고내용 <textarea name="report_content" placeholder="내용을 입력해주세요"></textarea>
<br><br>
신고아이디 <input type="text" name="report_crimi" placeholder="신고할 아이디">
<br><br>
<input type="submit" value="신고하기">
</form>