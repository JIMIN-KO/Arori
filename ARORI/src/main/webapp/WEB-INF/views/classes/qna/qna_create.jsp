<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>

                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                        <br>
                        <h1 class="font-weight-bold mt-4">Q&A | Create</h1>
                        <hr><br>
                        
                        <!-- 제목 입력 영역 -->
                        <div class="input-group input-group-lg">
							<div class="input-group-prepend">
								<span class="input-group-text" id="inputGroup-sizing-lg">Title</span>
							</div>
							<input type="text" class="form-control" id="qna_title" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
						</div>
						
						<!-- 게시글 작성 영역 -->
                        <div id="editor"></div>
                        <div class="float-right mt-5">
                        	<a href="javascript:history.back();" class="btn btn-primary btn-lg font-weight-bold" id="createCancel">취소</a>
                        	
                        	<!-- 전송 영역 -->
                        	<form action="${pageContext.request.contextPath }/classes/qna/create" method="post" style="display: inline-block;">
                        		<input type="hidden" name="c_no" value="${c_no}">
                        		<input type="hidden" name="member_no" value="${userinfo.member_no}">
                        		<input type="hidden" name="qna_title">
                        		<input type="hidden" name="qna_content" id="qna_content">
	                        	<input type="submit" class="btn btn-warning btn-lg font-weight-bold" id="createQna" value="작성">
                        	</form>
                        </div>
                    </div>
                    
 <jsp:include page="/WEB-INF/views/template/member/member_classes_editor_footer.jsp"></jsp:include>                   
<!-- Toast Editor 비동기 Javascript 영역 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/member/toast_ui_editor.js"></script>
<script>
$(function(){
	// 게시글 제목 설정하기 
	$("#qna_title").on("input",function(){
		var n_title = $("#qna_title").val()
		$("input[name=qna_title]").val(n_title)
	})
	
	// 게시글 작성하기
	$("#createQna").click(function(){
		/* $("#qna_content").val(editor.getTextObject()._mde.toastMark.lineTexts) */
		$("#qna_content").val(editor.getMarkdown());
	})

})
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>