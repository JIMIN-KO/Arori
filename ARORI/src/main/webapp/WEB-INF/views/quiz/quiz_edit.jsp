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
                        	<div class="mt-4" style="flex: 18;border-bottom: 1px solid rgba(190, 190, 190, 0.493);">
		                        <h1 class="font-weight-bold">Quiz | Edit</h1>
                        	</div>
	                        <ul class="nav nav-tabs justify-content-end mt-5" id="myTab" role="tablist">
							  <li class="nav-item" role="presentation">
							    <a class="nav-link h4 mb-0 active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Detail</a>
							  </li>
							  <li class="nav-item" role="presentation">
							    <a class="nav-link h4 mb-0" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Question</a>
							  </li>
							</ul>
                        </div>
                    	<br>
						<div class="tab-content" id="myTabContent">
						  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
							  <!-- 퀴즈 생성 영역 -->
							<form action="${pageContext.request.contextPath }/classes/quiz/create" method="post" id="quizDetail">
								<!-- 퀴즈 숨김 데이터 영역 -->
								<input type="hidden" name="c_no" value="${quizDto.c_no }">
								<input type="hidden" name="q_no" value="${quizDto.q_no }">
								<input type="hidden" name="content" id="quizDetailContent">
								<!-- 퀴즈 제목 영역 -->
								<div class="input-group input-group-lg mt-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="inputGroup-sizing-lg">Title</span>
									</div>
									<input type="text" class="form-control" name="q_title" id="q_title" value="${quizDto.q_title }" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" required="required">
								</div>
								<!-- 퀴즈 설명 (Toast UI Editor) 영역 -->
								<div id="editor" class="mt-5"></div>
								<input type="hidden" id="q_content" value="${quizDto.q_content }">
								<!-- 퀴즈 설정 영역 -->
								<!-- Runtime / Score Open -->
								<div class="form-row mt-5">
									<div class="form-group col-6">
										<div class="input-group input-group-lg">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-lg">Score Open</span>
											</div>
											<input type="datetime-local" class="form-control" value="${quizDto.q_score_open }" name="q_score_open" id="q_score_open" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" required="required">
										</div>
									</div>
									<div class="form-group col-6">
										<div class="input-group input-group-lg">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-lg">Time</span>
											</div>
											<input type="number" class="form-control" value="${quizDto.q_runtime }" name="q_runtime" id="q_runtime" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" min="10" required="required">
										</div>
									</div>
								</div>
								<!-- Opening / Closing -->
								<div class="form-row">
									<div class="form-group col-6">
										<div class="input-group input-group-lg">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-lg">Opening</span>
											</div>
											<input type="datetime-local" class="form-control" value="${quizDto.q_open }" name="q_open" id="q_open" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" required="required">
										</div>
									</div>
									<div class="form-group col-6">
										<div class="input-group input-group-lg">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-lg">Closing</span>
											</div>
											<input type="datetime-local" class="form-control" value="${quizDto.q_close }" name="q_close" id="q_close" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" required="required">
										</div>
									</div>
								</div>
							</form>
						  </div>
						  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
						  		<div class="accordion mt-5 mb-5 ml-3 mr-3" id="accordionExample">
						  			<c:set var="index" value="0"></c:set>
						  			<c:set var="q_index" value="1"></c:set>
									<c:forEach var="thisQuizDto" items="${thisQuizDto }">
									  <div class="card">
									    <div class="card-header bg-primary font-weight-bold text-white" id="heading${thisQuizDto.question_no }">
									      <h2 class="mb-0">
									        <button class="btn btn-link btn-block text-left text-white p-2" type="button" data-toggle="collapse" data-target="#collapse${thisQuizDto.question_no }" aria-expanded="true" aria-controls="collapse${thisQuizDto.question_no }" style="font-size: large;">
									        		Question ${q_index}
									        </button>
									        <c:set var="q_index" value="${q_index + 1 }"></c:set>
									      </h2>
									    </div>
									
									    <div id="collapse${thisQuizDto.question_no }" class="collapse" aria-labelledby="heading${thisQuizDto.question_no }" data-parent="#accordionExample">
									      <div class="card-body">
									        <div class="editor3 mb-5" data-index="${index }"></div>
									        <c:set var="index" value="${index + 1 }"></c:set>
											<input type="hidden" value="${thisQuizDto.aq_content }">
										 	<div>
										 		<c:choose>
										 			<c:when test="${thisQuizDto.qt_no == 1 }">
												  		<!-- OX -->
										 				<form class="editForm" >
												  			<!-- 숨김 영역 -->
												  			<!-- question_no -->
												  			<input type="hidden" name="question_no" value="${thisQuizDto.question_no }">
												  			<!-- q_no -->
												  			<input type="hidden" name="q_no" value="${thisQuizDto.q_no }">
													        <!--ox답변 영역-->
													        	<div class="input-group mb-3 input-group-lg">
															  <div class="input-group-prepend">
															    <span class="input-group-text">O</span>
															  </div>
															  <input type="text" class="form-control" value="${thisQuizDto.o_content }" placeholder="O > 지문을 입력해주세요.">
															</div>
															<div class="input-group mb-3 input-group-lg">
															  <div class="input-group-prepend">
															    <span class="input-group-text">X</span>
															  </div>
															  <input type="text" class="form-control"  value="${thisQuizDto.x_content }" placeholder="X > 지문을 입력해주세요.">
															</div>
															<div class="input-group mb-3 input-group-lg">
															  <div class="input-group-prepend">
															    <label class="input-group-text" id="inputGroup-sizing-lg">정답을 지정해주세요.</label>
															  </div>
															  <select class="custom-select">
															    <option disabled="disabled">정답 선택</option>
															    <option value="0" <c:if test="${thisQuizDto.ox_answer == 0 }">selected</c:if>>O</option>
															    <option value="1" <c:if test="${thisQuizDto.ox_answer == 1 }">selected</c:if>>X</option>
															  </select>
															</div>
												  		</form>
										 			</c:when>
										 			<c:when test="${thisQuizDto.qt_no == 2 }">
										 				<!-- 선다형 -->
												  		<form class="editForm">
												  			<!-- question_no -->
												  			<input type="hidden" name="question_no" value="${thisQuizDto.question_no }">
												  			<!-- q_no -->
												  			<input type="hidden" name="q_no" value="${thisQuizDto.q_no }">
													        <!--선다형 답변 영역-->
													       	<div class="input-group mb-3 input-group-lg">
															  <div class="input-group-prepend">
															    <span class="input-group-text">1.</span>
															  </div>
															  <textarea class="form-control">${thisQuizDto.multiple_one }</textarea>
															</div>
															<div class="input-group mb-3 input-group-lg">
															  <div class="input-group-prepend">
															    <span class="input-group-text">2.</span>
															  </div>
															  <textarea class="form-control">${thisQuizDto.multiple_two }</textarea>
															</div>
															<div class="input-group mb-3 input-group-lg">
															  <div class="input-group-prepend">
															    <span class="input-group-text" >3.</span>
															  </div>
															  <textarea class="form-control">${thisQuizDto.multiple_three }</textarea>
															</div>
															<div class="input-group mb-3 input-group-lg">
															  <div class="input-group-prepend">
															    <span class="input-group-text">4.</span>
															  </div>
															  <textarea class="form-control">${thisQuizDto.multiple_four }</textarea>
															</div>
															<div class="input-group mb-3 input-group-lg">
															  <div class="input-group-prepend">
															    <label class="input-group-text" id="inputGroup-sizing-lg">정답을 지정해주세요.</label>
															  </div>
															  <select class="custom-select">
															    <option disabled="disabled" selected>정답 선택</option>
															    <option value="1" <c:if test="${thisQuizDto.multiple_answer == 1 }">selected</c:if>>1번</option>
															    <option value="2" <c:if test="${thisQuizDto.multiple_answer == 2 }">selected</c:if>>2번</option>
															    <option value="3" <c:if test="${thisQuizDto.multiple_answer == 3 }">selected</c:if>>3번</option>
															    <option value="4" <c:if test="${thisQuizDto.multiple_answer == 4 }">selected</c:if>>4번</option>
															  </select>
															</div>
												  		</form>
										 			</c:when>
										 			<c:otherwise>
										 				<!-- 단답형 -->
												  		<form class="editForm">
												  			<!-- 숨김 영역 -->
												  			<!-- question_no -->
												  			<input type="hidden" name="question_no" value="${thisQuizDto.question_no }">
												  			<!-- q_no -->
												  			<input type="hidden" name="q_no" value="${thisQuizDto.q_no }">
													        <!--단답형 답변 영역-->
													            <div class="input-group mb-3 input-group-lg">
																  <div class="input-group-prepend">
																    <span class="input-group-text">단답형 정답</span>
																  </div>
																  <textarea class="form-control">${thisQuizDto.explain_answer }</textarea>
																</div>
												  		</form>
										 			</c:otherwise>
										  		</c:choose>
										  		<button type="button" class="btn btn-lg btn-warning font-weight-bold btn-block mt-5 mb-3 editQuestionBtn" data-type="${thisQuizDto.qt_no }">수정하기</button>
										  	</div>	
									      </div>
									    </div>
									  </div>
									</c:forEach>
								</div>
						  		<!-- 방금 만든 문제 확인 -->
						  		<div class="plz">
							  		<div class="question-list" style="display: none;">
										<div class="p-3 bg-success text-white row mt-3 ml-3 mr-3">
											<div class="col-11 font-weight-bold question-type"></div>
											<div class="col-1 text-right">X</div>
										</div>
										<div class="p-3 bg-white text-dark ml-3 mr-3 mb-3 shadow-sm bg-white rounded">
											<div class="question-content"></div>
										</div>
							  		</div>
						  		</div>
						  		<!--질문 영역-->
						  		<div class="input-group mb-3 input-group-lg">
								  <div class="input-group-prepend">
								    <label class="input-group-text" id="inputGroup-sizing-lg">문제 유형을 선택해주세요.</label>
								  </div>
								  <select class="type_select custom-select">
								    <option disabled="disabled" selected="selected">유형 선택</option>
								    <option value="ox-menu">OX</option>
								    <option value="mul-menu">선다형</option>
								    <option value="ex-menu">단답형</option>
								  </select>
								</div>
								<!-- 공통 퀘스쳔 영역 -->
								<form>
							        <div id="editor2" class="mb-5"></div>
								</form>
						  	<div class="question-add">
						  		<!-- OX -->
						  		<form class="ox form-group" >
						  			<!-- 숨김 영역 -->
						  			<!-- question_no -->
						  			<input type="hidden" name="question_no" value="${question_no }">
						  			<!-- q_no -->
						  			<input type="hidden" name="q_no" value="${quizDto.q_no }">
						  			<!-- aq_content -->
						  			<input type="hidden" name="content">
							        <!--ox답변 영역-->
							        	<div class="input-group mb-3 input-group-lg">
									  <div class="input-group-prepend">
									    <span class="input-group-text">O</span>
									  </div>
									  <input type="text" name="o_content" class="form-control" placeholder="O > 지문을 입력해주세요.">
									</div>
									<div class="input-group mb-3 input-group-lg">
									  <div class="input-group-prepend">
									    <span class="input-group-text">X</span>
									  </div>
									  <input type="text" name="x_content" class="form-control" placeholder="X > 지문을 입력해주세요.">
									</div>
									<div class="input-group mb-3 input-group-lg">
									  <div class="input-group-prepend">
									    <label class="input-group-text" id="inputGroup-sizing-lg">정답을 지정해주세요.</label>
									  </div>
									  <select class="custom-select" name="ox_answer">
									    <option disabled="disabled">정답 선택</option>
									    <option value="0" selected>O</option>
									    <option value="1">X</option>
									  </select>
									</div>
						  		</form>
						  		<!-- 선다형 -->
						  		<form class="multiple">
						  			<!-- question_no -->
						  			<input type="hidden" name="question_no" value="${question_no }">
						  			<!-- q_no -->
						  			<input type="hidden" name="q_no" value="${quizDto.q_no }">
						  			<!-- aq_content -->
						  			<input type="hidden" name="content">
							        <!--선다형 답변 영역-->
							       	<div class="input-group mb-3 input-group-lg">
									  <div class="input-group-prepend">
									    <span class="input-group-text">1.</span>
									  </div>
									  <textarea class="form-control" name="multiple_one"></textarea>
									</div>
									<div class="input-group mb-3 input-group-lg">
									  <div class="input-group-prepend">
									    <span class="input-group-text">2.</span>
									  </div>
									  <textarea class="form-control" name="multiple_two"></textarea>
									</div>
									<div class="input-group mb-3 input-group-lg">
									  <div class="input-group-prepend">
									    <span class="input-group-text" >3.</span>
									  </div>
									  <textarea class="form-control" name="multiple_three"></textarea>
									</div>
									<div class="input-group mb-3 input-group-lg">
									  <div class="input-group-prepend">
									    <span class="input-group-text">4.</span>
									  </div>
									  <textarea class="form-control" name="multiple_four"></textarea>
									</div>
									<div class="input-group mb-3 input-group-lg">
									  <div class="input-group-prepend">
									    <label class="input-group-text" id="inputGroup-sizing-lg">정답을 지정해주세요.</label>
									  </div>
									  <select class="custom-select" name="multiple_answer">
									    <option disabled="disabled" selected>정답 선택</option>
									    <option value="1" >1번</option>
									    <option value="2">2번</option>
									    <option value="3">3번</option>
									    <option value="4">4번</option>
									  </select>
									</div>
						  		</form>
						  		<!-- 단답형 -->
						  		<form class="explain">
						  			<!-- 숨김 영역 -->
						  			<!-- question_no -->
						  			<input type="hidden" name="question_no" value="${question_no }">
						  			<!-- q_no -->
						  			<input type="hidden" name="q_no" value="${quizDto.q_no }">
						  			<!-- aq_content -->
						  			<input type="hidden" name="content">
							        <!--단답형 답변 영역-->
							            <div class="input-group mb-3 input-group-lg">
										  <div class="input-group-prepend">
										    <span class="input-group-text">단답형 정답</span>
										  </div>
										  <textarea class="form-control" name="explain_answer"></textarea>
										</div>
						  		</form>
						  	</div>
						  		<div  class="d-flex justify-content-center">
							  		<button type="button" class="btn btn-lg btn-success add ">New Question</button>
						  		</div>
						  </div>
						</div>
						<div class="form-row float-right mt-5">
							<button type="submit" class="btn btn-warning btn-lg font-weight-bold" id="save" >퀴즈 등록</button>
							<a href="${pageContext.request.contextPath }/classes/quiz/delete/${quizDto.c_no}/${quizDto.q_no}" class="btn btn-primary btn-lg font-weight-bold" id="cancel">취소</a>
						</div>
					</div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>
