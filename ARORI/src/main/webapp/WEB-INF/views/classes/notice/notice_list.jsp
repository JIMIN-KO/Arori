<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                    	<br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">Notice</h1>
	                        <c:if test="${not empty temp }">
		                        <select class="form-control custom-select-lg mt-4" id="tempSelect" style="flex:10;">
		                        	<option selected="selected" disabled="disabled">임시 저장 리스트</option>
		                        	<c:forEach var="temp" items="${temp }">
		                        		<option value="${pageContext.request.contextPath }/classes/notice/edit/${temp.c_no}/${temp.n_no}">${temp.n_title }</option>
		                        	</c:forEach>
		                        </select>
                        	</c:if>
	                        <c:if test="${classes.member_no == userinfo.member_no }">
								<a href="${pageContext.request.contextPath }/classes/notice/create/${c_no}">
						            <button class="btn btn-link mt-4" style="flex:0.3; color: gray;">
							            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											<path fill-rule="evenodd" d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
										</svg>
						            </button>
				                </a>
			                </c:if>
                        </div>
                    	<hr><br>
                    	<!-- 본문 내용 -->
                    	<c:set var="index" value="${no }"></c:set>
                    	<div class="ml-3 mr-3">
                            <table class="table table-hover">
                                <thead>
                                    <tr class="text-center">
                                        <th scope="col" class="font-weight-bold">No</th>
                                        <th scope="col" class="font-weight-bold">Title</th>
                                        <th scope="col" class="font-weight-bold">Date</th>
                                        	<c:if test="${classes.member_no == userinfo.member_no }">
                                        		<th scope="col" class="font-weight-bold">Ctrl</th>
                                        </c:if>
                                    </tr>
                                </thead>
                                <tbody>
                                    	<c:forEach var="list" items="${list }">
                                    <tr class="text-center">
                                        <th scope="row">${index }</th>
                                        <c:set var="index" value="${index - 1 }"></c:set>
                                        <td class="font-weight-bold">
                                            <label for="${list.n_no }">
                                                ${list.n_title }
                                            </label>
                                            <input type="radio" name="title" id="${list.n_no }" >
                                        </td>
                                        <td>${list.n_when }</td>
                                        	<c:if test="${classes.member_no == userinfo.member_no }">
	                                        <td>
	                                        		<a class="text-primary font-weight-bold mr-3" href="${pageContext.request.contextPath }/classes/notice/edit/${list.c_no}/${list.n_no}">
	                                        			<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hammer" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
													  <path d="M9.812 1.952a.5.5 0 0 1-.312.89c-1.671 0-2.852.596-3.616 1.185L4.857 5.073V6.21a.5.5 0 0 1-.146.354L3.425 7.853a.5.5 0 0 1-.708 0L.146 5.274a.5.5 0 0 1 0-.706l1.286-1.29a.5.5 0 0 1 .354-.146H2.84C4.505 1.228 6.216.862 7.557 1.04a5.009 5.009 0 0 1 2.077.782l.178.129z"/>
													  <path fill-rule="evenodd" d="M6.012 3.5a.5.5 0 0 1 .359.165l9.146 8.646A.5.5 0 0 1 15.5 13L14 14.5a.5.5 0 0 1-.756-.056L4.598 5.297a.5.5 0 0 1 .048-.65l1-1a.5.5 0 0 1 .366-.147z"/>
													</svg>
	                                        		</a>
	                                        		<a class="text-danger font-weight-bold ml-3" href="${pageContext.request.contextPath }/classes/notice/delete/${list.c_no}/${list.n_no}">
	                                        			<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
													  <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
													</svg>
	                                        		</a>
	                                        </td>
                                        </c:if>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <input type="hidden" class="n_content" value="${list.n_content }">
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
                                    <a class="page-link" href="${pageContext.request.contextPath }/classes/notice/${classes.c_no }/${block[0] - 1}" aria-label="Previous">
                                      <span aria-hidden="true">&laquo;</span>
                                    </a>
                                    </c:if>
                                  </li>
									<c:forEach var="block" items="${block }">
                                  		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/classes/notice/${classes.c_no }/${block}">${block }</a></li>
									</c:forEach>
                                  <li class="page-item">
                                  <c:set var="size" value="${fn:length(block) }"></c:set>
                                  	<c:if test="${size > pageNo and pageNo > 10 }">
	                                    <a class="page-link" href="${pageContext.request.contextPath }/classes/notice/${classes.c_no }/${block[size]+1}" aria-label="Next">
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
	var n_content = document.querySelectorAll(".n_content") /* String 으로 뭉쳐진 마크다운 코드 받아오기 */

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
	        height: '1000px',
	        initialValue: n_content[i].value,
	        initialEditType: 'markdown',
	        plugins: [[chart, chartOptions], codeSyntaxHighlight, tableMergedCell, uml]
	    });
	}

	$(function(){
		// 임시 저장 데이터 작성하기 
		$("#tempSelect").on("change",function(){
			if($("#tempSelect").val() != "") {
				location.href = $("#tempSelect").val()
			}
		})
		
	    // 라디오 숨김
	    $("input[type=radio]").css("display","none")
	    // 공지 제목 커서 변경
	    $("input[type=radio]").prev().css("cursor","pointer")
	    // 공지 게시물 본문 숨김
	    $("input[type=radio]").parent().parent().next().css("display","none")
	    // 공지 게시물 id 삭제
	    $("input[type=radio]").parent().parent().next().children().children().removeAttr("class")
	
		// 공지사항 내용 띄우기
	    $("input[type=radio]").change(function(){
	        $("input[type=radio]").parent().parent().next().css("display","none")
	        $("input[type=radio]").parent().parent().next().children().children().removeAttr("class")
	                        
	        $(this).parent().parent().next().css("display","table-row")
	        $(this).parent().parent().next().children().children().attr("class","viewer")
	    })
	})
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>