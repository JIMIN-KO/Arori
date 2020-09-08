<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="memberProfile" method="post">

<h1>관리자만 볼 수 있는 회원페이지</h1>
번호
<input type="hidden" value="${memberDto.member_no}" readonly="readonly"><br>
아이디
<input type="text" value="${memberDto.member_id}" readonly="readonly"><br>
회원구분
<input type="text" value="${memberDto.member_state}" readonly="readonly"><br>
닉네임
<input type="text" value="${memberDto.member_nick}" readonly="readonly"><br>
이메일
<input type="text" value="${memberDto2.member_email}" readonly="readonly"><br>
핸드폰번호
<input type="text" value="${memberDto2.member_phone}" readonly="readonly"><br>
가입날짜
<input type="text" value="${memberDto.member_join}" readonly="readonly"><br>
로그인일시
<input type="text" value="${memberDto.member_login}" readonly="readonly"><br>
회원상태
<input type="text" value="${memberDto.report_state}" readonly="readonly"><br>
<a href="${pageContext.request.contextPath}/admin/adminUpdate/${memberDto.member_id}">수정하기</a>
<a href="${pageContext.request.contextPath}/admin/resultMap">회원 목록으로 돌아가기</a>






</form>