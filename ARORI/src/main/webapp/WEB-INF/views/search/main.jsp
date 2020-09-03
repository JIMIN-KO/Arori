<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
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
			
			var list = document.querySelector("#list")
			list.textContent = ""
			
			axios({
				url:'${pageContext.request.contextPath}/searchAjax/search?keyword=' + keyword + '&searchOption=' + searchOption,
				method:'get'
			}).then(function(resp){
				console.log(resp)
				
				for(var i = 0; i < resp.data.length; i++) {
					var no = document.createElement(".search_data")
					var title = document.createElement(".search_data")
					var nick = document.createElement(".search_data")
					var info = document.createElement(".search_data")
					var when = document.createElement(".search_data")
					no.textContent = resp.data[i].c_no
					nick.textContent = resp.data[i].member_nick
					title.textContent = resp.data[i].c_title
					info.textContent = resp.data[i].c_info
					when.textContent = resp.data[i].c_when
					
					list.appendChild(no)
					list.appendChild(nick)
					list.appendChild(title)
					list.appendChild(info)
					list.appendChild(when)
				}
			})
		})
	})
</script>
</head>
<body>

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
<div id="list">
	<table>
		<thead>
			<tr>
				<th>클래스 번호</th>
				<th>클래스 이름</th>
				<th>닉네임</th>
				<th>클래스 정보</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="mcDto" items="${list}">
			<tr>
				<td class="search_data">${mcDto.c_no}</td>
				<td class="search_data">
					<a href="${pageContext.request.contextPath}/classes/detail/${classesDto.c_no}">
						${mcDto.c_title}					
					</a>
				</td>
				<td class="search_data">${mc.member_nick}</td>
				<td class="search_data">${mc.c_info}</td>
				<td class="search_data">${mcDto.c_when}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>

<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>