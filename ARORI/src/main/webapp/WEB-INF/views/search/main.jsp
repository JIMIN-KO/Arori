<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>

                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                    	<br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">Search</h1>
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
                    	<hr><br> <!-- 여기가 기준이라서 여기 위에는 무조건 있어야 돼  -->
                    	<!-- 본문 내용 -->
                    	<div class="ml-3 mr-3">
							<!-- 검색창 -->
							<div>
									<!-- 검색 분류 -->
									<select name="searchOption" id="searchOption">
										<option value="member_nick">작성자</option>
										<option value="c_title">클래스</option>
									</select>
									
									<!-- 검색어 -->
									<input type="text" name="keyword" id="keyword">
									
									<!--검색 버튼 -->
									<input type="button" value="검색" id="search">
									
							</div>
							<div id="list" class="w-100">
								<table class="w-100">
									<thead>
										<tr>
											<th>클래스 번호</th>
											<th>클래스 이름</th>
											<th>닉네임</th>
											<th>클래스 정보</th>
											<th>등록일</th>
										</tr>
									</thead>
									<tbody class="tbody">

									</tbody>
								</table>
							</div>
                        </div>
                        <!-- 저기 위에서 부터 여기ㅈ까지 내용 들어갈 칸이야 이 밑에도 이런식으로 불러와야 해 
                        우리가 원래 하던대로 라면 이게 밑에 있고 아래 스크립트가 위에 잇는거지? 그건 상관없는거지??ㅇㅇ -->
                    </div>

<script>
$(function(){
	/* var keyword = document.querySelector("#searchOption")
	var searchOption = document.querySelector("#keyword")
	
	$("#searchOption").on("change",function(){
		console.log($("#searchOption").val())
	})
	
	$("#keyword").on("input",function(){
		console.log($("#keyword").val())
	}) */
	
	$("#search").click(function(){
		var keyword = $("#keyword").val()
		var searchOption = $("#searchOption").val()
		var list = document.querySelector(".tbody")
		list.textContent = ""
		
		axios({
			url:'${pageContext.request.contextPath}/searchAjax/search?keyword=' + keyword + '&searchOption=' + searchOption,
			method:'get'
		}).then(function(resp){
			console.log(resp)
			
			for(var i = 0; i < resp.data.length; i++) {
				
				var tr = document.createElement("tr")
				tr.classList.add("class_list" + i)
				list.appendChild(tr)
				var class_list = document.querySelector(".class_list" + i)
				
				var no = document.createElement("td")
				var title = document.createElement("td")
				var nick = document.createElement("td")
				var info = document.createElement("td")
				var when = document.createElement("td")
				
				
				no.textContent = resp.data[i].c_no
				title.textContent = resp.data[i].c_title
				nick.textContent = resp.data[i].member_nick
				info.textContent = resp.data[i].c_info
				when.textContent = resp.data[i].c_when
				
				class_list.appendChild(no)
				class_list.appendChild(title)
				class_list.appendChild(nick)
				class_list.appendChild(info)
				class_list.appendChild(when)
			}
		})
	})
})
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>