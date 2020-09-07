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
		                        <h1 class="font-weight-bold">Quiz | Create</h1>
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
								<input type="hidden" name="content">
								<!-- 퀴즈 제목 영역 -->
								<div class="input-group input-group-lg mt-3">
									<div class="input-group-prepend">
										<span class="input-group-text" id="inputGroup-sizing-lg">Title</span>
									</div>
									<input type="text" class="form-control" name="q_title" id="q_title" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
								</div>
								<!-- 퀴즈 설명 (Toast UI Editor) 영역 -->
								<div id="editor" class="mt-5"></div>
								<!-- 퀴즈 설정 영역 -->
								<!-- Total Score / Score Open -->
								<div class="form-row mt-5">
									<div class="form-group col-6">
										<div class="input-group input-group-lg">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-lg">Total Score</span>
											</div>
											<input type="number" class="form-control" name="q_score" id="q_score" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
										</div>
									</div>
									<div class="form-group col-6">
										<div class="input-group input-group-lg">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-lg">Score Open</span>
											</div>
											<input type="datetime-local" class="form-control" name="q_score_open" id="q_score_open" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
										</div>
									</div>
								</div>
								<!-- Runtime / Scoring -->
								<div class="form-row">
									<div class="form-group col-6">
										<div class="input-group input-group-lg">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-lg">Time</span>
											</div>
											<input type="number" class="form-control" name="q_runtime" id="q_runtime" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
										</div>
									</div>
									<div class="form-group col-6">
										<div class="input-group input-group-lg">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-lg">Scoring</span>
											</div>
											<select class="custom-select" id="q_scoring" name="scoring">
											    <option selected>Choose...</option>
											    <option value="0">자동 채점</option>
											    <option value="1">수동 채점</option>
											  </select>
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
											<input type="datetime-local" class="form-control" name="q_open" id="q_open" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
										</div>
									</div>
									<div class="form-group col-6">
										<div class="input-group input-group-lg">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-lg">Closing</span>
											</div>
											<input type="datetime-local" class="form-control" name="q_close" id="q_close" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
										</div>
									</div>
								</div>
							</form>
						  </div>
						  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
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
									<div class="form-row">
							        		<div class="col">
							        			<div class="input-group mb-3 input-group-lg">
											  <div class="input-group-prepend">
											    <span class="input-group-text">배점</span>
											  </div>
											  <input type="number" class="form-control" id="aq_score">
											  <div class="input-group-append">
											    <span class="input-group-text">점</span>
											  </div>
											</div>
							        		</div>
							        </div>
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
						  			<!-- aq_score -->
						  			<input type="hidden" name="aq_score">
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
						  			<!-- aq_score -->
						  			<input type="hidden" name="aq_score">
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
									    <option value="multiple_one" >1번</option>
									    <option value="multiple_two">2번</option>
									    <option value="multiple_three">3번</option>
									    <option value="multiple_four">4번</option>
									  </select>
									</div>
						  		</form>
						  		<!-- 단답형 -->
						  		<form class="explain">
							        <!--단답형 답변 영역-->
							            <div class="input-group mb-3 input-group-lg">
										  <div class="input-group-prepend">
										    <span class="input-group-text">단답형 정답</span>
										  </div>
										  <textarea class="form-control"></textarea>
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
							<button type="button" class="btn btn-primary btn-lg font-weight-bold" id="cancel">취소</button>
						</div>
					</div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>
<script>
 $(function(){
            //답안유형 숨김
            $(".ox").hide();
            $(".multiple").hide();
            $(".explain").hide();

            //시작하자마자 .question-add 를 하나 추가용으로 백업
            var backup = $(".question-add").first().clone();
            
            $(".type_select").change(function(){
               	console.log($(".add").val())
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
            });

            //form버튼 
            function qsubmit() {
                return true;
            }
            function qsubmit2() {
                frm.action="create";
                frm.submit();
                return true;
            }
                
        });
 // 최종 퀴즈 저장
 $(function(){
		$("#save").click(function(){
			$("input[name=content]").val(editor.getMarkdown())
			document.querySelector("#quizDetail").submit()
		})
	})

// 퀘스쳔 저장
$(function(){
	// 점수 설정
	$("#aq_score").on("input",function(){
			$("input[name=aq_score]").val($("#aq_score").val())
		})
		
	// new question 클릭 시 현재 퀘스쳔 저장 밑 새로운 퀘스쳔 생성
	$(".add").click(function(){
		var add = $(".add").val()
		$("input[name=content]").val(editor2.getMarkdown())
			axios({
					url:"/arori/questionAjax/create/" + add,
					method:"post",
					data:$("." + add).serialize()
				}).then(function(resp){
					console.log(resp.data)
					$("input[name=question_no]").val(resp.data)
				})
		})
})
 
//Toast Ui Editor
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
				url:"/arori/imgAjax/question/upload/${question_no }" ,
				method:"post",
				data:frm
			}).then(function(resp) {
				callback("/arori/imgAjax/question/download/" + resp.data);
			})
		}
	}
});
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>