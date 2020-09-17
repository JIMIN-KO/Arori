<jsp:include
   page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<div class="row mt-5">
   <div class="col-8 offset-2">
      <form action="adminUpdate" method="post" class="mt-3">
         <h1>회원 목록(관리자 페이지) - 회원 아이디를 클릭하면 상세페이지로 이동</h1>
         <button class="btn btn-lg btn-warning font-weight-bold mt-5"
            value="BLACK MEMBER">
            <a href="${pageContext.request.contextPath}/admin/blacklist">BLACK
               MEMBER </a>
         </button>
         <div class="col-md-3 mb-3">
            <tr>
               <th><select onchange="visit(this)" class="custom-select">
                     <option value="">
                     <option value="http://localhost:8080/arori/admin/allList"
                        selected>전체회원</option>
                     <option value="http://localhost:8080/arori/admin/aroriList">아로리</option>
                     <option value="http://localhost:8080/arori/admin/socialList">소셜</option>
               </select></th>
            </tr>
         </div>
         <table class="table table-hover">
            <thead>
               <tr>
                  <th scope="col">번호</th>
                  <th scope="col">아이디</th>
                  <th scrope="col">권한</th>
                  <th scope="col">닉네임</th>
                  <th scope="col">이메일</th>
                  <th scope="col">H.P</th>
                  <th scope="col">회원구분</th>
                  <th scope="col">회원상태</th>
                  <th scope="col">DETAIL</th>
               </tr>
            </thead>
            <tbody>
            

               <c:forEach var="allMemberDto" items="${list}" varStatus="status">
                  <tr>
                  <tr>
                     <th scope="row">${allMemberDto.member_no}</th>
                     <td>${allMemberDto.member_id}</td>
                     <td>
                  <c:if
							test="${fn:contains(allMemberDto.member_auth,'1') || fn:contains(allMemberDto.member_nick,'admin')}">
						관리자					
						</c:if>
						<c:if test="${fn:contains(allMemberDto.member_auth,'0')}">
						일반회원				
						</c:if>
						</td>
                     <td>${allMemberDto.member_nick}</td>
                     <td>${allMemberDto.member_email}</td>
                     <td>${allMemberDto.member_phone}</td>
                     <td>${allMemberDto.member_state}</td>
                     <td>${allMemberDto.report_state}</td>


                     <td><button>
                           <a
                              href="${pageContext.request.contextPath}/admin/memberProfile/${allMemberDto.member_no}">DETAIL</a>
                        </button></td>
                  </tr>

               </c:forEach>
     
							
					
						</td>
               <form action="search" method="post">
                  <tr>
                     <td><select name="type" class="custom-select">
                           <option value="member_id">ID</option>
                           <option value="member_state">소셜/아로리회원</option>
                           <option value="member_nick">닉네임</option>
                     </select></td>
                     <td><input type="text" class="form-control" name="keyword"
                        placeholder="검색어"></td>
                     <td><input type="submit" class="form-control" value="찾기"></td>
                  </tr>
               </form>
               <span>총 회원 수는 ${memberCount} 명 입니다. 생성 된 클래스 의 개수는
                  ${classCount} 클래스 입니다.</span>
               <a href="${pageContext.request.contextPath}">메인페이지로 이동</a>
            </tbody>
         </table>
      </form>
   </div>
</div>
 <script type="text/javascript">
            function visit(url) {
               if (url.selectedIndex != 0) {
                  location.href = url.options[url.selectedIndex].value;
               }
            }
         </script>


<jsp:include
   page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>