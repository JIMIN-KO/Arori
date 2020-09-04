<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>소셜 회원</h1>
<h1>socialMyPage</h1>
 <div>아이디 ${memberDto.member_id}</div><!-- MEMBER테이블 -->
 <div>닉네임  ${memberDto.member_nick }</div> <!-- MEMBER테이블 -->
 <div>마지막로그인 ${memberDto.member_nick }  </div><!--MEMBER테이블--> 
 <div>회원상태  ${memberDto.member_state } </div><!--MEMBER테이블 -->
 <div>회원가입일시  ${memberDto.member_join }</div> <!--MEMBER테이블--> 	





<%-- 
<h1>myPage</h1>
 <form action="socialMyPage" method="post">

<input type="hidden" value="${memberDto.getMember_no()}">
닉네임
<input type = "text" value="${ memberDto.getMember_nick}" readonly="readonly">
<br>
가입날짜
<input type ="text" value="${memberDto.member_join}" readonly="readonly">
<br>
<a href=""><input type="button"></a> 

 --%>
 --%><jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>