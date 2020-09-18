<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                    	<br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">Quiz | ${quizDto.q_title }</h1>
	                        <c:if test="${classesDto.member_no == userinfo.member_no }">
	                        			<a href="${pageContext.request.contextPath}/classes/quiz/edit/${quizDto.c_no}/${quizDto.q_no}">
				                        <button class="btn btn-link mt-4" style="flex:0.3; color: gray;">
				                        		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hammer" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											  <path d="M9.812 1.952a.5.5 0 0 1-.312.89c-1.671 0-2.852.596-3.616 1.185L4.857 5.073V6.21a.5.5 0 0 1-.146.354L3.425 7.853a.5.5 0 0 1-.708 0L.146 5.274a.5.5 0 0 1 0-.706l1.286-1.29a.5.5 0 0 1 .354-.146H2.84C4.505 1.228 6.216.862 7.557 1.04a5.009 5.009 0 0 1 2.077.782l.178.129z"/>
											  <path fill-rule="evenodd" d="M6.012 3.5a.5.5 0 0 1 .359.165l9.146 8.646A.5.5 0 0 1 15.5 13L14 14.5a.5.5 0 0 1-.756-.056L4.598 5.297a.5.5 0 0 1 .048-.65l1-1a.5.5 0 0 1 .366-.147z"/>
											</svg>
				                        </button>
			                        </a>
			                        <a href="${pageContext.request.contextPath}/classes/quiz/delete/${quizDto.c_no}/${quizDto.q_no}">
				                        <button class="btn btn-link mt-4" style="flex:0.3; color: gray;">
				                        		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											  <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
											</svg>
				                        </button>
			                        </a>
	                        </c:if>
                        </div>
                    	<hr><br>
                    	<!-- 퀴즈 디테일 영역 -->
						<div id="viewer" class="mb-5"></div>
						<input type="hidden" value="${quizDto.q_content }" id="q_content">
             				<div class="form-row mt-5">
             				<!-- Runtime / Opening / Closing -->
								<div class="form-group col-4">
									<div class="input-group input-group-lg">
										<div class="input-group-prepend">
											<span class="input-group-text" id="inputGroup-sizing-lg">Time</span>
										</div>
										<input type="text" class="form-control" value="${quizDto.q_runtime } 분" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly="readonly">
									</div>
								</div>
								<div class="form-group col-4">
									<div class="input-group input-group-lg">
										<div class="input-group-prepend">
											<span class="input-group-text" id="inputGroup-sizing-lg">Opening</span>
										</div>
										<input type="text" class="form-control" value="${quizDto.q_open }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly="readonly">
									</div>
								</div>
								<div class="form-group col-4">
									<div class="input-group input-group-lg">
										<div class="input-group-prepend">
											<span class="input-group-text" id="inputGroup-sizing-lg">Closing</span>
										</div>
										<input type="text" class="form-control" value="${quizDto.q_close }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" readonly="readonly">
									</div>
								</div>
							</div>
						<div class="row mt-5 d-flex justify-content-center">
							<button class="btn btn-lg btn-warning font-weight-bold mt-5 playBtn">퀴즈 풀기</button>
							<a href="${pageContext.request.contextPath }/classes/quiz/${quizDto.c_no}/1" class="btn btn-lg btn-primary font-weight-bold mt-5" >돌아가기</a>
						</div>
					</div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>
<script>
$(function(){
	// 파라미터 "sorry" 가 들어오면 현재 퀴즈 오픈 기간이 아님.
	var sorry = location.search
	console.log(sorry)
	if(sorry === '?sorry') {
			alert("현재 퀴즈 오픈 기간이 아닙니다.")
		}
})


// 퀴즈 풀기
$(".playBtn").click(function(){
	var questionSize = ${questionSize}

	if(questionSize > 0) {
		location.href="${pageContext.request.contextPath }/classes/quiz/play/${quizDto.q_no}"
	} else {
		alert("현재 퀴즈를 준비 중입니다.")
	}
})

//Toast Plugin 불러오기 
const Viewer = toastui.Editor;
const chartOptions = {
        minWidth: 100,
        maxWidth: 600,
        minHeight: 100,
        maxHeight: 300
      };
const { chart, codeSyntaxHighlight, colorSyntax, tableMergedCell, uml } = Viewer.plugin;

const viewer = toastui.Editor.factory({
	el: document.querySelector('#viewer'),
	viewer: true,
	height: '300px',
	initialValue: $("#q_content").val(),
	initialEditType: 'markdown',
	plugins: [[chart, chartOptions], codeSyntaxHighlight, tableMergedCell, uml]
}); 

</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>