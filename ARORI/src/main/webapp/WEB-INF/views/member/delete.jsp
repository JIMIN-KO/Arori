<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<jsp:include page="/WEB-INF/views/template/home_header.jsp"></jsp:include>
				<div class="row mt-3">
					<div class="offset-1 col-10 font-italic font-weight-light text-left">
						<a class="text-link" style="cursor: pointer; color: gray;" href="${pageContext.request.contextPath }">
							&laquo; &#32;Back
						</a>
					</div>
				</div>

	<div><h2>탈퇴안내</h2></div>	
	<div>${member.member_id}님 정말 탈퇴하실거에요?    </div>
	
        <div>탈퇴시 데이터는 즉시 삭제되며 복구가 불가능합니다 회원 탈퇴시 신중히 진행해주시길 바랍니다.</div>
        <div> 회원탈퇴에 동의 하신다면 아래 체크박스 체크후 탈퇴하기 버튼을 눌러주세요 .</div>


<form action="delete" method="post" >
<input type="checkbox" name="agree" onClick="agreeCheck(this.form)">
동의합니다.
    <input type="hidden" name=member_no value=${member.member_no}>
	<button type="submit" name="checkButton"  disabled>탈퇴하기</button>
</form>
</body>
</html>