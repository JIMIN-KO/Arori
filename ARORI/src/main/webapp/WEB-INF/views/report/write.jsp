<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_myPage_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
      <div class="card mt-5 mb-5">
         <div class="card-header h3 bg-danger text-white">신고 게시판</div>
         <div class="card-body">
            <blockquote class="mb-0">
               <p>건전한 운영을 위해 회원아이디로 운영되고 있습니다.</p>
               <p>게시판 취지와 관련이 없는 글 등은 관리자에 의해 통보없이 삭제되거나 관리자에 의해 접수됩니다.</p>
            </blockquote>
         </div>
      </div>


      <form action="write" method="post" id="report">
         <table class="table table-hover">
            <tbody>
               <tr>
                  <th scope="col">REPORT_MEMBER</th>
                  <td><input type="text" name="report_member"
                     class="form-control" value="${memberDto.member_id}"></td>
               </tr>
               <tr>
                  <th scope="col">REPORT TYPE</th>
                  <td><select name="report_type" required="required"
                     class="custom-select">
                        <option value="유언비어" selected="selected">유언비어</option>
                        <option value="욕설">욕설</option>
                        <option value="불법 광고">불법 광고</option>
                        <option value="저작권">저작권</option>
                        <option value="기타">기타</option>
                  </select></td>
               </tr>

               <tr>
                  <th scope="col">REPORT CONTENT</th>
                  <td ><textarea name="report_content"
                     
                        placeholder="게시판의 취지와 부합하지 않는 상업성 광고, 정치적 목적,

특정기관·단체·특정인에 대한 비난이나 비방, 반복적 게시물, 기타 불건전한 내용 등은 관리자에 의해 통보 없이 삭제될 수 있습니다." style="height:300px"
                        class="form-control"></textarea></td>
               </tr>

               <tr>
                  <th scope="col">REPORT CRIMI MEMBER</th>
                  <td><input type="text" name="report_crimi"
                     class="form-control" placeholder="신고할 아이디"></td>
               </tr>

               <tr>
                  <td><input type="submit"
                     class="btn btn-primary btn-lg font-weight-bold" value="신고접수"
                     id="ok"><a href="${pageContext.request.contextPath}"><input
                        type="button" class="btn btn-primary btn-lg font-weight-bold"
                        value="취소하기"></a></td>
               </tr>
            </tbody>
         </table>
      </form>
   </div>


<script>
   $("#report").submit(function(event) {

      if ($('[name=report_type]').val() == "") {
         alert("신고사유를 선택해주세요.");
         $('[name=report_type]').focus();
         return false;
      }
      if ($('[name=report_content]').val() == "") {
         alert("신고내용을 입력해주세요.");
         $('[name=report_content]').focus();
         return false;
      }
      if ($('[name=report_crimi]').val() == "") {
         alert("신고하실 회원의 아이디를 입력해주세요.");
         $('[name=report_crimi]').focus();
         return false;
      }
      return true;
   });
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>