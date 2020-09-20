<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_myPage_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                        <br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">Exit</h1>
                        </div>
                        <hr><br>
                        	<div class="card mt-3 mb-3 mr-5 ml-5">
                        	<div class="card-header bg-primary text-white font-weight-bold mb-3" style="font-size: 1.5rem;">
                        		회원 탈퇴	
                        	</div>
						  <div class="card-body text-center">
						  	<h2 class="font-weight-bolder">${member.member_id}님 정말 탈퇴를 진행하시겠습니까?   </h2>
						  	<br><hr><br>
					        <h5>탈퇴 시 데이터는 즉시 삭제되며 복구가 불가능합니다.<br> 회원 탈퇴 시 신중히 진행해주시길 바랍니다.</h5>
					        <br>
					        <h5> 회원탈퇴에 동의 하신다면 아래 체크박스 체크후 탈퇴하기 버튼을 눌러주세요 .</h5>
						   	<form action="delete" method="post"  class="mt-5">
								<input type="checkbox" name="agree" onClick="agreeCheck(this.form)">
									<span class="font-weight-bolder text-danger">동의합니다.</span>
					        			<br><hr><br>
								    <input type="hidden" name=member_no value="${member.member_no}">
									<button type="submit" name="checkButton"  class="btn btn-lg btn-warning font-weight-bold" disabled>탈퇴하기</button>
								</form>
						  </div>
						</div>		
                    </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>
<script>
//체크 박스 체크시에만 버튼 활성화 
function agreeCheck(frm)
{
   if (frm.checkButton.disabled==true)
    frm.checkButton.disabled=false
   else
    frm.checkButton.disabled=true
}
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>
