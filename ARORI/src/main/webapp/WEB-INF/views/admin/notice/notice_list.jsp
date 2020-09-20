<jsp:include
   page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<div class="row mt-5">
   <div class="col-8 offset-2">
         <div class="card mt-5 mb-5">
           <div class="card-header h3 bg-warning text-white">    
            Notice Statistics
           </div>
           <div class="card-body">
             <blockquote class="mb-0">
               <p>총 NOTICE 게시물 개수는 ${noticeCount} 개 입니다.</p>
             </blockquote>
           </div>
         </div>
         <form action="${pageContext.request.contextPath }/admin/noticeList/1" method="get" class="mt-5 mb-5 w-100">
            <div class="row">
               <div class="col-1">
                  <select name="col" class="custom-select">
                     <option value="c_no">클래스 번호</option>
                     <option value="n_no">공지 번호</option>
                     <option value="n_title">공지 제목</option>
                  </select>
               </div>
               <div class="col-10">
                  <input type="text" class="form-control" name="keyword" placeholder="검색어">
               </div>
               <div class="col-1">
                  <input type="submit" class="btn btn-primary btn-md font-weight-bold"  value="찾기">
               </div>
            </div>
         </form>
         <table class="table table-hover text-center">
            <thead>
               <tr>
               	  <th scope="col">No</th>
                  <th scope="col">CLASS.No</th>
                  <th scope="col">NOTICE.No</th>
                  <th scope="col">Q & A TITLE</th>
                  <th scope="col">DETAIL</th>
               </tr>
            </thead>
            <tbody>

               <c:set var="no" value="${no }"></c:set>
               <c:forEach var="noticeDto" items="${list}" varStatus="status">
                  <tr>
                  <tr>
                     <th scope="row">${no }</th>
                     <c:set var="no" value="${no - 1 }"></c:set>
                     <td>${noticeDto.c_no}</td>
                     <td>${noticeDto.n_no}</td>
                     <td>${noticeDto.n_title}</td>
                     <td>
                        <a class="btn btn-md btn-primary"href="${pageContext.request.contextPath}/admin/noticeDetail/${noticeDto.c_no}/${noticeDto.n_no}">DETAIL</a>
                     </td>
                  </tr>

               </c:forEach>
            </tbody>
         </table>
      <nav aria-label="Page navigation example">
         <ul class="pagination justify-content-center">
            <li class="page-item"><c:if test="${pageNo > 10 }">
                  <a class="page-link" href="${pageContext.request.contextPath }/admin/noticeList/${block[0] - 1}" aria-label="Previous">
                     <span aria-hidden="true">&laquo;</span>
                  </a>
               </c:if>
            </li>
            <c:forEach var="block" items="${block}">
               <li class="page-item">
                  <a class="page-link block" href="${pageContext.request.contextPath }/admin/noticeList/${block}">${block}</a>
               </li>
            </c:forEach>
            <li class="page-item">
            <c:set var="size" value="${fn:length(block)}"></c:set>
               <c:if test="${size> pageNo and pageNo >10}">
                  <a class="page-link" href="${pageContext.request.contextPath }/admin/noticeList/${block[size]+1}" aria-label="Next"> 
                     <span aria-hidden="true">&raquo;</span>
                  </a>
               </c:if>
            </li>
         </ul>
      </nav>
   </div>
</div>
<script>
   $(function(){
      // 페이지 네이션 시, 해당 블럭에 파라미터 값 넣기
      var block = document.querySelectorAll(".block");
      var next = document.querySelector(".next");
      var prev = document.querySelector(".prev");
      var param = location.search

      if(param) {   
         $(prev).attr("href","${pageContext.request.contextPath }/admin/noticeList/" + (block[0] - 1) + param)
         $(next).attr("href","${pageContext.request.contextPath }/admin/noticeList/" + (block[block.size]+1) + param)
         for(var i = 0; i < block.length; i++) {
            var path = "${pageContext.request.contextPath }/admin/noticeList/" + (i+1) + param
            $(block[i]).attr("href",path)
         }
      }

   })
</script>
<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>