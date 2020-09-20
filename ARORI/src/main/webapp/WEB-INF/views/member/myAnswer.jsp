<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_myPage_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                    	<br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">Quiz | ${quizDto.q_title }</h1>
                        </div>
                    	<hr><br>
                    	<!-- 본문 내용 -->
                    	<c:set var="index" value="1"></c:set>
                    	<c:forEach var="thisQuizVo" items="${thisQuizVo }">
                    	<div class="card m-5 question qt_${thisQuizVo.qt_no }">
                    	<input type="hidden" value="${thisQuizVo.question_no }">
						  <div class="card-header h3 text-white ${thisQuizVo.correct eq 1 ? 'bg-primary' : 'bg-danger'} ">Question ${index }</div>
						  <c:set var="index" value="${index + 1 }"></c:set>
						  <div class="card-body">
						    <div class="viewer"></div>
						    <input type="hidden" value="${thisQuizVo.aq_content }" class="aq_content">
						    <hr class="mt-5 mb-5">
						    <p class="card-text">
						    		<c:choose>
						    			<c:when test="${thisQuizVo.qt_no eq 1 }">
						    			<!-- OX 문제 영역 -->
						    				<div class="input-group mt-3 mb-3">
											  <div class="input-group-prepend">
											    <div class="input-group-text">
											      <input type="radio" value="0"  name="${thisQuizVo.question_no }" id="o_${thisQuizVo.question_no }" disabled="disabled" <c:if test="${thisQuizVo.myAnswer eq 0 }">checked</c:if>>
											    </div>
											  </div>
											  <label for="o_${thisQuizVo.question_no }" class="form-control h-auto ${thisQuizVo.ox_answer eq 0 ? 'bg-success text-white' : '' }">
											  	<span class="h5">${thisQuizVo.o_content }</span>
											  </label>
											</div>
						    				<div class="input-group mt-3 mb-3">
											  <div class="input-group-prepend">
											    <div class="input-group-text">
											      <input type="radio" value="1" name="${thisQuizVo.question_no }" id="x_${thisQuizVo.question_no }"  disabled="disabled" <c:if test="${thisQuizVo.myAnswer eq 1 }">checked</c:if>>
											    </div>
											  </div>
											  <label for="x_${thisQuizVo.question_no }" class="form-control h-auto ${thisQuizVo.ox_answer eq 1 ? 'bg-success text-white' : '' }">
											 	<span class="h5">${thisQuizVo.x_content }</span>
											  </label>
											</div>
						    			</c:when>
						    			<c:when test="${thisQuizVo.qt_no eq 2 }">
						    				<!-- 선다형 문제 영역 -->
						    				<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <div class="input-group-text">
										      <input type="radio" value="1"  name="${thisQuizVo.question_no }" id="one_${thisQuizVo.question_no }" disabled="disabled" <c:if test="${thisQuizVo.myAnswer eq '1' }">checked</c:if>>
										    </div>
										  </div>
										  <label for="one_${thisQuizVo.question_no }" class="form-control h-auto ${thisQuizVo.multiple_answer eq 1 ? 'bg-success text-white' : '' }">
										  	<span class="h5">${thisQuizVo.multiple_one }</span>
										  </label>
										</div>
						    				<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <div class="input-group-text">
										      <input type="radio" value="2" name="${thisQuizVo.question_no }" id="two_${thisQuizVo.question_no }" disabled="disabled" <c:if test="${thisQuizVo.myAnswer eq '2' }">checked</c:if>>
										    </div>
										  </div>
										  <label for="two_${thisQuizVo.question_no }" class="form-control h-auto ${thisQuizVo.multiple_answer eq 2 ? 'bg-success text-white' : '' }">
										 	<span class="h5">${thisQuizVo.multiple_two }</span>
										  </label>
										</div>
										<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <div class="input-group-text">
										      <input type="radio" value="3"  name="${thisQuizVo.question_no }" id="three_${thisQuizVo.question_no }" disabled="disabled" <c:if test="${thisQuizVo.myAnswer eq '3' }">checked</c:if>>
										    </div>
										  </div>
										  <label for="three_${thisQuizVo.question_no }" class="form-control h-auto ${thisQuizVo.multiple_answer eq 3 ? 'bg-success text-white' : '' }">
										  	<span class="h5">${thisQuizVo.multiple_three }</span>
										  </label>
										</div>
						    				<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <div class="input-group-text">
										      <input type="radio" value="4" name="${thisQuizVo.question_no }" id="four_${thisQuizVo.question_no }" disabled="disabled" <c:if test="${thisQuizVo.myAnswer eq '4' }">checked</c:if>>
										    </div>
										  </div>
										  <label for="four_${thisQuizVo.question_no }" class="form-control h-auto ${thisQuizVo.multiple_answer eq 4 ? 'bg-success text-white' : '' }">
										 	<span class="h5">${thisQuizVo.multiple_four }</span>
										  </label>
										</div>
						    			</c:when>
						    			<c:when test="${thisQuizVo.qt_no eq 3 }">
						    				<!-- 단답형 문제 영역 -->
						    				<div class="input-group mt-3 mb-3">
											  <div class="input-group-prepend">
											    <span class="input-group-text">나의 답안</span>
											  </div>
										  		<textarea class="form-control ${thisQuizVo.correct eq 1 ? 'bg-success text-white' : 'bg-warning text-white' }" name="${thisQuizVo.question_no }" readonly="readonly">${thisQuizVo.myAnswer }</textarea>
										</div>
										<div class="input-group mt-3 mb-3">
											  <div class="input-group-prepend">
											    <span class="input-group-text">문제 정답</span>
											  </div>
										  		<textarea class="form-control" name="${thisQuizVo.question_no }" readonly="readonly">${thisQuizVo.explain_answer }</textarea>
										</div>
						    			</c:when>
						    		</c:choose>
						    </p>
						  </div>
						</div>
						</c:forEach>
						<div class="row mt-5 mr-4">
							<div class="col-12 d-flex justify-content-end">
								<a href="${pageContext.request.contextPath }/classes/quiz/detail/${quizDto.c_no }/${quizDto.q_no}" class="btn btn-lg btn-warning font-weight-bold">다시 풀기</a>
								<a href="${pageContext.request.contextPath }/member/myQuiz/1"class="btn btn-lg btn-primary font-weight-bold deleteMyAnswer"  data-target="#deleteMyAnswer">돌아가기</a>
							</div>
						</div>
                    </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>
<script>

$(function(){
	
	/* 토스트 뷰어 영역 */
	var viewers = document.querySelectorAll(".viewer") /* viewer 클래스 생성 */
	var aq_content = document.querySelectorAll(".aq_content") /* String 으로 뭉쳐진 마크다운 코드 받아오기 */

	// Toast Plugin 불러오기 
	const Viewer = toastui.Editor;
    const { codeSyntaxHighlight, colorSyntax, tableMergedCell } = Viewer.plugin;
	// viewer 갯수만큼 반복하기
	for(var i = 0; i < viewers.length; i++) {
		
	    // Toast Viewer .viewer 만큼 불러오기 
	    const viewer = toastui.Editor.factory({
	        el: viewers[i],
	        viewer: true,
	        height: '350px',
	        initialValue: aq_content[i].value,
	        initialEditType: 'markdown',
	        plugins: [codeSyntaxHighlight, tableMergedCell]
	    });
	}
})
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>