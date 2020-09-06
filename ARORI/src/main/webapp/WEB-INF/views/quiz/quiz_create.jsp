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
						  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab"></div>
						</div>
						<div class="form-row float-right">
							<button type="submit" class="btn btn-warning btn-lg font-weight-bold" id="save" >퀴즈 등록</button>
							<button type="button" class="btn btn-primary btn-lg font-weight-bold" id="cancel">취소</button>
						</div>
					</div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>
<script>
$(function(){
	$("#save").click(function(){
		$("input[name=content]").val(editor.getMarkdown())
		document.querySelector("#quizDetail").submit()
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
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>