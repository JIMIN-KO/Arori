<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_myPage_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                        <br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">My Info | Social</h1>
                        </div>
                        <hr><br>
						 <div>아이디 ${memberDto.member_id}</div><!-- MEMBER테이블 -->
						 <div>닉네임  ${memberDto.member_nick}</div><!-- MEMBER테이블 -->
						 <div>핸드폰 번호 ${aroriMemberDto.member_phone} </div> <!--ARORI_MEMBER테이블  -->	
						 <div>이메일  ${aroriMemberDto.member_email }</div>   <!--ARORI_MEMBER테이블  -->	
						 <div>마지막로그인 ${memberDto.member_login }  </div><!--MEMBER테이블--> 
						 <div>회원가입일시  ${memberDto.member_join }</div> <!--MEMBER테이블--> 	
						 <div>회원상태  ${memberDto.member_state } </div><!--MEMBER테이블 -->
						 <button onClick=location.href='${pageContext.request.contextPath}/member/delete' >탈퇴하기 </button>
                    </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>
<script>

</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>