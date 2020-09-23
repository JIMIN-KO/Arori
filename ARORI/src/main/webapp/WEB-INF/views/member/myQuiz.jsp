<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_myPage_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                    	<br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">My Quiz</h1>
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
                                        <th scope="col" class="font-weight-bold">Score</th>
                                        <th scope="col" class="font-weight-bold">Result</th>
                                    </tr>
                                </thead>
                                <tbody>
                                		<c:set var="no" value="${no }"></c:set>
                                    	<c:forEach var="quizDto" items="${quizDto }">
                                    <tr class="text-center">
                                        <th scope="row">${no }</th>
	                                    	<c:set var="no" value="${no - 1 }"></c:set>
                                        <th class="font-weight-bold">
                                            <label for="${no }">
                                                ${quizDto.q_title }
                                            </label>
                                            <input type="radio" name="title" id="${no }" >
                                        </th>
                                        <td>${quizDto.when }</td>
                                        <td>${quizDto.score } 점</td>
                                        <td>
	                                        	<a href="${pageContext.request.contextPath }/member/myAnswer/${quizDto.q_no}">
	                                        		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-check2-square" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
												  <path fill-rule="evenodd" d="M15.354 2.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L8 9.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
												  <path fill-rule="evenodd" d="M1.5 13A1.5 1.5 0 0 0 3 14.5h10a1.5 1.5 0 0 0 1.5-1.5V8a.5.5 0 0 0-1 0v5a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V3a.5.5 0 0 1 .5-.5h8a.5.5 0 0 0 0-1H3A1.5 1.5 0 0 0 1.5 3v10z"/>
												</svg>
	                                        	</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <input type="hidden" class="q_content" value="${quizDto.q_content }">
                                            <div class="viewer"></div>
                                            <br><br><hr><br>
                                            <!-- 퀴즈 상세 정보 -->
				             				<div class="form-row mt-5">
				             					<div class="row">
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
											</div>
                                            <!-- 퀴즈 점수 및 회원의 정답률 전체 인원 해당 퀴즈 정답률 -->
                                            <div class="row">
									        	<div class="col-12">
										        	<div class="card-group mt-3">
										        		<div class="row w-100">
										        			 	<div class="card shadow-none col-sm-4 col-md-4 col-lg-2 offset-lg-1 bg-transparent">
															    <div class="card-body text-center">
															      <h5 class="card-title">점수</h5>
															      <span class="card-text font-weight-bolder" style="font-size: 3rem;">${quizDto.myScore }</span>
															      <span class="card-text ml-2 font-weight-bolder" style="font-size: 1rem;">점</span>
															    </div>
													  		</div>
													  		<div class="card shadow-none col-sm-4 col-md-4 col-lg-2 bg-transparent">
															    <div class="card-body text-center">
															      <h5 class="card-title">정답</h5>
															      <span class="card-text font-weight-bolder" style="font-size: 3rem;">${quizDto.correct }</span>
															      <span class="card-text ml-2 font-weight-bolder" style="font-size: 1rem;">/ ${quizDto.totalQuestion }</span>
															    </div>
													  		</div>
													  		<div class="card shadow-none col-sm-4 col-md-4 col-lg-2 bg-transparent">
															    <div class="card-body text-center">
															      <h5 class="card-title">오답</h5>
															      <span class="card-text font-weight-bolder" style="font-size: 3rem;">${quizDto.incorrect }</span>
															      <span class="card-text ml-2 font-weight-bolder" style="font-size: 1rem;">/ ${quizDto.totalQuestion }</span>
															    </div>
													  		</div>
										        				<div class="card shadow-none col-sm-6 col-md-6 col-lg-2 bg-transparent">
															    <div class="card-body text-center">
															      <h5 class="card-title">정답률</h5>
															      <span class="card-text font-weight-bolder" style="font-size: 3rem;">${quizDto.myPer }</span>
															      <span class="card-text ml-2 font-weight-bolder" style="font-size: 1rem;">%</span>
															    </div>
													  		</div>
										        				<div class="card shadow-none col-sm-6 col-md-6 col-lg-2 bg-transparent">
															    <div class="card-body text-center">
															      <h5 class="card-title">평균 점수</h5>
															      <span class="card-text font-weight-bolder" style="font-size: 3rem;">${quizDto.totalScore }</span>
															      <span class="card-text ml-2 font-weight-bolder" style="font-size: 1rem;">점</span>
															    </div>
													  		</div>
													  	</div>	
													</div>
												</div>
									        </div>
                                        </td>
                                    </tr>
                                    </c:forEach>    
                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                  <li class="page-item">
									<c:if test="${pageNo > 10 }">
	                                    <a class="page-link" href="${pageContext.request.contextPath }/cmember/myQuiz/${block[0] - 1}" aria-label="Previous">
	                                      <span aria-hidden="true">&laquo;</span>
	                                    </a>
	                                 </c:if>   
                                  </li>
									<c:forEach var="block" items="${block }">
                                  		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath }/member/myQuiz/${block}">${block }</a></li>
									</c:forEach>
                                  <li class="page-item">
                                  	<c:set var="size" value="${fn:length(block) }"></c:set>
                                    <c:if test="${size > pageNo and pageNo > 10 }">
	                                    <a class="page-link" href="${pageContext.request.contextPath }/member/myQuiz/${block[9]+1}" aria-label="Next">
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
	var n_content = document.querySelectorAll(".q_content") /* String 으로 뭉쳐진 마크다운 코드 받아오기 */

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