<script>
$(function(){
	// 기존의 퀘스쳔 수정 시
	$(".editQuestionBtn").click(function(){
			
			// question_no / q_no / aq_content 데이터 (정답 유형 공통 데이터)
			var editForm = $(this).parents(".card-body").children("input[type=hidden]").next().children(".editForm").children() // 해당 카드의 form 영역

			var question_no = $(editForm[0]).val()
			var q_no = $(editForm[1]).val()
			
			// Editor value
			var index = $(this).parents(".card-body").children(".editor3").data("index") // 해당 카드의 editor3 의 인덱스 번호
			var markdown = editor3[index].getMarkdown() // 해당 카드의 editor3 의 markdown 데이터

			console.log(question_no)
			console.log(q_no)
			console.log(markdown)

			// 유형 조회
			var qt_no = $(this).data("type")
			var frm // 정답 유형 별 Dto
			var path // 유형 별 이름
			
			if(qt_no == 1) {
				// OX 
				frm = {
					question_no:question_no,
					q_no:q_no,
					content:[editor3[index].getMarkdown()],
					o_content:$(editForm[2]).children("input").val(),
					x_content:$(editForm[3]).children("input").val(),
					ox_answer:$(editForm[4]).children("select").val()
				}

				path = "ox"
			} else if(qt_no == 2) {
				// 선다형
				frm = {
					question_no:question_no,
					q_no:q_no,
					content:[editor3[index].getMarkdown()],
					multiple_one:$(editForm[2]).children("textarea").val(),
					multiple_two:$(editForm[3]).children("textarea").val(),
					multiple_three:$(editForm[4]).children("textarea").val(),
					multiple_four:$(editForm[5]).children("textarea").val(),
					multiple_answer:$(editForm[6]).children("select").val()
				}

				path = "multiple"
			} else {
				// 단답형
				frm = {
					question_no:question_no,
					q_no:q_no,
					content:[editor3[index].getMarkdown()],
					explain_answer:$(editForm[2]).children("textarea").val()
				}

				path = "explain"
			}

			console.log(frm)

			axios.post("/arori/questionAjax/update/"+path, frm, {
				 	headers:{
						/* 'content-type':'application/json', */
				 	}
			 }) .then(resp=>{

			})
			
		})
})

 $(function(){
			// 퀴즈 컨텐트(q_content) -> 에디터에 삽입
			editor.setMarkdown($("#q_content").val())
	 
            //답안유형 숨김
            $(".ox").hide();
            $(".multiple").hide();
            $(".explain").hide();

            //시작하자마자 .question-add 를 하나 추가용으로 백업
            var backup = $(".question-add").first().clone();

            // 새로운 퀘스쳔 추가 시 유형 별 생성 화면 출력
            $(".type_select").change(function(){
          
                var state = $(this).val();

                if(state == "ox-menu"){
                    $(".ox").show(); 
                    $(".multiple").hide(); 
                    $(".explain").hide();
                    $(".add").val("ox")
                }
                else if(state == "mul-menu"){
                    $(".multiple").show(); 
                    $(".ox").hide(); 
                    $(".explain").hide();
                    $(".add").val("multiple")
                }
                else if(state == "ex-menu"){
                    $(".explain").show(); 
                    $(".ox").hide(); 
                    $(".multiple").hide();
                    $(".add").val("explain")
                }
              	console.log($(".add").val())
            });
                
        });
 
 // 최종 퀴즈 저장
 $(function(){
		$("#save").click(function(){
			$("#quizDetailContent").val(editor.getMarkdown())
			document.querySelector("#quizDetail").submit()
		})
	})

