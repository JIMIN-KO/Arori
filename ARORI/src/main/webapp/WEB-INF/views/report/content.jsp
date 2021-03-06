<jsp:include
   page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script>
function del(report_no) {
    var chk = confirm("정말 삭제하시겠습니까?")
    if (chk) {
       location.href='${pageContext.request.contextPath}/report/delete/'+ report_no
    }
 }   
</script>

<div class="row mt-5">
   <div class="col-8 offset-2">
      
         <h1 class="font-weight-bold mt-5">신고접수 상세 내용</h1>
         <table class="table table-hover text-center">
            <tbody>
            <tr>
               <th scope="col">NO</th>
               <td><input type="text" class="form-control"
                  value="${reportDto.report_no}" readonly="readonly"></td>
            </tr>
            <tr>
               <th scope="col">DATE</th>
               <td><input type="text" name="report_date" class="form-control"
                  value="${reportDto.report_date}" readonly="readonly"></td>
            </tr>
            <tr>
               <th scope="col">REPRT MEMBER ID</th>
               <td><input type="text" name="report_member"
                  class="form-control" value="${reportDto.report_member}"
                  readonly="readonly"></td>
            </tr>
            <tr>
               <th scope="col">CRIMI MEMBER ID</th>
               <td><input type="text" name="report_crimi"
                  class="form-control" value="${reportDto.report_crimi}"
                  readonly="readonly"></td>
            </tr>
            <tr>
               <th scope="col">REPORT TYPE</th>
               <td><input type="text" name="report_type"
                  value="${reportDto.report_type}" class="form-control"
                  readonly="readonly"></td>
            </tr>
            <tr>

               <th scope="col">REPORT CONTENT</th>
               <td><textarea name="report_content" class="form-control"
                     readonly="readonly">${reportDto.report_content}
</textarea></td>
            </tr>
            <tr>
               <th colspan="3"><a
                  href="${pageContext.request.contextPath}/admin/adminUpdate/${reportDto.member_no}"
                  class="btn btn-primary btn-lg font-weight-bold">상태변경</a> <a
                  href="${pageContext.request.contextPath}/admin/report_list/1"
                  class="btn btn-primary btn-lg font-weight-bold">목록으로</a> 
                  <a class="btn btn-primary btn-lg font-weight-bold"
                  onclick="del(${reportDto.report_no})">삭제하기</a></th>
            </tr>

         </tbody>
      </table>
   </div>
</div>

<jsp:include
   page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>