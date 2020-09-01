<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                        <br>
                        <h1 class="font-weight-bold mt-4">Read Me | Create</h1>
                        <hr><br>
                        <div id="editor"></div>
                        <div class="float-right mt-5">
                        	<button class="btn btn-primary btn-lg font-weight-bold" id="createCancel">취소하기</button>
                        	<form action="${pageContext.request.contextPath }/classes/readme/create" method="post" style="display: inline-block;">
                        		<input type="hidden" name="c_no" value="${c_no }">
                        		<input type="hidden" name="r_content" id="r_content">
	                        	<input type="submit" class="btn btn-warning btn-lg font-weight-bold" id="createReadme" value="작성하기">
                        	</form>
                        </div>
                    </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_editor_footer.jsp"></jsp:include>
<!-- Toast Editor 비동기 Javascript 영역 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/member/toast_ui_editor_readme.js"></script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>