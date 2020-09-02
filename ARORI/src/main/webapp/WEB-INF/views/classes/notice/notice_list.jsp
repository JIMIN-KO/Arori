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
							<a href="${pageContext.request.contextPath }/classes/notice/create/${c_no}">
					            <button class="btn btn-link mt-4" style="flex:0.3; color: gray;">
						            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
									</svg>
					            </button>
			                </a>
                        </div>
                    	<hr><br>
                    	<!-- 본문 내용 -->
                    	<div class="ml-3 mr-3">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col" class="font-weight-bold">No</th>
                                        <th scope="col" class="font-weight-bold">Title</th>
                                        <th scope="col" class="font-weight-bold">Date</th>
                                        <th scope="col" class="font-weight-bold">Ctrl</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    	<c:forEach var="list" items="${list }">
                                    <tr>
                                        <th scope="row">${list.n_no }</th>
                                        <td>
                                            <label for="${list.n_no }">
                                                ${list.n_title }
                                            </label>
                                            <input type="radio" name="title" id="${list.n_no }">
                                        </td>
                                        <td>${list.n_when }</td>
                                        <td>
                                        		<button class="">수정</button>
                                        		<button>삭제</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <input type="hidden" class="n_content" data-content=${list.n_content } value="${list.n_content }">
                                            <div class="viewer"></div>
                                        </td>
                                    </tr>
                                    </c:forEach>    
                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                  <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                      <span aria-hidden="true">&laquo;</span>
                                    </a>
                                  </li>
                                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                                  <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                      <span aria-hidden="true">&raquo;</span>
                                    </a>
                                  </li>
                                </ul>
                              </nav>
                        </div>
                    </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>
<script>

	var viewers = document.querySelectorAll(".viewer") /* viewer 클래스 생성 */
	var n_content = document.querySelectorAll(".n_content") /* String 으로 뭉쳐진 마크다운 코드 받아오기 */

	// viewer 갯수만큼 반복하기 (최대 10개)
	for(var i = 0; i < viewers.length; i++) {

		// Controller 에서 받아온 데이터 문자열로 변경됨.
		// 정규표현식을 이용해서 작은따옴표(') 제거 후, 쉼표(,) 를 기준으로 배열
		var plz = n_content[i].value.replace(/'/g, "").split(',')
		
		// 배열로 바뀐 마크다운 데이터를 인덱스를 기준으로 나눈 후 엔터처리 
	    const content = plz.join('\n')
	    
	    // Toast Viewer .viewer 만큼 불러오기 
	    const viewer = toastui.Editor.factory({
	        el: viewers[i],
	        viewer: true,
	        height: '1000px',
	        initialValue: content,
	        initialEditType: 'markdown'
	    });
	}

	$(function(){
		
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