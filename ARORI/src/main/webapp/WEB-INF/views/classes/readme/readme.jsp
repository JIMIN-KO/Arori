<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                        <br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">Read Me</h1>
	                        <c:choose>
	                        	<c:when test="${(empty readmeDto) and (classesDto.member_no == userinfo.member_no)}">
	                        		<a href="${pageContext.request.contextPath }/classes/readme/create/${c_no}">
				                        <button class="btn btn-link mt-4" style="flex:0.3; color: gray;">
				            				<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											  <path fill-rule="evenodd" d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
											</svg>
				                        </button>
			                        </a>
		                        </c:when>
		                        <c:when test="${(not empty readmeDto) and (classesDto.member_no == userinfo.member_no)}">
		                        	<a href="${pageContext.request.contextPath }/classes/readme/edit/${c_no}">
				                        <button class="btn btn-link mt-4" style="flex:0.3; color: gray;">
				                        		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-hammer" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											  <path d="M9.812 1.952a.5.5 0 0 1-.312.89c-1.671 0-2.852.596-3.616 1.185L4.857 5.073V6.21a.5.5 0 0 1-.146.354L3.425 7.853a.5.5 0 0 1-.708 0L.146 5.274a.5.5 0 0 1 0-.706l1.286-1.29a.5.5 0 0 1 .354-.146H2.84C4.505 1.228 6.216.862 7.557 1.04a5.009 5.009 0 0 1 2.077.782l.178.129z"/>
											  <path fill-rule="evenodd" d="M6.012 3.5a.5.5 0 0 1 .359.165l9.146 8.646A.5.5 0 0 1 15.5 13L14 14.5a.5.5 0 0 1-.756-.056L4.598 5.297a.5.5 0 0 1 .048-.65l1-1a.5.5 0 0 1 .366-.147z"/>
											</svg>
				                        </button>
			                        </a>
			                        <a href="${pageContext.request.contextPath }/classes/readme/delete/${c_no}">
				                        <button class="btn btn-link mt-4" style="flex:0.3; color: gray;">
				                        		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
											  <path fill-rule="evenodd" d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5a.5.5 0 0 0-1 0v7a.5.5 0 0 0 1 0v-7z"/>
											</svg>
				                        </button>
			                        </a>
		                        </c:when>
	                        </c:choose>
                        </div>
                        <hr><br>
                        <div id="viewer"></div>
                        <!-- DB 마크다운 데이터를 자바스크립트로 보내기위한 도구 -->
                        	<input type="hidden" value="${readmeDto.r_content }" id="r_content">
                    </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>
<script>
	var r_content = document.querySelector("#r_content").value
	// Toast Plugin 불러오기 
	const Viewer = toastui.Editor;
	const chartOptions = {
	        minWidth: 100,
	        maxWidth: 600,
	        minHeight: 100,
	        maxHeight: 300
	      };
    const { chart, codeSyntaxHighlight, colorSyntax, tableMergedCell, uml } = Viewer.plugin;
    
	const viewer = toastui.Editor.factory({
		el: document.querySelector('#viewer'),
		viewer: true,
		height: '1000px',
		initialValue: r_content,
		initialEditType: 'markdown',
		plugins: [[chart, chartOptions], codeSyntaxHighlight, tableMergedCell, uml]
	}); 
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>