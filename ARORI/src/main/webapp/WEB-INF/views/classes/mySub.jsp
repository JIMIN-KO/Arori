<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	/* 전체 카드 */
	.card-deck {
		padding-bottom: 40px;
		margin-top: 35px;
	}
	
	/* 이미지 사이즈 */
	.card-img {
	height:200px;
	width:100%;

	}
	
	/* 클래스 제목 링크 색상 제거 */
	a {
	text-decoration: none;
	}
	.btn a {
	text-decoration: none;
	color:#ffffff;
	}
	
	/* 클래스 타이틀 */
	.card-title {
	text-decoration: none;
	color:black;
	}
	
	/* 클래스 정보 */
	.card-info {
	max-height:4.5em;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	text-decoration: none;
	color:#3e3e3e;
	}
	
	/* 버튼 */
	.card-btn {
	display: inline-block;
	}
	
</style>
<div class="row content-top mt-5 h-100">
	<div class="col-12 overflow-auto mt-5">
			<div class="row w-100 m-0">
				<c:forEach var="MCIDto" items="${MCIDto}">
					<div class="col-sm-12 col-md-6 col-lg-3">
						<div class="card-deck">
  							<div class="card">
  								<a href="${pageContext.request.contextPath }/classes/readme/${MCIDto.c_no}">
	  								<c:choose>
										<c:when test="${MCIDto.ai_no > 0}">
											<img src="${pageContext.request.contextPath }/imgAjax/classes/download/${MCIDto.ai_no }" class="card-img" alt="...">
										</c:when>
										<c:otherwise>
											<img src="${pageContext.request.contextPath }/imgAjax/classes/download/57" class="card-img">
										</c:otherwise>
									</c:choose>
								</a>
   								<div class="card-body pb-0">
      								<span class="h4 title font-weight-bold">${MCIDto.c_title}</span>
									<span class="badge badge-pill badge-success ml-2 mb-1 subCount h4">${MCIDto.c_subscribe}</span>
      								<hr>
      								<p class="card-info mt-4">${MCIDto.c_info}</p>
      								<p class="card-nick mb-0 font-weight-bold">
      									<c:choose>
      										<c:when test="${MCIDto.member_nick eq 'null'}">
      											소셜 회원
      										</c:when>
      										<c:otherwise>
			      								${MCIDto.member_nick}  										
      										</c:otherwise>
      									</c:choose>
      								</p>
      								<p class="card-when mb-0"><small class="text-muted">
	      								<fmt:parseDate value="${MCIDto.c_when}" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
										<fmt:formatDate value="${time}" pattern="yyyy-MM-dd"/></small></p>
  								</div>	
  										<!-- 내 클래스일 때는 수정, 삭제 버튼 / 남의 클래스 일 때는 구독버튼이 보이게 -->
									<c:choose>
										<c:when test="${MCIDto.member_no != userinfo.member_no}">
												<form method="post" class="d-flex justify-content-center mb-3 mt-3">
													<span class="card-btn w-100 d-flex justify-content-center ">
														<input type="hidden" name="c_no" id="subC_no" value="${MCIDto.c_no }">										
														<input type="button" class="btn btn-primary btn-sm subBtn" value="구독" style="font-size:14px" data-target="#subModal">	
													</span>
												</form>
										</c:when>
									</c:choose>
  							</div>
 						</div>
					</div>
				</c:forEach>
			</div>
	</div>
</div>
<script>
$(function(){
	$("#subModal").modal("hide") // 모달 수정 모달 숨김
	$(".subBtn").click(function(){
	
		var subDto = {
				member_no:${userinfo.member_no},
				c_no:$(this).parents(".card-btn").children("input[name=c_no]").val()
		}
	
		var path = $(this).parents(".card").children(".card-body").children(".badge")
		console.log(path)
		
		axios.post("/arori/subAjax/subscribe", JSON.stringify(subDto), {
		 	headers:{
				'content-type':'application/json',
		 	}
		 }).then(function(resp){
			 console.log(resp.data)

			var msg
			console.log($(path).text())
			if($(path).text() < resp.data) {
				msg = '구독이 완료되었습니다.'
			} else {
				msg = '구독이 취소되었습니다.'
			}
             $(path).text(resp.data)
                $(".subModalBody").text(msg)
             $("#subModal").modal("show") // 모달 수정 모달 숨김
	 	})
	})
})
</script>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>
<!-- 구독 모달 -->
<div class="modal fade" id="subModal" tabindex="-1" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title font-weight-bold" id="exampleModalLabel">구독</h5>
            <button type="button" class="close" data-dismiss="modal"
               aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body subModalBody">
         </div>            
         <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">창 닫기</button>
         </div>
      </div>
   </div>
</div>