<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                    	<br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">Quiz | ${quizDto.q_title }</h1>
                        </div>
                    	<hr><br>
                    	<!-- 본문 내용 -->
                    	<c:forEach var="thisQuizDto" items="${thisQuizDto }">
                    	<div class="card m-5">
						  <div class="card-header h3 bg-warning text-white">${thisQuizDto.question_no }</div>
						  <div class="card-body">
						    <div class="viewer"></div>
						    <input type="hidden" value="${thisQuizDto.aq_content }" class="aq_content">
						    <hr class="mt-5 mb-5">
						    <p class="card-text">
						    		<c:choose>
						    			<c:when test="${thisQuizDto.qt_no == 1 }">
						    			<!-- OX 문제 영역 -->
						    				<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <div class="input-group-text">
										      <input type="radio" value="0"  name="ox_${thisQuizDto.question_no }" id="o_${thisQuizDto.question_no }">
										    </div>
										  </div>
										  <label for="o_${thisQuizDto.question_no }" class="form-control h-auto">
										  	<span class="h5">${thisQuizDto.o_content }</span>
										  </label>
										</div>
						    				<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <div class="input-group-text">
										      <input type="radio" value="1" name="ox_${thisQuizDto.question_no }" id="x_${thisQuizDto.question_no }">
										    </div>
										  </div>
										  <label for="x_${thisQuizDto.question_no }" class="form-control h-auto">
										 	<span class="h5">${thisQuizDto.x_content }</span>
										  </label>
										</div>
						    			</c:when>
						    			<c:when test="${thisQuizDto.qt_no == 2 }">
						    				<!-- 선다형 문제 영역 -->
						    				<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <div class="input-group-text">
										      <input type="radio" value="1"  name="one_${thisQuizDto.question_no }" id="one_${thisQuizDto.question_no }">
										    </div>
										  </div>
										  <label for="one_${thisQuizDto.question_no }" class="form-control h-auto">
										  	<span class="h5">${thisQuizDto.multiple_one }</span>
										  </label>
										</div>
						    				<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <div class="input-group-text">
										      <input type="radio" value="2" name="two_${thisQuizDto.question_no }" id="two_${thisQuizDto.question_no }">
										    </div>
										  </div>
										  <label for="two_${thisQuizDto.question_no }" class="form-control h-auto">
										 	<span class="h5">${thisQuizDto.multiple_two }</span>
										  </label>
										</div>
										<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <div class="input-group-text">
										      <input type="radio" value="3"  name="three_${thisQuizDto.question_no }" id="three_${thisQuizDto.question_no }">
										    </div>
										  </div>
										  <label for="three_${thisQuizDto.question_no }" class="form-control h-auto">
										  	<span class="h5">${thisQuizDto.multiple_three }</span>
										  </label>
										</div>
						    				<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <div class="input-group-text">
										      <input type="radio" value="4" name="four_${thisQuizDto.question_no }" id="four_${thisQuizDto.question_no }">
										    </div>
										  </div>
										  <label for="four_${thisQuizDto.question_no }" class="form-control h-auto">
										 	<span class="h5">${thisQuizDto.multiple_four }</span>
										  </label>
										</div>
						    			</c:when>
						    			<c:when test="${thisQuizDto.qt_no == 3 }">
						    				<!-- 단답형 문제 영역 -->
						    				<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <span class="input-group-text">정답을 입력해주세요!</span>
										  </div>
										  <textarea class="form-control"></textarea>
										</div>
						    			</c:when>
						    		</c:choose>
						    </p>
						  </div>
						</div>
						</c:forEach>
                    </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>
<script>

	var viewers = document.querySelectorAll(".viewer") /* viewer 클래스 생성 */
	var aq_content = document.querySelectorAll(".aq_content") /* String 으로 뭉쳐진 마크다운 코드 받아오기 */

	// Toast Plugin 불러오기 
	const Viewer = toastui.Editor;
	const chartOptions = {
	        minWidth: 100,
	        maxWidth: 600,
	        minHeight: 100,
	        maxHeight: 300
	      };
    const { chart, codeSyntaxHighlight, colorSyntax, tableMergedCell, uml } = Viewer.plugin;
	// viewer 갯수만큼 반복하기 (최대 10개)
	for(var i = 0; i < viewers.length; i++) {
		
	    // Toast Viewer .viewer 만큼 불러오기 
	    const viewer = toastui.Editor.factory({
	        el: viewers[i],
	        viewer: true,
	        height: '350px',
	        initialValue: aq_content[i].value,
	        initialEditType: 'markdown',
	        plugins: [[chart, chartOptions], codeSyntaxHighlight, tableMergedCell, uml]
	    });
	}
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>