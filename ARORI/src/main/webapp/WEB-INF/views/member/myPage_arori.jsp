<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h1>아로리 회원</h1>
<h1>aroriMyPage</h1>


 <div>아이디 ${memberDto.member_id}</div><!-- MEMBER테이블 -->
 <div>닉네임  ${memberDto.member_nick}</div><!-- MEMBER테이블 -->
 <div>핸드폰 번호 ${aroriMemberDto.member_phone} </div> <!--ARORI_MEMBER테이블  -->	
 <div>이메일  ${aroriMemberDto.member_email }</div>   <!--ARORI_MEMBER테이블  -->	
 <div>마지막로그인 ${memberDto.member_login }  </div><!--MEMBER테이블--> 
 <div>회원가입일시  ${memberDto.member_join }</div> <!--MEMBER테이블--> 	
 <div>회원상태  ${memberDto.member_state } </div><!--MEMBER테이블 -->
 
  <button onClick=location.href='${pageContext.request.contextPath}/member/updateArori' >정보수정 </button>
  
  <button onClick=location.href='${pageContext.request.contextPath}/member/changePW' >비밀번호변경 </button>
 <button onClick=location.href='${pageContext.request.contextPath}/member/delete' >탈퇴하기 </button>

<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>