// 새로 추가한 퀘스쳔 저장
$(function(){
	var backup = $(".question-list").first().clone()
		
	// new question 클릭 시 현재 퀘스쳔 저장 밑 새로운 퀘스쳔 생성
	$(".add").click(function(){
		// 클릭한 폼의 정보를 불러온다.
		var add = $(".add").val()
		// 해당 퀘스쳔 등록하고 새로운 퀘스쳔 생성
		$("input[name=content]").val(editor2.getMarkdown())
			axios({
					url:"/arori/questionAjax/create/" + add,
					method:"post",
					data:$("." + add).serialize()
				}).then(function(resp){
					console.log(resp.data)
					$("input[name=question_no]").val(resp.data)

					var clone = backup.clone()	
					$(".question-list").last().after(clone)
					var questionContent = document.querySelectorAll(".question-content")
					var questionType = document.querySelectorAll(".question-type")
					var string
					// 지금 만든 퀘스쳔 띄우기 		
					if(add == "ox") {
								var o_content = $("input[name=o_content]").val()
								var x_content = $("input[name=x_content]").val()
								var ox_answer = $("select[name=ox_answer]").val()
								string = "O : " + o_content + "<br>X : " + x_content + "<br><br>정답 : " + ox_answer

								questionType[questionType.length - 1].innerHTML = "OX 문제"
							
							} else if(add == "multiple") {
								var one = $("textarea[name=multiple_one]").val()
								var two = $("textarea[name=multiple_two]").val()
								var three = $("textarea[name=multiple_three]").val()
								var four = $("textarea[name=multiple_four]").val()
								var answer = $("select[name=multiple_answer]").val()
								string = "1번 : " + one + "<br>2번 : " + two + "<br>3번 : " + three + "<br>4번 : " + four + "<br><br>정답 : " + answer + "번"

								questionType[questionType.length - 1].innerHTML = "선다형 문제"
							} else {
								var explain_answer = $("textarea[name=explain_answer]").val()
								string = "정답 : " + explain_answer

								questionType[questionType.length - 1].innerHTML = "단답형 문제"
							}	
							questionContent[questionContent.length - 1].innerHTML = string
							$(".question-list").last().css("display","block")

							editor2.setMarkdown("")
							$("input[name=o_content]").val("")
							$("input[name=x_content]").val("")
							$("select[name=ox_answer]").val("")
							$("textarea[name=multiple_one]").val("")
							$("textarea[name=multiple_two]").val("")
							$("textarea[name=multiple_three]").val("")
							$("textarea[name=multiple_four]").val("")
							$("select[name=multiple_answer]").val("")
							$("textarea[name=explain_answer]").val("")
				})
		})
})
 
