<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
	/* 전체 카드 */
	.card-deck {
    height:460px;
    width:380px;
    padding-bottom: 30px;
    margin-top: 30px;
    margin-left: 17px;
}
	/* 이미지 사이즈 */
	.card-img {
	height:200px;
	width:320px;
	border-radius: 10px 10px;
	margin-left:13px;
	margin-top: 15px;
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
		<div class="container-fluid">
			<div class="row">
				<c:forEach var="MCIDto" items="${MCIDto}">
					<div class="col-sm-12 col-md-6 col-lg-3">
						<div class="card-deck">
  							<div class="card">
  								<c:choose>
									<c:when test="${MCIDto.ai_no > 0}">
										<img src="${pageContext.request.contextPath }/imgAjax/classes/download/${MCIDto.ai_no }" class="card-img" alt="...">
									</c:when>
									<c:otherwise>
										<img src="http://lorempixel.com/400/200/" alt="love" class="card-img">
									</c:otherwise>
								</c:choose>
   								<div class="card-body">
      								<h5 class="card-title">${MCIDto.c_title}</h5>
      								<p class="card-info">${MCIDto.c_info}</p>
      								<p class="card-when"><small class="text-muted">
      								<fmt:parseDate value="${MCIDto.c_when}" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
									<fmt:formatDate value="${time}" pattern="yyyy-MM-dd"/></small></p>
									<span class="badge badge-pill badge-success subCount">${MCIDto.c_subscribe}</span>
									<div>
										<input type="hidden" name="c_no" value="${MCIDto.c_no }">
										<input type="button" class="subBtn" value="구독">	
									</div>
  								</div>	
  							</div>
 						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<script>
$(function(){
	$(".subBtn").click(function(){

		var subDto = {
				member_no:${userinfo.member_no},
				c_no:$(this).parent().children("input[name=c_no]").val()
		}
		
		console.log(subDto)
		
		axios.post("/arori/subAjax/subscribe", JSON.stringify(subDto), {
		 	headers:{
				'content-type':'application/json',
		 	}
		 }).then(resp=>{
			console.log(resp)
			$(".subBtn").parents(".card-body").children(".subCount").text(resp.data)
			 
	 	})
	})
})
</script>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>