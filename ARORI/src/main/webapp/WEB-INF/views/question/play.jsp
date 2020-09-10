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
                    	<c:forEach var="thisQuizDto" items="${thisQuizDto }"></c:forEach>
                    	<div class="card border-primary mb-3" style="max-width: 18rem;">
						  <div class="card-header bg-info">${thisQuizDto.question_no }</div>
						  <div class="card-body">
						    <div class="viewer"></div>
						    <input type="hidden" value="${thisQuizDto.aq_content }" class="aq_content">
						    <p class="card-text">
						    		<c:choose>
						    			<c:when test="${thisQuizDto.qt_no == 1 }">
						    				오엑스 답안 : ${thisQuizDto.ox_answer }
						    			</c:when>
						    			<c:when test="${thisQuizDto.qt_no == 2 }">
						    				선다형 답안 : ${thisQuizDto.multiple_answer }
						    			</c:when>
						    			<c:when test="${thisQuizDto.qt_no == 3 }">
						    				단답형 답안 : ${thisQuizDto.explain_answer }
						    			</c:when>
						    		</c:choose>
						    </p>
						  </div>
						</div>
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