// 퀴즈 디테일 에디터
const Editor = toastui.Editor;
const { colorSyntax } = Editor.plugin;
const { codeSyntaxHighlight } = Editor.plugin;
const { tableMergedCell } = Editor.plugin;

const editor = new Editor({
	  el: document.querySelector('#editor'),
	  height: '350px',
	  initialEditType: 'markdown',
	  previewStyle: 'vertical',
	  plugins: [colorSyntax, codeSyntaxHighlight, tableMergedCell],
	  hooks:{
		'addImageBlobHook':function(blob, callback){
			console.log(blob, callback);
			
			var frm = new FormData();
			frm.append("f", blob);
			
			axios({
				contentType: false,
				processData: false,
				url:"/arori/imgAjax/quiz/upload/${quizDto.q_no }" ,
				method:"post",
				data:frm
			}).then(function(resp) {
				callback("/arori/imgAjax/quiz/download/" + resp.data);
			})
		}
	}
});

// 공통 출제 내역 에디터
const editor2 = new Editor({
	  el: document.querySelector('#editor2'),
	  height: '350px',
	  initialEditType: 'markdown',
	  previewStyle: 'vertical',
	  plugins: [colorSyntax, codeSyntaxHighlight, tableMergedCell],
	  hooks:{
		'addImageBlobHook':function(blob, callback){
			console.log(blob, callback);
			
			var frm = new FormData();
			frm.append("f", blob);
			
			axios({
				contentType: false,
				processData: false,
				url:"/arori/imgAjax/quiz/upload/${quizDto.q_no }" ,
				method:"post",
				data:frm
			}).then(function(resp) {
				callback("/arori/imgAjax/quiz/download/" + resp.data);
			})
		}
	}
});

// 만든 퀘스쳔 수정 카드
const editor3 = []
for(var i = 0; i < $(".editor3").length; i++) {
	var editor3Group = document.querySelectorAll(".editor3")
	var aq_content = $(editor3Group[i]).next().val()
	
	editor3[i] = new Editor({
		  el: editor3Group[i],
		  height: '250px',
		  initialEditType: 'markdown',
		  previewStyle: 'vertical',
		  plugins: [colorSyntax, codeSyntaxHighlight, tableMergedCell],
		  hooks:{
			'addImageBlobHook':function(blob, callback){
				console.log(blob, callback);
				
				var frm = new FormData();
				frm.append("f", blob);
				
				axios({
					contentType: false,
					processData: false,
					url:"/arori/imgAjax/quiz/upload/${quizDto.q_no }" ,
					method:"post",
					data:frm
				}).then(function(resp) {
					callback("/arori/imgAjax/quiz/download/" + resp.data);
				})
			}
		}
	});
	editor3[i].setMarkdown(aq_content)
}
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>