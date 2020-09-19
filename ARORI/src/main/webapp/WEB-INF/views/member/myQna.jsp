<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_myPage_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                    	<br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">My Q & A</h1>
                        </div>
                    	<hr><br>
                    	<!-- 본문 내용 -->
                    	<div class="ml-3 mr-3">
                            <table class="table table-hover">
                                <thead>
                                    <tr class="text-center">
                                        <th scope="col" class="font-weight-bold">No</th>
                                        <th scope="col" class="font-weight-bold">Title</th>
                                        <th scope="col" class="font-weight-bold">Date</th>
                                        <th scope="col" class="font-weight-bold">Go</th>
                                    </tr>
                                </thead>
                                <tbody>
                                		<c:set var="no" value="${no }"></c:set>
                                    	<c:forEach var="qnaDto" items="${qnaDto }">
                                    <tr class="text-center">
                                        <th scope="row">${no }</th>
	                                    	<c:set var="no" value="${no - 1 }"></c:set>
                                        <th class="text-left font-weight-bold">
                                            <label for="${no }">
                                            			<!-- 답글이라면 댑스만큼 공백을 둔 후 RE:를 붙임 -->
                                                <c:if test ="${qnaDto.super_no > 0}">
		                                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-return-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
														  <path fill-rule="evenodd" d="M1.5 1.5A.5.5 0 0 0 1 2v4.8a2.5 2.5 0 0 0 2.5 2.5h9.793l-3.347 3.346a.5.5 0 0 0 .708.708l4.2-4.2a.5.5 0 0 0 0-.708l-4-4a.5.5 0 0 0-.708.708L13.293 8.3H3.5A1.5 1.5 0 0 1 2 6.8V2a.5.5 0 0 0-.5-.5z"/>
														</svg>
                                                </c:if>
                                                ${qnaDto.qna_title }
                                            </label>
                                            <input type="radio" name="title" id="${no }" >
                                        </th>
                                        <td>${qnaDto.qna_when }</td>
                                        <td>
	                                        	<a href="${pageContext.request.contextPath }/classes/qna/${qnaDto.c_no}/1">
	                                        		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-box-arrow-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
												  <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
												  <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
												</svg>
	                                        	</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <input type="hidden" class="qna_content" value="${qnaDto.qna_content }">
                                            <div class="viewer"></div>
                                        </td>
                                    </tr>
                                    </c:forEach>    
                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                  <li class="page-item">
									<c:if test="${pageNo > 10 }">
	                                    <a class="page-link" href="${pageContext.request.contextPath }/cmember/myQna/${block[0] - 1}" aria-label="Previous">
	                                      <span aria-hidden="true">&laquo;</span>
	                                    </a>
	                                 </c:if>   
                                  </li>
									<c:forEach var="block" items="${block }">
                                  		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/member/myQna/${block}">${block }</a></li>
									</c:forEach>
                                  <li class="page-item">
                                  	<c:set var="size" value="${fn:length(block) }"></c:set>
                                    <c:if test="${size > pageNo and pageNo > 10 }">
	                                    <a class="page-link" href="${pageContext.request.contextPath }/member/myQna${block[9]+1}" aria-label="Next">
	                                      <span aria-hidden="true">&raquo;</span>
	                                    </a>
                                    </c:if>
                                  </li>
                                </ul>
                              </nav>
                        </div>
                    </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>
<script>

	var viewers = document.querySelectorAll(".viewer") /* viewer 클래스 생성 */
	var n_content = document.querySelectorAll(".qna_content") /* String 으로 뭉쳐진 마크다운 코드 받아오기 */

	// Toast Plugin 불러오기 
	const Viewer = toastui.Editor;
    const {codeSyntaxHighlight, colorSyntax, tableMergedCell} = Viewer.plugin;
	// viewer 갯수만큼 반복하기 (최대 10개)
	for(var i = 0; i < viewers.length; i++) {
		
	    // Toast Viewer .viewer 만큼 불러오기 
	    const viewer = toastui.Editor.factory({
	        el: viewers[i],
	        viewer: true,
	        height: '1000px',
	        initialValue: n_content[i].value,
	        initialEditType: 'markdown',
	        plugins: [codeSyntaxHighlight, tableMergedCell]
	    });
	}

	$(function(){
		
	    // 라디오 숨김
	    $("input[type=radio]").css("display","none")
	    // 퀴즈 제목 커서 변경
	    $("input[type=radio]").prev().css("cursor","pointer")
	    // 퀴즈 게시물 본문 숨김
	    $("input[type=radio]").parent().parent().next().css("display","none")
	    // 퀴즈 게시물 id 삭제
	    $("input[type=radio]").parent().parent().next().children().children().removeAttr("class")
	
		// 퀴즈 내용 띄우기
	    $("input[type=radio]").change(function(){
	        $("input[type=radio]").parent().parent().next().css("display","none")
	        $("input[type=radio]").parent().parent().next().children().children().removeAttr("class")
	                        
	        $(this).parent().parent().next().css("display","table-row")
	        $(this).parent().parent().next().children().children().attr("class","viewer")
	    })
	})
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>